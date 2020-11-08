//
//  DrawingVC.swift
//  PromiseApiCall
//
//  Created by macbook on 20/05/1942 Saka.
//  Copyright © 1942 com.mac. All rights reserved.
//



import UIKit
import iOSDropDown
import QuickLook
import KRProgressHUD
class DrawingVC: UIViewController {
    //MARK:- IBOutlet
    @IBOutlet weak var tbl_Drawing: UITableView!
    @IBOutlet var CollectionView_Filter: UICollectionView!
    @IBOutlet weak var view_filterBG: UIView!
    @IBOutlet var btn_Filter: UIButton!
    @IBOutlet weak var btn_Previous: UIButton!
    @IBOutlet weak var btn_Next: UIButton!
    @IBOutlet weak var lbl_ShowPageNum_Count: UILabel!
    @IBOutlet weak var lbl_PageNum: UILabel!
    @IBOutlet weak var switch_FinalRevision: UISwitch!
    @IBOutlet weak var txt_ProjectName: DropDown!
    //MARK:- variable
    public var docViewController = QLPreviewController()
    public var arrDocuments = [NSURL]()
    var Str_NavigateFrom = ""
    var Str_ID = ""
    var arrDrawing = [Result]()
    var arrFilterData = [FilterData]()
    var Home_Barbutton: UIBarButtonItem!
    var KLC_obj: KLCPopup?
    var obj_popUpVC : FilterPopup!
    //MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeview()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "MBL"
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationItem.title = ""
        self.revealViewController()?.delegate = nil
    }
    //MARK:- Initialisation
    func initializeview() {
        self.arrDocuments = []
        self.docViewController = QLPreviewController()
        self.docViewController.dataSource = self
        self.docViewController.reloadData()
        if Str_NavigateFrom == "Purchase" {
            ServiceCall.shareInstance.Get_getDrawing(ViewController: self, param: ["is_active": switch_FinalRevision.isOn,"ordering" : "project_id__name","purchase_id" : Str_ID])
        }else if Str_NavigateFrom == "Project" {
            ServiceCall.shareInstance.Get_getDrawing(ViewController: self, param: ["is_active": switch_FinalRevision.isOn,"ordering" : "project_id__name","project_id" : Str_ID])
        }else if Str_NavigateFrom == "Drawing_Revision" {
            ServiceCall.shareInstance.Get_getDrawing(ViewController: self, param: ["is_active": switch_FinalRevision.isOn,"ordering" : "project_id__name","structure_id" : Str_ID])
            DEFAULTS.Set_Revision_Count(Count: 1)
        }else {
            ServiceCall.shareInstance.Get_getDrawing(ViewController: self, param: ["is_active": switch_FinalRevision.isOn,"ordering" : "project_id__name"])
            self.Load_Dashboard()
            DEFAULTS.Set_Revision_Count(Count: 0)
        }
        self.CollectionView_Filter.register(UINib(nibName: "FilterCollectionCell", bundle: nil), forCellWithReuseIdentifier: "FilterCollectionCell")
        self.UIdesign()
        self.tbl_Drawing.rowHeight = UITableView.automaticDimension
        self.tbl_Drawing.tableFooterView = UIView()
        self.tbl_Drawing.separatorStyle = .singleLine
        self.btn_Filter.addTarget(self, action: #selector(btn_FilterClick(_:)), for: .touchUpInside)
        btn_Next.addTarget(self, action: #selector(btn_NextClick(_:)), for: .touchUpInside)
        btn_Previous.addTarget(self, action: #selector(btn_PreviousClick(_:)), for: .touchUpInside)
    }
    @IBAction func switch_FinalRevisionAction(_ sender: UISwitch) {
        ServiceCall.shareInstance.Get_getDrawing(ViewController: self,param: ["is_active": sender.isOn,"ordering" : "project_id__name"])
    }
    func Load_Dashboard() {
        self.Home_Barbutton = Utils.Get_Navigation_Bar_Button(str_Iconname: "ic_dashboard", action: #selector(SWRevealViewController.revealToggle(_:)), viewController: self.revealViewController())
        if revealViewController() != nil {
            self.revealViewController().delegate = self
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            self.revealViewController()?.rearViewRevealWidth = 280
        }
        self.navigationItem.setLeftBarButton(Home_Barbutton, animated: true)
    }
    //MARK:- UI design
    func UIdesign() {
        Utils.setborder(view: view_filterBG, bordercolor: .gray, borderwidth: 1)
        Utils.setcornerRadius(view: view_filterBG, cornerradius: 5)
    }
    override public var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscapeRight
    }
    override public var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return .landscapeRight
    }
    @objc func btn_FilterClick(_ Button : UIButton) {
        Get_Filter_popUp()
    }
    // MARK: - Show Filter Popup Shop_Drawing
    func Get_Filter_popUp() {
        //        self.navigationController?.navigationBar.isUserInteractionEnabled = false
        self.navigationController?.navigationBar.isTranslucent = true
        self.obj_popUpVC = FilterPopup(nibName: "FilterPopup", bundle: nil)
        self.obj_popUpVC.Str_FilterVC = "Shop_Drawing"
        self.obj_popUpVC!.view.clipsToBounds = true
        self.obj_popUpVC!.view.layer.cornerRadius = 5.0
        self.obj_popUpVC!.view.frame = CGRect.init(x: 0, y: 0, width: 400, height: 260)
        self.KLC_obj = KLCPopup(contentView: self.obj_popUpVC!.view, showType: .bounceInFromTop , dismissType: .bounceOutToTop, maskType: .dimmed, dismissOnBackgroundTouch: true, dismissOnContentTouch: false)
        self.KLC_obj?.didFinishDismissingCompletion =
            {() -> Void in
                if !(self.obj_popUpVC?.Is_CancelButtonClick)! {
                    self.navigationController?.navigationBar.isTranslucent = true
                    let FirstFilter = (self.obj_popUpVC?.btn_FirstFilter.currentTitle!)
                    let SecondFilter = (self.obj_popUpVC?.btn_SecondFilter.currentTitle!)
                    let FilterValue = (self.obj_popUpVC?.txt_ValueFilter!.text)!
                    let FilterParam = (self.obj_popUpVC?.Str_Filter_String)!
                    var arrFilter = [FilterData]()
                    arrFilter.append((FilterData(SelectAttribute: FirstFilter!, SelectCriteria: SecondFilter!, FilterParam: FilterParam, Value: String(FilterValue))))
                    self.arrFilterData.append(contentsOf: arrFilter)
                    self.CollectionView_Filter.reloadData()
                    if FirstFilter == "Project Name" || FirstFilter == "Group Name" || FirstFilter == "Structure id" || FirstFilter == "Approval Status" || FirstFilter == "Doc Status" || FirstFilter == "Purchase Order"  {
                        ServiceCall.shareInstance.Get_getDrawing(ViewController: self, param: [FilterParam : FilterValue])
                    }else {
                        ServiceCall.shareInstance.Get_getDrawing(ViewController: self, param: [FilterParam : SecondFilter!])
                    }
                } else {
                    print("Filter PopUp Dismiss")
                }
        }
        self.KLC_obj?.show(withRoot: self.view)
    }
    func storeAndShare(withURLString: String) {
        if AppDelegate.NetworkRechability(){
            Utils.ShowActivityIndicator(message: Strings.kLoading)
            guard let url = URL(string: withURLString) else { return }
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else { return }
                let tmpURL = FileManager.default.temporaryDirectory
                    .appendingPathComponent(response?.suggestedFilename ?? "fileName.png")
                do {
                    try data.write(to: tmpURL)
                } catch {
                    print(error)
                }
                DispatchQueue.main.async {
                    self.arrDocuments = [tmpURL as! NSURL]
                    self.docViewController.reloadData()
                    KRProgressHUD.dismiss()
                    self.present(self.docViewController, animated: true, completion: nil)
                }
            }.resume()
        }else {
            Utils.showToastWithMessage(message: Strings.kNoInternetMessage)
        }
        
    }
    @objc func btn_NextClick(_ sender: UIButton) {
     
    }
    @objc func btn_PreviousClick(_ sender: UIButton) {
      
    }
    
    // MARK: - Edit,Delete,Puase Buttons Clicks
    @objc func cell_Button_Clicks(_ sender : UIBarButtonItem) {
        if sender.accessibilityHint == "0" {
           let DrwaingViewVC1 = Config.StoryBoard2.instantiateViewController(withIdentifier: "DrwaingViewVC_1") as! DrwaingViewVC_1
            DrwaingViewVC1.id = String(self.arrDrawing[sender.tag].id)
           self.navigationController?.pushViewController(DrwaingViewVC1, animated: true)

        } else if sender.accessibilityHint == "1" {
          self.storeAndShare(withURLString: Api_Urls.GET_API_drawing + "\(String(self.arrDrawing[sender.tag].id))/export/")
        } else {
            print("Delete Button Click")
        }
    }
    //MARK:- Button CollectionView Filter Click
    @objc func btn_RejectSelected(sender: UIButton){
         self.arrFilterData.remove(at: sender.tag)
        if arrFilterData == nil {
            let rowdata = arrFilterData[sender.tag]
            if rowdata.SelectAttribute == "Project Name" || rowdata.SelectAttribute == "Group Name" || rowdata.SelectAttribute == "Structure id" || rowdata.SelectAttribute == "Approval Status" || rowdata.SelectAttribute == "Doc Status" || rowdata.SelectAttribute == "Purchase Order"  {
                ServiceCall.shareInstance.Get_getDrawing(ViewController: self, param: [rowdata.FilterParam : rowdata.Value])
            }else {
                ServiceCall.shareInstance.Get_getDrawing(ViewController: self, param: [rowdata.FilterParam : rowdata.SelectCriteria])
            }
        } else {
            if Str_NavigateFrom == "Purchase" {
                ServiceCall.shareInstance.Get_getDrawing(ViewController: self, param: ["is_active": switch_FinalRevision.isOn,"ordering" : "project_id__name","purchase_id" : Str_ID])
            }else if Str_NavigateFrom == "Project" {
                ServiceCall.shareInstance.Get_getDrawing(ViewController: self, param: ["is_active": switch_FinalRevision.isOn,"ordering" : "project_id__name","project_id" : Str_ID])
            }else if Str_NavigateFrom == "Drawing_Revision" {
                ServiceCall.shareInstance.Get_getDrawing(ViewController: self, param: ["is_active": switch_FinalRevision.isOn,"ordering" : "project_id__name","structure_id" : Str_ID])
                DEFAULTS.Set_Revision_Count(Count: 1)
            }else {
                ServiceCall.shareInstance.Get_getDrawing(ViewController: self, param: ["is_active": switch_FinalRevision.isOn,"ordering" : "project_id__name"])
                self.Load_Dashboard()
                DEFAULTS.Set_Revision_Count(Count: 0)
            }
        }
        CollectionView_Filter.reloadData()
    }
    // MARK: - Bind Buttons Clicks
    func set_Button_Target(buttons : [UIButton], action : Selector, tag : Int) {
        for i in 0..<buttons.count{
            buttons[i].addTarget(self, action: action, for: .touchUpInside)
            buttons[i].accessibilityHint = String(i)
            buttons[i].tag = tag
        }
    }
}
//MARK:- TableView Initialisation
extension DrawingVC : UITableViewDataSource,UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return arrDrawing.count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell : DrawingHeaderCell = tableView.dequeueReusableCell(withIdentifier: "DrawingHeaderCell") as! DrawingHeaderCell
            cell.selectionStyle = .none
            return cell
        } else {
            let cell : DrawingCell = tableView.dequeueReusableCell(withIdentifier: "DrawingCell") as! DrawingCell
            cell.DisplayCell(arr: arrDrawing, indexPath: indexPath)
            self.set_Button_Target(buttons: [cell.btn_DrawingView,cell.btn_Edit], action: #selector(self.cell_Button_Clicks(_:)), tag : indexPath.section)
            cell.selectionStyle = .none
            return cell
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            ServiceCall.id_Strc = String(arrDrawing[indexPath.row].id)
            let Drawinedit_VC = Config.StoryBoard.instantiateViewController(identifier: "DrawineditVC") as! DrawineditVC
            Drawinedit_VC.projectName = String(arrDrawing[indexPath.row].projectName)
            Drawinedit_VC.vendorName = String(arrDrawing[indexPath.row].vendorName)
            Drawinedit_VC.Str_Title = arrDrawing[indexPath.row].structureID
            self.navigationController?.pushViewController(Drawinedit_VC, animated: true)
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
//MARK:- SWRevealViewController Methods
extension DrawingVC : SWRevealViewControllerDelegate {
    // MARK: - Reveal View Controller Delagate Methods
    func revealController(_ revealController: SWRevealViewController, didMoveTo position: FrontViewPosition) {
        print(position)
        Utils.Disable_Front_ViewController(viewController: self, position: position)
    }
    func revealController(_ revealController: SWRevealViewController, willMoveTo position: FrontViewPosition) {
        print(position)
        Utils.Disable_Front_ViewController(viewController: self, position: position)
    }
}
extension DrawingVC: QLPreviewControllerDataSource {
 func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        dismiss(animated: true, completion: nil)
    }
    //MARK: Document Viewer Delegate methods
    func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
        return self.arrDocuments.count
    }
    
    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
        return self.arrDocuments[index] as QLPreviewItem
    }
}
// MARK: - Collection View Datasource Methods
extension DrawingVC : UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrFilterData.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: FilterCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "FilterCollectionCell", for: indexPath) as! FilterCollectionCell
        cell.DisplayCell(arr: arrFilterData, indexPath: indexPath.row)
        cell.btn_Close.tag = indexPath.row
        cell.btn_Close.addTarget(self, action: #selector(btn_RejectSelected), for: .touchUpInside)
        return cell
    }
}
