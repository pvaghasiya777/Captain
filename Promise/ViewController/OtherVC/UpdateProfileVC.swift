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
    @IBOutlet var btn_ChangePassword: UIButton!
    @IBOutlet var btn_Discard: UIButton!
    @IBOutlet var btn_Timezone: UIButton!
    @IBOutlet var btn_SelectProject: UIButton!
    @IBOutlet var btn_Save: UIButton!
    
    @IBOutlet var img_Profile: UIImageView!
    @IBOutlet var lbl_name: UILabel!
    @IBOutlet var txt_Lastname: UITextField!
    @IBOutlet var txt_Firstname: UITextField!
    @IBOutlet var txt_Email: UITextField!
    @IBOutlet var txt_Username: UITextField!
    //MARK:- Variable
    var Dic_userDetail : NSDictionary = NSDictionary()
    //MARK:-
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.Initialization()
    }
    override func viewWillAppear(_ animated: Bool)
    {
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
        ServiceCall.shareInstance.Get_userDetail(ViewController: self)
        
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
        Utils.Set_Same_View_Border(views: [txt_Username,txt_Firstname,txt_Lastname,txt_Email,View_updateprofile,btn_Timezone,btn_SelectProject], borderColor: .lightGray, border_Width: 0.5)
        Utils.Set_Corner_Radius(views: [txt_Username,txt_Firstname,txt_Lastname,txt_Email,View_updateprofile,btn_Timezone,btn_SelectProject,btn_Save,btn_Discard], radius: 5)
        self.txt_Username.addPadding(.left(8))
        self.txt_Firstname.addPadding(.left(8))
        self.txt_Lastname.addPadding(.left(8))
        self.txt_Email.addPadding(.left(8))
    }
    func Set_userData() {
        self.lbl_name.text = Dic_userDetail.value(forKey: "username") as! String
        self.txt_Username.text = Dic_userDetail.value(forKey: "username") as! String
        self.txt_Firstname.text = Dic_userDetail.value(forKey: "first_name") as! String
        self.txt_Lastname.text = Dic_userDetail.value(forKey: "last_name") as! String
        self.txt_Email.text = Dic_userDetail.value(forKey: "email") as! String
        self.btn_Timezone.setTitle(Dic_userDetail.value(forKey: "timezone") as! String, for: .normal)
        
    }
    //MARK:- Button Action Click
    @IBAction func btn_Click_Notification(_ sender: UIBarButtonItem) {
        print("Notification Click")
    }
    @IBAction func btn_Click_ChangePassword(_ sender: UIButton) {
        let ChangeVC = Config.StoryBoard.instantiateViewController(withIdentifier: "ChagePasswordVC") as! ChagePasswordVC
        ChangeVC.navigationController?.isNavigationBarHidden = true
        self.navigationController?.pushViewController(ChangeVC, animated: true)
    }
    @IBAction func btn_Click_TD(_ sender: UIButton) {
        if sender.tag == 1 {
            print("TimeZone Button Selected")
            Utils.showToastWithMessageAtCenter(message: "TimeZone Button Selected")
        }else if sender.tag == 2 {
            print("Default Project Button Selected")
            Utils.showToastWithMessageAtCenter(message: "Default Project Button Selected")
        }
    }
    @IBAction func btn_Click_Save(_ sender: UIButton) {
        print("Save Button Click")
    }
    @IBAction func btn_Click_Discard(_ sender: UIButton) {
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
