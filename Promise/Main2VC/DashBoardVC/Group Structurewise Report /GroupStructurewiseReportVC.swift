//
//  GroupStructurewiseReportVC.swift
//  Promise
//
//  Created by macbook on 10/08/1942 Saka.
//  Copyright © 1942 Captain. All rights reserved.
//

import UIKit
import QuickLook
import Alamofire
class GroupStructurewiseReportVC: UIViewController {
    //Mark:- IBOutlet
    @IBOutlet weak var tbl_GroupStructurewiseReport: UITableView!
    @IBOutlet weak var btn_Previous: UIButton!
    @IBOutlet weak var btn_Next: UIButton!
    @IBOutlet weak var lblShowPagination: UILabel!
    @IBOutlet weak var lblPageCount: UILabel!
    //Mark:- Variable
    public var docViewController = QLPreviewController()
    public var arrDocuments = [NSURL]()
    var pageName = String()
    var startIndex: Int = 0
    var PageNumber : Int = 1
    var Arr_GroupSReport = [GroupStrucherWiseReportModel]()
    var param : NSDictionary = NSDictionary()
    //Mark:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.Initialization()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.DFilter, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.set_FilterData(_:)), name: NSNotification.Name.DFilter, object: nil)
        self.title = "Group Structurewise Report"
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationItem.title = ""
    }
    func Initialization() {
        self.BarButton()
        self.arrDocuments = []
        self.docViewController = QLPreviewController()
        self.docViewController.dataSource = self
        self.docViewController.reloadData()
        self.tbl_GroupStructurewiseReport.register(UINib(nibName: "GroupStructurewiseReportCell", bundle: nil), forCellReuseIdentifier: "GroupStructurewiseReportCell")
        self.tbl_GroupStructurewiseReport.register(UINib(nibName: "GroupStructurewiseReportRowCell", bundle: nil), forCellReuseIdentifier: "GroupStructurewiseReportRowCell")
        self.btn_Next.addTarget(self, action: #selector(btnNextClick(_:)), for: .touchUpInside)
        self.btn_Previous.addTarget(self, action: #selector(btnPreviousClick(_:)), for: .touchUpInside)
        ReportAPI.shareInstance.Get_ReportList(ViewController: self, Api_Str: Api_Urls.GET_API_GroupStrucherWiseReport, params: (param.count == 0) ? ["project_id":"1"] : param as! [String : Any] , tag: 9)
    }
    @objc func btnNextClick(_ sender: UIButton) {
        if Arr_GroupSReport[0].next != nil {
            ReportAPI.shareInstance.Get_ReportList(ViewController: self, Api_Str: Arr_GroupSReport[0].next!, params: [:],tag: 9)
            self.PageNumber = PageNumber + 1
            self.startIndex = startIndex + 50
            self.lblPageCount.text = String(describing: PageNumber)
        }else {
            Utils.showToastWithMessageAtCenter(message: Strings.kNoMoreData)
        }
    }
    @objc func btnPreviousClick(_ sender: UIButton) {
        if Arr_GroupSReport[0].previous != nil {
            ReportAPI.shareInstance.Get_ReportList(ViewController: self, Api_Str: Arr_GroupSReport[0].previous!, params: [:],tag: 9)
            self.PageNumber = PageNumber - 1
            self.startIndex = startIndex - 50
            self.lblPageCount.text = String(describing: PageNumber)
//            self.lblShowPagination.text = "Showing \(self.startIndex) to \(((self.startIndex - 50) > self.Arr_GroupSReport[0].groupresults!.count) ? self.Arr_GroupSReport[0].groupresults!.count : (self.startIndex - 50)) of \(self.Arr_GroupSReport[0].groupresults!.count) results"
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
        self.SentMail(report_type: "mail" , Param: param)
    }
    @objc func barbtn_PDF(_ sender: UIBarButtonItem) {
        self.SentMail(report_type: "pdf" , Param: param)
    }
    @objc func barbtn_excel(_ sender: UIBarButtonItem) {
        self.SentMail(report_type: "excel" , Param: param)
    }
    func SentMail(report_type : String,Param : NSDictionary) {
        if param.count == 0 {
            param = ["project_id":"1","report_type" : report_type]
        }else {
            let tempDic : NSMutableDictionary = NSMutableDictionary(dictionary: param)
            tempDic.setValue(report_type, forKey: "report_type")
            param = tempDic
        }
        let CallApi = (report_type != "mail") ? ReportAPI.shareInstance.Get_DownloadDocument(ViewController: self, Api_Str: Api_Urls.GET_API_GroupStrucherWiseReport, params: param as! Parameters, tag: 9, report_Type: (report_type != "excel") ? "pdf" : "xlsx") : ReportAPI.shareInstance.Get_ReportList(ViewController: self, Api_Str: Api_Urls.GET_API_GroupStrucherWiseReport, params: param as! Parameters, tag: 9)
    }
}
//MARK:- TableView Methode
extension GroupStructurewiseReportVC : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return (Arr_GroupSReport.count == 0) ? Arr_GroupSReport.count : Arr_GroupSReport[0].groupresults!.count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell : GroupStructurewiseReportCell = tableView.dequeueReusableCell(withIdentifier: "GroupStructurewiseReportCell") as! GroupStructurewiseReportCell
            return cell
        } else {
            let cell : GroupStructurewiseReportRowCell = tableView.dequeueReusableCell(withIdentifier: "GroupStructurewiseReportRowCell") as! GroupStructurewiseReportRowCell
            cell.DisplayCell(Arr_Data: Arr_GroupSReport, indexpath: indexPath)
            return cell
        }
    }
}
extension GroupStructurewiseReportVC : QLPreviewControllerDataSource {
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
