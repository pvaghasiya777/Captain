//
//  PackingListVC.swift
//  Promise
//
//  Created by Captain on 29/07/20.
//  Copyright © 2020 Captain. All rights reserved.
//

import UIKit
import QuickLook
class PackingListVC: UIViewController, SWRevealViewControllerDelegate
{
    
    //MARK:- IBOutlet
    @IBOutlet weak var tbl_data: UITableView!
    @IBOutlet weak var searchview: UISearchBar!
    @IBOutlet weak var btn_Filter: UIButton!
    @IBOutlet weak var btn_Short: UIButton!
    @IBOutlet weak var btn_More: UIButton!
    @IBOutlet weak var btn_M_Released: UIButton!
    @IBOutlet weak var btn_Previous: UIButton!
    @IBOutlet weak var btn_Next: UIButton!
    @IBOutlet weak var lbl_ShowPageNum: UILabel!
    @IBOutlet weak var lbl_PageNum: UILabel!
    @IBOutlet weak var switch_FinalRevision: UISwitch!
    //    @IBOutlet var menu_Barbutton: UIBarButtonItem?
    
    //MARK:- Variable
    public var docViewController = QLPreviewController()
    public var arrDocuments = [NSURL]()
    var Str_NavigateFrom = ""
    var Str_ID = String()
    var startIndex: Int = 0
    var Arr_Data : NSMutableArray = []
    var Arr_Packing_Data : NSMutableArray = NSMutableArray()
    var Arr_Packing_DataChack : NSMutableArray = NSMutableArray()
    var Str_NextLink : String = String()
    var Str_PreviousLink : String = String()
    var KLC_obj: KLCPopup?
    var obj_popUpVC : FilterPopup!
    var Home_Barbutton: UIBarButtonItem!
    var markbool = true
    //MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.UIdesign()
        self.Initialization()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "Packing List"
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationItem.title = ""
        self.revealViewController()?.delegate = nil
    }
    func UIdesign() {
        self.arrDocuments = []
        self.docViewController = QLPreviewController()
        self.docViewController.dataSource = self
        self.docViewController.reloadData()
        self.tbl_data.rowHeight = UITableView.automaticDimension
        self.tbl_data.tableFooterView = UIView()
        self.tbl_data.separatorStyle = .singleLine
        Utils.setborder(view: btn_Previous, bordercolor: Config.boderColor1, borderwidth: 1)
        Utils.setborder(view: btn_Next, bordercolor: Config.boderColor1, borderwidth: 1)
        Utils.setborder(view: lbl_PageNum, bordercolor: Config.boderColor1, borderwidth: 1)
        Utils.setcornerRadius(view: btn_Previous, cornerradius: 5)
        Utils.setcornerRadius(view: btn_Next, cornerradius: 5)
        Utils.setcornerRadius(view: lbl_PageNum, cornerradius: 5)
    }
    func Initialization() {
        tbl_data.allowsMultipleSelectionDuringEditing = true
        if Str_NavigateFrom == "Packages" {
            ServiceCall.shareInstance.Get_packingList(ViewController: self, Api_Str: Api_Urls.GET_API_packingList, params: ["pl_input_id" : Str_ID,"is_active" : switch_FinalRevision.isOn])
        }else if Str_NavigateFrom == "Drawin Edit"{
            ServiceCall.shareInstance.Get_packingList(ViewController: self, Api_Str: Api_Urls.GET_API_packingList, params: ["shop_drawing_id" : Str_ID,"is_active" : switch_FinalRevision.isOn])
        }else if Str_NavigateFrom == "PackingList_Revision" {
            ServiceCall.shareInstance.Get_packingList(ViewController: self, Api_Str: Api_Urls.GET_API_packingList, params: ["number": Str_ID,"is_active" : switch_FinalRevision.isOn])
            DEFAULTS.Set_Revision_Count(Count: 1)
        }else if Str_NavigateFrom == "Project"{
            ServiceCall.shareInstance.Get_packingList(ViewController: self, Api_Str: Api_Urls.GET_API_packingList, params: ["project_id" : Str_ID,"is_active" : switch_FinalRevision.isOn])
        }else if Str_NavigateFrom == "Purchase"{
            ServiceCall.shareInstance.Get_packingList(ViewController: self, Api_Str: Api_Urls.GET_API_packingList, params: ["purchase_id" : Str_ID,"is_active" : switch_FinalRevision.isOn])
        }
        else {
            ServiceCall.shareInstance.Get_packingList(ViewController: self, Api_Str: Api_Urls.GET_API_packingList, params: [:])
            self.Load_Dashboard()
            DEFAULTS.Set_Revision_Count(Count: 0)
        }
        
        self.btn_Filter.addTarget(self, action: #selector(Get_Filter_popUp(_:)), for: .touchUpInside)
        //        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress))
        //        longPressGesture.minimumPressDuration = 0.5
        //        self.tbl_data.addGestureRecognizer(longPressGesture)
    }
    @IBAction func switch_FinalRevisionAction(_ sender: UISwitch) {
        print(sender.isOn)
         ServiceCall.shareInstance.Get_packingList(ViewController: self, Api_Str: Api_Urls.GET_API_packingList, params: ["ordering": "project_id__name","is_active" : sender.isOn])
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
    @objc func handleLongPress(longPressGesture: UILongPressGestureRecognizer) {
        let p = longPressGesture.location(in: self.tbl_data)
        var indexPath = self.tbl_data.indexPathForRow(at: p)
        if indexPath == nil {
            print("Long press on table view, not row.")
        } else if longPressGesture.state == UIGestureRecognizer.State.began {
            print("Long press on row, at \(indexPath!.row)")
        }
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
    // MARK: - Show Filter Popup Packing_List
    @objc func Get_Filter_popUp(_ Button : UIButton) {
        self.navigationController?.navigationBar.isTranslucent = true
        self.obj_popUpVC = FilterPopup(nibName: "FilterPopup", bundle: nil)
        self.obj_popUpVC.Str_FilterVC = "Packing_List"
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
                    if  FirstFilter == "Project Name" || FirstFilter == "Vendor Name" || FirstFilter == "Purchase Order" || FirstFilter == "Group name" || FirstFilter == "Strucher Id" || FirstFilter == "PL Number" || FirstFilter == "Package Name" || FirstFilter == "Approval Status" || FirstFilter == "Status"
                    {
                        ServiceCall.shareInstance.Get_packingList(ViewController: self, Api_Str: Api_Urls.GET_API_packingList, params: [FilterParam : FilterValue])
                    }else {
                        ServiceCall.shareInstance.Get_packingList(ViewController: self, Api_Str: Api_Urls.GET_API_packingList, params: [FilterParam : SecondFilter])
                    }
                } else {
                    print("Filter PopUp Dismiss")
                }
        }
        self.KLC_obj?.show(withRoot: self.view)
    }
    
    //Action Button Click
    @IBAction func btn_Click_First(_ sender: UIButton) {
        print("First Button Click")
    }
    @IBAction func btn_Click_Previous(_ sender: UIButton) {
        print("Previous Button Click")
        if startIndex - 8 <= -1 {
            print("No More Data Availabel")
            Utils.showToastWithMessageAtCenter(message: "Data not availabel")
        } else {
            startIndex = startIndex - 8
            tbl_data.reloadData()
        }
        self.lbl_ShowPageNum.text = "Showing \(startIndex/8) to \(Arr_Data.count/8) of \(Arr_Data.count) entriess"
        self.lbl_PageNum.text = String(describing: Int((startIndex + 8)/8))
    }
    @IBAction func btn_click_Next(_ sender: UIButton) {
        print("Next Button Click")
        if startIndex + 8 > Arr_Data.count - 1 {
            print("No More Data Availabel")
        } else {
            startIndex = startIndex + 8
            tbl_data.reloadData()
        }
        self.lbl_ShowPageNum.text = "Showing \(startIndex/8) to \(Arr_Data.count/8) of \(Arr_Data.count) entriess"
        self.lbl_PageNum.text = String(describing: Int((startIndex + 8)/8))
    }
    @IBAction func btn_Click_Last(_ sender: UIButton) {
        print("Last Button Click")
    }
    // MARK: - Bind Buttons Clicks
    func set_Button_Target(buttons : [UIButton], action : Selector, tag : Int) {
        for i in 0..<buttons.count{
            buttons[i].addTarget(self, action: action, for: .touchUpInside)
            buttons[i].accessibilityHint = String(i)
            buttons[i].tag = tag
        }
    }
    @objc func btn_Cell_selectHeader_Clicks(_ sender: UIButton) {
        markbool = false
        tbl_data.reloadData()
        
    }
    @objc func btn_Cell_select_Clicks(_ sender: UIButton) {
        if sender.accessibilityHint == "0" {
            if markbool == true {
                if sender.isSelected {
                    sender.isSelected = false
                      Arr_Packing_DataChack.removeObject(at: sender.tag)
                      print(Arr_Packing_DataChack)
                      Utils.setborder(view: sender, bordercolor: .gray, borderwidth: 1)
                } else {
                    // checkmark it
                    sender.isSelected = true
                      sender.setBackgroundImage(UIImage(named: "ic_check"), for: .normal)
                      Arr_Packing_DataChack.add(Arr_Packing_Data[sender.tag])
                      print(Arr_Packing_DataChack)
                }
            } else {
                sender.isSelected = false
            }
        } else if sender.accessibilityHint == "1" {
            let PackingLists_View = Config.StoryBoard.instantiateViewController(identifier: "PackingListsViewVC") as! PackingListsViewVC
            PackingLists_View.str_ID =  String((self.Arr_Packing_Data[sender.tag] as! PackingListModel).id)
            self.navigationController?.pushViewController(PackingLists_View, animated: true)
        } else if sender.accessibilityHint == "2" {
            self.storeAndShare(withURLString: ((self.Arr_Packing_Data[sender.tag] as! PackingListModel).plExcel!).replacingOccurrences(of: ":8000", with: ""))
        } else if sender.accessibilityHint == "3" {
                   
    }

    }
}
extension PackingListVC : UITableViewDataSource , UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
        //       return min (8, (Arr_Data.count - startIndex))
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return self.Arr_Packing_Data.count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {//
        
        if indexPath.section == 0 {
            let cell : TableViewHeaderCell = tableView.dequeueReusableCell(withIdentifier: "TableViewHeaderCell") as! TableViewHeaderCell
            self.set_Button_Target(buttons: [cell.btn_Select], action: #selector(self.btn_Cell_selectHeader_Clicks), tag: indexPath.row)
            cell.selectionStyle = .none
            
            return cell
        } else {
            let cell : TableViewCell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
            cell.Display_Cell(arr_data: Arr_Packing_Data, indexPath: indexPath)
           self.set_Button_Target(buttons: [cell.btn_Select,cell.btn_Edit,cell.btn_Download,cell.btn_Delete], action: #selector(self.btn_Cell_select_Clicks(_:)), tag: indexPath.row)
            cell.selectionStyle = .none
            return cell
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        if indexPath.section == 1 {
            let Packing_Edit = Config.StoryBoard.instantiateViewController(identifier: "PackingListsEdit") as! PackingListsEdit
            Packing_Edit.str_ID =  String((Arr_Packing_Data[indexPath.row] as! PackingListModel).id)
            Packing_Edit.str_title = String((Arr_Packing_Data[indexPath.row] as! PackingListModel).number)
            Packing_Edit.Str_ProjectName = String((Arr_Packing_Data[indexPath.row] as! PackingListModel).projectName)
            Packing_Edit.Str_VendorName = String((Arr_Packing_Data[indexPath.row] as! PackingListModel).vendorName)
            self.navigationController?.pushViewController(Packing_Edit, animated: true)
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }

}
extension PackingListVC: QLPreviewControllerDataSource {
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
