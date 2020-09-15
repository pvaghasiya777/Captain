//
//  PackageDetailsCell.swift
//  Promise
//
//  Created by macbook on 07/05/1942 Saka.
//  Copyright © 1942 Captain. All rights reserved.
//

import UIKit

class PackageDetailsCell: UITableViewCell {
    @IBOutlet var txt_Name: UITextField!
    @IBOutlet var txt_InputNumber: UITextField!
    @IBOutlet var txt_RevisionNumber: UITextField!
    @IBOutlet var txt_PONumber: UITextField!
    @IBOutlet var txt_Project: UITextField!
    @IBOutlet var txt_Status: UITextField!
    @IBOutlet var txt_Vendor: UITextField!
    @IBOutlet var txt_Structure: UITextField!
    @IBOutlet var txt_Address: UITextField!
    @IBOutlet var txt_CountryofOrigin: UITextField!
    @IBOutlet var txt_PickupLocation: UITextField!
    @IBOutlet var txt_ContactDetails: UITextField!
    @IBOutlet var txt_NameofGoods: UITextField!
    @IBOutlet var txt_InspectionTime: UITextField!
    @IBOutlet var btn_PLGenrated: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        UIdesign()
    }
    func UIdesign() {
        Utils.setborder(view: txt_Name, bordercolor: App_Colors.boderColor, borderwidth: 1)
        Utils.setborder(view: txt_InputNumber, bordercolor: App_Colors.boderColor, borderwidth: 1)
        Utils.setborder(view: txt_RevisionNumber, bordercolor: App_Colors.boderColor, borderwidth: 1)
        Utils.setborder(view: txt_PONumber, bordercolor: App_Colors.boderColor, borderwidth: 1)
        Utils.setborder(view: txt_Project, bordercolor: App_Colors.boderColor, borderwidth: 1)
        Utils.setborder(view: txt_Status, bordercolor: App_Colors.boderColor, borderwidth: 1)
        Utils.setborder(view: txt_Vendor, bordercolor: App_Colors.boderColor, borderwidth: 1)
        Utils.setborder(view: txt_Structure, bordercolor: App_Colors.boderColor, borderwidth: 1)
        Utils.setborder(view: txt_Address, bordercolor: App_Colors.boderColor, borderwidth: 1)
        Utils.setborder(view: txt_CountryofOrigin, bordercolor: App_Colors.boderColor, borderwidth: 1)
        Utils.setborder(view: txt_PickupLocation, bordercolor: App_Colors.boderColor, borderwidth: 1)
        Utils.setborder(view: txt_ContactDetails, bordercolor: App_Colors.boderColor, borderwidth: 1)
        Utils.setborder(view: txt_NameofGoods, bordercolor: App_Colors.boderColor, borderwidth: 1)
        Utils.setborder(view: txt_InspectionTime, bordercolor: App_Colors.boderColor, borderwidth: 1)
        Utils.setborder(view: btn_PLGenrated, bordercolor: App_Colors.boderColor, borderwidth: 1)
        
        Utils.setcornerRadius(view: txt_Name, cornerradius: 5)
        Utils.setcornerRadius(view: txt_InputNumber, cornerradius: 5)
        Utils.setcornerRadius(view: txt_RevisionNumber, cornerradius: 5)
        Utils.setcornerRadius(view: txt_PONumber, cornerradius: 5)
        Utils.setcornerRadius(view: txt_Project, cornerradius: 5)
        Utils.setcornerRadius(view: txt_Status, cornerradius: 5)
        Utils.setcornerRadius(view: txt_Vendor, cornerradius: 5)
        Utils.setcornerRadius(view: txt_Structure, cornerradius: 5)
        Utils.setcornerRadius(view: txt_Address, cornerradius: 5)
        Utils.setcornerRadius(view: txt_CountryofOrigin, cornerradius: 5)
        Utils.setcornerRadius(view: txt_ContactDetails, cornerradius: 5)
        Utils.setcornerRadius(view: txt_NameofGoods, cornerradius: 5)
        Utils.setcornerRadius(view: txt_InspectionTime, cornerradius: 5)
        Utils.setcornerRadius(view: btn_PLGenrated, cornerradius: 5)
       }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
