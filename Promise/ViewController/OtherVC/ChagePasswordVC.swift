//
//  ChagePasswordVC.swift
//  Promise
//
//  Created by Promise Inspection
//  Copyright © 2020 Captain. All rights reserved.
//

import UIKit

class ChagePasswordVC: UIViewController
{
    //MARK:- IBOutlet
    @IBOutlet var btn_Back: UIButton!
    @IBOutlet var view_ChangePassword: UIView!
    @IBOutlet var txt_OldPassword: UITextField!
    @IBOutlet var txt_NewPassword: UITextField!
    @IBOutlet var txt_ConfirmPassword: UITextField!
    @IBOutlet var btn_Cancel: UIButton!
    @IBOutlet var btn_Update: UIButton!
    //MARK:- Variable
    //MARK:- Life Cycle
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.Initialization()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    func Initialization() {
        Utils.setcornerRadius(view: view_ChangePassword, cornerradius: 10)
        Utils.setcornerRadius(view: txt_OldPassword, cornerradius: 5)
        Utils.setcornerRadius(view: txt_NewPassword, cornerradius: 5)
        Utils.setcornerRadius(view: txt_ConfirmPassword, cornerradius: 5)
        Utils.setcornerRadius(view: btn_Cancel, cornerradius: 10)
        Utils.setcornerRadius(view: btn_Update, cornerradius: 10)
        self.txt_OldPassword.addPadding(.left(16))
        self.txt_NewPassword.addPadding(.left(16))
        self.txt_ConfirmPassword.addPadding(.left(16))
        Utils.Set_Same_View_Border(views: [txt_OldPassword,txt_NewPassword,txt_ConfirmPassword,view_ChangePassword], borderColor: .lightGray, border_Width: 0.5)
    }
    //MARK:- Button Action Click
    @IBAction func btn_Click_Update(_ sender: UIButton) {
        print("Update Click")
    }
    @IBAction func btn_Click_Cancel(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
