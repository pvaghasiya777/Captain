//
//  R_MarkwiseReportVC.swift
//  Promise
//
//  Created by macbook on 08/08/1942 Saka.
//  Copyright © 1942 Captain. All rights reserved.
//

import UIKit
import Alamofire
import QuickLook
class R_MarkwiseReportVC: UIViewController {
    //MARK:- IBOutlet
    @IBOutlet weak var tbl_MarkwiseReport: UITableView!
    @IBOutlet weak var btn_Previous_MarkwiseReport: UIButton!
    @IBOutlet weak var btn_Next_MarkwiseReport: UIButton!
    @IBOutlet weak var lbl_ShowPage_Count_MarkwiseReport: UILabel!
    @IBOutlet weak var lbl_PageNum_MarkwiseReport: UILabel!
    //MARK:- variable
    var startIndex: Int = 0
    var PageNumber : Int = 1
    var pageName = String()
    var Arr_MarkWiseReport : NSMutableArray = NSMutableArray()
    var Str_markWiseReportNext = ""
    var Str_markWiseReportPrevious = ""
    var param : NSDictionary = NSDictionary()
    var PageCount = 1
    public var docViewController = QLPreviewController()
    public var arrDocuments = [NSURL]()
    //MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.Initialization()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.DFilter, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.set_FilterData(_:)), name: NSNotification.Name.DFilter, object: nil)
        self.title = "Markwise Report"
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationItem.title = ""
    }
    @objc func set_FilterData(_ FilterParam: NSNotification) {
        self.param = FilterParam.value(forKey: "userInfo") as! NSDictionary
        self.Initialization()
    }
    func Initialization() {
        self.arrDocuments = []
        self.docViewController = QLPreviewController()
        self.docViewController.dataSource = self
        self.docViewController.reloadData()
        self.BarButton()
        self.tbl_MarkwiseReport.register(UINib(nibName: "MarkwiseReportRowCell", bundle: nil), forCellReuseIdentifier: "MarkwiseReportRowCell")
        self.tbl_MarkwiseReport.register(UINib(nibName: "MarkwiseReportCell", bundle: nil), forCellReuseIdentifier: "MarkwiseReportCell")
        ReportAPI.shareInstance.Get_ReportList(ViewController: self, Api_Str: Api_Urls.GET_API_MarkWiseReport, params: (param.count == 0) ? ["project_id":"1"] : param as! [String : Any] , tag: 2)
        btn_Next_MarkwiseReport.addTarget(self, action: #selector(btn_NextMarkwiseReport), for: .touchUpInside)
        btn_Previous_MarkwiseReport.addTarget(self, action: #selector(btn_PreviousMarkwiseReport(_:)), for: .touchUpInside)
    }
    func BarButton() {
        let RightFilter : UIBarButtonItem = UIBarButtonItem(image: ImageNames.kFilter,style: .plain, target: self, action: #selector(barbtn_Filter(_:)))
        let rightButtonPDF: UIBarButtonItem = UIBarButtonItem(image: UIImage(named: "ic_pdf"),  style: .plain, target: self, action: #selector(barbtn_PDF(_:)))
        let rightButtonExcel: UIBarButtonItem = UIBarButtonItem(image: UIImage(named: "ic_excel"),  style: .plain, target: self, action: #selector(barbtn_excel(_:)))
        let rightButtonMail: UIBarButtonItem = UIBarButtonItem(image: UIImage(named: "ic_message"),  style: .plain, target: self, action: #selector(barbtn_Mail(_:)))
        RightFilter.tintColor = App_Colors.ThemBlue
        rightButtonMail.tintColor = App_Colors.ThemBlue
        rightButtonPDF.tintColor = App_Colors.ThemBlue
        rightButtonExcel.tintColor = App_Colors.ThemBlue
        self.navigationItem.rightBarButtonItems  = [rightButtonMail,rightButtonPDF,rightButtonExcel,RightFilter]
    }
    @objc func barbtn_Filter(_ sender: UIBarButtonItem) {
        let DFilters_VC = Config.StoryBoard.instantiateViewController(withIdentifier: "ReportsFiltersVC") as! ReportsFiltersVC
        DFilters_VC.StrNavigate = "DFilter"
        self.navigationController?.pushViewController(DFilters_VC, animated: true)
    }
    @objc func barbtn_Mail(_ sender: UIBarButtonItem) {
        self.SentMail(report_type: "mail")
    }
    @objc func barbtn_PDF(_ sender: UIBarButtonItem) {
        self.SentMail(report_type: "pdf")
    }
    @objc func barbtn_excel(_ sender: UIBarButtonItem) {
        self.SentMail(report_type: "excel")
    }
    func SentMail(report_type : String) {
        if param.count == 0 {
            param = ["project_id":"1","report_type" : report_type]
        }else {
            let tempDic : NSMutableDictionary = NSMutableDictionary(dictionary: param)
            tempDic.setValue(report_type, forKey: "report_type")
            param = tempDic
        }
        let CallApi = (report_type != "mail") ? ReportAPI.shareInstance.Get_DownloadDocument(ViewController: self, Api_Str: Api_Urls.GET_API_MarkWiseReport, params: param as! Parameters, tag: 2, report_Type: (report_type != "excel") ? "pdf" : "xlsx") : ReportAPI.shareInstance.Get_ReportList(ViewController: self, Api_Str: Api_Urls.GET_API_MarkWiseReport, params: param as! Parameters, tag: 2)
    }
    //Markwise Report
    @objc func btn_NextMarkwiseReport(_ sender: UIButton) {
        if Str_markWiseReportNext != "" {
            ReportAPI.shareInstance.Get_ReportList(ViewController: self, Api_Str: Str_markWiseReportNext, params: [:], tag: 2)
            self.PageNumber = PageNumber + 1
            self.startIndex = startIndex + 50
            self.lbl_ShowPage_Count_MarkwiseReport.text = String(describing: PageNumber)
        }else {
            Utils.showToastWithMessageAtCenter(message: Strings.kNoMoreData)
        }
    }
    //Markwise Report
    @objc func btn_PreviousMarkwiseReport(_ sender: UIButton) {
        if Str_markWiseReportPrevious != "" {
            ReportAPI.shareInstance.Get_ReportList(ViewController: self, Api_Str: Str_markWiseReportPrevious, params: [:], tag: 2)
            self.PageNumber = PageNumber - 1
            self.startIndex = startIndex - 50
            self.lbl_ShowPage_Count_MarkwiseReport.text = String(describing: PageNumber)
        }else {
            Utils.showToastWithMessageAtCenter(message: Strings.kNoMoreData)
        }
    }
}
//MARK:- TableView Methode
extension R_MarkwiseReportVC : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return Arr_MarkWiseReport.count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell : MarkwiseReportCell = tableView.dequeueReusableCell(withIdentifier: "MarkwiseReportCell") as! MarkwiseReportCell
            return cell
        } else {
            let cell : MarkwiseReportRowCell = tableView.dequeueReusableCell(withIdentifier: "MarkwiseReportRowCell") as! MarkwiseReportRowCell
            cell.DisplayCell(Arr_Data: Arr_MarkWiseReport, indexpath: indexPath)
            return cell
        }
    }
}
extension R_MarkwiseReportVC : QLPreviewControllerDataSource {
    func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
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
