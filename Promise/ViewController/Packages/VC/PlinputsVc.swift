//
//  PlinputsVc.swift
//  Packages
//
//  Created by macbook on 23/05/1942 Saka.
//  Copyright © 1942 com.mac. All rights reserved.
//

import UIKit

class PlinputsVc: UIViewController
{
    @IBOutlet var menu_Barbutton: UIBarButtonItem?
    @IBOutlet weak var tbl_data: UITableView!
    @IBOutlet weak var btn_Filter: UIButton!
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
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        self.navigationItem.title = "Packages"
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationItem.title = ""
        self.revealViewController()?.delegate = nil
    }
    
    func Initialization() {
        if Str_NavigateFrom == "Drawin Edit" {
            ServiceCall.shareInstance.Get_PLreports(ViewController: self, Api_Str: Api_Urls.GET_API_plReports, param: ["shop_drawing_id" : Str_ID])
        } else if Str_NavigateFrom == "Project" {
            ServiceCall.shareInstance.Get_PLreports(ViewController: self, Api_Str: Api_Urls.GET_API_plReports, param: ["project_id" : Str_ID])
        }else if Str_NavigateFrom == "Purchase"{
            ServiceCall.shareInstance.Get_PLreports(ViewController: self, Api_Str: Api_Urls.GET_API_plReports, param: ["purchase_id" : Str_ID])
        }else {
            ServiceCall.shareInstance.Get_PLreports(ViewController: self, Api_Str: Api_Urls.GET_API_plReports, param: [:])
            self.Load_Dashboard()
        }
        self.btn_Filter.addTarget(self, action: #selector(Get_Filter_popUp(_:)), for: .touchUpInside)
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
            cell.selectionStyle = .none
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
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
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        if indexPath.section == 1 {
            let viewAction = UIContextualAction(style: .normal, title: "") { (action, view, completion) in
                let Packages_View = Config.StoryBoard.instantiateViewController(identifier: "PackagesViewVC") as! PackagesViewVC
                Packages_View.str_ID =  String((self.Arr_PLInputs_Data[indexPath.row] as! PLreportsModel).id)
                Packages_View.Str_VendorName = (self.Arr_PLInputs_Data[indexPath.row] as! PLreportsModel).vendorName!
                Packages_View.Str_Strucher = (self.Arr_PLInputs_Data[indexPath.row] as! PLreportsModel).shopDrawingName!
                Packages_View.Str_ProjectName = (self.Arr_PLInputs_Data[indexPath.row] as! PLreportsModel).projectName!
                self.navigationController?.pushViewController(Packages_View, animated: true)
                completion(true)
                print("View Click")
            }
            viewAction.image = UIImage(named: "ic_eye")
            viewAction.backgroundColor = Config.bgColor
            return UISwipeActionsConfiguration(actions: [viewAction])
        }
        return UISwipeActionsConfiguration(actions: [])
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
