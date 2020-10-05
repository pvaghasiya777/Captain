//
//  UpdateProfileVC.swift
//  Promise
//
//  Created by Promise Inspection
//  Copyright © 2020 Captain. All rights reserved.
//

import UIKit

class UpdateProfileVC: UIViewController
{
    //MARK:- IBOutlet
    @IBOutlet var View_updateprofile: UIView!
    @IBOutlet var btn_menubar: UIBarButtonItem!
    @IBOutlet var btn_menunotification: UIBarButtonItem!
    @IBOutlet var btn_Timezone: UIButton!
    @IBOutlet var btn_SelectProject: UIButton!
    @IBOutlet var btn_Default_Discipline : UIButton!
    
    @IBOutlet var img_Profile: UIImageView!
    @IBOutlet var lbl_name: UILabel!
    @IBOutlet var txt_Lastname: UITextField!
    @IBOutlet var txt_Firstname: UITextField!
    @IBOutlet var txt_Email: UITextField!
    @IBOutlet var txt_Username: UITextField!
    var KLC_obj: KLCPopup?
    var obj_popUpVC : UserProfilePopUP!
    var Str_ProjectId = ""
    var Str_DisciplineId = ""
    //MARK:- Variable
    var Dic_userDetail : NSDictionary = NSDictionary()
    //MARK:-
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.Initialization()
    }
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationItem.title = ""
        self.revealViewController()?.delegate = nil
    }
    //MARK:-
    func Initialization() {
        if revealViewController() != nil {
            self.revealViewController().delegate = self
            btn_menubar.target = self.revealViewController()
            btn_menubar.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            self.revealViewController()?.rearViewRevealWidth = 280
        }
        self.Design()
        ServiceCall.shareInstance.Get_userDetail(APi_Str: Api_Urls.GET_API_userDetail + DEFAULTS.Get_UerID() + "/", ViewController: self, tag: 1)
        ServiceCall.shareInstance.Get_userDetail(APi_Str: Api_Urls.GET_API_DDisciplines, ViewController: self, tag: 2)
        let value = UIInterfaceOrientation.portrait.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
    }
    override public var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    override public var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return .portrait
    }
    func Design() {
        Utils.Set_Same_View_Border(views: [txt_Username,txt_Firstname,txt_Lastname,txt_Email,View_updateprofile,btn_Timezone,btn_SelectProject,btn_Default_Discipline], borderColor: .lightGray, border_Width: 0.5)
        Utils.Set_Corner_Radius(views: [txt_Username,txt_Firstname,txt_Lastname,txt_Email,View_updateprofile,btn_Timezone,btn_SelectProject], radius: 5)
        self.txt_Username.addPadding(.left(8))
        self.txt_Firstname.addPadding(.left(8))
        self.txt_Lastname.addPadding(.left(8))
        self.txt_Email.addPadding(.left(8))
    }
    func Set_userData() {
        self.lbl_name.text = (Dic_userDetail.value(forKey: "username") as! String)
        self.txt_Username.text = (Dic_userDetail.value(forKey: "username") as! String)
        self.txt_Firstname.text = (Dic_userDetail.value(forKey: "first_name") as! String)
        self.txt_Lastname.text = (Dic_userDetail.value(forKey: "last_name") as! String)
        self.txt_Email.text = (Dic_userDetail.value(forKey: "email") as! String)
        self.btn_Timezone.setTitle((Dic_userDetail.value(forKey: "timezone") as! String), for: .normal)
        if Dic_userDetail.value(forKey: "default_project")! is NSNull {
            self.btn_SelectProject.setTitle("All", for: .normal)
        }else {
            self.btn_SelectProject.setTitle(DEFAULTS.Get_UserPermission().data!.projects!.filter{$0.id! == Int(String(describing: Dic_userDetail.value(forKey: "default_project")!))!}[0].name!, for: .normal)
        }
    }
    //MARK:- Show Filter Popup Onsite
    func Get_Selection_Popup(str_Navigate : String) {
        self.navigationController?.navigationBar.isTranslucent = true
        self.obj_popUpVC = UserProfilePopUP(nibName: "UserProfilePopUP", bundle: nil)
        self.obj_popUpVC.str_Navigate = str_Navigate
        self.obj_popUpVC!.view.clipsToBounds = true
        self.obj_popUpVC!.view.layer.cornerRadius = 5.0
        self.KLC_obj = KLCPopup(contentView: self.obj_popUpVC!.view, showType: .bounceInFromTop , dismissType: .bounceOutToTop, maskType: .dimmed, dismissOnBackgroundTouch: true, dismissOnContentTouch: false)
        self.KLC_obj?.didFinishDismissingCompletion =
            {() -> Void in
                if !(self.obj_popUpVC?.Is_CancelButtonClick)! {
                    self.navigationController?.navigationBar.isTranslucent = true
                   print("Filter Did select")
                    if self.obj_popUpVC.str_Navigate == "TimeZone" {
                        self.btn_Timezone.setTitle(self.obj_popUpVC.str_Selected, for: .normal)
                    }else if self.obj_popUpVC.str_Navigate == "Disciple" {
                        self.btn_Default_Discipline.setTitle(self.obj_popUpVC.str_Selected, for: .normal)
                        self.Str_DisciplineId = self.obj_popUpVC.Str_id
                    }else{
                        self.btn_SelectProject.setTitle(self.obj_popUpVC.str_Selected, for: .normal)
                        self.Str_ProjectId = self.obj_popUpVC.Str_id
                    }
                } else {
                    print("Filter PopUp Dismiss")
                }
        }
        self.KLC_obj?.show(withRoot: self.view)
    }
    //MARK:- Button Action Click
    @IBAction func btn_Click_Notification(_ sender: UIBarButtonItem) {
        print("Notification Click")
    }
    
    @IBAction func btn_Click_TD(_ sender: UIButton) {
        if sender.tag == 1 {
            print("TimeZone Button Selected")
            self.Get_Selection_Popup(str_Navigate: "TimeZone")
        }else if sender.tag == 2 {
            print("Default Project Button Selected")
            self.Get_Selection_Popup(str_Navigate: "Project")
        }else if sender.tag == 3 {
            self.Get_Selection_Popup(str_Navigate: "Disciple")
        }
    } 
    @IBAction func btn_Click_Save(_ sender: UIButton) {
        print("Save Button Click")
        ServiceCall.shareInstance.Set_UpdateProfile(ViewController: self, param: ["default_discipline" : Str_DisciplineId,
        "default_project" : Str_ProjectId,
        "email": self.txt_Email.text!,
        "first_name":self.txt_Firstname.text!,
        "last_name":self.txt_Lastname.text!,
        "timezone":self.btn_Timezone.currentTitle!,
        "username":self.txt_Username.text!])
    }
    @IBAction func btn_Click_Discard(_ sender: UIButton) {
        self.set_DashBoard()
    }
    func set_DashBoard() {
        let revealController = SWRevealViewController()
        let sidebar_vc = Config.StoryBoard.instantiateViewController(withIdentifier:  "SidebarVC")as! SidebarVC
        let Homevc = Config.StoryBoard.instantiateViewController(withIdentifier:  "HomeVC")as! HomeVC
        revealController.frontViewController = UINavigationController(rootViewController: Homevc)
        revealController.rearViewController = UINavigationController(rootViewController: sidebar_vc)
        revealController.delegate = self as SWRevealViewControllerDelegate?
        SceneDelegate.shared?.window?.rootViewController = revealController
        SceneDelegate.shared?.window?.makeKeyAndVisible()
    }
}
//MARK:- SWRevealViewController Methods
extension UpdateProfileVC : SWRevealViewControllerDelegate {
    // MARK: - Reveal View Controller Delagate Methods
    func revealController(_ revealController: SWRevealViewController, didMoveTo position: FrontViewPosition) {
        print(position)
        print("Parent View")
        Utils.Disable_Front_ViewController(viewController: self, position: position)
    }
    func revealController(_ revealController: SWRevealViewController, willMoveTo position: FrontViewPosition) {
        print(position)
        print("SideView")
        Utils.Disable_Front_ViewController(viewController: self, position: position)
    }
}
