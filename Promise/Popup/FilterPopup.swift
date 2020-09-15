//
//  FilterPopup.swift
//  Promise
//
//  Created by macbook on 13/05/1942 Saka.
//  Copyright © 1942 Captain. All rights reserved.
//

import UIKit
//import iOSDropDown
import DropDown
class FilterPopup: UIViewController {
    //Mark :- IBOutlet
    @IBOutlet weak var BG_View: UIView!
    @IBOutlet weak var txt_ValueFilter: UITextField?
    @IBOutlet weak var btn_FirstFilter: UIButton!
    @IBOutlet weak var btn_SecondFilter: UIButton!
    @IBOutlet weak var btn_Clear: UIButton!
    @IBOutlet weak var btn_Apply: UIButton!
    @IBOutlet var txt_SecondFilter_Height: NSLayoutConstraint!
    @IBOutlet var txt_ValueFilter_Height: NSLayoutConstraint!
    //Mark :- Variable
    var Is_CancelButtonClick : Bool = false
    var Str_VcName = ""
    var Str_Filter_String = ""
    let FirstFilter = DropDown()
    let SecondFilter = DropDown()

    var Arr_Onsite_Filter = ["Project Name","Vendor Name","Purchase Order Number","PL Number","Is Released","Is Shipped","Is onsite","Is Active"]
    var Arr_Shipped_Filter = ["Project Name","Vendor Name","Purchase Order Number","PL Number","Is Released","Is Shipped","Is Active"]
    var Arr_Packages_Filter = ["Project Name","Vendor Name","Purchase Order","Group name","Strucher Id","Approval Status","status","Is PLInput Genrated","Is Group Strucher","Is Active"]
    var Arr_PackingList_Filter = ["Project Name","Vendor Name","Purchase Order","Group name","Strucher Id","PL Number","Package Name","Approval Status","Status","Is Released","Is Group Strucher","Is Active"]
    var Arr_Project_Filter = ["Project Code","Project Name","Site Location","Manager Name","Refrences","Is Shipper","Is Active"]
    var Arr_Drawing_Filter = ["Project Name","Purchase Order","Group Name","Strucher Id","Approval Status","Doc Status","Is PL Input Created","Is Group Strucher","Is Active"]
    
    var Arr_Second_FIlter = ["Contains","Start with","Equal"]
    var Arr_IsActive = ["True","False"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.Initialization()
//        self.Design()
    }
    func Initialization() {
        firstFilter()
//        secondFilter()
    }

    func firstFilter() {
        
    }
    @IBAction func btn_FirstFilterClick(_ sender: NiceButton) {
        
        if Str_VcName == "Onsite" {
            FirstFilter.anchorView = btn_FirstFilter
            FirstFilter.bottomOffset = CGPoint(x: 0, y: btn_FirstFilter.bounds.height)
            FirstFilter.dataSource = ["Project Name","Vendor Name","Purchase Order Number","PL Number","Is Released","Is Shipped","Is onsite","Is Active"]
            FirstFilter.selectionAction = { [weak self] (index, item) in
               self?.btn_FirstFilter.setTitle(item, for: .normal)
            }
        } else if Str_VcName == "Shipped_Status" {
            FirstFilter.anchorView = btn_FirstFilter
            FirstFilter.bottomOffset = CGPoint(x: 0, y: btn_FirstFilter.bounds.height)
            FirstFilter.dataSource = ["Project Name","Vendor Name","Purchase Order Number","PL Number","Is Released","Is Shipped","Is Active"]
            FirstFilter.selectionAction = { [weak self] (index, item) in
               self?.btn_FirstFilter.setTitle(item, for: .normal)
            }
        } else if Str_VcName == "Shop_Drawing" {
            FirstFilter.anchorView = btn_FirstFilter
            FirstFilter.bottomOffset = CGPoint(x: 0, y: btn_FirstFilter.bounds.height)
            FirstFilter.dataSource = ["Project Name","Purchase Order","Group Name","Strucher Id","Approval Status","Doc Status","Is PL Input Created","Is Group Strucher","Is Active"]
            FirstFilter.selectionAction = { [weak self] (index, item) in
               self?.btn_FirstFilter.setTitle(item, for: .normal)
            }
        } else if Str_VcName == "Packages" {
            FirstFilter.anchorView = btn_FirstFilter
            FirstFilter.bottomOffset = CGPoint(x: 0, y: btn_FirstFilter.bounds.height)
            FirstFilter.dataSource = ["Project Name","Vendor Name","Purchase Order","Group name","Strucher Id","Approval Status","status","Is PLInput Genrated","Is Group Strucher","Is Active"]
            FirstFilter.selectionAction = { [weak self] (index, item) in
               self?.btn_FirstFilter.setTitle(item, for: .normal)
            }
        } else if Str_VcName == "Packing_List" {
            FirstFilter.anchorView = btn_FirstFilter
            FirstFilter.bottomOffset = CGPoint(x: 0, y: btn_FirstFilter.bounds.height)
            FirstFilter.dataSource = ["Project Name","Vendor Name","Purchase Order","Group name","Strucher Id","PL Number","Package Name","Approval Status","Status","Is Released","Is Group Strucher","Is Active"]
            FirstFilter.selectionAction = { [weak self] (index, item) in
               self?.btn_FirstFilter.setTitle(item, for: .normal)
            }
        } else if Str_VcName == "Project" {
            FirstFilter.anchorView = btn_FirstFilter
            FirstFilter.bottomOffset = CGPoint(x: 0, y: btn_FirstFilter.bounds.height)
            FirstFilter.dataSource = ["Project Code","Project Name","Site Location","Manager Name","Refrences","Is Shipper","Is Active"]
            FirstFilter.selectionAction = { [weak self] (index, item) in
               self?.btn_FirstFilter.setTitle(item, for: .normal)
            }
        }
        FirstFilter.show()
        btn_SecondFilter.isEnabled = true
    }
    @IBAction func btn_SecondFilterClick(_ sender: NiceButton) {
        if btn_FirstFilter.currentTitle == "Select" {
            btn_SecondFilter.isEnabled = false
            Utils.showToastWithMessage(message: "Select value")
        } else {
            btn_SecondFilter.isEnabled = true
            SecondFilter.anchorView = btn_SecondFilter
            SecondFilter.bottomOffset = CGPoint(x: 0, y: btn_SecondFilter.bounds.height)
            if btn_FirstFilter.currentTitle == "Project Name" || btn_FirstFilter.currentTitle == "Vendor Name" || btn_FirstFilter.currentTitle == "Purchase Order" || btn_FirstFilter.currentTitle == "PL Number" {
                self.txt_ValueFilter_Height.constant = 50
                SecondFilter.dataSource = ["Contains","Start with","Equal"]
            }else {
                self.txt_ValueFilter_Height.constant = 0
                SecondFilter.dataSource = ["True","False"]
            }
            SecondFilter.selectionAction = { [weak self] (index, item) in
                self?.btn_SecondFilter.setTitle(item, for: .normal)
            }
            SecondFilter.show()
        }
    }
}
