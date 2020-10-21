//
//  PlinputsVc.swift
//  Packages
//
//  Created by macbook on 23/05/1942 Saka.
//  Copyright © 1942 com.mac. All rights reserved.
//

import UIKit
import QuickLook
class PlinputsVc: UIViewController
{
    @IBOutlet var menu_Barbutton: UIBarButtonItem?
    @IBOutlet weak var tbl_data: UITableView!
    @IBOutlet weak var lbl_ShowPage: UILabel!
    @IBOutlet weak var btn_Filter: UIButton!
    
    @IBOutlet weak var btn_Previous: UIButton!
    @IBOutlet weak var btn_Next: UIButton!
    @IBOutlet weak var lbl_ShowPage_Count: UILabel!
    @IBOutlet weak var lbl_PageNum: UILabel!
    @IBOutlet weak var switch_FinalRevision: UISwitch!
    public var docViewController = QLPreviewController()
    public var arrDocuments = [NSURL]()
    var Str_NavigateFrom = String()
    var Str_ID = String()
    var Arr_PLInputs_Data : NSMutableArray = NSMutableArray()
    var Str_NextLink : String = String()
    var Str_PreviousLink : String = String()
    var Home_Barbutton: UIBarButtonItem!
    var KLC_obj: KLCPopup?
    var obj_popUpVC : FilterPopup!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.Initialization()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "Packages"
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationItem.title = ""
        self.revealViewController()?.delegate = nil
    }
    func Initialization() {
        self.arrDocuments = []
        self.docViewController = QLPreviewController()
        self.docViewController.dataSource = self
        self.docViewController.reloadData()
        if Str_NavigateFrom == "Drawin Edit" {
            ServiceCall.shareInstance.Get_PLreports(ViewController: self, Api_Str: Api_Urls.GET_API_plReports, param: ["shop_drawing_id" : Str_ID,"ordering": "project_id__name","is_active" : switch_FinalRevision.isOn])
        } else if Str_NavigateFrom == "Project" {
            ServiceCall.shareInstance.Get_PLreports(ViewController: self, Api_Str: Api_Urls.GET_API_plReports, param: ["project_id" : Str_ID,"ordering": "project_id__name","is_active" : switch_FinalRevision.isOn])
        }else if Str_NavigateFrom == "Purchase"{
            ServiceCall.shareInstance.Get_PLreports(ViewController: self, Api_Str: Api_Urls.GET_API_plReports, param: ["purchase_id" : Str_ID,"ordering": "project_id__name","is_active" : switch_FinalRevision.isOn])
        }else {
            ServiceCall.shareInstance.Get_PLreports(ViewController: self, Api_Str: Api_Urls.GET_API_plReports, param: ["ordering": "project_id__name","is_active" : switch_FinalRevision.isOn])
            self.Load_Dashboard()
        }
        self.btn_Filter.addTarget(self, action: #selector(Get_Filter_popUp(_:)), for: .touchUpInside)
        btn_Next.addTarget(self, action: #selector(btn_NextClick(_:)), for: .touchUpInside)
        btn_Previous.addTarget(self, action: #selector(btn_PreviousClick(_:)), for: .touchUpInside)
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
    @IBAction func switch_FinalRevisionAction(_ sender: UISwitch) {
           print(sender.isOn)
        ServiceCall.shareInstance.Get_PLreports(ViewController: self, Api_Str: Api_Urls.GET_API_plReports, param: ["ordering": "name","is_active" : sender.isOn])
       }
    // MARK: - Show Filter Popup Packages
    @objc func Get_Filter_popUp(_ Button : UIButton) {
        self.navigationController?.navigationBar.isTranslucent = true
        self.obj_popUpVC = FilterPopup(nibName: "FilterPopup", bundle: nil)
        self.obj_popUpVC.Str_FilterVC = "Packages"
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
                    if FirstFilter == "Project Name" || FirstFilter == "Vendor Name" || FirstFilter == "Purchase Order" || FirstFilter == "Group name" || FirstFilter == "Strucher Id" || FirstFilter == "Approval Status" || FirstFilter == "status"{
                        ServiceCall.shareInstance.Get_PLreports(ViewController: self, Api_Str: Api_Urls.GET_API_plReports, param: [FilterParam: FilterValue])
                    }else {
                        ServiceCall.shareInstance.Get_PLreports(ViewController: self, Api_Str: Api_Urls.GET_API_plReports, param: [FilterParam: SecondFilter])
                    }
                } else {
                    print("Filter PopUp Dismiss")
                }
        }
        self.KLC_obj?.show(withRoot: self.view)
    }
    
    
    @objc func btn_NextClick(_ sender: UIButton) {
        
    }
    @objc func btn_PreviousClick(_ sender: UIButton) {
        
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
    // MARK: - Edit,Delete,Puase Buttons Clicks
    @objc func cell_Button_Clicks(_ sender : UIBarButtonItem) {
        if sender.accessibilityHint == "0" {
            let Packages_View = Config.StoryBoard.instantiateViewController(identifier: "PackagesViewVC") as! PackagesViewVC
            Packages_View.str_ID =  String((self.Arr_PLInputs_Data[sender.tag] as! PLreportsModel).id)
            Packages_View.Str_VendorName = (self.Arr_PLInputs_Data[sender.tag] as! PLreportsModel).vendorName!
            Packages_View.Str_Strucher = (self.Arr_PLInputs_Data[sender.tag] as! PLreportsModel).shopDrawingName!
            Packages_View.Str_ProjectName = (self.Arr_PLInputs_Data[sender.tag] as! PLreportsModel).projectName!
            self.navigationController?.pushViewController(Packages_View, animated: true)
        } else if sender.accessibilityHint == "1" {
            self.storeAndShare(withURLString: Api_Urls.GET_API_plReports + "\(String((self.Arr_PLInputs_Data[sender.tag] as! PLreportsModel).id))/export/")
        } else {
            print("Delete")
        }
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
extension PlinputsVc : UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return self.Arr_PLInputs_Data.count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell : PLInputesHomeHeader_Cell = tableView.dequeueReusableCell(withIdentifier: "PLInputesHomeHeader_Cell") as! PLInputesHomeHeader_Cell
            cell.isUserInteractionEnabled = false
            return cell
        } else {
            let cell : PlinputsCell = tableView.dequeueReusableCell(withIdentifier: "PlinputsCell") as! PlinputsCell
            cell.Display_Cell(viewController: self, indexPath: indexPath)
            self.set_Button_Target(buttons: [cell.btn_PackagesView,cell.btn_Edit,cell.btn_Delete], action: #selector(self.cell_Button_Clicks(_:)), tag : indexPath.section)
            cell.selectionStyle = .none
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let Next = Config.StoryBoard.instantiateViewController(identifier: "PLinputDetails") as! PLinputDetails
        Next.Str_id = String(describing: (Arr_PLInputs_Data[indexPath.row] as! PLreportsModel).id!)
        Next.Str_Project = (Arr_PLInputs_Data[indexPath.row] as! PLreportsModel).projectName!
        Next.Str_Vendor = (Arr_PLInputs_Data[indexPath.row] as! PLreportsModel).vendorName!
        Next.Str_Title = (Arr_PLInputs_Data[indexPath.row] as! PLreportsModel).name!
        Next.navigationItem.title = (Arr_PLInputs_Data[indexPath.row] as! PLreportsModel).name!
        self.navigationController?.pushViewController(Next, animated: true)
    }
}
//MARK:- SWRevealViewController Methods
extension PlinputsVc : SWRevealViewControllerDelegate {
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
extension PlinputsVc: QLPreviewControllerDataSource {
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
