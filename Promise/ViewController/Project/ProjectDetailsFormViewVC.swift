//
//  ProjectDetailsVC.swift
//  report
//
//  Created by macbook on 05/06/1942 Saka.
//  Copyright © 1942 com.mac. All rights reserved.
//

import UIKit

class ProjectDetailsFormViewVC: UIViewController {
    //MARK:- IBOutlet
    @IBOutlet weak var view_topBG: UIView!
    @IBOutlet weak var view_SecondBG : UIView!
    @IBOutlet weak var btn_Structure : UIButton!
    @IBOutlet weak var btn_Packages : UIButton!
    @IBOutlet weak var btn_PackingList : UIButton!
    //Project Details
    @IBOutlet weak var txt_Name: UITextField!
    @IBOutlet weak var txt_ProjectCode: UITextField!
    @IBOutlet weak var txt_ContractNumber: UITextField!
    @IBOutlet weak var txt_ConsigneeBuyer: UITextField!
    @IBOutlet weak var txt_Reference: UITextField!
    @IBOutlet weak var btn_Shipper: UIButton!
    @IBOutlet weak var btn_Active: UIButton!
    //Duration
    @IBOutlet weak var txt_SiteLocation: UITextField!
    @IBOutlet weak var txt_Description: UITextField!
    @IBOutlet weak var txt_StartDate: UITextField!
    @IBOutlet weak var txt_EndDate: UITextField!
    @IBOutlet weak var txt_Manager: UITextField!
    //MARK:- variable
    var Arr_Project = [SingleMasterProjectModel]()
    let datepicker = UIDatePicker()
    var textFieldTag : Int = Int()
    var Str_ID = ""
    var Str_Title = ""
    //MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        Initialization()
        MasterServiceCall.shareInstance.Get_masterProjectSingle(Api_Str: Api_Urls.GET_API_masterProject + Str_ID + "/", ViewController: self)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = Str_Title
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationItem.title = ""
    }
    
    //MARK:- Initialization
    func Initialization() {
        Utils.EnableTextField(textFields: [txt_Name,txt_ProjectCode,txt_ContractNumber,txt_ConsigneeBuyer,txt_Reference,txt_SiteLocation,txt_Description,txt_StartDate,txt_EndDate,txt_Manager])
        Utils.Set_Same_Corner_Radius(views: [txt_Name,txt_ProjectCode,txt_ContractNumber,txt_ConsigneeBuyer,txt_Reference,txt_SiteLocation,txt_Description,txt_StartDate,txt_EndDate,txt_Manager,btn_Shipper,btn_Active], cornerRadius: 5)
        Utils.add_shadow_around_view_Multiple(views: [view_SecondBG,view_topBG], color: .gray, radius: 3, opacity: 3)
        Utils.set_Image_on_RightView_of_Textfield(textfield: txt_StartDate, imagename: "ic_calendar", width: 20, height:20)
        Utils.set_Image_on_RightView_of_Textfield(textfield: txt_EndDate, imagename: "ic_calendar", width: 20, height: 20)

    }
    
    func SetData(){
        print(Arr_Project)
        self.txt_Name.text = Arr_Project[0].name!
        self.txt_ProjectCode.text = Arr_Project[0].code!
        self.txt_ContractNumber.text = Arr_Project[0].contractNumber!
        self.txt_ConsigneeBuyer.text = Arr_Project[0].consigneeBuyer!
        self.txt_Reference.text = Arr_Project[0].reference!
        self.txt_SiteLocation.text = Arr_Project[0].siteLocation!
        self.txt_Description.text = Arr_Project[0].Description!
        self.txt_StartDate.text = Arr_Project[0].startDate!
        self.txt_EndDate.text = Arr_Project[0].endDate!
        self.btn_Active.setBackgroundImage(UIImage(named: (Arr_Project[0].isActive!) ? "ic_check" : "ic_Uncheck"), for: .normal)
        self.btn_Shipper.setBackgroundImage(UIImage(named: (Arr_Project[0].isShipper!) ? "ic_check" : "ic_Uncheck"), for: .normal)
        self.txt_Manager.text = (Arr_Project[0].managerID == nil) ? "" : Arr_Project[0].managerID!
        self.btn_Structure.addSubview(Utils.set_Badge(Count: Arr_Project[0].structureCount!))
        self.btn_Packages.addSubview(Utils.set_Badge(Count: Arr_Project[0].packageCount!))
        self.btn_PackingList.addSubview(Utils.set_Badge(Count: Arr_Project[0].packingCount!))
    }
    @IBAction func btn_Click(_ sender: UIButton) {
        if sender.tag == 1 {
            //Packing List
            let PackingList_VC = Config.StoryBoard.instantiateViewController(identifier: "PackingListVC") as! PackingListVC
            PackingList_VC.Str_NavigateFrom = "Project"
            PackingList_VC.Str_ID = String(describing: Arr_Project[0].id!)
            self.navigationController?.pushViewController(PackingList_VC, animated: true)
        }else if sender.tag == 2 { // Packages
            let Plinputs_Vc = Config.StoryBoard.instantiateViewController(identifier: "PlinputsVc") as! PlinputsVc
            Plinputs_Vc.Str_NavigateFrom = "Project"
            Plinputs_Vc.Str_ID = String(describing: Arr_Project[0].id!)
            self.navigationController?.pushViewController(Plinputs_Vc, animated: true)
        }else if sender.tag == 3 {//Strucher
            let Drawing_VC = Config.StoryBoard.instantiateViewController(identifier: "DrawingVC") as! DrawingVC
            Drawing_VC.Str_NavigateFrom = "Project"
            Drawing_VC.Str_ID = String(describing: Arr_Project[0].id!)
            self.navigationController?.pushViewController(Drawing_VC, animated: true)
        }
    }
}
// MARK: - Datepicketr
extension ProjectDetailsFormViewVC : UITextFieldDelegate {
    func opendatepicker() {
        let timePicker = UIDatePicker()
        datepicker.datePickerMode = .date
        timePicker.datePickerMode = .time
        txt_StartDate.inputView = datepicker
        txt_EndDate.inputView = datepicker
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 44))
        let cancelbtn = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(self.cancelBtnClick))
        let donebtn = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.doneBtnClick))
        let flexibleBtn = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolbar.setItems([cancelbtn,flexibleBtn,donebtn], animated: false)
        txt_StartDate.inputAccessoryView = toolbar
        txt_EndDate.inputAccessoryView = toolbar
    }
    @objc func cancelBtnClick() {
        if textFieldTag == 1 {
            txt_StartDate.resignFirstResponder()
        } else if textFieldTag == 2 {
            txt_EndDate.resignFirstResponder()
        }
    }
    @objc func doneBtnClick() {
        if textFieldTag == 1 {
            let datePicker = txt_StartDate.inputView as? UIDatePicker
            txt_StartDate.text = Utils.stringFromDate(date: datePicker?.date as! NSDate, Format: "d/M/yyyy" , isCapitalAMPM: false) as String
            txt_StartDate.resignFirstResponder()
        } else if textFieldTag == 2 {
            let datePicker = txt_EndDate.inputView as? UIDatePicker
            txt_EndDate.text = Utils.stringFromDate(date: datePicker?.date as! NSDate, Format: "d/M/yyyy", isCapitalAMPM: true) as String
            txt_EndDate.resignFirstResponder()
        }
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textFieldTag = textField.tag
        if textField.tag == 1 {
            self.opendatepicker()
        } else if textField.tag == 2 {
            self.opendatepicker()
        }
    }
}


