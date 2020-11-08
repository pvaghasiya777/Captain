import UIKit
import SwiftDataTables
import Alamofire
import QuickLook
import KRProgressHUD
class DReportVC: UIViewController {
    //MARK:- IBOutlet
    @IBOutlet weak var viewDataTable: UIView!
    @IBOutlet weak var btnPrevious: UIButton!
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var lblShowPagination: UILabel!
    @IBOutlet weak var lblPageCount: UILabel!
    //MARK:- variable
    var strNext = ""
    var strPrevious = ""
    var strTotalCount = ""
    var startIndex: Int = 0
    var PageNumber : Int = 1
    lazy var dataTable = makeDataTable()
    var dataSource: DataTableContent = []
    var arrFinalData : NSMutableArray = NSMutableArray()
    var arrJSONData : NSMutableArray = NSMutableArray()
    var pageName = String()
    //DetailFigure
    var arrDetailFigureStaticHeader : NSMutableArray = ["Serial ID","Structure MWP","Structure","Lot ","MBL Revision","Total Weight (kg)","Total Pieces","Released Weight (kg)","Released Pieces","Balance Pieces","Extra Pieces","Balance Weight (kg)","Progress Weight (%)","Progress Pieces (%)"]
    var arrDetailFigureKey : NSMutableArray = ["serial_no","group_structure_name","structure_id","lot","rev_no","total_weight","total_pieces","total_weight_released","total_pieces_released","balance_pieces","extra_pieces","balance_weight","progress_weight","progress_piece"]
    //MarkWise
    var arrMarkWiseStaticHeader : NSMutableArray = ["Structure MWP","Mark","Progressive Piece Number","Total Number of Pieces","Purchase Order","Structure","Description","MBL Revision","Ident Code","Weight (kg)","Ident Code","Weight (kg)","Ident Code","Weight (kg)","Heat / Cast Number","MTC Number","PL Number    ","PL Progressive Number","Net Weight (kg)","Package Gross Weight (kg)","Package Volume (cm)","Released Date","Shipped Date","Onsite Date"]
    var arrMarkWiseKey : NSMutableArray = ["group_structure_name","mark","progressive_piece_nr","quantity","purchase_id","structure_id","description","rev_no","mark_ident_code","mark_weight","paint_ident_code","painting_weight","fire_ident_code","fireproofing_weight","heat_no","mtc_no","pl_name","progressive","net_weight","master_gross_weight","master_total_volume","released_date","shipped_date","onsite_date"]
    //PackageWise
    var arrPackagewiseStaticHeader : NSMutableArray = ["Vendor  ","Purchase Order","Structure MWP","Packing List    ","Package/Progressive","Package Denominator","Vendor Package ID","Net Weight (kg)","Gross Weight (kg)","RN Date","Shipped Date","Onsite Date","MWP Release Status","MWP Shipped Status","MWP Onsite Status"]
    var arrPackagewiseKey : NSMutableArray = ["vendor_name","purchase_id","group_structure_name","pl_name","pl_package","master_package_count","vendor_package","master_net_weight","master_gross_weight","released_date","shipped_date","onsite_date","released_status","shipped_status","onsite_status"]
    //POPositionWise
    var arrPoPositionWiseStaticHeader : NSMutableArray = ["Vendor","Purchase Order","Short Description","PO Position","Ident Code","UOM","PO Quantity (kg)","PO Value(€)","MBL Quantity","PL Quantity","Released Quantity (kg)","Released Pieces","Released Value (€)","Progress Quantity [%]","Progress Value [%]"]
    var arrPoPositionWiseKey : NSMutableArray = ["vendor","po","short_des","po_position","ident_code","uom","po_qty","po_value","mbl_qty","pl_qty","released_qty","released_pieces","released_value","progress_qty","progress_value"]
    //IdentCodewise
    var arrIdentCodeWiseStaticHeader : NSMutableArray = ["Vendor  ","Purchase Order","Short Description","Ident Code","UOM  ","PO Quantity","PO Value (€)","MBL Quantiy","PL Quantity","Released Quantity","Released Pieces","Released Value (€)","Progress Quantity [%]","Progress Value [%]"]
    var arrIdentCodeWiseKey : NSMutableArray = ["vendor","po","short_des","ident_code","uom","po_qty","po_value","mbl_qty","pl_qty","released_qty","released_pieces","released_value","progress_qty","progress_value"]
    //Summary
    var arrSummaryStaticHeader : NSMutableArray = ["Vendor","Purchase Order","Ordered (by PO) [ton]","MBL Available [ton]","I.F by Vendor [ton]","Released [ton]","Shipped Weight [ton]","Onsite Weight [ton]","    To be Shipped [ton]","To be Released [ton]"]
    var arrSummaryKey : NSMutableArray = ["number","vendor","ordered","mbl_weight","if_by_vendor","released","shipped_weight","onsite_weight","to_be_shipped","to_be_released"]
    var param : NSDictionary = NSDictionary()
    public var docViewController = QLPreviewController()
    public var arrDocuments = [NSURL]()
    //MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.Initialisation()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.DFilter, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.set_FilterData(_:)), name: NSNotification.Name.DFilter, object: nil)
        self.title = pageName
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationItem.title = ""
    }
    //MARK:- Initialisation
    func Initialisation(){
        self.arrDocuments = []
        self.docViewController = QLPreviewController()
        self.docViewController.dataSource = self
        self.docViewController.reloadData()
        self.BarButton()
        self.setupViews()
        self.setupConstraints()
        self.btnNext.addTarget(self, action: #selector(btnNextClick(_:)), for: .touchUpInside)
        self.btnPrevious.addTarget(self, action: #selector(btnPreviousClick(_:)), for: .touchUpInside)
        switch pageName {
        case "Detail Figure Report":
            self.APICalling(API: Api_Urls.GET_API_DetailFigureReport, Param: (param.count == 0) ? ["project_id":"1"] : param as! [String : Any])
        case "Packagewise Report" :
            self.APICalling(API: Api_Urls.GET_API_PackagWiseReport, Param: (param.count == 0) ? ["project_id":"1"] : param as! [String : Any])
        case "PO Positionwise Report" :
            self.APICalling(API: Api_Urls.GET_API_POPositionReport, Param: (param.count == 0) ? ["project_id":"1"] : param as! [String : Any])
        case "Ident Codewise Report" :
            self.APICalling(API: Api_Urls.GET_API_IdentCodeWiseReport, Param: (param.count == 0) ? ["project_id":"1"] : param as! [String : Any])
        case "Summary Report" :
            self.APICalling(API: Api_Urls.GET_API_SummaryReport, Param: (param.count == 0) ? ["project_id":"1"] : param as! [String : Any])
        default:
            print(pageName)
        }
    }
    @objc func btnNextClick(_ sender: UIButton) {
        if strNext != "" {
            self.APICalling(API: strNext, Param: [:])
            self.PageNumber = PageNumber + 1
            self.startIndex = startIndex + 50
            self.lblPageCount.text = String(describing: PageNumber)
        }else {
            Utils.showToastWithMessageAtCenter(message: Strings.kNoMoreData)
        }
    }
    @objc func btnPreviousClick(_ sender: UIButton) {
        if strPrevious != "" {
            self.APICalling(API: strPrevious, Param: [:])
            self.PageNumber = PageNumber - 1
            self.startIndex = startIndex - 50
            self.lblPageCount.text = String(describing: PageNumber)
        }else {
            Utils.showToastWithMessageAtCenter(message: Strings.kNoMoreData)
        }
    }
    @objc func set_FilterData(_ FilterParam: NSNotification) {
        self.param = FilterParam.value(forKey: "userInfo") as! NSDictionary
        self.Initialisation()
    }
    func configurationWithoutFooter() -> DataTableConfiguration {
        var configuration = DataTableConfiguration()
        configuration.shouldShowFooter = false
        configuration.shouldShowSearchSection = false
        return configuration
    }
    func setupViews() {
        navigationController?.navigationBar.isTranslucent = false
        title = self.pageName
        view.backgroundColor = UIColor.white
        self.viewDataTable.addSubview(dataTable)
        dataTable.reload()
    }
    func setupConstraints() {
        NSLayoutConstraint.activate([
            dataTable.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            dataTable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            dataTable.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
            dataTable.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
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
        switch pageName {
        case "Detail Figure Report":
            let CallApi = (report_type != "mail") ? ReportAPI.shareInstance.GetDownloadDocument(ViewController: self, Api_Str: Api_Urls.GET_API_DetailFigureReport, params: param as! Parameters, tag: 1, report_Type: (report_type != "excel") ? "pdf" : "xlsx") : ReportAPI.shareInstance.SentMail(ViewController: self, Api_Str: Api_Urls.GET_API_DetailFigureReport, params: param as! Parameters, tag: 1)
        case "Packagewise Report" :
            let CallApi = (report_type != "mail") ? ReportAPI.shareInstance.GetDownloadDocument(ViewController: self, Api_Str: Api_Urls.GET_API_PackagWiseReport, params: param as! Parameters, tag: 4, report_Type: (report_type != "excel") ? "pdf" : "xlsx") : ReportAPI.shareInstance.SentMail(ViewController: self, Api_Str: Api_Urls.GET_API_PackagWiseReport, params: param as! Parameters, tag: 4)
        case "PO Positionwise Report" :
            let CallApi = (report_type != "mail") ? ReportAPI.shareInstance.GetDownloadDocument(ViewController: self, Api_Str: Api_Urls.GET_API_POPositionReport, params: param as! Parameters, tag: 6, report_Type: (report_type != "excel") ? "pdf" : "xlsx") : ReportAPI.shareInstance.SentMail(ViewController: self, Api_Str: Api_Urls.GET_API_POPositionReport, params: param as! Parameters, tag: 6)
        case "Ident Codewise Report" :
            let CallApi = (report_type != "mail") ? ReportAPI.shareInstance.GetDownloadDocument(ViewController: self, Api_Str: Api_Urls.GET_API_IdentCodeWiseReport, params: param as! Parameters, tag: 7, report_Type: (report_type != "excel") ? "pdf" : "xlsx") : ReportAPI.shareInstance.SentMail(ViewController: self, Api_Str: Api_Urls.GET_API_IdentCodeWiseReport, params: param as! Parameters, tag: 7)
        case "Summary Report" :
            let CallApi = (report_type != "mail") ? ReportAPI.shareInstance.GetDownloadDocument(ViewController: self, Api_Str: Api_Urls.GET_API_SummaryReport, params: param as! Parameters, tag: 10, report_Type: (report_type != "excel") ? "pdf" : "xlsx") : ReportAPI.shareInstance.SentMail(ViewController: self, Api_Str: Api_Urls.GET_API_SummaryReport, params: param as! Parameters, tag: 10)
        default:
            print(pageName)
        }
    }
    public func addDataSourceAfter(){
        self.arrFinalData.removeAllObjects()
        for i in 0..<arrJSONData.count {
            let allDic = (arrJSONData[i] as! NSDictionary)
            var singleArray : [DataTableValueType] = []
            switch pageName {
            case "Detail Figure Report":
                for key in self.arrDetailFigureKey {
                    singleArray.append(DataTableValueType.string(String(describing: allDic.value(forKey: key as! String)!)))
                }
            case "Packagewise Report" :
                for key in self.arrPackagewiseKey {
                    singleArray.append(DataTableValueType.string(String(describing: allDic.value(forKey: key as! String)!)))
                }
            case "PO Positionwise Report" :
                for key in self.arrPoPositionWiseKey {
                    singleArray.append(DataTableValueType.string(String(describing: allDic.value(forKey: key as! String)!)))
                }
            case "Ident Codewise Report" :
                for key in self.arrIdentCodeWiseKey {
                    singleArray.append(DataTableValueType.string(String(describing: allDic.value(forKey: key as! String)!)))
                }
            case "Summary Report" :
                for key in self.arrSummaryKey {
                    singleArray.append(DataTableValueType.string(String(describing: allDic.value(forKey: key as! String)!)))
                }
            default:
                print(pageName)
            }
            self.arrFinalData.add(singleArray)
        }
        self.dataSource = arrFinalData as! DataTableContent
        dataTable.reload()
    }
    func APICalling(API : String,Param : Parameters) {
        if AppDelegate.NetworkRechability() {
            Utils.ShowActivityIndicator(message: Strings.kLoading)
            Alamofire.request(API, method: .get, parameters: Param, encoding: URLEncoding.default, headers: ["Authorization": DEFAULTS.Get_TOKEN()]).responseJSON { (responseObject) -> Void in
                KRProgressHUD.dismiss()
                self.strNext = ((responseObject.result.value as! NSDictionary).value(forKey: "next")! is NSNull) ? "" : (responseObject.result.value as! NSDictionary).value(forKey: "next") as! String
                self.strPrevious = ((responseObject.result.value as! NSDictionary).value(forKey: "previous")! is NSNull) ? "" : (responseObject.result.value as! NSDictionary).value(forKey: "previous") as! String
                self.strTotalCount = String(describing: (responseObject.result.value as! NSDictionary).value(forKey: "count")!)
                self.arrJSONData = NSMutableArray(array: (responseObject.result.value as! NSDictionary).value(forKey: "results") as! NSArray)
                self.lblShowPagination.text = "Showing \(self.startIndex) to \(((self.startIndex + 50) > self.arrJSONData.count) ? (self.startIndex + self.arrJSONData.count) : (self.startIndex + 50)) of \(self.strTotalCount) results"
                self.addDataSourceAfter()
            }
        }else {
            Utils.showToastWithMessageAtCenter(message: Strings.kNoInternetMessage)
        }
    }
}
extension DReportVC {
    private func makeDataTable() -> SwiftDataTable {
        let dataTable = SwiftDataTable(dataSource: self, options: configurationWithoutFooter(), frame: self.view.frame)
        dataTable.translatesAutoresizingMaskIntoConstraints = false
        dataTable.delegate = self
        return dataTable
    }
}
extension DReportVC : SwiftDataTableDataSource {
    func numberOfColumns(in: SwiftDataTable) -> Int {
        switch pageName {
        case "Detail Figure Report":
            return self.arrDetailFigureStaticHeader.count
        case "Packagewise Report" :
            return self.arrPackagewiseStaticHeader.count
        case "PO Positionwise Report" :
            return self.arrPoPositionWiseStaticHeader.count
        case "Ident Codewise Report" :
            return self.arrIdentCodeWiseStaticHeader.count
        case "Summary Report" :
            return self.arrSummaryStaticHeader.count
        default:
            return 10
        }
    }
    func numberOfRows(in: SwiftDataTable) -> Int {
        return self.dataSource.count
    }
    func dataTable(_ dataTable: SwiftDataTable, dataForRowAt index: NSInteger) -> [DataTableValueType] {
        return self.dataSource[index]
    }
    
    func dataTable(_ dataTable: SwiftDataTable, headerTitleForColumnAt columnIndex: NSInteger) -> String {
        switch pageName {
        case "Detail Figure Report":
            return  self.arrDetailFigureStaticHeader[columnIndex] as! String
        case "Packagewise Report" :
            return  self.arrPackagewiseStaticHeader[columnIndex] as! String
        case "PO Positionwise Report" :
            return  self.arrPoPositionWiseStaticHeader[columnIndex] as! String
        case "Ident Codewise Report" :
            return  self.arrIdentCodeWiseStaticHeader[columnIndex] as! String
        case "Summary Report" :
            return  self.arrSummaryStaticHeader[columnIndex] as! String
        default:
            return String(describing: columnIndex)
        }
    }
}
extension DReportVC: SwiftDataTableDelegate {
    func didSelectItem(_ dataTable: SwiftDataTable, indexPath: IndexPath) {
        debugPrint("did select item at indexPath: \(indexPath) dataValue: \(dataTable.data(for: indexPath))")
    }
}
extension DReportVC : QLPreviewControllerDataSource {
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


