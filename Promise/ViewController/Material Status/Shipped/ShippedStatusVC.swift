//
//  ShippedStatusVC.swift
//  Promise
//
//  Created by macbook on 30/05/1942 Saka.
//  Copyright © 1942 Captain. All rights reserved.
//

import UIKit

class ShippedStatusVC: UIViewController {
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
    //MARK:- variable
    var Arr_onSiteStatusData : NSMutableArray = NSMutableArray()
    var arrFilterData = [FilterData]()
    var Str_NextLink : String = String()
    var Str_PreviousLink : String = String()
    var KLC_obj: KLCPopup?
    var obj_popUpVC : FilterPopup!
    var Arr_onSiteStatusChack = NSMutableArray()
    var markbool = false
    //MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.Initialization()
    }
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(true)
        self.navigationItem.title = "Shipped Status"
        markbool = false
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
        self.tbl_data.rowHeight = UITableView.automaticDimension
        self.tbl_data.tableFooterView = UIView()
        self.tbl_data.separatorStyle = .singleLine
        self.CollectionView_Filter.register(UINib(nibName: "FilterCollectionCell", bundle: nil), forCellWithReuseIdentifier: "FilterCollectionCell")
        ServiceCall.shareInstance.Get_onSiteStatus(ViewController: self, API_Str: Api_Urls.GET_API_onSiteStatus, Param: ["is_active" : switch_FinalRevision.isOn],tag : 1)
        self.btn_Filter.addTarget(self, action: #selector(Get_Filter_popUp(_:)), for: .touchUpInside)
        let value = UIInterfaceOrientation.landscapeRight.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        Utils.setborder(view: view_filterBG, bordercolor: .gray, borderwidth: 1)
        Utils.setcornerRadius(view: view_filterBG, cornerradius: 5)
    }
    @IBAction func switch_FinalRevisionAction(_ sender: UISwitch) {
        ServiceCall.shareInstance.Get_onSiteStatus(ViewController: self, API_Str: Api_Urls.GET_API_onSiteStatus, Param: ["is_active" : sender.isOn],tag : 1)
    }
    // MARK: - Show Filter Popup Shipped_Status
    @objc func Get_Filter_popUp(_ Button : UIButton) {
        self.navigationController?.navigationBar.isTranslucent = true
        self.obj_popUpVC = FilterPopup(nibName: "FilterPopup", bundle: nil)
        self.obj_popUpVC.Str_FilterVC = "Shipped_Status"
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
                    if FirstFilter == "Project Name" || FirstFilter == "Vendor Name" || FirstFilter == "Purchase Order Number" || FirstFilter == "PL Number" {
                        ServiceCall.shareInstance.Get_onSiteStatus(ViewController: self, API_Str: Api_Urls.GET_API_onSiteStatus, Param: [FilterParam: FilterValue] ,tag : 1)
                    }else {
                        ServiceCall.shareInstance.Get_onSiteStatus(ViewController: self, API_Str: Api_Urls.GET_API_onSiteStatus, Param: [FilterParam: SecondFilter] ,tag : 1)
                    }
                } else {
                    print("Filter PopUp Dismiss")
                }
        }
        self.KLC_obj?.show(withRoot: self.view)
    }
    //MARK:- Button next previous Click
    @IBAction func btn_Click_Next(_ sender: UIButton) {
        (Str_NextLink == "") ? Utils.showToastWithMessageAtCenter(message: Strings.kNoMoreData)  : ServiceCall.shareInstance.Get_onSiteStatus(ViewController: self, API_Str: Str_NextLink, Param: [:] ,tag : 1)
    }
    @IBAction func btn_Click_Previous(_ sender: UIButton) {
        (Str_PreviousLink == "") ? Utils.showToastWithMessageAtCenter(message: Strings.kNoMoreData)  :ServiceCall.shareInstance.Get_onSiteStatus(ViewController: self, API_Str: Str_PreviousLink, Param: [:] ,tag : 1)
    }
    //MARK:- Interface Orientations
    override public var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscapeRight
    }
    override public var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return .landscapeRight
    }
    //MARK:- Button CollectionView Filter Click
    @objc func btn_RejectSelected(sender: UIButton){
         self.arrFilterData.remove(at: sender.tag)
        if arrFilterData == nil {
            let rowdata = arrFilterData[sender.tag]
            if rowdata.SelectAttribute == "Project Name" || rowdata.SelectAttribute == "Vendor Name" || rowdata.SelectAttribute == "Purchase Order Number" || rowdata.SelectAttribute == "PL Number" {
                ServiceCall.shareInstance.Get_onSiteStatus(ViewController: self, API_Str: Api_Urls.GET_API_onSiteStatus, Param: [rowdata.FilterParam: rowdata.Value] ,tag : 1)
            }else {
                ServiceCall.shareInstance.Get_onSiteStatus(ViewController: self, API_Str: Api_Urls.GET_API_onSiteStatus, Param: [rowdata.FilterParam: rowdata.SelectCriteria] ,tag : 1)
            }
        } else {
            ServiceCall.shareInstance.Get_onSiteStatus(ViewController: self, API_Str: Api_Urls.GET_API_onSiteStatus, Param: ["is_active" : switch_FinalRevision.isOn],tag : 1)
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
    @objc func btn_Cell_selectHeader_Clicks(_ sender: UIButton) {
        tbl_data.reloadData()
        
    }
    @objc func btn_Cell_select_Clicks(_ sender: UIButton) {
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
}
//MARK:- TableView Initialization
extension ShippedStatusVC : UITableViewDataSource , UITableViewDelegate{
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
            let cell : ShippedStatusHeaderCell = tableView.dequeueReusableCell(withIdentifier: "ShippedStatusHeaderCell") as! ShippedStatusHeaderCell
            cell.isUserInteractionEnabled = false
            return cell
        } else {
            let cell : ShippedStatusCell = tableView.dequeueReusableCell(withIdentifier: "ShippedStatusCell") as! ShippedStatusCell
            cell.Display_Cell(viewController: self, indexPath: indexPath)
            self.set_Button_Target(buttons: [cell.btn_Select], action: #selector(self.btn_Cell_select_Clicks(_:)), tag: indexPath.row)
            markbool = true
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
        OnsiteDetail_VC.Str_Navigate = "Shipped Status"
        self.navigationController?.pushViewController(OnsiteDetail_VC, animated: true)
    }
}
//MARK:- SWRevealViewController Methods
extension ShippedStatusVC : SWRevealViewControllerDelegate {
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
// MARK: - Collection View Datasource Methods
extension ShippedStatusVC : UICollectionViewDataSource {
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
