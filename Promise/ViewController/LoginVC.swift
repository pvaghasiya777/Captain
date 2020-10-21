//
//  LoginVC.swift
//  Promise
//
//  Created by Prime Inspection
//  Copyright © 2020 Captain. All rights reserved.
//

import UIKit

class LoginVC: UIViewController,SWRevealViewControllerDelegate
{
    @IBOutlet var View_Login: UIView!
    @IBOutlet var lbl_login: UILabel!
    @IBOutlet var txt_Password: UITextField!
    @IBOutlet var txt_Username: UITextField!
    @IBOutlet var btn_Login: UIButton!
    @IBOutlet var btn_Forgetpassword: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.Initialization()
    }
    func Initialization() {
        Utils.Set_Corner_Radius(views: [btn_Login,txt_Username,txt_Password], radius: 10)
        Utils.setborder(view: txt_Username, bordercolor: .lightGray, borderwidth: 1)
        Utils.setborder(view: txt_Password, bordercolor: .lightGray, borderwidth: 1)
        self.navigationController?.navigationBar.isHidden = true
        let value = UIInterfaceOrientation.portrait.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
    }

    override public var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    override public var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return .portrait
    }
    @IBAction func btn_Click_Login(_ sender: UIButton) {
       if validateFields() {
           ServiceCall.shareInstance.post_Login(viewConroller: self, parameters:
           ["username": self.txt_Username.text!,
            "password": self.txt_Password.text!])
       }
    }
    @IBAction func btn_Forgot(_ sender: UIButton) {
        print("Forgot Button Click")
        let ForgotVC = Config.StoryBoard.instantiateViewController(withIdentifier: "ForgotVC") as! ForgotVC
        ForgotVC.navigationController?.isNavigationBarHidden = true
        self.navigationController?.pushViewController(ForgotVC, animated: true)
    }
    // MARK: - Validation
    func validateFields() -> Bool {
        if !Utils.isValidString(string: self.txt_Username.text!.trimmed) {
            Utils.showToastWithMessageAtCenter(message: Strings.kUserNameBlankMessage)
            return false
        } else if !Utils.isValidString(string: self.txt_Password.text!.trimmed) {
            Utils.showToastWithMessageAtCenter(message: Strings.kPasswordBlankMessage)
            return false
        }
        return true
    }
    func Right_Login() {
        DEFAULTS.Set_Login(login_status: true)
        UserDefaults.standard.synchronize()
        print("Login Status : \(DEFAULTS.Is_User_LoggedIn())")
        Utils.Set_Root_ViewController()
        Utils.showToastWithMessage_withPosition(message: "Login Sucessfully", position: PositionBottom)
        //        let revealController = SWRevealViewController()
        //        let sidebar_vc = Config.StoryBoard.instantiateViewController(withIdentifier:  "SidebarVC")as! SidebarVC
        //        let Homevc = Config.StoryBoard.instantiateViewController(withIdentifier:  "HomeVC")as! HomeVC
        //        revealController.frontViewController = UINavigationController(rootViewController: Homevc)
        //        revealController.rearViewController = UINavigationController(rootViewController: sidebar_vc)
        //        revealController.delegate = self as SWRevealViewControllerDelegate?
        //        Utils.Set_Navigationbar_Shadow(viewController: revealController)
        //        UIApplication.shared.windows.first?.rootViewController = revealController
        //        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
}
