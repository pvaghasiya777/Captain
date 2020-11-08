//
//  FilterPopup.swift
//  Promise
//
//  Created by Captain  on 13/05/1942 Saka.
//  Copyright ©Captain. All rights reserved.
//

import UIKit
import DropDown
class FilterPopup: UIViewController {
    //MARK:- IBOutlet
    @IBOutlet weak var BG_View: UIView!
    @IBOutlet weak var txt_ValueFilter: UITextField?
    @IBOutlet weak var btn_FirstFilter: UIButton!
    @IBOutlet weak var btn_SecondFilter: UIButton!
    @IBOutlet weak var btn_Clear: UIButton!
    @IBOutlet weak var btn_Apply: UIButton!
    @IBOutlet var btn_SecondFilter_Height: NSLayoutConstraint!
    @IBOutlet var txt_ValueFilter_Height: NSLayoutConstraint!
    //MARK:- Variable
    var Is_CancelButtonClick : Bool = false
    var Str_FilterVC = ""
    var Str_Filter_String = ""
    var Str_FirstFilter_Selected = ""
    let FirstFilter = DropDown()
    let SecondFilter = DropDown()
    var Arr_Onsite_Filter = ["Project Name","Vendor Name","Purchase Order Number","PL Number","Is Released","Is Shipped","Is onsite","Is Active"]
    var Arr_Shipped_Filter = ["Project Name","Vendor Name","Purchase Order Number","PL Number","Is Released","Is Shipped","Is Active"]
    var Arr_Packages_Filter = ["Project Name","Vendor Name","Purchase Order","Group name","Strucher Id","Approval Status","status","Is PLInput Genrated","Is Group Strucher","Is Active"]
    var Arr_PackingList_Filter = ["Project Name","Vendor Name","Purchase Order","Group name","Strucher Id","PL Number","Package Name","Approval Status","Status","Is Released","Is Group Strucher","Is Active"]
    var Arr_Project_Filter = ["Project Code","Project Name","Site Location","Manager Name","Refrences","Is Shipper","Is Active"]
    var Arr_Drawing_Filter = ["Project Name","Purchase Order","Group Name","Structure Id","Approval Status","Doc Status","Is PL Input Created","Is Group Structure","Is Active"]
    var Arr_Second_FIlter = ["Contains","Start with","Equal"]
    var Arr_IsActive = ["True","False"]
    //MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.Initialization()
        self.Design()
    }
    //MARK:- Initialization
    func Initialization() {
        self.btn_Apply.addTarget(self, action: #selector(btn_Apply_Click(_:)), for: .touchUpInside)
        self.btn_Clear.addTarget(self, action: #selector(btn_Cancel_Click(_:)), for: .touchUpInside)
        self.btn_SecondFilter.isUserInteractionEnabled = false
        //First Filter
        self.FirstFilter.anchorView = self.btn_FirstFilter
        self.FirstFilter.bottomOffset = CGPoint(x: 0, y: btn_FirstFilter.bounds.height)
        self.FirstFilter.selectionAction = { [weak self] (index, selectedText) in
            print("Selected String: \(selectedText) \n index: \(index)")
            self?.btn_FirstFilter.setTitle(selectedText, for: .normal)
            self?.Str_FirstFilter_Selected = selectedText
            self?.Set_Second_Filter(Selected: selectedText)
            self?.btn_SecondFilter.isUserInteractionEnabled = true
        }
        //Second Filter
        self.SecondFilter.anchorView = self.btn_SecondFilter
        self.SecondFilter.bottomOffset = CGPoint(x: 0, y: self.btn_SecondFilter.bounds.height)
        self.btn_SecondFilter.setTitle("Select", for: .normal)
        SecondFilter.selectionAction = { [weak self] (index, item) in
            self?.btn_SecondFilter.setTitle(item, for: .normal)
        }
    }
    func Design() {
        Utils.Set_Same_Corner_Radius(views: [BG_View,btn_Apply,btn_Clear,btn_FirstFilter,btn_SecondFilter,txt_ValueFilter!], cornerRadius: 5)
        Utils.Set_Same_View_Border(views: [btn_FirstFilter,btn_SecondFilter,txt_ValueFilter!], borderColor: .lightGray, border_Width: 0.5)
    }
    //MARK:- Button Cllick Event
    @IBAction func btn_FirstFilterClick(_ sender: NiceButton) {
        if Str_FilterVC == "Onsite" {
            self.FirstFilter.dataSource = Arr_Onsite_Filter
        }else if Str_FilterVC == "Packages" {
            self.FirstFilter.dataSource = Arr_Packages_Filter
        }else if Str_FilterVC == "Packing_List" {
            self.FirstFilter.dataSource = Arr_PackingList_Filter
        }else if Str_FilterVC == "Project" {
            self.FirstFilter.dataSource = Arr_Project_Filter
        }else if Str_FilterVC == "Shipped_Status" {
            self.FirstFilter.dataSource = Arr_Shipped_Filter
        }else if Str_FilterVC == "Shop_Drawing" {
            self.FirstFilter.dataSource = Arr_Drawing_Filter
        }
        self.FirstFilter.show()
    }
    @IBAction func btn_SecondFilterClick(_ sender: NiceButton) {
        if btn_FirstFilter.currentTitle == "Select" || btn_SecondFilter.isUserInteractionEnabled == false {
            Utils.showToastWithMessage(message: "Select First Filter Value")
        }else {
            if Str_FilterVC == "Onsite" || Str_FilterVC == "Shipped_Status" {
                if Str_FirstFilter_Selected == "Project Name" || Str_FirstFilter_Selected == "Vendor Name" || Str_FirstFilter_Selected == "Purchase Order Number" || Str_FirstFilter_Selected == "PL Number" {
                    self.SecondFilter.dataSource = self.Arr_Second_FIlter
                }else {
                    self.SecondFilter.dataSource = self.Arr_IsActive
                }
            }else if Str_FilterVC == "Packages" {
                if Str_FirstFilter_Selected == "Project Name" || Str_FirstFilter_Selected == "Vendor Name" || Str_FirstFilter_Selected ==  "Group name" || Str_FirstFilter_Selected == "Strucher Id" || Str_FirstFilter_Selected == "Approval Status" || Str_FirstFilter_Selected == "status" {
                    self.SecondFilter.dataSource = self.Arr_Second_FIlter
                }else {
                    self.SecondFilter.dataSource = self.Arr_IsActive
                }
            }else if Str_FilterVC == "Packing_List" {
                if Str_FirstFilter_Selected == "Project Name" || Str_FirstFilter_Selected == "Vendor Name" || Str_FirstFilter_Selected == "Group name" || Str_FirstFilter_Selected == "Strucher Id" || Str_FirstFilter_Selected == "PL Number" || Str_FirstFilter_Selected == "Package Name" || Str_FirstFilter_Selected == "Approval Status" || Str_FirstFilter_Selected == "Status" {
                    self.SecondFilter.dataSource = self.Arr_Second_FIlter
                }else{
                    self.SecondFilter.dataSource = self.Arr_IsActive
                }
            }else if Str_FilterVC == "Project" {
                if Str_FirstFilter_Selected == "Project Code" || Str_FirstFilter_Selected == "Project Name" || Str_FirstFilter_Selected == "Site Location" || Str_FirstFilter_Selected == "Manager Name" || Str_FirstFilter_Selected == "Refrences" {
                    self.SecondFilter.dataSource = self.Arr_Second_FIlter
                }else {
                    self.SecondFilter.dataSource = self.Arr_IsActive
                }
            }else if Str_FilterVC == "Shop_Drawing" {
                if Str_FirstFilter_Selected == "Project Name" || Str_FirstFilter_Selected == "Group Name" || Str_FirstFilter_Selected == "Strucher Id" || Str_FirstFilter_Selected == "Approval Status" || Str_FirstFilter_Selected == "Doc Status" {
                    self.SecondFilter.dataSource = self.Arr_Second_FIlter
                }else {
                    self.SecondFilter.dataSource = self.Arr_IsActive
                }
            }
            self.SecondFilter.show()
        }
    }
    func SearchString(strSearchFor : String , searchType : String)  {
        if  searchType == "Contains" {
            self.Str_Filter_String = strSearchFor + Second_Filter_Value.GET_Filter_icontains
        }else if  searchType == "Start with" {
            self.Str_Filter_String = strSearchFor + Second_Filter_Value.GET_Filter_istartswith
        }else if searchType == "Equal" {
            self.Str_Filter_String = strSearchFor + Second_Filter_Value.GET_Filter_Equal
        }
    }
    @objc func btn_Apply_Click(_ Button : UIButton) {
        //-----------------Onsite And Shipped Status Final Filter Param----------------------//
        if Str_FilterVC == "Onsite" || Str_FilterVC == "Shipped_Status" {
            if btn_FirstFilter.currentTitle! ==  "Project Name" {
                self.SearchString(strSearchFor: Filter_onSite_Shipped.GET_Filter_ProjectName, searchType: btn_SecondFilter.currentTitle!)
            } else if btn_FirstFilter.currentTitle! ==  "Vendor Name" {
                self.SearchString(strSearchFor: Filter_onSite_Shipped.GET_Filter_VendorName, searchType: btn_SecondFilter.currentTitle!)
            } else if btn_FirstFilter.currentTitle! ==  "Purchase Order Number" {
                self.SearchString(strSearchFor: Filter_onSite_Shipped.GET_Filter_PurchaseOrderNumber, searchType: btn_SecondFilter.currentTitle!)
            } else if btn_FirstFilter.currentTitle! ==  "PL Number" {
                self.SearchString(strSearchFor: Filter_onSite_Shipped.GET_Filter_PLNumber, searchType: btn_SecondFilter.currentTitle!)
            } else if self.btn_FirstFilter.currentTitle! == "Is Active" {
                self.Str_Filter_String = Filter_onSite_Shipped.GET_Filter_IsActive
            } else if self.btn_FirstFilter.currentTitle! == "Is onsite" {
                self.Str_Filter_String = Filter_onSite_Shipped.GET_Filter_Isonsite
            } else if self.btn_FirstFilter.currentTitle! == "Is Shipped" {
                self.Str_Filter_String = Filter_onSite_Shipped.GET_Filter_IsShipped
            } else if self.btn_FirstFilter.currentTitle! ==  "Is Released"{
                self.Str_Filter_String = Filter_onSite_Shipped.GET_Filter_IsReleased
            }
        }else if Str_FilterVC == "Shop_Drawing" {
            //------------------------------Shop_Drawing Final Filter Param------------------------------------//
            
            if btn_FirstFilter.currentTitle! ==  "Project Name" {
                self.SearchString(strSearchFor: Filter_shopDrawing.GET_Filter_Project_Name, searchType: btn_SecondFilter.currentTitle!)
            }else if self.btn_FirstFilter.currentTitle! ==  "Group Name" {
                self.SearchString(strSearchFor: Filter_shopDrawing.GET_Filter_Group_Name, searchType: btn_SecondFilter.currentTitle!)
            }else if self.btn_FirstFilter.currentTitle! ==  "Strucher Id" {
                self.SearchString(strSearchFor: Filter_shopDrawing.GET_Filter_Strucher_Id, searchType: btn_SecondFilter.currentTitle!)
            }else if self.btn_FirstFilter.currentTitle! == "Approval Status" {
                self.SearchString(strSearchFor: Filter_shopDrawing.GET_Filter_Approval_Status, searchType: btn_SecondFilter.currentTitle!)
            }else if self.btn_FirstFilter.currentTitle! == "Doc Status" {
                self.SearchString(strSearchFor: Filter_shopDrawing.GET_Filter_Doc_Status, searchType: btn_SecondFilter.currentTitle!)
            }else if self.btn_FirstFilter.currentTitle! == "Is PL Input Created" {
                self.Str_Filter_String = Filter_shopDrawing.GET_Filter_Is_PL_Input_Created
            }else if self.btn_FirstFilter.currentTitle! == "Is Group Strucher" {
                self.Str_Filter_String = Filter_shopDrawing.GET_Filter_Is_Group_Strucher
            }else if self.btn_FirstFilter.currentTitle! == "Is Active" {
                self.Str_Filter_String = Filter_shopDrawing.GET_Filter_Is_Active
            }else if self.btn_FirstFilter.currentTitle! ==  "Purchase Order"{
                self.Str_Filter_String = Filter_shopDrawing.GET_Filter_Purchase_Order
            }
        }else if Str_FilterVC == "Packing_List" {
            //------------------------------Packing_List Final Filter Param------------------------------------//
            if btn_FirstFilter.currentTitle! ==  "Project Name" {
                self.SearchString(strSearchFor: Filter_packingList.GET_Filter_Project_Name, searchType: btn_SecondFilter.currentTitle!)
            }else if self.btn_FirstFilter.currentTitle! ==  "Vendor Name" {
                self.SearchString(strSearchFor: Filter_packingList.GET_Filter_Vendor_Name, searchType: btn_SecondFilter.currentTitle!)
            }else if self.btn_FirstFilter.currentTitle! ==  "Group name" {
                self.SearchString(strSearchFor: Filter_packingList.GET_Filter_Group_name, searchType: btn_SecondFilter.currentTitle!)
            }else if self.btn_FirstFilter.currentTitle! == "Strucher Id" {
                self.SearchString(strSearchFor: Filter_packingList.GET_Filter_Strucher_Id, searchType: btn_SecondFilter.currentTitle!)
            }else if self.btn_FirstFilter.currentTitle! == "PL Number" {
                self.SearchString(strSearchFor: Filter_packingList.GET_Filter_PL_Number, searchType: btn_SecondFilter.currentTitle!)
            }else if self.btn_FirstFilter.currentTitle! == "Package Name" {
                self.SearchString(strSearchFor: Filter_packingList.GET_Filter_Package_Name, searchType: btn_SecondFilter.currentTitle!)
            }else if self.btn_FirstFilter.currentTitle! == "Approval Status" {
                self.SearchString(strSearchFor: Filter_packingList.GET_Filter_Approval_Status, searchType: btn_SecondFilter.currentTitle!)
            }else if self.btn_FirstFilter.currentTitle! == "Status" {
                self.SearchString(strSearchFor: Filter_packingList.GET_Filter_Status, searchType: btn_SecondFilter.currentTitle!)
            }else if self.btn_FirstFilter.currentTitle! == "Is Released" {
                self.Str_Filter_String = Filter_packingList.GET_Filter_Is_Released
            }else if self.btn_FirstFilter.currentTitle! == "Is Group Strucher" {
                self.Str_Filter_String = Filter_packingList.GET_Filter_Is_Group_Strucher
            }else if self.btn_FirstFilter.currentTitle! == "Is Active" {
                self.Str_Filter_String = Filter_packingList.GET_Filter_Is_Active
            }else if self.btn_FirstFilter.currentTitle! ==  "Purchase Order"{
                self.Str_Filter_String = Filter_packingList.GET_Filter_Purchase_Order
            }
        }else if Str_FilterVC == "Project" {
            //------------------------------Project Final Filter Param------------------------------------//
            if btn_FirstFilter.currentTitle! ==  "Project Code" {
                self.SearchString(strSearchFor: Filter_project.GET_Filter_Project_Code, searchType: btn_SecondFilter.currentTitle!)
            }else if self.btn_FirstFilter.currentTitle! ==  "Project Name" {
                self.SearchString(strSearchFor: Filter_project.GET_Filter_Project_Name, searchType: btn_SecondFilter.currentTitle!)
            }else if self.btn_FirstFilter.currentTitle! ==  "Site Location" {
                self.SearchString(strSearchFor: Filter_project.GET_Filter_Site_Location, searchType: btn_SecondFilter.currentTitle!)
            }else if self.btn_FirstFilter.currentTitle! == "Manager Name" {
                self.SearchString(strSearchFor: Filter_project.GET_Filter_Manager_Name, searchType: btn_SecondFilter.currentTitle!)
            }else if self.btn_FirstFilter.currentTitle! == "Refrences" {
                self.SearchString(strSearchFor: Filter_project.GET_Filter_Refrences, searchType: btn_SecondFilter.currentTitle!)
            }else if self.btn_FirstFilter.currentTitle! == "Is Shipper" {
                self.Str_Filter_String = Filter_project.GET_Filter_Is_Shipper
            }else if self.btn_FirstFilter.currentTitle! == "Is Active" {
                self.Str_Filter_String = Filter_project.GET_Filter_Is_Active
            }
        }else if Str_FilterVC == "Packages" {
            //------------------------------Packages Final Filter Param------------------------------------//
            if btn_FirstFilter.currentTitle! ==  "Project Name" {
                self.SearchString(strSearchFor: Filter_packages.GET_Filter_Project_Name, searchType: btn_SecondFilter.currentTitle!)
            }else if self.btn_FirstFilter.currentTitle! ==  "Vendor Name" {
                self.SearchString(strSearchFor: Filter_packages.GET_Filter_VendorName, searchType: btn_SecondFilter.currentTitle!)
            }else if self.btn_FirstFilter.currentTitle! ==  "Group name" {
                self.SearchString(strSearchFor: Filter_packages.GET_Filter_Group_name, searchType: btn_SecondFilter.currentTitle!)
            }else if self.btn_FirstFilter.currentTitle! == "Strucher Id" {
                self.SearchString(strSearchFor: Filter_packages.GET_Filter_Strucher_Id, searchType: btn_SecondFilter.currentTitle!)
            }else if self.btn_FirstFilter.currentTitle! == "Approval Status" {
                self.SearchString(strSearchFor: Filter_packages.GET_Filter_Approval_Status, searchType: btn_SecondFilter.currentTitle!)
            }else if self.btn_FirstFilter.currentTitle! == "status" {
                self.SearchString(strSearchFor: Filter_packages.GET_Filter_status, searchType: btn_SecondFilter.currentTitle!)
            }else if self.btn_FirstFilter.currentTitle! == "Is PLInput Genrated" {
                self.Str_Filter_String = Filter_packages.GET_Filter_Is_PLInput_Genrated
            }else if self.btn_FirstFilter.currentTitle! == "Is Group Strucher" {
                self.Str_Filter_String = Filter_packages.GET_Filter_Is_Group_Strucher
            }else if self.btn_FirstFilter.currentTitle! == "Is Active" {
                self.Str_Filter_String = Filter_packages.GET_Filter_Is_Active
            }else if self.btn_FirstFilter.currentTitle! ==  "Purchase Order"{
                self.Str_Filter_String = Filter_packingList.GET_Filter_Purchase_Order
            }
        }
        self.view.dismissPresentingPopup()
    }
    @objc func btn_Cancel_Click(_ Button : UIButton) {
        self.view.dismissPresentingPopup()
        self.Is_CancelButtonClick = true
    }
    //MARK:- Custom Function
    func Set_Second_Filter(Selected : String) {
        if Str_FilterVC == "Onsite" || Str_FilterVC == "Shipped_Status"{
            if Selected == "Project Name" || Selected == "Vendor Name" || Selected == "Purchase Order Number" || Selected == "PL Number" {
                self.txt_ValueFilter_Height.constant = 50
            }else {
                self.txt_ValueFilter_Height.constant = 0
            }
        }else if Str_FilterVC == "Packages" {
            if Selected == "Project Name" || Selected == "Vendor Name" || Selected ==  "Group name" || Selected == "Strucher Id" || Selected == "Approval Status" || Selected == "status" {
                self.txt_ValueFilter_Height.constant = 50
                self.btn_SecondFilter_Height.constant = 50
            }else if Selected == "Purchase Order" {
                self.btn_SecondFilter_Height.constant = 0
            }else {
                self.txt_ValueFilter_Height.constant = 0
                self.btn_SecondFilter_Height.constant = 50
            }
        }else if Str_FilterVC == "Packing_List" {
            if Selected == "Project Name" || Selected == "Vendor Name" || Selected == "Group name" || Selected == "Strucher Id" || Selected == "PL Number" || Selected == "Package Name" || Selected == "Approval Status" || Selected == "Status" {
                self.txt_ValueFilter_Height.constant = 50
                self.btn_SecondFilter_Height.constant = 50
            }else if Selected == "Purchase Order" {
                self.btn_SecondFilter_Height.constant = 0
            }else{
                self.txt_ValueFilter_Height.constant = 0
                self.btn_SecondFilter_Height.constant = 50
            }
        }else if Str_FilterVC == "Project" {
            if Selected == "Project Code" || Selected == "Project Name" || Selected == "Site Location" || Selected == "Manager Name" || Selected == "Refrences" {
                self.txt_ValueFilter_Height.constant = 50
            }else {
                self.txt_ValueFilter_Height.constant = 0
            }
        }else if Str_FilterVC == "Shop_Drawing" {
            if Selected == "Project Name" || Selected == "Group Name" || Selected == "Strucher Id" || Selected == "Approval Status" || Selected == "Doc Status" {
                self.txt_ValueFilter_Height.constant = 50
                self.btn_SecondFilter_Height.constant = 50
            }else if Selected == "Purchase Order" {
                self.btn_SecondFilter_Height.constant = 0
            }else {
                self.txt_ValueFilter_Height.constant = 0
                self.btn_SecondFilter_Height.constant = 50
            }
        }
    }
}
