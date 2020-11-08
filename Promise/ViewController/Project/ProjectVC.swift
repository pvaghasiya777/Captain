//
//  ProjectVC.swift
//  Promise
//
//  Created by Promise Inspection
//  Copyright © 2020 Promise. All rights reserved.
//

import UIKit

class ProjectVC: UIViewController
{
    //MARK:- IBOutlet
    @IBOutlet var btn_Profile: UIBarButtonItem!
    @IBOutlet var View_Tbl_Header: UIView!
    @IBOutlet var View_Tbl_pagination: UIView!
    @IBOutlet weak var view_filterBG: UIView!
    @IBOutlet var View_Tbl_Header_Height: NSLayoutConstraint!
    @IBOutlet var btn_menubar: UIBarButtonItem!
    @IBOutlet var btn_Notification: UIBarButtonItem!
    @IBOutlet var btn_CollectionView: UIButton!
    @IBOutlet var btn_Filter: UIButton!
    @IBOutlet var btn_TableView: UIButton!
    @IBOutlet var CollectionView_Filter: UICollectionView!
    @IBOutlet var CollectionView_Project: UICollectionView!
    @IBOutlet var tbl_Project: UITableView!
    @IBOutlet weak var btn_Previous: UIButton!
    @IBOutlet weak var btn_Next: UIButton!
    @IBOutlet weak var lbl_ShowPageNum: UILabel!
    @IBOutlet weak var lbl_PageNum: UILabel!
    @IBOutlet weak var switch_FinalRevision: UISwitch!
    //MARK:- Variable
    let sectionInsets = UIEdgeInsets(top: 8.0, left:  8.0, bottom: 8.0, right: 8.0)
    let itemsperrow : CGFloat = 3
    var Is_ListView : Bool = false
    var Is_GridView : Bool = false
    var arrProject = [MasterProjectModel]()
    var arrFilterData = [FilterData]()
    var KLC_obj: KLCPopup?
    var obj_popUpVC : FilterPopup!
    //MARK:- Life Cycle
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.Initialization()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "Project"
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationItem.title = ""
        self.revealViewController()?.delegate = nil
    }
    func Initialization()
    {
        ServiceCall.shareInstance.Get_getProject(ViewController: self, Api_Str: Api_Urls.GET_API_masterProject, Param: ["is_active": true])
        self.CollectionView_Project.register(UINib(nibName: "Project_CollectionCell", bundle: nil), forCellWithReuseIdentifier: "Project_CollectionCell")
         self.CollectionView_Filter.register(UINib(nibName: "FilterCollectionCell", bundle: nil), forCellWithReuseIdentifier: "FilterCollectionCell")
        self.tbl_Project.register(UINib(nibName: "Project_tbl_Cell", bundle: nil), forCellReuseIdentifier: "Project_tbl_Cell")
        Utils.setborder(view: view_filterBG, bordercolor: .gray, borderwidth: 1)
        Utils.setcornerRadius(view: view_filterBG, cornerradius: 5)
        self.View_Tbl_pagination.isHidden = true
        self.navigationController?.navigationBar.isTranslucent = false
        self.CollectionView_Project.backgroundColor = .clear
        self.tbl_Project.tableFooterView = UIView()
        self.tbl_Project.rowHeight = UITableView.automaticDimension
        self.tbl_Project.separatorStyle = .singleLine
        self.CollectionView_Project.reloadData()
        self.View_Tbl_Header_Height.constant = 0
        self.btn_Filter.addTarget(self, action: #selector(Get_Filter_popUp(_:)), for: .touchUpInside)
        if revealViewController() != nil {
            self.revealViewController().delegate = self
            btn_menubar.target = self.revealViewController()
            btn_menubar.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            self.revealViewController()?.rearViewRevealWidth = 280
        }
        let value = UIInterfaceOrientation.landscapeRight.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
    }
    @IBAction func switch_FinalRevisionAction(_ sender: UISwitch) {
        ServiceCall.shareInstance.Get_getProject(ViewController: self, Api_Str: Api_Urls.GET_API_masterProject, Param: ["is_active": sender.isOn])
    }
    // MARK: - Show Filter Popup// MARK: - Show Filter Popup Project
    @objc func Get_Filter_popUp(_ Button : UIButton) {
        self.navigationController?.navigationBar.isTranslucent = true
        self.obj_popUpVC = FilterPopup(nibName: "FilterPopup", bundle: nil)
        self.obj_popUpVC.Str_FilterVC = "Project"
        self.obj_popUpVC!.view.clipsToBounds = true
        self.obj_popUpVC!.view.layer.cornerRadius = 5.0
        self.obj_popUpVC!.view.frame = CGRect.init(x: 0, y: 0, width: 414, height: 289)
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
                    if FirstFilter == "Project Code" || FirstFilter == "Project Name" || FirstFilter == "Site Location" || FirstFilter == "Manager Name" || FirstFilter == "Refrences" {
                        ServiceCall.shareInstance.Get_getProject(ViewController: self, Api_Str: Api_Urls.GET_API_masterProject, Param: [FilterParam : FilterValue])
                    }else {
                        ServiceCall.shareInstance.Get_getProject(ViewController: self, Api_Str: Api_Urls.GET_API_masterProject, Param: [FilterParam : SecondFilter as Any])
                    }
                } else {
                    print("Filter PopUp Dismiss")
                }
        }
        self.KLC_obj?.show(withRoot: self.view)
    }
    override public var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscapeRight
    }
    override public var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return .landscapeRight
    }
    @IBAction func btn_Click_Mode(_ sender: UIButton) {
        if sender.tag == 1 {
            self.Is_GridView = !self.Is_GridView
            self.btn_CollectionView.setImage(UIImage(named: Is_GridView ? "ic_tiles_view_Active" : "ic_tilesview"), for: .normal)
            self.btn_TableView.setImage(UIImage(named: Is_GridView ? "ic_list_view" : "ic_list_view_Active"), for: .normal)
            self.Is_ListView = false
            
            self.View_Tbl_Header_Height.constant = 0
            self.View_Tbl_Header.isHidden = true
            self.View_Tbl_pagination.isHidden = true
            self.tbl_Project.isHidden = true
            self.CollectionView_Project.isHidden = false
            self.CollectionView_Project.reloadData()
        }else if sender.tag == 2 {
            self.Is_ListView = !self.Is_ListView
            self.btn_TableView.setImage(UIImage(named: Is_ListView ? "ic_list_view_Active" : "ic_list_view"), for: .normal)
            self.btn_CollectionView.setImage(UIImage(named: Is_ListView ? "ic_tilesview" : "ic_tiles_view_Active"), for: .normal)
            self.Is_GridView = false
            self.View_Tbl_Header_Height.constant = 30
            self.View_Tbl_Header.isHidden = false
            self.View_Tbl_pagination.isHidden = false
            self.CollectionView_Project.isHidden = true
            self.tbl_Project.isHidden = false
            self.tbl_Project.reloadData()
        }
    }
    //MARK:- Button next previous Click
    @IBAction func btn_Click_Next(_ sender: UIButton) {
        print("Next Button Click")
    }
    @IBAction func btn_Click_Previous(_ sender: UIButton) {
        print("Next Button Click")
    }
    //MARK:- Button CollectionView Filter Click
    @objc func btn_RejectSelected(sender: UIButton){
        self.arrFilterData.remove(at: sender.tag)
        if arrFilterData == nil {
            let rowdata = arrFilterData[sender.tag]
            if rowdata.SelectAttribute == "Project Code" || rowdata.SelectAttribute == "Project Name" || rowdata.SelectAttribute == "Site Location" || rowdata.SelectAttribute == "Manager Name" || rowdata.SelectAttribute == "Refrences" {
                ServiceCall.shareInstance.Get_getProject(ViewController: self, Api_Str: Api_Urls.GET_API_masterProject, Param: [rowdata.FilterParam : rowdata.Value])
            } else {
                ServiceCall.shareInstance.Get_getProject(ViewController: self, Api_Str: Api_Urls.GET_API_masterProject, Param: [rowdata.FilterParam : rowdata.SelectCriteria as Any])
            }
        } else {
            ServiceCall.shareInstance.Get_getProject(ViewController: self, Api_Str: Api_Urls.GET_API_masterProject, Param: ["is_active": true])
        }
        CollectionView_Filter.reloadData()
    }
}
// MARK: - Collection View Datasource Methods
extension ProjectVC : UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == CollectionView_Project {
            return arrProject.count
        } else {
            return arrFilterData.count
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      
         if collectionView == CollectionView_Project {
            let cell: Project_CollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Project_CollectionCell", for: indexPath) as! Project_CollectionCell
            cell.DisplayCell(arr: arrProject, indexPath: indexPath)
            return cell
         } else {
            let cell: FilterCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "FilterCollectionCell", for: indexPath) as! FilterCollectionCell
            cell.DisplayCell(arr: arrFilterData, indexPath: indexPath.row)
            cell.btn_Close.tag = indexPath.row
            cell.btn_Close.addTarget(self, action: #selector(btn_RejectSelected), for: .touchUpInside)
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let ProjectDetailsFormView_VC = Config.StoryBoard.instantiateViewController(withIdentifier: "ProjectDetailsFormViewVC" )as! ProjectDetailsFormViewVC
        ProjectDetailsFormView_VC.Str_ID = String(describing: arrProject[indexPath.row].id!)
        ProjectDetailsFormView_VC.Str_Title = arrProject[indexPath.row].name!
        self.navigationController?.pushViewController(ProjectDetailsFormView_VC, animated: true)
    }
}
//MARK:- Collection View Dataflow Methods
extension ProjectVC : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let paddingSpace = sectionInsets.left * (itemsperrow + 1)
        let availableWidth = (self.view.frame.width) - paddingSpace
        let availableHeight = (collectionView.frame.height) - paddingSpace
        let widthPerItem = availableWidth / itemsperrow
        let heightPerItem = availableHeight / itemsperrow
        return CGSize(width: Int(widthPerItem), height: Int(heightPerItem))
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
}
extension ProjectVC : UITableViewDataSource,UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrProject.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : Project_tbl_Cell = tableView.dequeueReusableCell(withIdentifier: "Project_tbl_Cell") as! Project_tbl_Cell
        cell.DisplayCell(arr: arrProject, indexPath: indexPath.row)
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let ProjectDetail_VC = Config.StoryBoard.instantiateViewController(withIdentifier: "ProjectDetailsFormViewVC" ) as! ProjectDetailsFormViewVC
        ProjectDetail_VC.Str_ID = String(describing: arrProject[indexPath.row].id!)
        ProjectDetail_VC.Str_Title = arrProject[indexPath.row].name!
        self.navigationController?.pushViewController(ProjectDetail_VC, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 8
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
}
//MARK:- SWRevealViewController Methods
extension ProjectVC : SWRevealViewControllerDelegate {
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
