//
//  PurchaseOrderformCell.swift
//  Promise
//
//  Created by macbook on 08/05/1942 Saka.
//  Copyright © 1942 Captain. All rights reserved.
//

import UIKit
import iOSDropDown
class PurchaseOrderformCell: UITableViewCell {
    //MARK :- IBOutlet
    @IBOutlet var view_PurchaseDetails: UIView!
    @IBOutlet var view_PurchaseDetails2: UIView!
    @IBOutlet var view_DocumentAttachment: UIView!
    //ViewPurchase Details First
    @IBOutlet var txt_Number: UITextField!
    @IBOutlet var txt_Vendor: DropDown!
    @IBOutlet var txt_Project: DropDown!
    @IBOutlet var txt_POType: UITextField!
    @IBOutlet var txt_Address: UITextField!
    @IBOutlet var txt_ShipperDetails : UITextField!
    //ViewPurchase Detail Second
    @IBOutlet var txt_Date: UITextField!
    @IBOutlet var txt_DeliveryDate: DropDown!
    @IBOutlet var txt_Currency: DropDown!
    @IBOutlet var txt_WeightUOM: UITextField!
    @IBOutlet var txt_Dimension: UITextField!
    @IBOutlet var txt_Volume: UITextField!
    @IBOutlet var btn_isActive: UIButton!
    //ViewDocument Attachment
    @IBOutlet var txt_ExcelFile: UITextField!
    @IBOutlet var txt_PDFFIle: UITextField!
    @IBOutlet var btn_ExcelFile: UIButton!
    @IBOutlet var btn_PDFFIle: UIButton!
    //Commom Action
    @IBOutlet var btn_FormDetails: UIButton!
    @IBOutlet var btn_DocumentAttachment: UIButton!
    @IBOutlet var lbl_FormDetails: UILabel!
    @IBOutlet var lbl_DocumentAttachment: UILabel!
    //Mark :- Variable
    
    override func awakeFromNib() {
        super.awakeFromNib()
        view_DocumentAttachment.isHidden = true
        lbl_DocumentAttachment.isHidden = true
        Utils.EnableTextField(textFields: [txt_Number,txt_Vendor,txt_Project,txt_WeightUOM,txt_Dimension,txt_Volume,txt_DeliveryDate,txt_Date,txt_Project,txt_POType,txt_Address,txt_Currency])
    }
    func DisplayCell(Arr_Data : [SingleMasterPurchaseModel],indexpath : IndexPath) {
        print(Arr_Data)
        if Arr_Data.count != 0 {
            self.txt_Number.text = Arr_Data[0].number!
            self.txt_WeightUOM.text = Arr_Data[0].weight_uom!
            self.txt_Dimension.text = Arr_Data[0].dimension_uom!
            self.txt_Volume.text = Arr_Data[0].volume_uom!
            self.txt_DeliveryDate.text = (Arr_Data[0].delivery_date != nil) ? Arr_Data[0].delivery_date! : "Select Date"
            self.txt_Date.text = (Arr_Data[0].date != nil) ? Arr_Data[0].delivery_date! : "Select Date"
            let Arr_Vendor = DEFAULTS.Get_MasterVendor().filter {$0.id! == Arr_Data[0].vendor_id!}
            let Arr_POType = DEFAULTS.Get_MasterPOType().filter {$0.id! == Arr_Data[0].po_type_id!}
            let Arr_Address = DEFAULTS.Get_AddressStruct().filter {$0.id! == Arr_Data[0].address_id!}
            let Arr_Currency = DEFAULTS.Get_MasterCurrency().filter {$0.id! == Arr_Data[0].currency_id!}
            let Arr_Project = DEFAULTS.Get_MasterProject().filter {$0.id! == Arr_Data[0].project_id!}
            
            self.txt_Vendor.text = Arr_Vendor[0].name!
            self.txt_Project.text = Arr_Project[0].name!
            self.txt_POType.text = Arr_POType[0].name!
            self.txt_Address.text = Arr_Address[0].name!
            self.txt_Currency.text = Arr_Address[0].name!
//            self.btn_isActive.setBackgroundImage(UIImage(named: ""), for: .normal)
        }
    }
    //Buttion Action
    @IBAction func btn_formAndDocument(_ sender: UIButton) {
        self.view_DocumentAttachment.isHidden = (sender.tag == 1) ? false : true
        self.view_PurchaseDetails2.isHidden = (sender.tag == 1) ?  true : false
        self.view_PurchaseDetails.isHidden = (sender.tag == 1) ?  true : false
        self.lbl_FormDetails.isHidden = (sender.tag == 1) ?  true : false
        self.lbl_DocumentAttachment.isHidden = (sender.tag == 1) ? false : true
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
