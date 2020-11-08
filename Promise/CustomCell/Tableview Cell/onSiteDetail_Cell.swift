//
//  onSiteDetail_Cell.swift
//  Promise
//
//  Created by Captain on 11/08/20.
//  Copyright © 2020 Captain. All rights reserved.
//

import UIKit

class onSiteDetail_Cell: UITableViewCell {

    @IBOutlet var btn_Save: UIButton!
    @IBOutlet var btn_Discard: UIButton!
    @IBOutlet var lbl_Number: UILabel!
    @IBOutlet var lbl_Revision: UILabel!
    @IBOutlet var lbl_Package: UILabel!
    @IBOutlet var lbl_KindOfPackage: UILabel!
    @IBOutlet var lbl_Length: UILabel!
    @IBOutlet var lbl_Width: UILabel!
    @IBOutlet var lbl_Height: UILabel!
    @IBOutlet var lbl_Gross_Weight: UILabel!
    @IBOutlet var lbl_Weight: UILabel!
    @IBOutlet var lbl_Stackable: UILabel!
    @IBOutlet var lbl_Min_Temp: UILabel!
    @IBOutlet var lbl_Max_Temp: UILabel!
    @IBOutlet var lbl_Truck_Number: UILabel!
    @IBOutlet var txt_Shipped_Date: UITextField!
    @IBOutlet var txt_Onsite_Date: UITextField!
    @IBOutlet var btn_Active: UIButton!
    @IBOutlet var btn_Shipped: UIButton!
    @IBOutlet var btn_onSite: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        Utils.Set_Same_View_Border(views: [lbl_Number,lbl_Revision,lbl_Package,lbl_KindOfPackage,lbl_Length,lbl_Width,lbl_Height,lbl_Gross_Weight,lbl_Gross_Weight,lbl_Weight,lbl_Stackable,lbl_Min_Temp,lbl_Max_Temp,lbl_Truck_Number,txt_Shipped_Date,txt_Onsite_Date], borderColor: .gray, border_Width: 1)
//        Utils.Set_Same_View_Border(views: [btn_Active,btn_Shipped,btn_onSite], borderColor: .gray, border_Width: 1)
        Utils.Set_Same_Corner_Radius(views: [lbl_Number,lbl_Revision,lbl_Package,lbl_KindOfPackage,lbl_Length,lbl_Width,lbl_Height,lbl_Gross_Weight,lbl_Gross_Weight,lbl_Weight,lbl_Stackable,lbl_Min_Temp,lbl_Max_Temp,lbl_Truck_Number,txt_Shipped_Date,txt_Onsite_Date], cornerRadius: 5)
        Utils.Set_Same_Corner_Radius(views: [btn_Save,btn_Discard,btn_Discard], cornerRadius: 5)
    }
    func DisplayCell(Arr_Data : NSMutableArray,indexpath : IndexPath) {
        let Arr_SiteData = Arr_Data[indexpath.row] as! onSiteStatusDetailModel
        self.lbl_Number.text = Arr_SiteData.number!
                self.lbl_Revision.text = Arr_SiteData.revision!
        self.lbl_Package.text = String(describing: Arr_SiteData.packageField!)
        self.lbl_KindOfPackage.text = Arr_SiteData.kindOfPackage!
        self.lbl_Length.text = (Arr_SiteData.length == nil) ? "" : String(describing: Arr_SiteData.length!)
        self.lbl_Width.text = (Arr_SiteData.width == nil) ? "" : String(describing: Arr_SiteData.width!)
        self.lbl_Height.text = (Arr_SiteData.height == nil) ? "" : String(describing: Arr_SiteData.height!)
        self.lbl_Gross_Weight.text = (Arr_SiteData.grossWeight == nil) ? "" : String(describing: Arr_SiteData.grossWeight!)
        self.lbl_Weight.text = (Arr_SiteData.netWeight == nil) ? "" : String(describing: Arr_SiteData.netWeight!)
        self.lbl_Stackable.text = Arr_SiteData.stackable!
        self.lbl_Min_Temp.text = Arr_SiteData.minTemp!
        self.lbl_Max_Temp.text = Arr_SiteData.maxTemp!
        self.lbl_Truck_Number.text = Arr_SiteData.truckNumber!
        self.txt_Shipped_Date.text = String(describing: nullToNil(value: Arr_SiteData.shippedDate!))
        self.txt_Onsite_Date.text = String(describing: nullToNil(value: Arr_SiteData.onsiteDate!))
        
        btn_Active.setBackgroundImage(UIImage(named:  String((Arr_SiteData.isActive == true) ? "ic_check":"ic_not_released")), for: .normal)
                btn_Shipped.setBackgroundImage(UIImage(named: String((Arr_SiteData.shipped == true) ? "ic_check":"ic_not_released")), for: .normal)
        btn_onSite.setBackgroundImage(UIImage(named: String((Arr_SiteData.onSite == true) ? "ic_check":"ic_not_released")), for: .normal)
    }
    @IBAction func btn_Click_Save(_ sender: UIButton) {
        
    }
    @IBAction func btn_Click_Discard(_ sender: UIButton) {
    }
    func nullToNil(value : AnyObject?) -> String {
        if value is NSNull {
            return ""
        } else {
            return value as! String
        }
    }
}
