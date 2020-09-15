//
//  ForgotVC.swift
//  Promise 
//
//  Created by Prime Inspection
//  Copyright © 2020 Captain. All rights reserved.
//

import UIKit

class ForgotVC: UIViewController
{
    //MARK:- IBOutlet
    @IBOutlet var btn_back: UIButton!
    @IBOutlet var lbl_Forgot: UILabel!
    @IBOutlet var lbl_Description: UILabel!
    @IBOutlet var txt_Email: UITextField!
    @IBOutlet var btn_Send: UIButton!
    //MARK:- Variable
    //MARK:-Life Cycle
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.Initialization()
    }
    override func viewWillAppear(_ animated: Bool){
       super.viewWillAppear(animated)
       self.navigationController?.isNavigationBarHidden = true
    }
    func Initialization() {
        Utils.setcornerRadius(view: btn_Send, cornerradius: 10)
        Utils.setborder(view: txt_Email, bordercolor: .lightGray, borderwidth: 1)
        Utils.setcornerRadius(view: txt_Email, cornerradius: 5)
        self.txt_Email.addPadding(.left(16))
    }
    //MARK:- Button Action
    @IBAction func btn_Click_Back(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func btn_Click_Send(_ sender: UIButton) {
    }
    
}
