//
//  DrawingVC.swift
//  PromiseApiCall
//
//  Created by macbook on 20/05/1942 Saka.
//  Copyright © 1942 com.mac. All rights reserved.
//



import UIKit
import iOSDropDown
class DrawingVC: UIViewController {
    //MARK:- IBOutlet
    @IBOutlet weak var tbl_Drawing: UITableView!
    @IBOutlet var Searc_project: UISearchBar!
    @IBOutlet var btn_Filter: UIButton!
    @IBOutlet var btn_Sort: UIButton!
    @IBOutlet var btn_FinalRevision: UIButton!
    @IBOutlet weak var btn_First: UIButton!
    @IBOutlet weak var btn_Previous: UIButton!
    @IBOutlet weak var btn_Next: UIButton!
    @IBOutlet weak var btn_Last: UIButton!
    @IBOutlet weak var lbl_ShowPageNum: UILabel!
    @IBOutlet weak var lbl_PageNum: UILabel!
    @IBOutlet weak var txt_ProjectName: DropDown!
    //MARK:- variable
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
        self.navigationItem.title = "Shop Drawing"
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationItem.title = ""
        self.revealViewController()?.delegate = nil
    }
    //MARK:- Initialisation
    func initializeview() {
        if Str_NavigateFrom == "Purchase" {
            ServiceCall.shareInstance.Get_getDrawing(ViewController: self, param: ["purchase_id" : Str_ID])
        }else if Str_NavigateFrom == "Project" {
            ServiceCall.shareInstance.Get_getDrawing(ViewController: self, param: ["project_id" : Str_ID])
        }else if Str_NavigateFrom == "Drawing_Revision" {
            ServiceCall.shareInstance.Get_getDrawing(ViewController: self, param: ["structure_id" : Str_ID])
            DEFAULTS.Set_Revision_Count(Count: 1)
        }else {
            ServiceCall.shareInstance.Get_getDrawing(ViewController: self, param: [:])
            self.Load_Dashboard()
            DEFAULTS.Set_Revision_Count(Count: 0)
        }
        self.UIdesign()
        self.tbl_Drawing.rowHeight = UITableView.automaticDimension
        self.tbl_Drawing.tableFooterView = UIView()
        self.tbl_Drawing.separatorStyle = .singleLine
        self.btn_Filter.addTarget(self, action: #selector(btn_FilterClick(_:)), for: .touchUpInside)
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
        let viewAction = UIContextualAction(style: .normal, title: "") { (action, view, completion) in
            // Perform your action here
            completion(true)
            
            let DrwaingViewVC1 = Config.StoryBoard.instantiateViewController(withIdentifier: "DrwaingViewVC_1") as! DrwaingViewVC_1
            DrwaingViewVC1.id = String(self.arrDrawing[indexPath.row].id)
            self.navigationController?.pushViewController(DrwaingViewVC1, animated: true)
        }
        let editAction = UIContextualAction(style: .normal, title: "") { (action, view, completion) in
            //                let DrwaingView_VC = Config.StoryBoard.instantiateViewController(withIdentifier: "DrwaingViewVC_1") as! DrwaingViewVC_1
            //                DrwaingView_VC.id = String(self.arrDrawing[indexPath.row].id)
            //                self.navigationController?.pushViewController(DrwaingView_VC, animated: true)
            completion(true)
        }
        let deleteAction = UIContextualAction(style: .normal, title: "") { (action, view, completion) in
            // Perform your action here
            completion(true)
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
