//
//  PackingListReport_VC.swift
//  Promise
//
//  Created by macbook on 10/08/1942 Saka.
//  Copyright © 1942 Captain. All rights reserved.
//

import UIKit
import QuickLook
import Alamofire
class PackingListReport_VC: UIViewController {
    //MARK:- IBOutlet
    @IBOutlet weak var tbl_PackingListReport: UITableView!
    @IBOutlet weak var btn_Previous: UIButton!
    @IBOutlet weak var btn_Next: UIButton!
    @IBOutlet weak var lblShowPagination: UILabel!
    @IBOutlet weak var lblPageCount: UILabel!
    //MARK:- Variable
    var pageName = String()
    var arrPackingListReport = [PackingListReportModel]()
    var param : NSDictionary = NSDictionary()
    public var docViewController = QLPreviewController()
    public var arrDocuments = [NSURL]()
    var startIndex: Int = 0
    var PageNumber : Int = 1
    //MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        Initialization()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.DFilter, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.set_FilterData(_:)), name: NSNotification.Name.DFilter, object: nil)
        self.title = "Packing List Report"
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
        self.BarButton()
        self.arrDocuments = []
        self.docViewController = QLPreviewController()
        self.docViewController.dataSource = self
        self.docViewController.reloadData()
        self.tbl_PackingListReport.register(UINib(nibName: "PackingListReportCell", bundle: nil), forCellReuseIdentifier: "PackingListReportCell")
        self.tbl_PackingListReport.register(UINib(nibName: "PackingListReportRowCell", bundle: nil), forCellReuseIdentifier: "PackingListReportRowCell")
        self.btn_Next.addTarget(self, action: #selector(btn_Next_PackingListReport(_:)), for: .touchUpInside)
        self.btn_Previous.addTarget(self, action: #selector(btn_Previous_PackingListReport(_:)), for: .touchUpInside)
        ReportAPI.shareInstance.Get_ReportList(ViewController: self, Api_Str: Api_Urls.GET_API_PackingListReport, params: (param.count == 0) ? ["project_id":"1"] : param as! [String : Any], tag: 5)
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
        let CallApi = (report_type != "mail") ? ReportAPI.shareInstance.Get_DownloadDocument(ViewController: self, Api_Str: Api_Urls.GET_API_PackingListReport, params: param as! Parameters, tag: 5, report_Type: (report_type != "excel") ? "pdf" : "xlsx") : ReportAPI.shareInstance.Get_ReportList(ViewController: self, Api_Str: Api_Urls.GET_API_PackingListReport, params:param as! Parameters , tag: 5)
    }
    @objc func btn_Next_PackingListReport(_ sender: UIButton) {
        if arrPackingListReport[0].next != nil {
            ReportAPI.shareInstance.Get_ReportList(ViewController: self, Api_Str: arrPackingListReport[0].next!, params: [:],tag: 5)
            self.PageNumber = PageNumber + 1
            self.startIndex = startIndex + 50
            self.lblPageCount.text = String(describing: PageNumber)
        }else {
            Utils.showToastWithMessageAtCenter(message: Strings.kNoMoreData)
        }
    }
    @objc func btn_Previous_PackingListReport(_ sender: UIButton) {
        if arrPackingListReport[0].previous != nil {
            ReportAPI.shareInstance.Get_ReportList(ViewController: self, Api_Str: arrPackingListReport[0].previous!, params: [:],tag: 5)
            self.PageNumber = PageNumber - 1
            self.startIndex = startIndex - 50
            self.lblPageCount.text = String(describing: PageNumber)
        }else {
            Utils.showToastWithMessageAtCenter(message: Strings.kNoMoreData)
        }
    }
}
//MARK:- TableView Methode
extension PackingListReport_VC : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return (arrPackingListReport.count == 0) ? arrPackingListReport.count : arrPackingListReport[0].results!.count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell : PackingListReportCell = tableView.dequeueReusableCell(withIdentifier: "PackingListReportCell") as! PackingListReportCell
            return cell
        } else {
            let cell : PackingListReportRowCell = tableView.dequeueReusableCell(withIdentifier: "PackingListReportRowCell") as! PackingListReportRowCell
            cell.DisplayCell(Arr_Data: arrPackingListReport, indexpath: indexPath)
            return cell
        }
    }
}
extension PackingListReport_VC : QLPreviewControllerDataSource {
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
