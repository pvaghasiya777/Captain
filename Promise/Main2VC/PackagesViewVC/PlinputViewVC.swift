//
//  PlinputViewVC.swift
//  Promise
//
//  Created by Captain on 04/11/20.
//  Copyright © 2020 Captain. All rights reserved.
//

import UIKit

class PlinputViewVC: UIViewController {
    //MARK:- IBOutlet
    @IBOutlet weak var view_InputDetails: UIView!
    
    @IBOutlet weak var view_BGWidth: NSLayoutConstraint!
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
    @IBOutlet weak var tbl_MasterDetails: UITableView!
    @IBOutlet weak var tbl_SingleDetails: UITableView!
    @IBOutlet weak var lblInputDetail: UILabel!
    @IBOutlet weak var lblMasterDetails: UILabel!
    @IBOutlet weak var lblSingleListDetails: UILabel!
    //Pagination
    @IBOutlet weak var btnPrevious: UIButton!
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var lblShowPagination: UILabel!
    @IBOutlet weak var lblPageCount: UILabel!
    @IBOutlet weak var view_Pagination: UIView!
    //MARK:- Variable
    var Arr_PLDetail = [PlreportDetailModel]()
    var Arr_SingleDetail = [InputSingleID]()
    var str_ID = String()
    var Str_ProjectName = ""
    var Str_VendorName = ""
    var Str_Strucher = ""
    var Pagination_tag = 0
    var startIndex: Int = 0
    var PageNumber : Int = 1
    //MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.Initialisation()
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
        view_InputDetails.isHidden = false
        view_Pagination.isHidden = true
        self.tbl_MasterDetails.isHidden = true
        tbl_SingleDetails.isHidden = true
        self.lblInputDetail.isHidden =  false
        self.lblSingleListDetails.isHidden = true
        self.lblMasterDetails.isHidden = true
        self.lblInputDetail.backgroundColor = UIColor(red: 0.21, green: 0.20, blue: 0.51, alpha: 1.00)
        self.tbl_MasterDetails.register(UINib(nibName: "MasterDetailsCell", bundle: nil), forCellReuseIdentifier: "MasterDetailsCell")
        self.tbl_MasterDetails.register(UINib(nibName: "MasterDetailsRowCell", bundle: nil), forCellReuseIdentifier: "MasterDetailsRowCell")
        self.btnNext.addTarget(self, action: #selector(btn_NextClick(_:)), for: .touchUpInside)
        self.btnPrevious.addTarget(self, action: #selector(btn_PreviousClick(_:)), for: .touchUpInside)

    }
    func SetData(){
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
            view_Pagination.isHidden = true
            self.tbl_MasterDetails.isHidden = true
            tbl_SingleDetails.isHidden = true
            self.lblInputDetail.isHidden =  false
            self.lblSingleListDetails.isHidden = true
            self.lblMasterDetails.isHidden = true
            self.lblInputDetail.backgroundColor = UIColor(red: 0.21, green: 0.20, blue: 0.51, alpha: 1.00)
            self.view_BGWidth.constant = 1040
        } else if sender.tag == 2  { //Master Detail
            self.tbl_MasterDetails.isHidden = false
            view_Pagination.isHidden = false
            tbl_SingleDetails.isHidden = true
            view_InputDetails.isHidden = true
            self.lblMasterDetails.isHidden = false
            self.lblInputDetail.isHidden = true
            self.lblSingleListDetails.isHidden = true
            self.lblMasterDetails.backgroundColor = UIColor(red: 0.21, green: 0.20, blue: 0.51, alpha: 1.00)
            self.view_BGWidth.constant = 2048
            self.tbl_MasterDetails.reloadData()
            self.startIndex = 0
            self.PageNumber = 1
            self.lblShowPagination.text = "Showing \(startIndex) to \(((startIndex + 50) > Arr_PLDetail[0].inputMasterIDS!.count) ? Arr_PLDetail[0].inputMasterIDS!.count : (startIndex + 50)) of \(Arr_PLDetail[0].inputMasterIDS!.count) results"
            Pagination_tag = 1
        } else  if sender.tag == 3 { // Single Detail
            self.tbl_MasterDetails.isHidden = true
            tbl_SingleDetails.isHidden = false
            view_Pagination.isHidden = false
            view_InputDetails.isHidden = true
            self.lblMasterDetails.isHidden = true
            self.lblInputDetail.isHidden = true
            self.lblSingleListDetails.isHidden = false
            self.lblSingleListDetails.backgroundColor = UIColor(red: 0.21, green: 0.20, blue: 0.51, alpha: 1.00)
            self.view_BGWidth.constant = 1040
            self.tbl_SingleDetails.reloadData()
            self.startIndex = 0
            self.PageNumber = 1
            self.lblShowPagination.text = "Showing \(startIndex) to \(((startIndex + 50) > Arr_SingleDetail.count) ? Arr_SingleDetail.count : (startIndex + 50)) of \(Arr_SingleDetail.count) results"
            Pagination_tag = 2
        }
    }
   //MARK:- Pagination Action
    @objc func btn_NextClick(_ sender: UIButton) {
        if startIndex + 50 > ((Pagination_tag == 1) ? Arr_PLDetail[0].inputMasterIDS!.count - 1 : Arr_SingleDetail.count - 1) {
            Utils.showToastWithMessage(message: Strings.kNoMoreData)
        } else {
            if Pagination_tag == 1 { //Master Details Pagination
                startIndex = startIndex + 50
                self.PageNumber = PageNumber + 1
                self.lblPageCount.text = String(describing: PageNumber)
                self.lblShowPagination.text = "Showing \(startIndex) to \(((startIndex + 50) > Arr_PLDetail[0].inputMasterIDS!.count) ? Arr_PLDetail[0].inputMasterIDS!.count : (startIndex + 50)) of \(Arr_PLDetail[0].inputMasterIDS!.count) results"
                self.tbl_MasterDetails.reloadData()
            }else { //SingleList Details
                startIndex = startIndex + 50
                self.PageNumber = PageNumber + 1
                self.lblPageCount.text = String(describing: PageNumber)
                self.lblShowPagination.text = "Showing \(startIndex) to \(((startIndex + 50) > Arr_SingleDetail.count) ? Arr_SingleDetail.count : (startIndex + 50)) of \(Arr_SingleDetail.count) results"
                self.tbl_SingleDetails.reloadData()
            }
        }
    }
    @objc func btn_PreviousClick(_ sender: UIButton) {
        if startIndex - 50 < 0 {
            Utils.showToastWithMessage(message: Strings.kNoMoreData)
        } else {
            if Pagination_tag == 1 { //Master Details Pagination
                startIndex = startIndex - 50
                self.PageNumber = PageNumber - 1
                self.lblPageCount.text = String(describing: PageNumber)
                self.lblShowPagination.text = "Showing \(startIndex) to \((startIndex == 0) ? 50 : startIndex + 50 ) of \(Arr_PLDetail[0].inputMasterIDS!.count) results"
                self.tbl_MasterDetails.reloadData()
            }else { //SingleList Details
                startIndex = startIndex - 50
                self.PageNumber = PageNumber - 1
                self.lblPageCount.text = String(describing: PageNumber)
                self.lblShowPagination.text = "Showing \(startIndex) to \((startIndex == 0) ? 50 : startIndex + 50 ) of \(Arr_SingleDetail.count) results"
                self.tbl_SingleDetails.reloadData()
            }
        }
    }
}
//MARK:- TableView Initialisation
extension PlinputViewVC : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tbl_MasterDetails {
            if section == 0 {
                return 1
            } else {
                return min(50,((Arr_PLDetail.count == 0) ? Arr_PLDetail.count : Arr_PLDetail[0].inputMasterIDS!.count - startIndex))
            }
        } else {
            if section == 0 {
                return 1
            } else {
                return min(50,((Arr_PLDetail.count == 0) ? Arr_PLDetail.count : Arr_SingleDetail.count - startIndex))
            }
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == tbl_MasterDetails {
            if indexPath.section == 0 {
                let cell : MasterDetailsCell = tableView.dequeueReusableCell(withIdentifier: "MasterDetailsCell") as! MasterDetailsCell
                return cell
            } else {
                let cell : MasterDetailsRowCell = tableView.dequeueReusableCell(withIdentifier: "MasterDetailsRowCell") as! MasterDetailsRowCell
                cell.DisplayCell(ViewController: self, indexPath: indexPath)
                cell.selectionStyle = .none
                return cell
            }
        }  else {
            if indexPath.section == 0 {
                let cell : PackageView_SingleDetailsHeaderCell = tableView.dequeueReusableCell(withIdentifier: "PackageView_SingleDetailsHeaderCell") as! PackageView_SingleDetailsHeaderCell
                return cell
            } else {
                let cell : PackageView_SingleDetailsCell = tableView.dequeueReusableCell(withIdentifier: "PackageView_SingleDetailsCell") as! PackageView_SingleDetailsCell
                cell.DisplayCell(ViewController: self, indexPath: indexPath)
                cell.selectionStyle = .none
                return cell
            }
        }
        let cell = UITableViewCell()
        cell.selectionStyle = .none
        return cell
    }
}
