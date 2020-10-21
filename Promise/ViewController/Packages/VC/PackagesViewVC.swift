
//
//  PackagesViewVC.swift
//  report
//
//  Created by macbook on 20/06/1942 Saka.
//  Copyright © 1942 com.mac. All rights reserved.
//

import UIKit

class PackagesViewVC: UIViewController {
    
    //MARK:- IBOutlet
    @IBOutlet weak var view_MasterDetailButton: UIView!
    @IBOutlet weak var btn_MasterDetails: UIButton!
    @IBOutlet weak var btn_SingleDetails: UIButton!
    @IBOutlet weak var btn_InputDetail: UIButton!
    @IBOutlet weak var btn_MasterDetails_P1: UIButton!
    @IBOutlet weak var btn_MasterDetails_P2: UIButton!
    @IBOutlet weak var lbl_MasterDetails: UILabel!
    @IBOutlet weak var lbl_SingleDetails: UILabel!
    @IBOutlet weak var lblInputDetail: UILabel!
    
    @IBOutlet weak var view_InputDetails: UIView!
    @IBOutlet weak var txt_Name: UITextField!
    @IBOutlet weak var txt_InputNumber: UITextField!
    @IBOutlet weak var txt_Revisionnumber: UITextField!
    @IBOutlet weak var txt_PurchaseOrderNumber: UITextField!
    @IBOutlet weak var txt_Project: UITextField!
    @IBOutlet weak var txt_Status: UITextField!
    @IBOutlet weak var txt_Vendor: UITextField!
    @IBOutlet weak var txt_Structure: UITextField!
    @IBOutlet weak var btn_PLGenerated: UIButton!
    //  Contact Details
    @IBOutlet weak var txt_Address: UITextField!
    @IBOutlet weak var txt_CountryOfOrigin: UITextField!
    @IBOutlet weak var txt_PickupLocation: UITextField!
    @IBOutlet weak var txt_ContactDetails: UITextField!
    @IBOutlet weak var txt_NameOfGoods: UITextField!
    @IBOutlet weak var txt_InspectionTime: UITextField!
    @IBOutlet weak var txt_TotalNetWeightkg: UITextField!
    @IBOutlet weak var txt_TotalGrossWeightkg: UITextField!
    @IBOutlet weak var txt_TotalVolumem: UITextField!
//  Master Details
    @IBOutlet weak var tbl_MasterDetails_1: UITableView!
    @IBOutlet weak var tbl_MasterDetails_2: UITableView!
    @IBOutlet weak var btn_MPrevious: UIButton!
    @IBOutlet weak var btn_MNext: UIButton!
    @IBOutlet weak var lbl_MShowPagination: UILabel!
    @IBOutlet weak var lbl_MPageNum: UILabel!
    
//    Single Details
    @IBOutlet weak var tbl_SingleDetails: UITableView!
    @IBOutlet weak var btn_SPrevious: UIButton!
    @IBOutlet weak var btn_SNext: UIButton!
    @IBOutlet weak var lbl_SShowPagination: UILabel!
    @IBOutlet weak var lbl_SPageNum: UILabel!
    //MARK:- variable
    var Arr_PLDetail = [PlreportDetailModel]()
    var Arr_SingleDetail = [InputSingleID]()
    var str_ID = String()
    var Str_ProjectName = ""
    var Str_VendorName = ""
    var Str_Strucher = ""
    //MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        Initialisation()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "Packages View"
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationItem.title = ""
    }
    //MARK:- Initialisation
    func Initialisation(){
        ServiceCall.shareInstance.Get_PLreportsDetail(ViewController: self, Api_Str: Api_Urls.GET_API_plReports + str_ID + "/", tag: 1)
        self.view_InputDetails.isHidden = false
        self.tbl_MasterDetails_1.isHidden = true
        self.tbl_MasterDetails_2.isHidden = true
        self.tbl_SingleDetails.isHidden = true
        self.lblInputDetail.backgroundColor = UIColor(red: 0.21, green: 0.20, blue: 0.51, alpha: 1.00)
        self.lbl_MasterDetails.backgroundColor = .white
        self.lbl_SingleDetails.backgroundColor = .white
        self.tbl_SingleDetails.allowsSelection = false

  
//       Utils.EnableTextField(textFields: [txt_Name,txt_InputNumber,txt_Revisionnumber,txt_PurchaseOrderNumber,txt_Project,txt_Project,txt_Status,txt_Vendor,txt_Structure,txt_Address,txt_CountryOfOrigin,txt_PickupLocation,txt_ContactDetails,txt_NameOfGoods,txt_InspectionTime,txt_TotalNetWeightkg,txt_TotalGrossWeightkg,txt_TotalVolumem])
    }
    func SetData(){
        print(Arr_PLDetail)
        self.txt_Name.text = Arr_PLDetail[0].name!
        self.txt_InputNumber.text = Arr_PLDetail[0].inputNo!
        self.txt_Revisionnumber.text = String(describing: Arr_PLDetail[0].revNo!)
        self.txt_PurchaseOrderNumber.text = Arr_PLDetail[0].purchaseID!
        self.txt_Project.text = Str_ProjectName
        self.txt_Status.text = Arr_PLDetail[0].status!
        self.txt_Vendor.text = Str_VendorName
        self.txt_Structure.text = Str_Strucher
        self.btn_PLGenerated.setBackgroundImage(UIImage(named: (Arr_PLDetail[0].plGenerated! == true) ? "ic_correct" : "ic_not_released"), for: .normal)
        self.txt_PickupLocation.text = Arr_PLDetail[0].pickUpLocation!
        self.txt_ContactDetails.text = Arr_PLDetail[0].contactDetails!
        self.txt_NameOfGoods.text = Arr_PLDetail[0].nameOfGoods!
        self.txt_InspectionTime.text = Arr_PLDetail[0].inspectionDate == nil ? "" : Arr_PLDetail[0].inspectionDate!
        self.txt_TotalNetWeightkg.text = Arr_PLDetail[0].totalNetWeight!
        self.txt_TotalGrossWeightkg.text = Arr_PLDetail[0].totalGrossWeight!
        self.txt_TotalVolumem.text = Arr_PLDetail[0].totalVolume!
        let Arr_CountryOrigin = DEFAULTS.Get_MasterCoutry().filter {$0.id == Arr_PLDetail[0].countryOfOrigin!}
        self.txt_CountryOfOrigin.text = Arr_CountryOrigin[0].name!
        let Arr_Address = DEFAULTS.Get_AddressStruct().filter {$0.id == Arr_PLDetail[0].addressID!}
        self.txt_Address.text = Arr_Address[0].name!
        
        
        //Set SingleDetail
        let Arr_SingleID = Arr_PLDetail[0].inputMasterIDS!.map{($0.inputSingleIDS!)}.joined()
        Arr_SingleID.forEach { Arr_SingleDetail.append($0)}
    }
    //MARK:- Button Click
    @IBAction func btn_SegmentBtn(_ sender: UIButton) {
        if sender.tag == 1 { //Input Detail
            view_InputDetails.isHidden = false
            tbl_MasterDetails_1.isHidden = true
            tbl_MasterDetails_2.isHidden = true
            tbl_SingleDetails.isHidden = true
            self.view_MasterDetailButton.isHidden = true
            lblInputDetail.backgroundColor = UIColor(red: 0.21, green: 0.20, blue: 0.51, alpha: 1.00)
            lbl_MasterDetails.backgroundColor = .white
            lbl_SingleDetails.backgroundColor = .white
        } else if sender.tag == 2  { //Master Detail
            view_InputDetails.isHidden = true
            tbl_MasterDetails_1.isHidden = false
            tbl_MasterDetails_2.isHidden = false
            tbl_SingleDetails.isHidden = true
            self.view_MasterDetailButton.isHidden = false
            lblInputDetail.backgroundColor = .white
            lbl_MasterDetails.backgroundColor = UIColor(red: 0.21, green: 0.20, blue: 0.51, alpha: 1.00)
            lbl_SingleDetails.backgroundColor = .white
            self.tbl_MasterDetails_1.reloadData()
            self.tbl_MasterDetails_2.reloadData()
        } else  if sender.tag == 3 { // Single Detail
            view_InputDetails.isHidden = true
            tbl_MasterDetails_1.isHidden = true
            tbl_MasterDetails_2.isHidden = true
            tbl_SingleDetails.isHidden = false
            self.view_MasterDetailButton.isHidden = true
            lblInputDetail.backgroundColor = .white
            lbl_MasterDetails.backgroundColor = .white
            lbl_SingleDetails.backgroundColor = UIColor(red: 0.21, green: 0.20, blue: 0.51, alpha: 1.00)
            self.tbl_SingleDetails.reloadData()
        }
    }
    @IBAction func btn_NextPrevious_Click(_ sender: UIButton) {
        if sender.tag == 1 {
            tbl_MasterDetails_1.isHidden = false
            tbl_MasterDetails_2.isHidden = true
            tbl_SingleDetails.isHidden = true
            self.tbl_MasterDetails_1.reloadData()
        } else {
            tbl_MasterDetails_1.isHidden = true
            tbl_MasterDetails_2.isHidden = false
            tbl_SingleDetails.isHidden = true
            self.tbl_MasterDetails_2.reloadData()
        }
    }
    
}
//MARK:- TableView Initialisation
extension PackagesViewVC : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tbl_MasterDetails_1 {
            if section == 0 {
                return 1
            } else {
                return (Arr_PLDetail.count == 0) ? Arr_PLDetail.count : Arr_PLDetail[0].inputMasterIDS!.count
            }
        } else if tableView == tbl_MasterDetails_2 {
            if section == 0 {
                return 1
            } else {
                return (Arr_PLDetail.count == 0) ? Arr_PLDetail.count : Arr_PLDetail[0].inputMasterIDS!.count
            }
        } else {
            if section == 0 {
                return 1
            } else {
                return (Arr_PLDetail.count == 0) ? Arr_PLDetail.count : Arr_SingleDetail.count
            }
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == tbl_MasterDetails_1 {
            if indexPath.section == 0 {
                let cell : PackageView_MasterDetailsHeader1Cell = tableView.dequeueReusableCell(withIdentifier: "PackageView_MasterDetailsHeader1Cell") as! PackageView_MasterDetailsHeader1Cell
                return cell
                
            } else {
                let cell : PackageView_MasterDetails1Cell = tableView.dequeueReusableCell(withIdentifier: "PackageView_MasterDetails1Cell") as! PackageView_MasterDetails1Cell
                cell.DisplayCell(Arr_Data: Arr_PLDetail, indexPath: indexPath)
                return cell
            }
        } else if tableView == tbl_MasterDetails_2 {
            if indexPath.section == 0 {
                let cell : PackageView_MasterDetailshedear2Cell = tableView.dequeueReusableCell(withIdentifier: "PackageView_MasterDetailshedear2Cell") as! PackageView_MasterDetailshedear2Cell
                return cell
                
            } else {
                let cell : PackageView_MasterDetails2Cell = tableView.dequeueReusableCell(withIdentifier: "PackageView_MasterDetails2Cell") as! PackageView_MasterDetails2Cell
                cell.DisplayCell(Arr_Data: Arr_PLDetail, indexPath: indexPath)
                return cell
            }
        } else {
            if indexPath.section == 0 {
                let cell : PackageView_SingleDetailsHeaderCell = tableView.dequeueReusableCell(withIdentifier: "PackageView_SingleDetailsHeaderCell") as! PackageView_SingleDetailsHeaderCell
                return cell
            } else {
                let cell : PackageView_SingleDetailsCell = tableView.dequeueReusableCell(withIdentifier: "PackageView_SingleDetailsCell") as! PackageView_SingleDetailsCell
                cell.DisplayCell(Arr_Data: Arr_SingleDetail, indexPath: indexPath)
                return cell
            }
        }
        let cell = UITableViewCell()
        cell.selectionStyle = .none
        return cell
    }
}
