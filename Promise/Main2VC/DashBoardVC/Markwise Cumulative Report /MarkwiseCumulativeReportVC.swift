//
//  MarkwiseCumulativeReportVC.swift
//  Promise
//
//  Created by macbook on 09/08/1942 Saka.
//  Copyright © 1942 Captain. All rights reserved.
//

import UIKit
import QuickLook
import Alamofire
class MarkwiseCumulativeReportVC: UIViewController {
    //MARK:- IBOutlet
    @IBOutlet weak var tbl_MarkwiseCumulativeReport: UITableView!
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var btnPrevious: UIButton!
    @IBOutlet weak var lblShowPagination: UILabel!
    @IBOutlet weak var lblPageCount: UILabel!
    //MARK:- Variable
    var pageName = String()
    var Arr_MarkWiseCumulativeReport = [MarkWiseCumulativeReportModel]()
    var param : NSDictionary = NSDictionary()
    var startIndex: Int = 0
    var PageNumber : Int = 1
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
        self.title = "Markwise Cumulative Report"
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationItem.title = ""
    }
    func Initialization() {
        self.tbl_MarkwiseCumulativeReport.register(UINib(nibName: "MarkwiseCumulativeReportCell", bundle: nil), forCellReuseIdentifier: "MarkwiseCumulativeReportCell")
        self.tbl_MarkwiseCumulativeReport.register(UINib(nibName: "MarkwiseCumulativeReportRowCell", bundle: nil), forCellReuseIdentifier: "MarkwiseCumulativeReportRowCell")
        self.arrDocuments = []
        self.docViewController = QLPreviewController()
        self.docViewController.dataSource = self
        self.docViewController.reloadData()
        self.BarButton()
        self.btnNext.addTarget(self, action: #selector(btnNextClick), for: .touchUpInside)
        self.btnPrevious.addTarget(self, action: #selector(btnPreviousClick), for: .touchUpInside)
        ReportAPI.shareInstance.Get_ReportList(ViewController: self, Api_Str: Api_Urls.GET_API_MarkCummReport, params: (param.count == 0) ? ["project_id":"1"] : param as! [String : Any] , tag: 3)
    }
    @objc func btnNextClick(_ sender: UIButton) {
        if Arr_MarkWiseCumulativeReport[0].next != nil {
            ReportAPI.shareInstance.Get_ReportList(ViewController: self, Api_Str: Arr_MarkWiseCumulativeReport[0].next!, params: [:], tag: 3)
            self.PageNumber = PageNumber + 1
            self.startIndex = startIndex + 50
            self.lblPageCount.text = String(describing: PageNumber)
        }else {
            Utils.showToastWithMessageAtCenter(message: Strings.kNoMoreData)
        }
    }
    @objc func btnPreviousClick(_ sender: UIButton) {
        if Arr_MarkWiseCumulativeReport[0].previous != nil {
            ReportAPI.shareInstance.Get_ReportList(ViewController: self, Api_Str: Arr_MarkWiseCumulativeReport[0].previous!, params: [:], tag: 3)
            self.PageNumber = PageNumber - 1
            self.startIndex = startIndex - 50
            self.lblPageCount.text = String(describing: PageNumber)
        }else {
            Utils.showToastWithMessageAtCenter(message: Strings.kNoMoreData)
        }
    }
    @objc func set_FilterData(_ FilterParam: NSNotification) {
        self.param = FilterParam.value(forKey: "userInfo") as! NSDictionary
        self.Initialization()
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
        let CallApi = (report_type != "mail") ? ReportAPI.shareInstance.Get_DownloadDocument(ViewController: self, Api_Str: Api_Urls.GET_API_MarkCummReport, params: param as! Parameters, tag: 3, report_Type: (report_type != "excel") ? "pdf" : "xlsx") : ReportAPI.shareInstance.Get_ReportList(ViewController: self, Api_Str: Api_Urls.GET_API_MarkCummReport, params: param as! Parameters, tag: 3)
    }
}
//MARK:- TableView Methode
extension MarkwiseCumulativeReportVC : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return (self.Arr_MarkWiseCumulativeReport.count == 0) ? self.Arr_MarkWiseCumulativeReport.count : self.Arr_MarkWiseCumulativeReport[0].results!.count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell : MarkwiseCumulativeReportCell = tableView.dequeueReusableCell(withIdentifier: "MarkwiseCumulativeReportCell") as! MarkwiseCumulativeReportCell
            return cell
        } else {
            let cell : MarkwiseCumulativeReportRowCell = tableView.dequeueReusableCell(withIdentifier: "MarkwiseCumulativeReportRowCell") as! MarkwiseCumulativeReportRowCell
            cell.DisplayCell(Arr_Data: Arr_MarkWiseCumulativeReport, indexpath: indexPath)
            return cell
        }
    }
}
extension MarkwiseCumulativeReportVC : QLPreviewControllerDataSource {
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
