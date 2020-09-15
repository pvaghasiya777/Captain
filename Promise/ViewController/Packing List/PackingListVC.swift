//
//  PackingListVC.swift
//  Promise
//
//  Created by Captain on 29/07/20.
//  Copyright © 2020 Captain. All rights reserved.
//

import UIKit

class PackingListVC: UIViewController
{
    
    //MARK:- IBOutlet
    @IBOutlet weak var tbl_data: UITableView!
    @IBOutlet weak var searchview: UISearchBar!
    @IBOutlet weak var btn_Filter: UIButton!
    @IBOutlet weak var btn_Short: UIButton!
    @IBOutlet weak var btn_More: UIButton!
    @IBOutlet weak var btn_M_Released: UIButton!
    @IBOutlet weak var btn_Unlock: UIButton!
    @IBOutlet weak var btn_First: UIButton!
    @IBOutlet weak var btn_Previous: UIButton!
    @IBOutlet weak var btn_Next: UIButton!
    @IBOutlet weak var btn_Last: UIButton!
    @IBOutlet weak var lbl_ShowPageNum: UILabel!
    @IBOutlet weak var lbl_PageNum: UILabel!
    //    @IBOutlet var menu_Barbutton: UIBarButtonItem?
    //MARK:- Variable
    var Str_NavigateFrom = ""
    var Str_ID = String()
    var startIndex: Int = 0
    var Arr_Data : NSMutableArray = []
    var Arr_Packing_Data : NSMutableArray = NSMutableArray()
    var Str_NextLink : String = String()
    var Str_PreviousLink : String = String()
    var KLC_obj: KLCPopup?
    var obj_popUpVC : FilterPopup!
    var Home_Barbutton: UIBarButtonItem!
    //MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.UIdesign()
        self.Initialization()
    }
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        self.navigationItem.title = "Packing List"
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationItem.title = ""
        self.revealViewController()?.delegate = nil
    }
    func UIdesign() {
        self.tbl_data.rowHeight = UITableView.automaticDimension
        self.tbl_data.tableFooterView = UIView()
        self.tbl_data.separatorStyle = .singleLine
        Utils.setborder(view: btn_First, bordercolor: Config.boderColor1, borderwidth: 1)
        Utils.setborder(view: btn_Previous, bordercolor: Config.boderColor1, borderwidth: 1)
        Utils.setborder(view: btn_Next, bordercolor: Config.boderColor1, borderwidth: 1)
        Utils.setborder(view: btn_Last, bordercolor: Config.boderColor1, borderwidth: 1)
        Utils.setborder(view: lbl_PageNum, bordercolor: Config.boderColor1, borderwidth: 1)
        Utils.setcornerRadius(view: btn_First, cornerradius: 5)
        Utils.setcornerRadius(view: btn_Previous, cornerradius: 5)
        Utils.setcornerRadius(view: btn_Next, cornerradius: 5)
        Utils.setcornerRadius(view: btn_Last, cornerradius: 5)
        Utils.setcornerRadius(view: lbl_PageNum, cornerradius: 5)
    }
    func Initialization() {
        
        if Str_NavigateFrom == "Packages" {
            ServiceCall.shareInstance.Get_packingList(ViewController: self, Api_Str: Api_Urls.GET_API_packingList, params: ["pl_input_id" : Str_ID])
        }else if Str_NavigateFrom == "Drawin Edit"{
            ServiceCall.shareInstance.Get_packingList(ViewController: self, Api_Str: Api_Urls.GET_API_packingList, params: ["shop_drawing_id" : Str_ID])
        }else if Str_NavigateFrom == "PackingList_Revision" {
            ServiceCall.shareInstance.Get_packingList(ViewController: self, Api_Str: Api_Urls.GET_API_packingList, params: ["number": Str_ID])
            DEFAULTS.Set_Revision_Count(Count: 1)
        }else if Str_NavigateFrom == "Project"{
            ServiceCall.shareInstance.Get_packingList(ViewController: self, Api_Str: Api_Urls.GET_API_packingList, params: ["project_id" : Str_ID])
        }else if Str_NavigateFrom == "Purchase"{
            ServiceCall.shareInstance.Get_packingList(ViewController: self, Api_Str: Api_Urls.GET_API_packingList, params: ["purchase_id" : Str_ID])
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
            
            return cell
        } else {
            let cell : TableViewCell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
            cell.Display_Cell(arr_data: Arr_Packing_Data, indexPath: indexPath)
            //        let cellIndex = startIndex + indexPath.section
            //        cell.lbl_ProjectName.text = self.Arr_Data[cellIndex] as! String
            cell.selectionStyle = .none
            return cell
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //        if let cell : TableViewCell = tableView.cellForRow(at: indexPath) as! TableViewCell {
        //            let selected =  UIView.animate(withDuration: 0.3, animations: {
        //                if cell.view_BG.backgroundColor != Config.cellSelection {
        //                    print(indexPath.row)
        //                    cell.view_BG.backgroundColor = Config.cellSelection
        //                } else {
        //                    print(indexPath.row)
        //                    cell.view_BG.backgroundColor = UIColor.white
        //                }
        //            })
        //        }
        let Packing_Edit = Config.StoryBoard.instantiateViewController(identifier: "PackingListsEdit") as! PackingListsEdit
        Packing_Edit.str_ID =  String((Arr_Packing_Data[indexPath.row] as! PackingListModel).id)
        Packing_Edit.str_title = String((Arr_Packing_Data[indexPath.row] as! PackingListModel).number)
        Packing_Edit.Str_ProjectName = String((Arr_Packing_Data[indexPath.row] as! PackingListModel).projectName)
        Packing_Edit.Str_VendorName = String((Arr_Packing_Data[indexPath.row] as! PackingListModel).vendorName)
        self.navigationController?.pushViewController(Packing_Edit, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let viewAction = UIContextualAction(style: .normal, title: "") { (action, view, completion) in
            let PackingLists_View = Config.StoryBoard.instantiateViewController(identifier: "PackingListsViewVC") as! PackingListsViewVC
            PackingLists_View.str_ID =  String((self.Arr_Packing_Data[indexPath.section] as! PackingListModel).id)
            self.navigationController?.pushViewController(PackingLists_View, animated: true)
            completion(true)
            print("View Click")
        }
        let editAction = UIContextualAction(style: .normal, title: "") { (action, view, completion) in
            // Perform your action here
            completion(true)
            print("Edit Click")
        }
        let deleteAction = UIContextualAction(style: .normal, title: "") { (action, view, completion) in
            // Perform your action here
            completion(true)
            print("Delete Click")
        }
        viewAction.image = UIImage(named: "ic_eye")
        editAction.image = UIImage(named: "ic_edit")
        deleteAction.image = UIImage(named: "ic_bin")
        viewAction.backgroundColor = Config.bgColor
        editAction.backgroundColor = Config.bgColor
        deleteAction.backgroundColor = Config.bgColor
        return UISwipeActionsConfiguration(actions: [deleteAction,editAction,viewAction])
    }
}


//MARK:- SWRevealViewController Methods
extension PackingListVC : SWRevealViewControllerDelegate {
    // MARK: - Reveal View Controller Delagate Methods
    func revealController(_ revealController: SWRevealViewController, didMoveTo position: FrontViewPosition) {
        print(position)
        print("HomeVC")
        Utils.Disable_Front_ViewController(viewController: self, position: position)
    }
    func revealController(_ revealController: SWRevealViewController, willMoveTo position: FrontViewPosition) {
        print(position)
        print("HomeVC")
        Utils.Disable_Front_ViewController(viewController: self, position: position)
    }
}
