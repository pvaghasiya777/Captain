//
//  OnsiteStatusVC.swift
//  Onsite Status
//
//  Created by Prime on 10/05/1942 Saka.
//  Copyright © 1942 com.mac. All rights reserved.
//

import UIKit

class OnsiteStatusVC: UIViewController {
    //MARK:- IBOutlet
    @IBOutlet weak var tbl_data: UITableView!
    @IBOutlet var CollectionView_Filter: UICollectionView!
    @IBOutlet weak var view_filterBG: UIView!
    @IBOutlet weak var searchview: UISearchBar!
    @IBOutlet weak var btn_Filter: UIButton!
    @IBOutlet weak var btn_M_Released: UIButton!
    @IBOutlet weak var btn_Previous: UIButton!
    @IBOutlet weak var btn_Next: UIButton!
    @IBOutlet weak var lbl_ShowPageNum: UILabel!
    @IBOutlet weak var lbl_PageNum: UILabel!
    @IBOutlet var bar_Notification: UIBarButtonItem!
    @IBOutlet var bar_Profile: UIBarButtonItem!
    @IBOutlet var btn_menubar: UIBarButtonItem!
    @IBOutlet weak var switch_FinalRevision: UISwitch!
    //MARK:- Variable
    var Arr_onSiteStatusData : NSMutableArray = NSMutableArray()
    var Arr_onSiteStatusChack : NSMutableArray = NSMutableArray()
    var arrFilterData = [FilterData]()
    var Str_NextLink : String = String()
    var Str_PreviousLink : String = String()
    var KLC_obj: KLCPopup?
    var obj_popUpVC : FilterPopup!
    var textFieldTag : Int = Int()
    let datepicker = UIDatePicker()
    var markbool = false
    //MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.Initialization()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "Onsite Status"
        self.tbl_data.reloadData()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationItem.title = ""
        self.revealViewController()?.delegate = nil
    }
    //MARK:- Initialization
    func Initialization() {
        if revealViewController() != nil {
            self.revealViewController().delegate = self
            btn_menubar.target = self.revealViewController()
            btn_menubar.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            self.revealViewController()?.rearViewRevealWidth = 280
        }
        self.CollectionView_Filter.register(UINib(nibName: "FilterCollectionCell", bundle: nil), forCellWithReuseIdentifier: "FilterCollectionCell")
        self.tbl_data.rowHeight = UITableView.automaticDimension
        self.tbl_data.tableFooterView = UIView()
        self.tbl_data.separatorStyle = .singleLine
        self.btn_Filter.addTarget(self, action: #selector(Get_Filter_popUp(_:)), for: .touchUpInside)
        ServiceCall.shareInstance.Get_onSiteStatus(ViewController: self, API_Str: Api_Urls.GET_API_onSiteStatus, Param: ["is_active" : switch_FinalRevision.isOn] ,tag : 0)
        let value = UIInterfaceOrientation.landscapeRight.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        Utils.setborder(view: view_filterBG, bordercolor: .gray, borderwidth: 1)
        Utils.setcornerRadius(view: view_filterBG, cornerradius: 5)
    }
    //MARK:- Button Click Event
    @IBAction func btn_Click_Next(_ sender: UIButton) {
        (Str_NextLink == "") ? Utils.showToastWithMessageAtCenter(message: Strings.kNoMoreData)  : ServiceCall.shareInstance.Get_onSiteStatus(ViewController: self, API_Str: Str_NextLink, Param: ["is_active" : switch_FinalRevision.isOn],tag : 0)
    }
    @IBAction func btn_Click_Previous(_ sender: UIButton) {
        (Str_PreviousLink == "") ? Utils.showToastWithMessageAtCenter(message: Strings.kNoMoreData)  :ServiceCall.shareInstance.Get_onSiteStatus(ViewController: self, API_Str: Str_PreviousLink, Param: ["is_active" : switch_FinalRevision.isOn],tag : 0)
    }
    @IBAction func switch_FinalRevisionAction(_ sender: UISwitch) {
         ServiceCall.shareInstance.Get_onSiteStatus(ViewController: self, API_Str: Api_Urls.GET_API_onSiteStatus, Param: ["is_active" : sender.isOn],tag : 0)
    }
    //MARK:- Show Filter Popup Onsite
    @objc func Get_Filter_popUp(_ Button : UIButton) {
        self.navigationController?.navigationBar.isTranslucent = true
        self.obj_popUpVC = FilterPopup(nibName: "FilterPopup", bundle: nil)
        self.obj_popUpVC.Str_FilterVC = "Onsite"
        self.obj_popUpVC!.view.clipsToBounds = true
        self.obj_popUpVC!.view.layer.cornerRadius = 5.0
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
                    if FirstFilter == "Project Name" || FirstFilter == "Vendor Name" || FirstFilter == "Purchase Order Number" || FirstFilter == "PL Number" {
                        ServiceCall.shareInstance.Get_onSiteStatus(ViewController: self, API_Str: Api_Urls.GET_API_onSiteStatus, Param: [FilterParam: FilterValue] ,tag : 0)
                    }else {
                        ServiceCall.shareInstance.Get_onSiteStatus(ViewController: self, API_Str: Api_Urls.GET_API_onSiteStatus, Param: [FilterParam: SecondFilter!] ,tag : 0)
                    }
                } else {
                    print("Filter PopUp Dismiss")
                }
        }
        self.KLC_obj?.show(withRoot: self.view)
    }
    @objc func cell_Button_Clicks(_ sender : UIBarButtonItem) {
        var dateq  = String()
        dateq = OnsiteDate()
    }
    @objc func tbl_cell_Button_Clicks(_ sender : UIButton) {
        if markbool == true {
            if sender.isSelected {
                sender.isSelected = false
                let rowdata = Arr_onSiteStatusData[sender.tag]
                Arr_onSiteStatusChack.remove(rowdata)
                sender.setBackgroundImage(UIImage(named: ""), for: .normal)
            } else {
                // checkmark it
                sender.isSelected = true
                sender.setBackgroundImage(UIImage(named: "ic_check"), for: .normal)
                Arr_onSiteStatusChack.add(Arr_onSiteStatusData[sender.tag])
            }
        } else {
            sender.isSelected = false
            Arr_onSiteStatusChack.removeAllObjects()
            sender.setBackgroundImage(UIImage(named: ""), for: .normal)
        }
    }
    //MARK:- Button CollectionView Filter Click
    @objc func btn_RejectSelected(sender: UIButton){
         self.arrFilterData.remove(at: sender.tag)
        if arrFilterData == nil {
            let rowdata = arrFilterData[sender.tag]
            if rowdata.SelectAttribute == "Project Name" || rowdata.SelectAttribute == "Vendor Name" || rowdata.SelectAttribute == "Purchase Order Number" || rowdata.SelectAttribute == "PL Number" {
                ServiceCall.shareInstance.Get_onSiteStatus(ViewController: self, API_Str: Api_Urls.GET_API_onSiteStatus, Param: [rowdata.FilterParam: rowdata.Value] ,tag : 0)
            }else {
                ServiceCall.shareInstance.Get_onSiteStatus(ViewController: self, API_Str: Api_Urls.GET_API_onSiteStatus, Param: [rowdata.FilterParam: rowdata.SelectCriteria] ,tag : 0)
            }
        } else {
            ServiceCall.shareInstance.Get_onSiteStatus(ViewController: self, API_Str: Api_Urls.GET_API_onSiteStatus, Param: ["is_active" : switch_FinalRevision.isOn] ,tag : 0)
        }
        CollectionView_Filter.reloadData()
    }

    //MARK:- Bind Buttons Clicks
    func set_Button_Target(buttons : [UIButton], action : Selector, tag : Int) {
        for i in 0..<buttons.count{
            buttons[i].addTarget(self, action: action, for: .touchUpInside)
            buttons[i].accessibilityHint = String(i)
            buttons[i].tag = tag
        }
    }
    override public var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscapeRight
    }
    override public var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return .landscapeRight
    }
}
extension OnsiteStatusVC : UITableViewDataSource , UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return self.Arr_onSiteStatusData.count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell : OnsiteStatusHeaderCell = tableView.dequeueReusableCell(withIdentifier: "OnsiteStatusHeaderCell") as! OnsiteStatusHeaderCell
            cell.isUserInteractionEnabled = false
            return cell
        } else {
            let cell : OnsiteStatusCell = tableView.dequeueReusableCell(withIdentifier: "OnsiteStatusCell") as! OnsiteStatusCell
            cell.Display_Cell(viewController: self, indexPath: indexPath)
            self.set_Button_Target(buttons: [cell.btn_Action], action: #selector(self.cell_Button_Clicks(_:)), tag: indexPath.row)
            cell.btn_Select.tag = indexPath.row
            cell.btn_Select.addTarget(self, action: #selector(tbl_cell_Button_Clicks(_:)), for: .touchUpInside)
            cell.selectionStyle = .none
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let OnsiteDetail_VC = Config.StoryBoard.instantiateViewController(withIdentifier: "OnsiteDetailVC") as! OnsiteDetailVC
        OnsiteDetail_VC.Str_ID = String(describing: (Arr_onSiteStatusData[indexPath.row] as! onSiteStatusModel).id!)
        OnsiteDetail_VC.Str_PLNumber = String(describing: (Arr_onSiteStatusData[indexPath.row] as! onSiteStatusModel).number!)
        OnsiteDetail_VC.Str_Navigate = "Onsite Status"
        self.navigationController?.pushViewController(OnsiteDetail_VC, animated: true)
    }
}
//MARK:- SWRevealViewController Methods
extension OnsiteStatusVC : SWRevealViewControllerDelegate {
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
// MARK: - Datepicketr
extension OnsiteStatusVC {
    func OnsiteDate() -> String {
        let TextField = UITextField()
        datepicker.datePickerMode = .date
        TextField.inputView = datepicker
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 44))
        let cancelbtn = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(self.cancelBtnClick))
        let donebtn = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.doneBtnClick))
        let flexibleBtn = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolbar.setItems([cancelbtn,flexibleBtn,donebtn], animated: false)
        TextField.inputAccessoryView = toolbar
        return String(TextField.text!)
    }
    @objc func cancelBtnClick(TextField : UITextField) {
        TextField.resignFirstResponder()
    }
    @objc func doneBtnClick(TextField : UITextField) {
        let datePicker = TextField.inputView as? UIDatePicker
        TextField.text = Utils.stringFromDate(date: datePicker?.date as! NSDate, Format: "dd-MM-yyyy" , isCapitalAMPM: false) as String
        TextField.resignFirstResponder()
    }
}
// MARK: - Collection View Datasource Methods
extension OnsiteStatusVC : UICollectionViewDataSource {
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
