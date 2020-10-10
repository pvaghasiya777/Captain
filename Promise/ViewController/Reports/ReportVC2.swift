//
//  Report2.swift
//  report
//
//  Created by macbook on 18/06/1942 Saka.
//  Copyright © 1942 com.mac. All rights reserved.
//

import UIKit
import Alamofire
import QuickLook
class Report2: UIViewController {
    //MARK:- IBOutlet
    @IBOutlet weak var tbl_POPositionwiseReport: UITableView!
    @IBOutlet weak var tbl_POPositionwiseReport_1: UITableView!
    @IBOutlet weak var tbl_StructurewiseReport: UITableView!
    @IBOutlet weak var tbl_StructurewiseReport_1: UITableView!
    @IBOutlet weak var tbl_StructurewiseReport_2: UITableView!
    @IBOutlet weak var tbl_StructurewiseReport_3: UITableView!
    @IBOutlet weak var tbl_StructurewiseReport_4: UITableView!
    
    @IBOutlet weak var tbl_IdentCodewiseReport: UITableView!
    @IBOutlet weak var tbl_IdentCodewiseReport_1: UITableView!
    @IBOutlet weak var view_IdentCodewiseReport: UIView!
    @IBOutlet weak var btn_IdentCodewiseReport_1: UIButton!
    @IBOutlet weak var btn_IdentCodewiseReport_2: UIButton!
    // View
    @IBOutlet weak var view_POPositionwiseReport: UIView!
    @IBOutlet weak var view_StructurewiseReport: UIView!
    //Button
    @IBOutlet weak var btn_POPositionwiseReport_1: UIButton!
    @IBOutlet weak var btn_POPositionwiseReport_2: UIButton!
    @IBOutlet weak var btn_StructurewiseReport_1: UIButton!
    @IBOutlet weak var btn_StructurewiseReport_2: UIButton!
    @IBOutlet weak var btn_StructurewiseReport_3: UIButton!
    @IBOutlet weak var btn_StructurewiseReport_4: UIButton!
    @IBOutlet weak var btn_StructurewiseReport_5: UIButton!
    //Show Pagination Number
    @IBOutlet weak var lbl_POPositionPageNumber: UILabel!
    @IBOutlet weak var lbl_IdentCodewiseNumber: UILabel!
    @IBOutlet weak var lbl_StrucherWiseReport: UILabel!
    
    @IBOutlet weak var btn_Previous_POPositionwiseReport: UIButton!
    @IBOutlet weak var btn_Next_POPositionwiseReport: UIButton!
    @IBOutlet weak var lbl_ShowPage_Count_POPositionwiseReport: UILabel!
    @IBOutlet weak var lbl_PageNum_POPositionwiseReport: UILabel!
    
    @IBOutlet weak var btn_Previous_StructurewiseReport: UIButton!
    @IBOutlet weak var btn_Next_StructurewiseReport: UIButton!
    @IBOutlet weak var lbl_ShowPage_Count_StructurewiseReport: UILabel!
    @IBOutlet weak var lbl_PageNum_StructurewiseReport: UILabel!
    
    @IBOutlet weak var btn_Previous_IdentCodewiseReport: UIButton!
    @IBOutlet weak var btn_Next_IdentCodewiseReport: UIButton!
    @IBOutlet weak var lbl_ShowPage_Count_IdentCodewiseReport: UILabel!
    @IBOutlet weak var lbl_PageNum_IdentCodewiseReport: UILabel!
    
    //MARK:- Variable
    var pageName = String()
    var Arr_PoPositionReport = [POPositionWiseReportModel]()
    var Arr_IdentCodeReport = [IdentCodewiseReportModel]()
    var Arr_StrucherWiseReport : NSMutableArray = NSMutableArray()
    var Str_markWiseReportNext = ""
    var Str_markWiseReportPrevious = ""
    var param : NSDictionary = NSDictionary()
    var PageCount = 1
    public var docViewController = QLPreviewController()
    public var arrDocuments = [NSURL]()
    //MARK:-
    override func viewDidLoad() {
        super.viewDidLoad()
        self.Initlization()
    }
    func Initlization(){
        barbuttonheader()
        self.arrDocuments = []
        self.docViewController = QLPreviewController()
        self.docViewController.dataSource = self
        self.docViewController.reloadData()
        if pageName == "PO Positionwise Report" {
            title = "PO Positionwise Report"
            ReportAPI.shareInstance.Get_ReportList(ViewController: self, Api_Str: Api_Urls.GET_API_POPositionReport, params: (param.count == 0) ? ["project_id":"1"] : param as! [String : Any] , tag: 6)
            tbl_POPositionwiseReport.isHidden = false
            tbl_POPositionwiseReport_1.isHidden = true
            view_StructurewiseReport.isHidden = true
            view_POPositionwiseReport.isHidden = false
            view_IdentCodewiseReport.isHidden = true
            tbl_StructurewiseReport.isHidden = true
            tbl_StructurewiseReport_1.isHidden = true
            tbl_StructurewiseReport_2.isHidden = true
            tbl_StructurewiseReport_3.isHidden = true
            tbl_StructurewiseReport_4.isHidden = true
            btn_Next_POPositionwiseReport.addTarget(self, action: #selector(btn_Next_POPositionwiseReport(_:)), for: .touchUpInside)
            btn_Previous_POPositionwiseReport.addTarget(self, action: #selector(btn_Previous_POPositionwiseReport(_:)), for: .touchUpInside)
            
        } else if pageName == "Ident Codewise Report"{
            title = "Ident Codewise Report"
            ReportAPI.shareInstance.Get_ReportList(ViewController: self, Api_Str: Api_Urls.GET_API_IdentCodeWiseReport, params: (param.count == 0) ? ["project_id":"1"] : param as! [String : Any] , tag: 7)
            self.tbl_IdentCodewiseReport.isHidden = false
            self.tbl_IdentCodewiseReport_1.isHidden = false
            tbl_POPositionwiseReport.isHidden = true
            tbl_POPositionwiseReport_1.isHidden = true
            view_StructurewiseReport.isHidden = true
            view_POPositionwiseReport.isHidden = true
            view_IdentCodewiseReport.isHidden = false
            tbl_StructurewiseReport.isHidden = true
            tbl_StructurewiseReport_1.isHidden = true
            tbl_StructurewiseReport_2.isHidden = true
            tbl_StructurewiseReport_3.isHidden = true
            tbl_StructurewiseReport_4.isHidden = true

            btn_Next_IdentCodewiseReport.addTarget(self, action: #selector(btn_Next_IdentCodewiseReport(_:)), for: .touchUpInside)
            btn_Previous_IdentCodewiseReport.addTarget(self, action: #selector(btn_IdentCodewiseReport(_:)), for: .touchUpInside)
        } else if pageName == "Structurewise Report" {
            title = "Structurewise Report"
            ReportAPI.shareInstance.Get_ReportList(ViewController: self, Api_Str: Api_Urls.GET_API_StrucherWiseReport, params: (param.count == 0) ? ["project_id":"1"] : param as! [String : Any], tag: 8)
            tbl_POPositionwiseReport.isHidden = true
            tbl_POPositionwiseReport_1.isHidden = true
            view_StructurewiseReport.isHidden = false
            view_POPositionwiseReport.isHidden = true
            view_IdentCodewiseReport.isHidden = true
            tbl_StructurewiseReport.isHidden = false
            tbl_StructurewiseReport_1.isHidden = true
            tbl_StructurewiseReport_2.isHidden = true
            tbl_StructurewiseReport_3.isHidden = true
            tbl_StructurewiseReport_4.isHidden = true
            btn_Next_StructurewiseReport.addTarget(self, action: #selector(btn_Next_StructurewiseReport(_:)), for: .touchUpInside)
            btn_Previous_StructurewiseReport.addTarget(self, action: #selector(btn_Previous_StructurewiseReport(_:)), for: .touchUpInside)
        }
    }
    func barbuttonheader() {
        let rightButtonPDF: UIBarButtonItem = UIBarButtonItem(image: UIImage(named: "ic_pdf"),  style: .plain, target: self, action: #selector(barbtn_PDF(_:)))
        let rightButtonExcel: UIBarButtonItem = UIBarButtonItem(image: UIImage(named: "ic_excel"),  style: .plain, target: self, action: #selector(barbtn_excel(_:)))
        let rightButtonMail: UIBarButtonItem = UIBarButtonItem(image: UIImage(named: "ic_message"),  style: .plain, target: self, action: #selector(barbtn_Mail(_:)))
        rightButtonMail.tintColor = App_Colors.ThemBlue
        rightButtonPDF.tintColor = App_Colors.ThemBlue
        rightButtonExcel.tintColor = App_Colors.ThemBlue
        self.navigationItem.rightBarButtonItems  = [rightButtonMail,rightButtonPDF,rightButtonExcel]
    }
    
    @IBAction func btn_IdentCodewiseReport(_ sender: UIButton) {
       if sender.tag == 8 {
           tbl_IdentCodewiseReport.isHidden = false
           tbl_IdentCodewiseReport_1.isHidden = true
        self.tbl_IdentCodewiseReport.reloadData()
       } else if sender.tag == 9 {
           tbl_IdentCodewiseReport.isHidden = true
           tbl_IdentCodewiseReport_1.isHidden =  false
        self.tbl_IdentCodewiseReport_1.reloadData()
       }
    }
    @objc func barbtn_Mail(_ sender: UIBarButtonItem) {
        self.SentMail(report_type: "mail", Param: param)
    }
    @objc func barbtn_PDF(_ sender: UIBarButtonItem) {
       self.SentMail(report_type: "pdf", Param: param)
    }
    @objc func barbtn_excel(_ sender: UIBarButtonItem) {
        self.SentMail(report_type: "excel", Param: param)
    }
    func SentMail(report_type : String,Param : NSDictionary) {
        if param.count == 0 {
             param = ["project_id":"1","report_type" : report_type]
        }else {
            let tempDic : NSMutableDictionary = NSMutableDictionary(dictionary: param)
            tempDic.setValue(report_type, forKey: "report_type")
            param = tempDic
        }
        switch pageName {
        case "PO Positionwise Report":
            let CallApi = (report_type != "mail") ? ReportAPI.shareInstance.Get_DownloadDocument(ViewController: self, Api_Str: Api_Urls.GET_API_POPositionReport, params: param as! Parameters, tag: 6, report_Type: (report_type != "excel") ? "pdf" : "xlsx") : ReportAPI.shareInstance.Get_ReportList(ViewController: self, Api_Str: Api_Urls.GET_API_POPositionReport, params: param as! Parameters, tag: 6)
            print(CallApi)
//            ReportAPI.shareInstance.Get_ReportList(ViewController: self, Api_Str: Api_Urls.GET_API_POPositionReport, params: param as! Parameters, tag: 6)
        case "Ident Codewise Report" :
            let CallApi = (report_type != "mail") ? ReportAPI.shareInstance.Get_DownloadDocument(ViewController: self, Api_Str: Api_Urls.GET_API_IdentCodeWiseReport, params: param as! Parameters, tag: 7, report_Type: (report_type != "excel") ? "pdf" : "xlsx") : ReportAPI.shareInstance.Get_ReportList(ViewController: self, Api_Str: Api_Urls.GET_API_IdentCodeWiseReport, params: param as! Parameters, tag: 7)
            print(CallApi)
//            ReportAPI.shareInstance.Get_ReportList(ViewController: self, Api_Str: Api_Urls.GET_API_IdentCodeWiseReport, params: param as! Parameters, tag: 7)
        case "Structurewise Report" :
            let CallApi = (report_type != "mail") ? ReportAPI.shareInstance.Get_DownloadDocument(ViewController: self, Api_Str: Api_Urls.GET_API_StrucherWiseReport, params: param as! Parameters, tag: 8, report_Type: (report_type != "excel") ? "pdf" : "xlsx") : ReportAPI.shareInstance.Get_ReportList(ViewController: self, Api_Str: Api_Urls.GET_API_StrucherWiseReport, params: param as! Parameters, tag: 8)
            print(CallApi)
//            ReportAPI.shareInstance.Get_ReportList(ViewController: self, Api_Str: Api_Urls.GET_API_StrucherWiseReport, params: param as! Parameters, tag: 8)
        default:
            print(pageName)
        }
    }
    //MARK:- Button Click Event
    @IBAction func btn_POPositionwiseReportNum(_ sender: UIButton) {
        if sender.tag == 1 {
            tbl_POPositionwiseReport.isHidden = false
            tbl_POPositionwiseReport_1.isHidden = true
            self.tbl_POPositionwiseReport.reloadData()
        } else if sender.tag == 2 {
            tbl_POPositionwiseReport.isHidden = true
            tbl_POPositionwiseReport_1.isHidden =  false
            self.tbl_POPositionwiseReport_1.reloadData()
        }
    }
    @IBAction func btn_StructurewiseReportNum(_ sender: UIButton) {
        if sender.tag == 3 {
            tbl_StructurewiseReport.isHidden = false
            tbl_StructurewiseReport_1.isHidden = true
            tbl_StructurewiseReport_2.isHidden = true
            tbl_StructurewiseReport_3.isHidden = true
            tbl_StructurewiseReport_4.isHidden = true
            self.tbl_StructurewiseReport.reloadData()
        } else if sender.tag == 4 {
            tbl_StructurewiseReport.isHidden = true
            tbl_StructurewiseReport_1.isHidden = false
            tbl_StructurewiseReport_2.isHidden = true
            tbl_StructurewiseReport_3.isHidden = true
            tbl_StructurewiseReport_4.isHidden = true
            self.tbl_StructurewiseReport_1.reloadData()
        } else if sender.tag == 5 {
            tbl_StructurewiseReport.isHidden = true
            tbl_StructurewiseReport_1.isHidden = true
            tbl_StructurewiseReport_2.isHidden = false
            tbl_StructurewiseReport_3.isHidden = true
            tbl_StructurewiseReport_4.isHidden = true
            self.tbl_StructurewiseReport_2.reloadData()
        } else if sender.tag == 6 {
            tbl_StructurewiseReport.isHidden = true
            tbl_StructurewiseReport_1.isHidden = true
            tbl_StructurewiseReport_2.isHidden = true
            tbl_StructurewiseReport_3.isHidden = false
            tbl_StructurewiseReport_4.isHidden = true
            self.tbl_StructurewiseReport_3.reloadData()
        } else if sender.tag == 7 {
            tbl_StructurewiseReport.isHidden = true
            tbl_StructurewiseReport_1.isHidden = true
            tbl_StructurewiseReport_2.isHidden = true
            tbl_StructurewiseReport_3.isHidden = true
            tbl_StructurewiseReport_4.isHidden = false
            self.tbl_StructurewiseReport_4.reloadData()
        }
    }
    //MARK:- Button next previous Click
    @objc func btn_Next_POPositionwiseReport(_ sender: UIButton) {
        if Arr_PoPositionReport[0].next != nil {
            ReportAPI.shareInstance.Get_ReportList(ViewController: self, Api_Str: Arr_PoPositionReport[0].next!, params: [:],tag: 6)
            self.PageCount = PageCount + 1
            self.lbl_PageNum_POPositionwiseReport.text = String(describing: PageCount)
        }else {
            Utils.showToastWithMessageAtCenter(message: "Next Data not Available")
        }
    }
    @objc func btn_Previous_POPositionwiseReport(_ sender: UIButton) {
     
         if Arr_PoPositionReport[0].next != nil {
             ReportAPI.shareInstance.Get_ReportList(ViewController: self, Api_Str: Arr_PoPositionReport[0].next!, params: [:],tag: 6)
             self.PageCount = PageCount - 1
             self.lbl_PageNum_POPositionwiseReport.text = String(describing: PageCount)
         }else {
             Utils.showToastWithMessageAtCenter(message: "Next Data not Available")
         }
     }
    @objc func btn_Next_StructurewiseReport(_ sender: UIButton) {
        if Str_markWiseReportNext != "" {
            ReportAPI.shareInstance.Get_ReportList(ViewController: self, Api_Str: Str_markWiseReportNext, params: [:],tag: 8)
            self.PageCount = PageCount + 1
            self.lbl_PageNum_StructurewiseReport.text = String(describing: PageCount)
        }else {
            Utils.showToastWithMessageAtCenter(message: "Next Data not Available")
        }
    }
    @objc func btn_Previous_StructurewiseReport(_ sender: UIButton) {
        if Str_markWiseReportPrevious != "" {
            ReportAPI.shareInstance.Get_ReportList(ViewController: self, Api_Str: Str_markWiseReportPrevious, params: [:],tag: 8)
            self.PageCount = PageCount - 1
            self.lbl_PageNum_StructurewiseReport.text = String(describing: PageCount)
        }else {
            Utils.showToastWithMessageAtCenter(message: "Previous Data not Available")
        }
    }
    @objc func btn_Next_IdentCodewiseReport(_ sender: UIButton) {
        if Arr_IdentCodeReport[0].next != nil {
            ReportAPI.shareInstance.Get_ReportList(ViewController: self, Api_Str: Arr_IdentCodeReport[0].next!, params: [:],tag: 7)
            self.PageCount = PageCount + 1
            self.lbl_PageNum_IdentCodewiseReport.text = String(describing: PageCount)
        }else {
            Utils.showToastWithMessageAtCenter(message: "Next Data not Available")
        }
    }
    @objc func btn_Previous_IdentCodewiseReport(_ sender: UIButton) {
        if Arr_IdentCodeReport[0].next != nil {
            ReportAPI.shareInstance.Get_ReportList(ViewController: self, Api_Str: Arr_IdentCodeReport[0].next!, params: [:],tag: 7)
            self.PageCount = PageCount - 1
            self.lbl_PageNum_IdentCodewiseReport.text = String(describing: PageCount)
        }else {
            Utils.showToastWithMessageAtCenter(message: "Next Data not Available")
        }
    }
}
extension Report2 : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }else {
            if tableView == tbl_POPositionwiseReport {
                return (Arr_PoPositionReport.count == 0) ? Arr_PoPositionReport.count : Arr_PoPositionReport[0].results!.count
            } else if tableView == tbl_POPositionwiseReport_1 {
                return (Arr_PoPositionReport.count == 0) ? Arr_PoPositionReport.count : Arr_PoPositionReport[0].results!.count
            } else if tableView == tbl_StructurewiseReport {
                return Arr_StrucherWiseReport.count
            } else if tableView == tbl_StructurewiseReport_1 {
                return Arr_StrucherWiseReport.count
            } else if tableView == tbl_StructurewiseReport_2 {
                return Arr_StrucherWiseReport.count
            } else if tableView == tbl_StructurewiseReport_3 {
                return Arr_StrucherWiseReport.count
            } else  if tableView == tbl_StructurewiseReport_4{
                return Arr_StrucherWiseReport.count
            } else if tableView == tbl_IdentCodewiseReport {
                return (Arr_IdentCodeReport.count == 0) ? Arr_IdentCodeReport.count : Arr_IdentCodeReport[0].results!.count
            }else {
                  return (Arr_IdentCodeReport.count == 0) ? Arr_IdentCodeReport.count : Arr_IdentCodeReport[0].results!.count
            }
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == tbl_POPositionwiseReport {
            if indexPath.section == 0 {
                let cell : POPositionwiseReportHeadercell = tableView.dequeueReusableCell(withIdentifier: "POPositionwiseReportHeadercell") as! POPositionwiseReportHeadercell
                return cell
            } else {
                let cell : POPositionwiseReportcell = tableView.dequeueReusableCell(withIdentifier: "POPositionwiseReportcell") as! POPositionwiseReportcell
                cell.DisplayCell(Arr_Data: Arr_PoPositionReport, indexpath: indexPath)
                return cell
            }
        } else if tableView == tbl_POPositionwiseReport_1 {
            if indexPath.section == 0 {
                let cell : POPositionwiseReportHeadercell1 = tableView.dequeueReusableCell(withIdentifier: "POPositionwiseReportHeadercell1") as! POPositionwiseReportHeadercell1
                return cell
            } else {
                let cell : POPositionwiseReportcell1 = tableView.dequeueReusableCell(withIdentifier: "POPositionwiseReportcell1") as! POPositionwiseReportcell1
                cell.DisplayCell(Arr_Data: Arr_PoPositionReport, indexpath: indexPath)
                return cell
            }
        } else if tableView == tbl_StructurewiseReport {
            if indexPath.section == 0 {
                let cell : StructurewiseReportHeadercell = tableView.dequeueReusableCell(withIdentifier: "StructurewiseReportHeadercell") as! StructurewiseReportHeadercell
                return cell
            } else {
                let cell : StructurewiseReportcell = tableView.dequeueReusableCell(withIdentifier: "StructurewiseReportcell") as! StructurewiseReportcell
                cell.DisplayCell(Arr_Data: Arr_StrucherWiseReport, indexpath: indexPath)
                return cell
            }
        } else if tableView == tbl_StructurewiseReport_1 {
            if indexPath.section == 0 {
                let cell : StructurewiseReportHeadercell1 = tableView.dequeueReusableCell(withIdentifier: "StructurewiseReportHeadercell1") as! StructurewiseReportHeadercell1
                return cell
            } else {
                let cell : StructurewiseReportcell1 = tableView.dequeueReusableCell(withIdentifier: "StructurewiseReportcell1") as! StructurewiseReportcell1
                cell.DisplayCell(Arr_Data: Arr_StrucherWiseReport, indexpath: indexPath)
                return cell
            }
        } else if tableView == tbl_StructurewiseReport_2 {
            if indexPath.section == 0 {
                let cell : StructurewiseReportHeadercell2 = tableView.dequeueReusableCell(withIdentifier: "StructurewiseReportHeadercell2") as! StructurewiseReportHeadercell2
                return cell
            } else {
                let cell : StructurewiseReportcell2 = tableView.dequeueReusableCell(withIdentifier: "StructurewiseReportcell2") as! StructurewiseReportcell2
                cell.DisplayCell(Arr_Data: Arr_StrucherWiseReport, indexpath: indexPath)
                return cell
            }
        } else if tableView == tbl_StructurewiseReport_3 {
            if indexPath.section == 0 {
                let cell : StructurewiseReportHeadercell3 = tableView.dequeueReusableCell(withIdentifier: "StructurewiseReportHeadercell3") as! StructurewiseReportHeadercell3
                return cell
            } else {
                let cell : StructurewiseReportcell3 = tableView.dequeueReusableCell(withIdentifier: "StructurewiseReportcell3") as! StructurewiseReportcell3
                cell.DisplayCell(Arr_Data: Arr_StrucherWiseReport, indexpath: indexPath)
                return cell
            }
        } else if tableView == tbl_StructurewiseReport_4{
            if indexPath.section == 0 {
                let cell : StructurewiseReportHeadercell4 = tableView.dequeueReusableCell(withIdentifier: "StructurewiseReportHeadercell4") as! StructurewiseReportHeadercell4
                return cell
            } else {
                let cell : StructurewiseReportcell4 = tableView.dequeueReusableCell(withIdentifier: "StructurewiseReportcell4") as! StructurewiseReportcell4
                cell.DisplayCell(Arr_Data: Arr_StrucherWiseReport, indexpath: indexPath)
                return cell
            }
        } else if tableView == tbl_IdentCodewiseReport{
            if indexPath.section == 0 {
                let cell : IdentCodewiseReportHeaderCell = tableView.dequeueReusableCell(withIdentifier: "IdentCodewiseReportHeaderCell") as! IdentCodewiseReportHeaderCell
                return cell
            } else {
                let cell : IdentCodewiseReportCell = tableView.dequeueReusableCell(withIdentifier: "IdentCodewiseReportCell") as! IdentCodewiseReportCell
                cell.DisplayCell(Arr_Data: Arr_IdentCodeReport[0].results!, indexpath: indexPath)
                return cell
            }
        }else {
            if indexPath.section == 0 {
                let cell : IdentCodewiseReportHeaderCell1 = tableView.dequeueReusableCell(withIdentifier: "IdentCodewiseReportHeaderCell1") as! IdentCodewiseReportHeaderCell1
                return cell
            } else {
                let cell : IdentCodewiseReportCell1 = tableView.dequeueReusableCell(withIdentifier: "IdentCodewiseReportCell1") as! IdentCodewiseReportCell1
               cell.DisplayCell(Arr_Data: Arr_IdentCodeReport[0].results!, indexpath: indexPath)
                return cell
            }
        }
        
    }
}
extension Report2 : QLPreviewControllerDataSource {
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
