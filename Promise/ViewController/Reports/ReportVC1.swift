//
//  ReportVC1.swift
//  report
//
//  Created by macbook on 17/06/1942 Saka.
//  Copyright © 1942 com.mac. All rights reserved.
//

import UIKit
import Alamofire
import QuickLook
import SKActivityIndicatorView
class ReportVC1: UIViewController {
    //MARK:- IBOutlet
    //TableView
    @IBOutlet weak var tbl_PackagewiseReport: UITableView!
    @IBOutlet weak var tbl_PackagewiseReport_1: UITableView!
    @IBOutlet weak var tbl_PackingListReport: UITableView!
    @IBOutlet weak var tbl_PackingListReport_1: UITableView!
    @IBOutlet weak var tbl_PackingListReport_2: UITableView!
    @IBOutlet weak var tbl_PackingListReport_3: UITableView!
    //View
    @IBOutlet weak var view_PackagewiseReport: UIView!
    
    @IBOutlet weak var view_PackingListReport: UIView!
    
    //Button
    @IBOutlet weak var btn_PackagewiseReport_1: UIButton!
    @IBOutlet weak var btn_PackagewiseReport_2: UIButton!
    //Packing List Report Button
    @IBOutlet weak var btn_PackingListReport_1: UIButton!
    @IBOutlet weak var btn_PackingListReport_2: UIButton!
    @IBOutlet weak var btn_PackingListReport_3: UIButton!
    @IBOutlet weak var btn_PackingListReport_4: UIButton!
    //Show Pagination Number
    @IBOutlet weak var lbl_PackWiseNumber: UILabel!
    @IBOutlet weak var lbl_PackingListNum: UILabel!
    
    @IBOutlet weak var btn_Previous_PackagewiseReport: UIButton!
    @IBOutlet weak var btn_Next_PackagewiseReport: UIButton!
    @IBOutlet weak var lbl_ShowPage_Count_PackagewiseReport: UILabel!
    @IBOutlet weak var lbl_PageNum_PackagewiseReport: UILabel!
    
    
    @IBOutlet weak var btn_Previous_PackingListReport: UIButton!
    @IBOutlet weak var btn_Next_PackingListReport: UIButton!
    @IBOutlet weak var lbl_ShowPage_Count_PackingListReport: UILabel!
    @IBOutlet weak var lbl_PageNum_PackingListReport: UILabel!
    //MARK:- Variable
    var pageName = String()
    var Arr_PackagWiseReport = [packageWiseReportModel]()
    var Arr_PackingListReport = [PackingListReportModel]()
    var param : NSDictionary = NSDictionary()
    public var docViewController = QLPreviewController()
    public var arrDocuments = [NSURL]()
    var PageCount = 1
    //MARK:- LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.Initialization()
    }
    func Initialization(){
        barbuttonheader()
        self.arrDocuments = []
        self.docViewController = QLPreviewController()
        self.docViewController.dataSource = self
        self.docViewController.reloadData()
        if pageName == "Packagewise Report" {
            title = "Packagewise Report"
            ReportAPI.shareInstance.Get_ReportList(ViewController: self, Api_Str: Api_Urls.GET_API_PackagWiseReport, params: (param.count == 0) ? ["project_id":"1"] : param as! [String : Any], tag: 4)
            tbl_PackagewiseReport.isHidden = false
            tbl_PackagewiseReport_1.isHidden = true
            tbl_PackingListReport.isHidden = true
            tbl_PackingListReport_1.isHidden = true
            tbl_PackingListReport_2.isHidden = true
            tbl_PackingListReport_3.isHidden = true
            view_PackingListReport.isHidden = true
            btn_Next_PackagewiseReport.addTarget(self, action: #selector(btn_Next_PackagewiseReport(_:)), for: .touchUpInside)
            btn_Previous_PackagewiseReport.addTarget(self, action: #selector(btn_Previous_PackagewiseReport(_:)), for: .touchUpInside)
            
            
        } else if pageName == "Packing List Report"{
            title = "Packing List Report"
            ReportAPI.shareInstance.Get_ReportList(ViewController: self, Api_Str: Api_Urls.GET_API_PackingListReport, params: (param.count == 0) ? ["project_id":"1"] : param as! [String : Any], tag: 5)
            tbl_PackagewiseReport.isHidden = true
            tbl_PackagewiseReport_1.isHidden = true
            tbl_PackingListReport.isHidden = false
            tbl_PackingListReport_1.isHidden = true
            tbl_PackingListReport_2.isHidden = true
            tbl_PackingListReport_3.isHidden = true
            view_PackagewiseReport.isHidden = true
            btn_Next_PackingListReport.addTarget(self, action: #selector(btn_Next_PackingListReport(_:)), for: .touchUpInside)
            btn_Previous_PackagewiseReport.addTarget(self, action: #selector(btn_Previous_PackingListReport(_:)), for: .touchUpInside)
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
    @objc func barbtn_Mail(_ sender: UIBarButtonItem) {
        self.SentMail(report_type: "mail",Param: param)
    }
    @objc func barbtn_PDF(_ sender: UIBarButtonItem) {
        self.SentMail(report_type: "pdf",Param: param)
    }
    @objc func barbtn_excel(_ sender: UIBarButtonItem) {
        self.SentMail(report_type: "excel",Param: param)
        
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
        case "Packagewise Report":
            let CallApi = (report_type != "mail") ? ReportAPI.shareInstance.Get_DownloadDocument(ViewController: self, Api_Str: Api_Urls.GET_API_PackagWiseReport, params: param as! Parameters, tag: 4, report_Type: (report_type != "excel") ? "pdf" : "xlsx") : ReportAPI.shareInstance.Get_ReportList(ViewController: self, Api_Str: Api_Urls.GET_API_PackagWiseReport, params: param as! Parameters, tag: 4)
            print(CallApi)
        case "Packing List Report" :
            let CallApi = (report_type != "mail") ? ReportAPI.shareInstance.Get_DownloadDocument(ViewController: self, Api_Str: Api_Urls.GET_API_PackingListReport, params: param as! Parameters, tag: 4, report_Type: (report_type != "excel") ? "pdf" : "xlsx") : ReportAPI.shareInstance.Get_ReportList(ViewController: self, Api_Str: Api_Urls.GET_API_PackingListReport, params:param as! Parameters , tag: 5)
        default:
            print(pageName)
        }
    }
//    func Get_DownloadDocument(ViewController: UIViewController,Api_Str : String,params : Parameters,tag : Int,report_Type : String) {
//        if AppDelegate.NetworkRechability(){
//            Utils.ShowActivityIndicator(message: "Loading")
//            AFWrapper.request_ResponseDat(Api_Str, headers: ["Authorization": DEFAULTS.Get_TOKEN()], params: params, success: { (responseObject, statusCode, JSONObject) in
//                print(responseObject)
//                if statusCode == 200 {
//                    if tag == 4 || tag == 5 {
//                         NSTemporaryDirectory()
//                      let DataFile = try! responseObject.write(to: URL(fileURLWithPath: NSTemporaryDirectory() + "\((Date().string(with: "dd/mm/yyyy hh:mm:ss").replacingOccurrences(of: "/", with: "_").replacingOccurrences(of: " ", with: "_"))).\(report_Type)"), options: .atomicWrite)
//                      let tmpURL = FileManager.default.temporaryDirectory.appendingPathComponent("\((Date().string(with: "dd/mm/yyyy hh:mm:ss").replacingOccurrences(of: "/", with: "_").replacingOccurrences(of: " ", with: "_"))).\(report_Type)")
//                        print(tmpURL)
//                        self.arrDocuments = [tmpURL as! NSURL]
//                        self.docViewController.reloadData()
//                        self.present(self.docViewController, animated: true, completion: nil)
//                    }
//                }else {
//                    Utils.showToastWithMessageAtCenter(message: "Json Failed")
//                }
//                SKActivityIndicator.dismiss()
//            })
//            { (error, statusCode) in
//                SKActivityIndicator.dismiss()
//                print(error.localizedDescription)
//            }
//        }else {
//            //            Utils.showToastWithMessageAtCenter(message: "Strings.kNoInternetMessage")
//        }
//    }
    @IBAction func btn_DetailFigureReportNum(_ sender: UIButton) {
        if sender.tag == 1 {
            tbl_PackagewiseReport.isHidden = false
            tbl_PackagewiseReport_1.isHidden = true
            self.tbl_PackagewiseReport.reloadData()
        } else if sender.tag == 2{
            tbl_PackagewiseReport.isHidden = true
            tbl_PackagewiseReport_1.isHidden =  false
            self.tbl_PackagewiseReport_1.reloadData()
        }
    }
    @IBAction func btn_MarkwiseReportNum(_ sender: UIButton) {
        if sender.tag == 3 {
            tbl_PackingListReport.isHidden = false
            tbl_PackingListReport_1.isHidden = true
            tbl_PackingListReport_2.isHidden = true
            tbl_PackingListReport_3.isHidden = true
            self.tbl_PackingListReport.reloadData()
        } else if sender.tag == 4 {
            tbl_PackingListReport.isHidden = true
            tbl_PackingListReport_1.isHidden = false
            tbl_PackingListReport_2.isHidden = true
            tbl_PackingListReport_3.isHidden = true
            self.tbl_PackingListReport_1.reloadData()
        } else  if sender.tag == 5 {
            tbl_PackingListReport.isHidden = true
            tbl_PackingListReport_1.isHidden = true
            tbl_PackingListReport_2.isHidden = false
            tbl_PackingListReport_3.isHidden = true
            self.tbl_PackingListReport_2.reloadData()
        } else {
            tbl_PackingListReport.isHidden = true
            tbl_PackingListReport_1.isHidden = true
            tbl_PackingListReport_2.isHidden = true
            tbl_PackingListReport_3.isHidden = false
            self.tbl_PackingListReport_3.reloadData()
        }
    }
    
    //MARK:- Button next previous Click
    @objc func btn_Next_PackagewiseReport(_ sender: UIButton) {
        if Arr_PackagWiseReport[0].next != nil {
            ReportAPI.shareInstance.Get_ReportList(ViewController: self, Api_Str: Arr_PackagWiseReport[0].next!, params: [:],tag: 4)
            self.PageCount = PageCount + 1
            self.lbl_PageNum_PackagewiseReport.text = String(describing: PageCount)
        }else {
            Utils.showToastWithMessageAtCenter(message: "Next Data not Available")
        }
    }
    @objc func btn_Previous_PackagewiseReport(_ sender: UIButton) {
        if Arr_PackagWiseReport[0].next != nil {
            ReportAPI.shareInstance.Get_ReportList(ViewController: self, Api_Str: Arr_PackagWiseReport[0].next!, params: [:],tag: 4)
            self.PageCount = PageCount - 1
            self.lbl_PageNum_PackagewiseReport.text = String(describing: PageCount)
        }else {
            Utils.showToastWithMessageAtCenter(message: "Next Data not Available")
        }
    }
    @objc func btn_Next_PackingListReport(_ sender: UIButton) {
        if Arr_PackingListReport[0].next != nil {
            ReportAPI.shareInstance.Get_ReportList(ViewController: self, Api_Str: Arr_PackingListReport[0].next!, params: [:],tag: 5)
            self.PageCount = PageCount + 1
            self.lbl_PageNum_PackingListReport.text = String(describing: PageCount)
        }else {
            Utils.showToastWithMessageAtCenter(message: "Next Data not Available")
        }
    }
    @objc func btn_Previous_PackingListReport(_ sender: UIButton) {
        if Arr_PackingListReport[0].next != nil {
            ReportAPI.shareInstance.Get_ReportList(ViewController: self, Api_Str: Arr_PackingListReport[0].next!, params: [:],tag: 5)
            self.PageCount = PageCount - 1
            self.lbl_PageNum_PackingListReport.text = String(describing: PageCount)
        }else {
            Utils.showToastWithMessageAtCenter(message: "Next Data not Available")
        }
    }
}
extension ReportVC1 : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }else {
            if tableView == tbl_PackagewiseReport {
                return (Arr_PackagWiseReport.count == 0) ? Arr_PackagWiseReport.count : Arr_PackagWiseReport[0].results!.count
            } else if tableView == tbl_PackagewiseReport_1 {
                return (Arr_PackagWiseReport.count == 0) ? Arr_PackagWiseReport.count : Arr_PackagWiseReport[0].results!.count
            } else if tableView == tbl_PackingListReport {
                return (Arr_PackingListReport.count == 0) ? Arr_PackingListReport.count : Arr_PackingListReport[0].results!.count
            } else if tableView == tbl_PackingListReport_1 {
                return (Arr_PackingListReport.count == 0) ? Arr_PackingListReport.count : Arr_PackingListReport[0].results!.count
            } else if tableView == tbl_PackingListReport_2 {
                return (Arr_PackingListReport.count == 0) ? Arr_PackingListReport.count : Arr_PackingListReport[0].results!.count
            } else {
                return (Arr_PackingListReport.count == 0) ? Arr_PackingListReport.count : Arr_PackingListReport[0].results!.count
            }
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == tbl_PackagewiseReport {
            if indexPath.section == 0 {
                let cell : PackagewiseReportHeaderCell = tableView.dequeueReusableCell(withIdentifier: "PackagewiseReportHeaderCell") as! PackagewiseReportHeaderCell
                return cell
            } else {
                let cell : PackagewiseReportCell = tableView.dequeueReusableCell(withIdentifier: "PackagewiseReportCell") as! PackagewiseReportCell
                cell.DisplayCell(Arr_Data: Arr_PackagWiseReport, indexpath: indexPath)
                return cell
            }
        } else if tableView == tbl_PackagewiseReport_1 {
            if indexPath.section == 0 {
                let cell : PackagewiseReportHeaderCell1 = tableView.dequeueReusableCell(withIdentifier: "PackagewiseReportHeaderCell1") as! PackagewiseReportHeaderCell1
                return cell
            } else {
                let cell : PackagewiseReportCell1 = tableView.dequeueReusableCell(withIdentifier: "PackagewiseReportCell1") as! PackagewiseReportCell1
                cell.DisplayCell(Arr_Data: Arr_PackagWiseReport, indexpath: indexPath)
                return cell
            }
        } else if tableView == tbl_PackingListReport {
            if indexPath.section == 0 {
                let cell : PackingListReportHeadercell = tableView.dequeueReusableCell(withIdentifier: "PackingListReportHeadercell") as! PackingListReportHeadercell
                return cell
            } else {
                let cell : PackingListReportcell = tableView.dequeueReusableCell(withIdentifier: "PackingListReportcell") as! PackingListReportcell
                cell.DisplayCell(Arr_Data: Arr_PackingListReport, indexpath: indexPath)
                return cell
            }
        } else if tableView == tbl_PackingListReport_1 {
            if indexPath.section == 0 {
                let cell : PackingListReportHeadercell1 = tableView.dequeueReusableCell(withIdentifier: "PackingListReportHeadercell1") as! PackingListReportHeadercell1
                return cell
            } else {
                let cell : PackingListReportcell1 = tableView.dequeueReusableCell(withIdentifier: "PackingListReportcell1") as! PackingListReportcell1
                cell.DisplayCell(Arr_Data: Arr_PackingListReport, indexpath: indexPath)
                return cell
            }
        } else if tableView == tbl_PackingListReport_2 {
            if indexPath.section == 0 {
                let cell : PackingListReportHeadercell2 = tableView.dequeueReusableCell(withIdentifier: "PackingListReportHeadercell2") as! PackingListReportHeadercell2
                return cell
            } else {
                let cell : PackingListReportcell2 = tableView.dequeueReusableCell(withIdentifier: "PackingListReportcell2") as! PackingListReportcell2
                cell.DisplayCell(Arr_Data: Arr_PackingListReport, indexpath: indexPath)
                return cell
            }
        } else {
            if indexPath.section == 0 {
                let cell : PackingListReportHeadercell3 = tableView.dequeueReusableCell(withIdentifier: "PackingListReportHeadercell3") as! PackingListReportHeadercell3
                return cell
            } else {
                let cell : PackingListReportcell3 = tableView.dequeueReusableCell(withIdentifier: "PackingListReportcell3") as! PackingListReportcell3
                cell.DisplayCell(Arr_Data: Arr_PackingListReport, indexpath: indexPath)
                return cell
            }
        }
    }
}
extension ReportVC1 : QLPreviewControllerDataSource {
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
