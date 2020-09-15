//
//  PackingListsEdit.swift
//  Promise
//
//  Created by macbook on 26/05/1942 Saka.
//  Copyright © 1942 Captain. All rights reserved.
//

import UIKit

class PackingListsEdit: UIViewController {
    //MARK:- IBOutlet
    //view topBG
    @IBOutlet weak var view_topBG: UIView!
    @IBOutlet weak var btn_Save: UIButton!
    @IBOutlet weak var btn_Discard: UIButton!
    //view SecondBG
    @IBOutlet weak var view_SecondBG: UIView!
    @IBOutlet weak var btn_SubmitforApproval: UIButton!
    @IBOutlet weak var btn_Draft: UIButton!
    @IBOutlet weak var btn_Submitted: UIButton!
    @IBOutlet weak var btn_Approved: UIButton!
    //view ThardBG
    @IBOutlet weak var view_ThardBG: UIView!
    @IBOutlet weak var btn_RivisonHistory: UIButton!
    // manu button
    @IBOutlet weak var btn_Structure: UIButton!
    @IBOutlet weak var lbl_Structure: UILabel!
    @IBOutlet weak var btn_Documents: UIButton!
    @IBOutlet weak var lbl_Documents: UILabel!
    @IBOutlet weak var btn_Rejection: UIButton!
    @IBOutlet weak var lbl_Rejection: UILabel!
    //Project Details View
    @IBOutlet weak var view_ProjectDetails: UIView!
    @IBOutlet weak var txt_PackingListNumber: UITextField!
    @IBOutlet weak var txt_Revision: UITextField!
    @IBOutlet weak var txt_PLInput: UITextField!
    //Weight Details
    @IBOutlet weak var txt_PurchaseOrder: UITextField!
    @IBOutlet weak var txt_Project: UITextField!
    @IBOutlet weak var txt_Vendor: UITextField!
    @IBOutlet weak var txt_Structure: UITextField!
    @IBOutlet weak var txt_ReleasedDate: UITextField!
    @IBOutlet weak var txt_Releasenote: UITextField!
    //Weight Details
    @IBOutlet weak var view_WeightDetails: UIView!
    @IBOutlet weak var txt_TotalNetWeight: UITextField!
    @IBOutlet weak var txt_TotalGrossWeight: UITextField!
    @IBOutlet weak var txt_TotalVolume: UITextField!
    @IBOutlet weak var txt_PLSequence: UITextField!
    @IBOutlet weak var txt_Status: UITextField!
    //Documents view
    @IBOutlet weak var view_Documentsview: UIView!
    @IBOutlet weak var txt_ExcelFile: UITextField!
    @IBOutlet weak var btn_BrowseExcel: UIButton!
    @IBOutlet weak var txt_PDFFile: UITextField!
    @IBOutlet weak var btn_BrowsePDF: UIButton!
    @IBOutlet weak var txt_SignedPDFFile: UITextField!
    @IBOutlet weak var btn_BrowseSignedPDFFile: UIButton!
    @IBOutlet weak var txt_MaterialCertificate: UITextField!
    @IBOutlet weak var btn_MaterialCertificate: UIButton!
    @IBOutlet weak var txt_PackingCertificate: UITextField!
    @IBOutlet weak var btn_BrowsePackingCertificate: UIButton!
    //Rejection view
    @IBOutlet weak var view_Rejectionview: UIView!
    @IBOutlet weak var tbl_RejectionHistory: UITableView!
    //MARK:- variable
    var arrPackingListsID_Model = [PackinglistIDModel]()
    var Str_ProjectName = ""
    var Str_VendorName = ""
    var str_ID = String()
    var str_title = String()
    var Str_NextLink : String = String()
    var Str_PreviousLink : String = String()
    //MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initializeview()
    }
    override func viewWillAppear(_ animated: Bool) {
       super.viewWillAppear(animated)
        self.navigationItem.title = str_title
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationItem.title = ""
    }
    //MARK:- Initialization
    func initializeview() {
        self.UIdesign()
        let appurl : String = Api_Urls.GET_API_packingList + "\(str_ID)" + "/"
        ServiceCall.shareInstance.Get_packingList_Edit(ViewController: self, Api_Str: appurl,tag: 0)
        print(arrPackingListsID_Model)
        lbl_Documents.backgroundColor = .white
        lbl_Rejection.backgroundColor = .white
        view_ProjectDetails.isHidden = false
        view_Documentsview.isHidden = true
        view_Rejectionview.isHidden = true
        TableViewHelper.EmptyMessage(message: "No records found", tableview: tbl_RejectionHistory, textColor: .gray)
        
    }
    //MARK:- UI design
    func UIdesign() {
        Utils.add_shadow_around_view(view: view_topBG, color: .gray, radius: 5, opacity: 5)
        Utils.add_shadow_around_view(view: view_SecondBG, color: .gray, radius: 5, opacity: 5)
        Utils.add_shadow_around_view(view: view_ThardBG, color: .gray, radius: 5, opacity: 5)
        Utils.setcornerRadius(view: btn_Save, cornerradius: 5)
        Utils.setcornerRadius(view: btn_Discard, cornerradius: 5)
        Utils.setcornerRadius(view: btn_SubmitforApproval, cornerradius: 5)
    }
    @IBAction func btn_Click_Revision(_ sender: UIButton) {
        print("Revision Click")
        if DEFAULTS.Get_Revision_Count() == 0 {
            let PackingList_VC = Config.StoryBoard.instantiateViewController(identifier: "PackingListVC") as! PackingListVC
            PackingList_VC.Str_NavigateFrom = "PackingList_Revision"
            PackingList_VC.Str_ID = arrPackingListsID_Model[0].number!
            self.navigationController?.pushViewController(PackingList_VC, animated: true)
        }else {
            Utils.showToastWithMessageAtCenter(message: "Already In Revision Histroy")
        }
        
    }
    //MARK:- Button Click Action
    @IBAction func btn_Click(_ sender: UIButton) {
        if sender.tag == 1 {
            lbl_Structure.backgroundColor = UIColor(red: 0.21, green: 0.20, blue: 0.51, alpha: 1.00)
            lbl_Documents.backgroundColor = .white
            lbl_Rejection.backgroundColor = .white
            view_ProjectDetails.isHidden = false
            view_Documentsview.isHidden = true
            view_Rejectionview.isHidden = true
        } else if sender.tag == 2{
            lbl_Structure.backgroundColor = .white
            lbl_Documents.backgroundColor = UIColor(red: 0.21, green: 0.20, blue: 0.51, alpha: 1.00)
            lbl_Rejection.backgroundColor = .white
            view_ProjectDetails.isHidden = true
            view_Documentsview.isHidden = false
            view_Rejectionview.isHidden = true
            
        } else if sender.tag == 3{
            lbl_Structure.backgroundColor = .white
            lbl_Documents.backgroundColor = .white
            lbl_Rejection.backgroundColor = UIColor(red: 0.21, green: 0.20, blue: 0.51, alpha: 1.00)
            view_ProjectDetails.isHidden = true
            view_Documentsview.isHidden = true
            view_Rejectionview.isHidden = false
            self.tbl_RejectionHistory.reloadData()
        }
    }
    //MARK:- Set Data For UI
    func dataset(){
        let rowdata = arrPackingListsID_Model[0]
//        self.btn_RivisonHistory.addSubview(Utils.set_Badge(Count: Int(rowdata.revision!)!))
        //Packing List Details
        txt_PackingListNumber.text = rowdata.number
        txt_Revision.text = rowdata.revision
        txt_PLInput.text = rowdata.pl_input_name
        txt_Structure.text = rowdata.structure_id
        txt_ReleasedDate.text = rowdata.released_date
        txt_Releasenote.text = rowdata.release_note
        self.txt_PurchaseOrder.text = rowdata.purchase_id!
        self.txt_Project.text = Str_ProjectName
        self.txt_Vendor.text = Str_VendorName
        
        //Weight Details
        txt_TotalNetWeight.text = rowdata.total_net_weight
        txt_TotalGrossWeight.text = rowdata.total_gross_weight
        txt_TotalVolume.text = rowdata.total_volume
        txt_PLSequence.text = rowdata.pl_sequence
        txt_Status.text = rowdata.status
        if rowdata.approve_status == "draft" {
            btn_Draft.backgroundColor = UIColor(red: 0.21, green: 0.20, blue: 0.51, alpha: 1.00)
            btn_Submitted.backgroundColor = .white
            btn_Approved.backgroundColor = .white
        } else if rowdata.approve_status == "Submitted"  {
            btn_Draft.backgroundColor = .white
            btn_Submitted.backgroundColor = UIColor(red: 0.21, green: 0.20, blue: 0.51, alpha: 1.00)
            btn_Approved.backgroundColor = .white
        } else if rowdata.approve_status == "approved" {
            btn_Draft.backgroundColor = .white
            btn_Submitted.backgroundColor = .white
            btn_Approved.backgroundColor = UIColor(red: 0.21, green: 0.20, blue: 0.51, alpha: 1.00)
        }
    }
}
//MARK:- TableView Initialisation
extension PackingListsEdit : UITableViewDataSource,UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return ((arrPackingListsID_Model.count == 0) ? arrPackingListsID_Model.count : arrPackingListsID_Model[0].reject_reasons!.count)
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell : PackingListsEditHeaderCell = tableView.dequeueReusableCell(withIdentifier: "PackingListsEditHeaderCell") as! PackingListsEditHeaderCell
            cell.isUserInteractionEnabled = false
            return cell
        } else {
            let cell : PackingListsEditCell = tableView.dequeueReusableCell(withIdentifier: "PackingListsEditCell") as! PackingListsEditCell
            cell.Display_Cell(Arr_Data : arrPackingListsID_Model, indexPath: indexPath)
            cell.selectionStyle = .none
            return cell
        }
    }
}
