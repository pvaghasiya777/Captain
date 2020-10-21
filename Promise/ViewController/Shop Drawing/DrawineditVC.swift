//
//  DrawineditVC.swift
//  PromiseApiCall
//
//  Created by macbook on 20/05/1942 Saka.
//  Copyright © 1942 com.mac. All rights reserved.
//

import UIKit
import iOSDropDown
import QuickLook
class DrawineditVC: UIViewController {
    //MARK:- IBOutlet
    @IBOutlet weak var view_topBG: UIView!
    @IBOutlet weak var btn_Save: UIButton!
    @IBOutlet weak var btn_Discard: UIButton!
    @IBOutlet weak var view_SecondBG: UIView!
    //@IBOutlet weak var btn_CreateNew: UIButton!
    @IBOutlet weak var btn_Draft: UIButton!
    @IBOutlet weak var btn_Submitted: UIButton!
    @IBOutlet weak var btn_Approved: UIButton!
    @IBOutlet weak var view_ThardBG: UIView!
    @IBOutlet weak var btn_Packages: UIButton!
    @IBOutlet weak var btn_PackagesList: UIButton!
    @IBOutlet weak var btn_RivisonHistory: UIButton!
    @IBOutlet weak var btn_Structure: UIButton!
    @IBOutlet weak var lbl_Structure: UILabel!
    @IBOutlet weak var btn_Quantities: UIButton!
    @IBOutlet weak var lbl_Quantities: UILabel!
    @IBOutlet weak var btn_Documents: UIButton!
    @IBOutlet weak var lbl_Documents: UILabel!
    @IBOutlet weak var btn_Rejection: UIButton!
    @IBOutlet weak var lbl_Rejection: UILabel!
    //Project Details View
    @IBOutlet weak var view_ProjectDetails: UIView!
    @IBOutlet weak var txt_Purchase: DropDown!
    @IBOutlet weak var txt_Project: UITextField!
    @IBOutlet weak var txt_Vendor: UITextField!
    //Structure Details
    @IBOutlet weak var view_StructureDetails: UIView!
    @IBOutlet weak var txt_StructureId: UITextField!
    @IBOutlet weak var txt_GroupName: UITextField!
    @IBOutlet weak var txt_Revision: UITextField!
    @IBOutlet weak var btn_IsGroupStructure: UIButton!
    @IBOutlet weak var txt_Lot: UITextField!
    @IBOutlet weak var txt_LotSub: UITextField!
    //Structure Details View
    @IBOutlet weak var txt_ContractorDocument: UITextField!
    @IBOutlet weak var txt_SubContractor: UITextField!
    @IBOutlet weak var drop_PreparedBy: DropDown!
    @IBOutlet weak var drop_CheckedBy: DropDown!
    @IBOutlet weak var drop_ApprovedBy: DropDown!
    @IBOutlet weak var drop_Status: DropDown!
    @IBOutlet weak var btn_Active: UIButton!
    @IBOutlet weak var btn_IsPackageCreated: UIButton!
    //Quantities view
    @IBOutlet weak var view_Quantities: UIView!
    @IBOutlet weak var txt_TotalQuantity: UITextField!
    @IBOutlet weak var txt_TotalNetWeight: UITextField!
    @IBOutlet weak var txt_TotalPaintingWeight: UITextField!
    @IBOutlet weak var txt_TotalFireproofingWeight: UITextField!
    //Documents view
    @IBOutlet weak var view_Documentsview: UIView!
    @IBOutlet weak var txt_ExcelFile: UITextField!
    @IBOutlet weak var btn_BrowseExcel: UIButton!
    @IBOutlet weak var txt_PDFFile: UITextField!
    @IBOutlet weak var btn_BrowsePDF: UIButton!
    //Rejection view
    @IBOutlet weak var view_Rejectionview: UIView!
    @IBOutlet weak var view_RejectionviewPagination: UIView!
    @IBOutlet weak var tbl_RejectionHistory: UITableView!
    @IBOutlet weak var btn_ExcelFile: UIButton!
    @IBOutlet weak var btn_PDFFile: UIButton!
    
    @IBOutlet weak var btn_Previous: UIButton!
    @IBOutlet weak var btn_Next: UIButton!
    @IBOutlet weak var lbl_ShowPage_Count: UILabel!
    @IBOutlet weak var lbl_PageNum: UILabel!
    //MARK:- variable
    public var docViewController = QLPreviewController()
    public var arrDocuments = [NSURL]()
    var arrStructureInfo = [StructureInformationModel]()
    var arrrejectreasons = [Reject_reasons]()
    var arrDrawing = [Result]()
    var indexpatharr = Int()
    var projectName = String()
    var vendorName = String()
    var Str_Title = ""
    //MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeview()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = Str_Title
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationItem.title = ""
    }
    //MARK:- Initialisation
    func initializeview() {
        self.arrDocuments = []
        self.docViewController = QLPreviewController()
        self.docViewController.dataSource = self
        self.docViewController.reloadData()
        ServiceCall.shareInstance.Get_getDrawingEdit(ViewController: self)
        self.UIdesign()
        view_RejectionviewPagination.isHidden = (arrrejectreasons != nil) ? true : false
        lbl_Quantities.backgroundColor = .white
        lbl_Documents.backgroundColor = .white
        lbl_Rejection.backgroundColor = .white
        view_ProjectDetails.isHidden = false
        view_StructureDetails.isHidden = false
        view_Quantities.isHidden = true
        view_Documentsview.isHidden = true
        view_Rejectionview.isHidden = true
        TableViewHelper.EmptyMessage(message: "No records found", tableview: tbl_RejectionHistory, textColor: .gray)
    }
    func UIdesign() {
        Utils.EnableTextField(textFields: [txt_Purchase,txt_Project,txt_Vendor,txt_StructureId,txt_GroupName,txt_Revision,txt_Lot,txt_LotSub,txt_ContractorDocument,txt_SubContractor,txt_TotalQuantity,txt_TotalNetWeight,txt_TotalPaintingWeight,txt_TotalFireproofingWeight,txt_ExcelFile,txt_PDFFile])
        Utils.EnableTextField(textFields: [drop_PreparedBy,drop_CheckedBy,drop_ApprovedBy,drop_Status])
        Utils.add_shadow_around_view_Multiple(views: [view_topBG,view_SecondBG,view_ThardBG], color: .gray, radius: 5, opacity: 5)
        Utils.add_shadow_around_view(view: btn_Active, color: .gray, radius: 2, opacity: 5)
//        Utils.add_shadow_around_view(view: btn_IsPackageCreated, color: .gray, radius: 2, opacity: 5)
        Utils.Set_Same_Corner_Radius(views: [btn_Save,btn_Discard,btn_IsGroupStructure,btn_Active,btn_IsGroupStructure], cornerRadius: 5)
    }
    //MARK:- Button Click Action
    @IBAction func btn_Click(_ sender: UIButton) {
        if sender.tag == 1 {
            lbl_Structure.backgroundColor = UIColor(red: 0.21, green: 0.20, blue: 0.51, alpha: 1.00)
            lbl_Quantities.backgroundColor = .white
            lbl_Documents.backgroundColor = .white
            lbl_Rejection.backgroundColor = .white
            view_ProjectDetails.isHidden = false
            view_StructureDetails.isHidden = false
            view_Quantities.isHidden = true
            view_Documentsview.isHidden = true
            view_Rejectionview.isHidden = true
        } else if sender.tag == 2{
            lbl_Structure.backgroundColor = .white
            lbl_Quantities.backgroundColor = UIColor(red: 0.21, green: 0.20, blue: 0.51, alpha: 1.00)
            lbl_Documents.backgroundColor = .white
            lbl_Rejection.backgroundColor = .white
            view_ProjectDetails.isHidden = true
            view_StructureDetails.isHidden = true
            view_Quantities.isHidden = false
            view_Documentsview.isHidden = true
            view_Rejectionview.isHidden = true
            
        } else if sender.tag == 3{
            lbl_Structure.backgroundColor = .white
            lbl_Quantities.backgroundColor = .white
            lbl_Documents.backgroundColor = UIColor(red: 0.21, green: 0.20, blue: 0.51, alpha: 1.00)
            lbl_Rejection.backgroundColor = .white
            view_ProjectDetails.isHidden = true
            view_StructureDetails.isHidden = true
            view_Quantities.isHidden = true
            view_Documentsview.isHidden = false
            view_Rejectionview.isHidden = true
            
        }else if sender.tag == 4{
            lbl_Structure.backgroundColor = .white
            lbl_Quantities.backgroundColor = .white
            lbl_Documents.backgroundColor = .white
            lbl_Rejection.backgroundColor = UIColor(red: 0.21, green: 0.20, blue: 0.51, alpha: 1.00)
            view_ProjectDetails.isHidden = true
            view_StructureDetails.isHidden = true
            view_Quantities.isHidden = true
            view_Documentsview.isHidden = true
            view_Rejectionview.isHidden = false
        }
    }
    
    func dataset(){
        let rowdata = arrStructureInfo[0]
        self.btn_Packages.addSubview(Utils.set_Badge(Count: rowdata.package_count!))
        self.btn_PackagesList.addSubview(Utils.set_Badge(Count: rowdata.packing_count!))
        self.btn_RivisonHistory.addSubview(Utils.set_Badge(Count: rowdata.history_count!))
        txt_Purchase.text = rowdata.purchase_id
        txt_Project.text = projectName
        txt_Vendor.text = vendorName
        txt_StructureId.text = rowdata.structure_id
        txt_GroupName.text = rowdata.group_name
        ////        btn_IsPackageCreated
        txt_Revision.text = rowdata.rev_no
        btn_IsGroupStructure.setBackgroundImage(UIImage(named: ((rowdata.is_active == true) ? "ic_check": "")), for: .normal)
        txt_Lot.text  = rowdata.lot
        txt_LotSub.text = rowdata.sub_lot
        //Document Details
        txt_ContractorDocument.text = rowdata.contract_doc_no
        txt_SubContractor.text = rowdata.sub_contractor_doc_no
        self.txt_PDFFile.text = (rowdata.shop_drawing_pdf != nil) ? (rowdata.shop_drawing_pdf! as NSString).lastPathComponent : "File Not Availabel"
        self.txt_ExcelFile.text = (rowdata.shop_drawing_excel != nil) ? (rowdata.shop_drawing_excel! as NSString).lastPathComponent : "File Not Availabel"
        let Arr_Employee = DEFAULTS.Get_MasterEmployee()
        drop_PreparedBy.text = Arr_Employee.filter{$0.id! == rowdata.prepared_by!}[0].name!
        drop_CheckedBy.text = Arr_Employee.filter{$0.id! == rowdata.checked_by!}[0].name!
        drop_ApprovedBy.text = Arr_Employee.filter{$0.id! == rowdata.approved_by!}[0].name!
        btn_Active.setBackgroundImage(UIImage(named: ((rowdata.is_active == true) ? "ic_check": "")), for: .normal)
        btn_IsPackageCreated.setBackgroundImage(UIImage(named: ((rowdata.is_active == true) ? "ic_check": "")), for: .normal)
        //////        Quantities view
        txt_TotalQuantity.text = String(describing: rowdata.total_quantity!)
        txt_TotalNetWeight.text = String(describing: rowdata.total_net_weight!)
        txt_TotalPaintingWeight.text = String(describing: rowdata.total_painting_weight!)
        txt_TotalFireproofingWeight.text = String(describing: rowdata.total_fireproofing_weight!)
        if rowdata.status == "draft" {
            btn_Draft.setBackgroundImage(UIImage(named: "ic_StutsPathColor"), for: .normal)
            btn_Draft.setTitleColor(.white, for: .normal)
            btn_Submitted.backgroundColor = .white
            btn_Approved.backgroundColor = .white
        } else if rowdata.status == "submit" {
            btn_Draft.backgroundColor = .white
            btn_Submitted.setBackgroundImage(UIImage(named: "ic_StutsPathColor"), for: .normal)
            btn_Submitted.setTitleColor(.white, for: .normal)
            btn_Approved.backgroundColor = .white
        } else {
            btn_Draft.backgroundColor = .white
            btn_Submitted.backgroundColor = .white
            btn_Approved.setBackgroundImage(UIImage(named: "ic_StutsPathColor"), for: .normal)
            btn_Approved.setTitleColor(.white, for: .normal)
        }
        btn_PDFFile.isHidden = (rowdata.shop_drawing_pdf == nil) ? true : false
        btn_ExcelFile.isHidden = (rowdata.shop_drawing_excel == nil) ? true : false
        btn_ExcelFile.addTarget(self, action: #selector(barbtn_excel(_:)), for: .touchUpInside)
        btn_PDFFile.addTarget(self, action: #selector(barbtn_PDF(_:)), for: .touchUpInside)
    }
    @objc func barbtn_PDF(_ sender: UIButton) {
        self.storeAndShare(withURLString: Api_Urls.DocumentBASE_URL + arrStructureInfo[0].shop_drawing_pdf!)
     }
     @objc func barbtn_excel(_ sender: UIButton) {
       self.storeAndShare(withURLString: Api_Urls.DocumentBASE_URL + arrStructureInfo[0].shop_drawing_excel!)
     }
    func storeAndShare(withURLString: String) {
        guard let url = URL(string: withURLString) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }
            let tmpURL = FileManager.default.temporaryDirectory
                .appendingPathComponent(response?.suggestedFilename ?? "fileName.png")
            do {
                try data.write(to: tmpURL)
            } catch {
                print(error)
            }
            DispatchQueue.main.async {
                self.arrDocuments = [tmpURL as! NSURL]
                self.docViewController.reloadData()
                self.present(self.docViewController, animated: true, completion: nil)
            }
        }.resume()
    }
    @IBAction func btn_ActiveClick(_ sender: UIButton) {
        //         let rodata = arrStructureInfo[0]
        //        if sender.tag == 5 {
        //            btn_Active.setImage(UIImage(named: ((rodata.is_active == true) ? "": "ic_check")), for: .normal)
        //        } else if sender.tag == 6 {
        //            btn_IsPackageCreated.setImage(UIImage(named: ((rodata.is_active == true) ? "": "ic_check")), for: .normal)
        //        }
    }
    //MARK:- Button Click Action
    @IBAction func btn_Click_Inside(_ sender: UIButton) {
        if sender.tag == 1 {
            print("Packges Click")
            let Plinputs_Vc = Config.StoryBoard.instantiateViewController(identifier: "PlinputsVc") as! PlinputsVc
            Plinputs_Vc.Str_NavigateFrom = "Drawin Edit"
            Plinputs_Vc.Str_ID = String(describing: arrStructureInfo[0].id!)
            self.navigationController?.pushViewController(Plinputs_Vc, animated: true)
        }else if sender.tag == 2 {
            print("Packing List Click")
            let PackingList_VC = Config.StoryBoard.instantiateViewController(identifier: "PackingListVC") as! PackingListVC
            PackingList_VC.Str_NavigateFrom = "Drawin Edit"
            PackingList_VC.Str_ID = String(describing: arrStructureInfo[0].id!)
            self.navigationController?.pushViewController(PackingList_VC, animated: true)
        }else {
            if DEFAULTS.Get_Revision_Count() == 0 {
                print("Revision histroy")
                let Drawing_VC = Config.StoryBoard.instantiateViewController(identifier: "DrawingVC") as! DrawingVC
                Drawing_VC.Str_NavigateFrom = "Drawing_Revision"
                Drawing_VC.Str_ID = String(describing: arrStructureInfo[0].structure_id!)
                DEFAULTS.Set_Revision_Count(Count: 1)
                self.navigationController?.pushViewController(Drawing_VC, animated: true)
            }else {
                Utils.showToastWithMessageAtCenter(message: "Already In Revision Histroy")
            }
        }
    }
    @IBAction func btn_SaveClick_Action(_ sender: UIButton) {
       }
    @IBAction func btn_DiscardClick_Action(_ sender: UIButton) {
    }
}

extension DrawineditVC : UITableViewDataSource,UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return  self.arrrejectreasons.count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell : DRejectionHistoryHeaderCell = tableView.dequeueReusableCell(withIdentifier: "DRejectionHistoryHeaderCell") as! DRejectionHistoryHeaderCell
            cell.selectionStyle = .none
            return cell
        } else {
            let cell : DRejectionHistoryCell = tableView.dequeueReusableCell(withIdentifier: "DRejectionHistoryCell") as! DRejectionHistoryCell
            cell.DisplayCell(arr : arrrejectreasons,indexPath : indexPath)
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
extension DrawineditVC : QLPreviewControllerDataSource {
 func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        print("view was cancelled")
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: Document Viewer Delegate methods
    func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
        return self.arrDocuments.count
    }
    
    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
        return self.arrDocuments[index] as QLPreviewItem
    }
}
