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
class DrawingVC: UIViewController {
    //MARK:- IBOutlet
    @IBOutlet weak var tbl_Drawing: UITableView!
    @IBOutlet var Searc_project: UISearchBar!
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
        self.UIdesign()
        self.tbl_Drawing.rowHeight = UITableView.automaticDimension
        self.tbl_Drawing.tableFooterView = UIView()
        self.tbl_Drawing.separatorStyle = .singleLine
        self.btn_Filter.addTarget(self, action: #selector(btn_FilterClick(_:)), for: .touchUpInside)
        btn_Next.addTarget(self, action: #selector(btn_NextClick(_:)), for: .touchUpInside)
        btn_Previous.addTarget(self, action: #selector(btn_PreviousClick(_:)), for: .touchUpInside)
    }
    @IBAction func switch_FinalRevisionAction(_ sender: UISwitch) {
        print(sender.isOn)
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
                    print("==============Filter Value==============")
                    print(FirstFilter!)
                    print(SecondFilter!)
                    print(FilterValue)
                    print(FilterParam)
                    if FirstFilter == "Project Name" || FirstFilter == "Group Name" || FirstFilter == "Strucher Id" || FirstFilter == "Approval Status" || FirstFilter == "Doc Status" || FirstFilter == "Purchase Order"  {
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
                self.present(self.docViewController, animated: true, completion: nil)
            }
        }.resume()
    }
    @objc func btn_NextClick(_ sender: UIButton) {
     
    }
    @objc func btn_PreviousClick(_ sender: UIButton) {
      
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
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        if indexPath.section == 1 {
            let viewAction = UIContextualAction(style: .normal, title: "") { (action, view, completion) in
                completion(true)
                let DrwaingViewVC1 = Config.StoryBoard.instantiateViewController(withIdentifier: "DrwaingViewVC_1") as! DrwaingViewVC_1
                DrwaingViewVC1.id = String(self.arrDrawing[indexPath.row].id)
                self.navigationController?.pushViewController(DrwaingViewVC1, animated: true)
            }
            let viewExcelSheet = UIContextualAction(style: .normal, title: "") { (action, view, completion) in
                completion(true)
                self.storeAndShare(withURLString: Api_Urls.GET_API_drawing + "\(String(self.arrDrawing[indexPath.row].id))/export/")
                }
            viewAction.image = UIImage(named: "ic_eye")
            viewAction.backgroundColor = Config.bgColor
            viewExcelSheet.image = UIImage(named: "ic_excel")
            viewExcelSheet.backgroundColor = Config.bgColor
            return UISwipeActionsConfiguration(actions: [viewExcelSheet,viewAction])
        }
        return UISwipeActionsConfiguration(actions: [])
    }
}
//MARK:- SWRevealViewController Methods
extension DrawingVC : SWRevealViewControllerDelegate {
    // MARK: - Reveal View Controller Delagate Methods
    func revealController(_ revealController: SWRevealViewController, didMoveTo position: FrontViewPosition) {
        print(position)
        print("Parent View")
        Utils.Disable_Front_ViewController(viewController: self, position: position)
    }
    func revealController(_ revealController: SWRevealViewController, willMoveTo position: FrontViewPosition) {
        print(position)
        print("HomeVC")
        Utils.Disable_Front_ViewController(viewController: self, position: position)
    }
}
extension DrawingVC: QLPreviewControllerDataSource {
 func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        print("view was cancelled")
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
