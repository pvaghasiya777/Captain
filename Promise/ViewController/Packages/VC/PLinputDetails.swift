//
//  PLinputDetails.swift
//  Packages
//
//  Copyright © 1942 com.mac. All rights reserved.
//

import UIKit

class PLinputDetails: UIViewController {
    //MARK:- IBOutlet
    @IBOutlet var tbl_Package_Detail: UITableView!
    @IBOutlet weak var view_topBG: UIView!
    @IBOutlet weak var btn_Save: UIButton!
    @IBOutlet weak var btn_Discard: UIButton!
    @IBOutlet weak var view_SecondBG: UIView!
//    @IBOutlet weak var btn_CreateNew: UIButton!
    @IBOutlet weak var btn_Draft: UIButton!
    @IBOutlet weak var btn_Submitted: UIButton!
    @IBOutlet weak var btn_Approved: UIButton!
    @IBOutlet weak var view_ThardBG: UIView!
    @IBOutlet weak var btn_PackagesList: UIButton!
    @IBOutlet weak var btn_RivisonHistory: UIButton!
    @IBOutlet weak var btn_PackageDetails: UIButton!
    @IBOutlet weak var lbl_PackageDetails: UILabel!
    @IBOutlet weak var btn_Quantities: UIButton!
    @IBOutlet weak var lbl_Quantities: UILabel!
    @IBOutlet weak var btn_Rejection: UIButton!
    @IBOutlet weak var lbl_Rejection: UILabel!
    // Details View
    @IBOutlet weak var view_Details: UIView!
    @IBOutlet weak var txt_Name: UITextField!
    @IBOutlet weak var txt_InputNumber: UITextField!
    @IBOutlet weak var txt_Revisionnumber: UITextField!
    @IBOutlet weak var txt_PONumber: UITextField!
    @IBOutlet weak var txt_Project: UITextField!
    @IBOutlet weak var txt_Vendor: UITextField!
    @IBOutlet weak var txt_Structure: UITextField!
    @IBOutlet weak var txt_Address: UITextField!
    //Structure Details View
    @IBOutlet weak var txt_CountryOfOrigin: UITextField!
    @IBOutlet weak var txt_PickupLocation: UITextField!
    @IBOutlet weak var txt_ContactDetails: UITextField!
    @IBOutlet weak var txt_NameOfGoods: UITextField!
    @IBOutlet weak var txt_InspectionTime: UITextField!
    @IBOutlet weak var btn_Active: UIButton!
    //Quantities view
    @IBOutlet weak var view_Quantities: UIView!
    @IBOutlet weak var txt_NetWeight: UITextField!
    @IBOutlet var txt_TotalVolume: UITextField!
    @IBOutlet var txt_GrossWeight: UITextField!
    //Rejection view
    @IBOutlet weak var view_Rejectionview: UIView!
    @IBOutlet weak var tbl_RejectionHistory: UITableView!
    @IBOutlet weak var btn_Previous: UIButton!
    @IBOutlet weak var btn_Next: UIButton!
    @IBOutlet weak var lbl_ShowPage_Count: UILabel!
    @IBOutlet weak var lbl_PageNum: UILabel!
    //MARK:- Variable
    var Arr_PLDetail = [PlreportDetailModel]()
    var Arr_Country = [MasterCountryModel]()
    var Arr_Address = [MasterAddressModel]()
    var Arr_Purchase = [MasterPurchaseModel]()
    var arr_rejectH = [RejectReason]()
    var Str_id = ""
    var Str_Project = ""
    var Str_Vendor = ""
    var Str_Title = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.Initialization()
        self.UIdesign()
    }
    override func viewWillAppear(_ animated: Bool) {
       super.viewWillAppear(animated)
        self.navigationItem.title = Str_Title
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationItem.title = ""
    }
    func Initialization() {
        ServiceCall.shareInstance.Get_PLreportsDetail(ViewController: self, Api_Str: Api_Urls.GET_API_plReports + Str_id + "/", tag: 0)
        self.btn_PackagesList.addTarget(self, action: #selector(Get_PackingListClick(_:)), for: .touchUpInside)
        self.lbl_PackageDetails.backgroundColor = UIColor(red: 0.21, green: 0.20, blue: 0.51, alpha: 1.00)
        
        self.lbl_Quantities.backgroundColor = .white
        self.lbl_Rejection.backgroundColor = .white
        self.view_Details.isHidden = false
        self.view_Quantities.isHidden = true
        self.view_Rejectionview.isHidden = true
        self.tbl_Package_Detail.rowHeight = UITableView.automaticDimension
        self.tbl_Package_Detail.tableFooterView = UIView()
        self.tbl_Package_Detail.separatorStyle = .singleLine
        self.tbl_RejectionHistory.rowHeight = UITableView.automaticDimension
        self.tbl_RejectionHistory.tableFooterView = UIView()
        self.tbl_RejectionHistory.separatorStyle = .singleLine
        btn_Next.addTarget(self, action: #selector(btn_NextClick(_:)), for: .touchUpInside)
               btn_Previous.addTarget(self, action: #selector(btn_PreviousClick(_:)), for: .touchUpInside)
    }
    func UIdesign() {
        Utils.add_shadow_around_view(view: view_topBG, color: .gray, radius: 5, opacity: 5)
        Utils.add_shadow_around_view(view: view_SecondBG, color: .gray, radius: 5, opacity: 5)
        Utils.add_shadow_around_view(view: view_ThardBG, color: .gray, radius: 5, opacity: 5)
        Utils.setborder(view: btn_Save, bordercolor: Config.boderColor, borderwidth: 1)
        Utils.setborder(view: btn_Discard, bordercolor: Config.boderColor1, borderwidth: 1)
        Utils.Set_Same_Corner_Radius(views: [btn_Save,btn_Discard], cornerRadius: 5)
        Utils.EnableTextField(textFields: [txt_Name,txt_InputNumber,txt_Revisionnumber,txt_PONumber,txt_Project,txt_Vendor,txt_PickupLocation,txt_ContactDetails,txt_NameOfGoods,txt_InspectionTime,txt_CountryOfOrigin,txt_Address,txt_Structure,txt_GrossWeight,txt_NetWeight,txt_TotalVolume])
    }
    func Set_PackageDetail() {
        print(Arr_PLDetail)
        self.btn_PackagesList.addSubview(Utils.set_Badge(Count: Arr_PLDetail[0].packingCount!))
        self.txt_Name.text = Arr_PLDetail[0].name!
        self.txt_InputNumber.text = Arr_PLDetail[0].inputNo!
        self.txt_Revisionnumber.text = String(describing: Arr_PLDetail[0].revNo!)
        self.txt_PONumber.text = Arr_PLDetail[0].purchaseID!
        self.txt_Project.text = Str_Project
        self.txt_Vendor.text = Str_Vendor
        self.txt_PickupLocation.text = Arr_PLDetail[0].pickUpLocation!
        self.txt_ContactDetails.text = Arr_PLDetail[0].contactDetails!
        self.txt_NameOfGoods.text = Arr_PLDetail[0].nameOfGoods!
        self.txt_InspectionTime.text = (Arr_PLDetail[0].inspectionDate == nil) ? "" : Arr_PLDetail[0].inspectionDate!
        self.btn_Active.isUserInteractionEnabled = false
        self.btn_Active.setImage(UIImage(named: (Arr_PLDetail[0].isActive == true) ? "ic_check":"ic_not_released"), for: .normal)
        self.Arr_Address = DEFAULTS.Get_AddressStruct().filter{$0.id! == Arr_PLDetail[0].addressID!}
        self.Arr_Country = DEFAULTS.Get_MasterCoutry().filter{$0.id! == Arr_PLDetail[0].countryOfOrigin!}
        self.Arr_Purchase = DEFAULTS.Get_MasterPurchase().filter {$0.number! == Arr_PLDetail[0].purchaseID!}
        let Arr_Strucher = Arr_Purchase[0].shopDrawingIDS!.filter{$0.id! == Arr_PLDetail[0].shopDrawingID!}
        self.txt_CountryOfOrigin.text = Arr_Country[0].name!
        self.txt_Address.text = Arr_Address[0].name!
        self.txt_Structure.text = Arr_Strucher[0].structureID! + " (\(Arr_Strucher[0].revNo!))"
        if Arr_PLDetail[0].approveStatus == "draft" {
            btn_Draft.backgroundColor = UIColor(red: 0.21, green: 0.20, blue: 0.51, alpha: 1.00)
            btn_Draft.setTitleColor(.white, for: .normal)
            btn_Submitted.backgroundColor = .white
            btn_Approved.backgroundColor = .white
        } else if Arr_PLDetail[0].approveStatus == "submitted" {
            btn_Draft.backgroundColor = .white
            btn_Submitted.backgroundColor = UIColor(red: 0.21, green: 0.20, blue: 0.51, alpha: 1.00)
            btn_Submitted.setTitleColor(.white, for: .normal)
            btn_Approved.backgroundColor = .white
        } else {
            btn_Draft.backgroundColor = .white
            btn_Submitted.backgroundColor = .white
            btn_Approved.backgroundColor = UIColor(red: 0.21, green: 0.20, blue: 0.51, alpha: 1.00)
            btn_Approved.setTitleColor(.white, for: .normal)
        }
    }
    func Set_Quantites() {
        self.txt_GrossWeight.text = Arr_PLDetail[0].totalGrossWeight!
        self.txt_NetWeight.text = Arr_PLDetail[0].totalNetWeight!
        self.txt_TotalVolume.text = Arr_PLDetail[0].totalVolume!
    }
    @objc func Get_PackingListClick(_ Button : UIButton) {
        let PackingList_VC = Config.StoryBoard.instantiateViewController(identifier: "PackingListVC") as! PackingListVC
        PackingList_VC.Str_NavigateFrom = "Packages"
        PackingList_VC.Str_ID = String(describing: Arr_PLDetail[0].id!)
        self.navigationController?.pushViewController(PackingList_VC, animated: true)
    }
    @IBAction func btn_Click(_ sender: UIButton) {
        if sender.tag == 1 {
            lbl_PackageDetails.backgroundColor = UIColor(red: 0.21, green: 0.20, blue: 0.51, alpha: 1.00)
            lbl_Quantities.backgroundColor = .white
            lbl_Rejection.backgroundColor = .white
            view_Details.isHidden = false
            view_Quantities.isHidden = true
            view_Rejectionview.isHidden = true
            self.tbl_Package_Detail.isHidden = false
           // self.tbl_Package_Detail.reloadData()
        } else if sender.tag == 2{
            lbl_PackageDetails.backgroundColor = .white
            lbl_Quantities.backgroundColor = UIColor(red: 0.21, green: 0.20, blue: 0.51, alpha: 1.00)
            lbl_Rejection.backgroundColor = .white
            view_Details.isHidden = true
            view_Quantities.isHidden = false
            view_Rejectionview.isHidden = true
            self.tbl_Package_Detail.isHidden = true
            self.Set_Quantites()
        } else if sender.tag == 3{
            lbl_PackageDetails.backgroundColor = .white
            lbl_Quantities.backgroundColor = .white
            lbl_Rejection.backgroundColor = UIColor(red: 0.21, green: 0.20, blue: 0.51, alpha: 1.00)
            view_Details.isHidden = true
            view_Quantities.isHidden = true
            view_Rejectionview.isHidden = false
            self.tbl_Package_Detail.isHidden = true
            self.tbl_RejectionHistory.isHidden = false
            if Arr_PLDetail[0].rejectReasons!.count == 0 {
                TableViewHelper.EmptyMessage(message: "No records found", tableview: tbl_RejectionHistory, textColor: .black)
            }else {
             self.tbl_RejectionHistory.reloadData()
            }
            
        }
    }
    @IBAction func btn_SaveClick_Action(_ sender: UIButton) {
       }
    @IBAction func btn_DiscardClick_Action(_ sender: UIButton) {
    }
    
    @objc func btn_NextClick(_ sender: UIButton) {
     
    }
    @objc func btn_PreviousClick(_ sender: UIButton) {
      
    }
}
extension PLinputDetails: UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        if tableView == tbl_Package_Detail {
        return 2
        } else {
            return 2
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tbl_Package_Detail {
            if section == 0 {
                return 1
            } else {
              return ((Arr_PLDetail.count == 0) ? Arr_PLDetail.count : Arr_PLDetail[0].inputMasterIDS!.count)
            }
        } else {
            if section == 0 {
                return 1
            } else {
                return arr_rejectH.count
            }
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == tbl_Package_Detail { // Detail Table
            if indexPath.section == 0 {
                let cell : PackageDetailsHeaderCell = tableView.dequeueReusableCell(withIdentifier: "PackageDetailsHeaderCell") as! PackageDetailsHeaderCell
                cell.isUserInteractionEnabled = false
                return cell
            } else {
                let cell : PL_PackageDetailsCell = tableView.dequeueReusableCell(withIdentifier: "PL_PackageDetailsCell") as! PL_PackageDetailsCell
                cell.Display_Cell(viewController: self, indexPath: indexPath)
                cell.selectionStyle = .none
                return cell
            }
        } else if tableView == tbl_RejectionHistory {
            if indexPath.section == 0 {
                let cell : RejectionHistoryHeaderCell = tableView.dequeueReusableCell(withIdentifier: "RejectionHistoryHeaderCell") as! RejectionHistoryHeaderCell
                cell.isUserInteractionEnabled = false
                return cell
            } else {
                let cell : RejectionHistoryCell = tableView.dequeueReusableCell(withIdentifier: "RejectionHistoryCell") as! RejectionHistoryCell
                cell.Display_Cell(arr: arr_rejectH, indexPath: indexPath.row)
                cell.selectionStyle = .none
                return cell
            }
        }
        let cell = UITableViewCell()
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == tbl_Package_Detail { // Detail Table
            if indexPath.section == 1 {
                let PackageDetails_VC = Config.StoryBoard.instantiateViewController(identifier: "PackageDetailsVC") as! PackageDetailsVC
                PackageDetails_VC.Arr_PLDetail = Arr_PLDetail
                PackageDetails_VC.IndexpathRow = indexPath.row
                self.navigationController?.pushViewController(PackageDetails_VC, animated: true)
            }
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        if tableView == tbl_Package_Detail { // Detail Table
            if indexPath.section == 1 {
                let viewAction = UIContextualAction(style: .normal, title: "") { (action, view, completion) in
                    // Perform your action here
                    completion(true)
                    print("View Click")
                    let AddedItems_VC = Config.StoryBoard.instantiateViewController(identifier: "AddedItemsVC") as! AddedItemsVC
                    AddedItems_VC.Arr_PLDetail = self.Arr_PLDetail
                    AddedItems_VC.IndexpathRow = indexPath.row
                    self.navigationController?.pushViewController(AddedItems_VC, animated: true)
                }
                viewAction.image = UIImage(named: "ic_eye")
                viewAction.backgroundColor = Config.bgColor
                return UISwipeActionsConfiguration(actions: [viewAction])
            }
        }
        return UISwipeActionsConfiguration(actions: [])
    }
}

