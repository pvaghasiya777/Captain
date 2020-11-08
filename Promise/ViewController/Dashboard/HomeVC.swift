
import UIKit
import ABGaugeViewKit
class HomeVC: UIViewController
{
    //MARK:- IBOutlet
    @IBOutlet var btn_filter: UIBarButtonItem!
    @IBOutlet var btn_filterView: UIBarButtonItem!
    @IBOutlet var menu_Barbutton: UIBarButtonItem!
    @IBOutlet weak var tbl_ReportSection: UITableView!
    @IBOutlet weak var view_TotalWeightkg: UIView!
    @IBOutlet weak var lbl_TotalWeightkg: UILabel!
    @IBOutlet weak var view_TotalPieces: UIView!
    @IBOutlet weak var lbl_TotalPieces: UILabel!
    @IBOutlet weak var btn_Dashboard: UIButton!
    @IBOutlet weak var btn_Report: UIButton!
    @IBOutlet weak var ReleasedWeightkg: ABGaugeView!
    @IBOutlet weak var lbl_ReleasedWeightload: UILabel!
    @IBOutlet weak var lbl_ReleasedWeightpr: UILabel!
    @IBOutlet weak var ReleasedPieces: ABGaugeView!
    @IBOutlet weak var lbl_ReleasedPiecesload: UILabel!
    @IBOutlet weak var lbl_ReleasedPiecespr: UILabel!
    @IBOutlet weak var ShippedWeightkg: ABGaugeView!
    @IBOutlet weak var lbl_ShippedWeightload: UILabel!
    @IBOutlet weak var lbl_ShippedWeightpr: UILabel!
    @IBOutlet weak var ShippedPieces: ABGaugeView!
    @IBOutlet weak var lbl_ShippedPiecesload: UILabel!
    @IBOutlet weak var lbl_ShippedPiecespr: UILabel!
    @IBOutlet weak var OnSiteWeightkg: ABGaugeView!
    @IBOutlet weak var lbl_OnSiteWeightload: UILabel!
    @IBOutlet weak var lbl_OnSiteWeightpr: UILabel!
    @IBOutlet weak var OnSitePieces: ABGaugeView!
    @IBOutlet weak var lbl_OnSitePiecesload: UILabel!
    @IBOutlet weak var lbl_OnSitePiecespr: UILabel!
    //MARK:- Variable
    var Arr_Report_Section : NSMutableArray = ["Detail Figure Report","Markwise Report","Markwise Cumulative Report","Packagewise Report","Packing List Report","PO Positionwise Report","Ident Codewise Report","Structurewise Report","Group Structurewise Report","Summary Report"]
    var Arr_DashBoardResult = [DashBoardResult]()
    var Arr_DashBoardMarkwise = [DashBoardMarkWiseModel]()
    var Is_Mark : Bool = false
    //MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.Initialization()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.selected_Filter, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.set_FilterData(_:)), name: NSNotification.Name.selected_Filter, object: nil)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationItem.title = ""
        self.revealViewController()?.delegate = nil
    }
    //MARK:- Initialization
    func Initialization() {
        if revealViewController() != nil {
            self.revealViewController().delegate = self
            menu_Barbutton.target = self.revealViewController()
            menu_Barbutton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            self.revealViewController()?.rearViewRevealWidth = 280
        }
        self.tbl_ReportSection.register(UINib(nibName: "ReportTblCell", bundle: nil), forCellReuseIdentifier: "ReportTblCell")
        btn_Dashboard.backgroundColor = UIColor(hexString: "2B3990")
        btn_Dashboard.tintColor = .white
        btn_Report.backgroundColor = .white
        btn_Report.tintColor = .black
        tbl_ReportSection.isHidden = true
        ReportAPI.shareInstance.Get_DashBoardHome(Api_str: Api_Urls.GET_API_DashBoardProjectWise + "\(DEFAULTS.Get_ProjectID())/",ViewController: self,Tag: 1)
        self.Device_Orientaction()
        self.Design()
    }
    func Design() {
        Utils.Set_Same_Corner_Radius(views: [btn_Dashboard,btn_Report], cornerRadius: 7)
    }
    @objc func set_FilterData(_ notification: NSNotification) {
        let SelectedTag = notification.userInfo!["SelectedTag"] as! Int
        let str_SelectedFilter = notification.userInfo!["Str_SelectedFilter"] as! String
        if SelectedTag == 1 {
            ReportAPI.shareInstance.Get_DashBoardHome(Api_str: Api_Urls.GET_API_DashBoardProjectWise + "\(str_SelectedFilter)/", ViewController: self,Tag: SelectedTag)
        }else if SelectedTag == 2 {
            ReportAPI.shareInstance.Get_DashBoardHome(Api_str: Api_Urls.GET_API_DashBoardPurchaseWise + "\(str_SelectedFilter)/", ViewController: self,Tag: SelectedTag)
        }else if SelectedTag == 3 {
            ReportAPI.shareInstance.Get_DashBoardHome(Api_str: Api_Urls.GET_API_DashBoardStrucherWise + "\(str_SelectedFilter)/", ViewController: self,Tag: SelectedTag)
        }else if SelectedTag == 4 {
            ReportAPI.shareInstance.Get_DashBoardHome(Api_str: Api_Urls.GET_API_DashBoardPackinglistWise + "\(str_SelectedFilter)/", ViewController: self,Tag: SelectedTag)
        }else if SelectedTag == 5 {
            ReportAPI.shareInstance.Get_DashBoardHome(Api_str: Api_Urls.GET_API_DashBoardMarkWise + "\(str_SelectedFilter)/", ViewController: self,Tag: SelectedTag)
        }
    }
    func SetData() {
        self.lbl_TotalWeightkg.text = String(describing: Arr_DashBoardResult[0].strWeight!)
        self.lbl_TotalPieces.text = String(describing: Arr_DashBoardResult[0].strPieces!)
        self.lbl_ReleasedWeightload.text = Arr_DashBoardResult[0].strRelWeight!
        self.lbl_ReleasedPiecesload.text = String(describing: Arr_DashBoardResult[0].strRelPieces!)
        self.lbl_ShippedPiecesload.text = String(describing: Arr_DashBoardResult[0].strShipPieces!)
        self.lbl_ShippedWeightload.text = Arr_DashBoardResult[0].strShipWeight!
        self.lbl_OnSitePiecesload.text = String(describing: Arr_DashBoardResult[0].strOnsitePieces!)
        self.lbl_OnSiteWeightload.text = Arr_DashBoardResult[0].strOnsiteWeight!
        //Percantage
        self.lbl_ReleasedWeightpr.text = Utils.Get_Percantage(Uses: Double(Arr_DashBoardResult[0].strRelWeight!)!, Total: Double(Arr_DashBoardResult[0].strWeight!)!)
        self.lbl_ShippedWeightpr.text = Utils.Get_Percantage(Uses: Double(Arr_DashBoardResult[0].strShipWeight!)!, Total: Double(Arr_DashBoardResult[0].strWeight!)!)
        self.lbl_OnSiteWeightpr.text = Utils.Get_Percantage(Uses: Double(Arr_DashBoardResult[0].strOnsiteWeight!)!, Total: Double(Arr_DashBoardResult[0].strWeight!)!)
        self.lbl_ReleasedPiecespr.text = Utils.Get_Percantage(Uses: Double(Arr_DashBoardResult[0].strRelPieces!), Total: Double(Arr_DashBoardResult[0].strPieces!))
        self.lbl_ShippedPiecespr.text = Utils.Get_Percantage(Uses: Double(Arr_DashBoardResult[0].strShipPieces!), Total: Double(Arr_DashBoardResult[0].strPieces!))
        self.lbl_OnSitePiecespr.text = Utils.Get_Percantage(Uses: Double(Arr_DashBoardResult[0].strOnsitePieces!), Total: Double(Arr_DashBoardResult[0].strPieces!))
        //Needle Value
        self.ReleasedWeightkg.needleValue = CGFloat(Utils.Get_NeedleValue(Value: self.lbl_ReleasedWeightpr.text!))
        self.ReleasedPieces.needleValue = CGFloat(Utils.Get_NeedleValue(Value: self.lbl_ReleasedPiecespr.text!))
        self.ShippedWeightkg.needleValue = CGFloat(Utils.Get_NeedleValue(Value: self.lbl_ShippedWeightpr.text!))
        self.ShippedPieces.needleValue = CGFloat(Utils.Get_NeedleValue(Value: self.lbl_ShippedPiecespr.text!))
        self.OnSitePieces.needleValue = CGFloat(Utils.Get_NeedleValue(Value: self.lbl_OnSitePiecespr.text!))
        self.OnSiteWeightkg.needleValue = CGFloat(Utils.Get_NeedleValue(Value: self.lbl_OnSiteWeightpr.text!))
    }
    func SetMarkData() {
        self.lbl_TotalWeightkg.text = String(describing: Arr_DashBoardMarkwise[0].strWeight!)
        self.lbl_TotalPieces.text = String(describing: Arr_DashBoardMarkwise[0].strPieces!)
        self.lbl_ReleasedWeightload.text = String(describing: Arr_DashBoardMarkwise[0].strRelWeight!)
        self.lbl_ReleasedPiecesload.text = String(describing: Arr_DashBoardMarkwise[0].strRelPieces!)
        self.lbl_ShippedPiecesload.text = String(describing: Arr_DashBoardMarkwise[0].strShipPieces!)
        self.lbl_ShippedWeightload.text = String(describing: Arr_DashBoardMarkwise[0].strShipWeight!)
        self.lbl_OnSitePiecesload.text = String(describing: Arr_DashBoardMarkwise[0].strOnsitePieces!)
        self.lbl_OnSiteWeightload.text = String(describing: Arr_DashBoardMarkwise[0].strOnsiteWeight!)
        //Percantage
        self.lbl_ReleasedWeightpr.text = Utils.Get_Percantage(Uses: Double(Arr_DashBoardMarkwise[0].strRelWeight!), Total: Double(Arr_DashBoardMarkwise[0].strWeight!))
        self.lbl_ShippedWeightpr.text = Utils.Get_Percantage(Uses: Double(Arr_DashBoardMarkwise[0].strShipWeight!), Total: Double(Arr_DashBoardMarkwise[0].strWeight!))
        self.lbl_OnSiteWeightpr.text = Utils.Get_Percantage(Uses: Double(Arr_DashBoardMarkwise[0].strOnsiteWeight!), Total: Double(Arr_DashBoardMarkwise[0].strWeight!))
        self.lbl_ReleasedPiecespr.text = Utils.Get_Percantage(Uses: Double(Arr_DashBoardMarkwise[0].strRelPieces!), Total: Double(Arr_DashBoardMarkwise[0].strPieces!))
        self.lbl_ShippedPiecespr.text = Utils.Get_Percantage(Uses: Double(Arr_DashBoardMarkwise[0].strShipPieces!), Total: Double(Arr_DashBoardMarkwise[0].strPieces!))
        self.lbl_OnSitePiecespr.text = Utils.Get_Percantage(Uses: Double(Arr_DashBoardMarkwise[0].strOnsitePieces!), Total: Double(Arr_DashBoardMarkwise[0].strPieces!))
        //Needle Value
        self.ReleasedWeightkg.needleValue = CGFloat(Utils.Get_NeedleValue(Value: self.lbl_ReleasedWeightpr.text!))
        self.ReleasedPieces.needleValue = CGFloat(Utils.Get_NeedleValue(Value: self.lbl_ReleasedPiecespr.text!))
        self.ShippedWeightkg.needleValue = CGFloat(Utils.Get_NeedleValue(Value: self.lbl_ShippedWeightpr.text!))
        self.ShippedPieces.needleValue = CGFloat(Utils.Get_NeedleValue(Value: self.lbl_ShippedPiecespr.text!))
        self.OnSitePieces.needleValue = CGFloat(Utils.Get_NeedleValue(Value: self.lbl_OnSitePiecespr.text!))
        self.OnSiteWeightkg.needleValue = CGFloat(Utils.Get_NeedleValue(Value: self.lbl_OnSiteWeightpr.text!))
    }
    func Device_Orientaction() {
        let value = UIInterfaceOrientation.portrait.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
    }
    @IBAction func btn_Filter_Click(_ sender: UIBarButtonItem) {
        let DFilters_VC = Config.StoryBoard.instantiateViewController(withIdentifier: "DFiltersVC") as! DFiltersVC
        self.navigationController?.pushViewController(DFilters_VC, animated: true)
    }
    @IBAction func btn_ViewFilter_Click(_ sender: UIBarButtonItem) {
        if DEFAULTS.Get_View_Filter().count == 0 {
            Utils.showToastWithMessage(message: Strings.kNoFilterSelect)
        }else{
            let ViewFilterVC = Config.StoryBoard.instantiateViewController(withIdentifier: "ViewSelectFilter") as! ViewSelectFilter
            self.navigationController?.pushViewController(ViewFilterVC, animated: true)
        }
    }
    @IBAction func btn_heaerCklick(_ sender: UIButton) {
        if sender.tag == 0 {
            btn_Dashboard.backgroundColor = App_Colors.ThemeColor
            btn_Dashboard.tintColor = .white
            btn_Report.backgroundColor = .white
            btn_Report.tintColor = .black
            tbl_ReportSection.isHidden = true
            btn_filter.image = (UIImage(named: "ic_filter"))
            btn_filter.isEnabled = true
            btn_filterView.image = (UIImage(named: "ic_eye"))
            btn_filterView.isEnabled = true
        } else {
            btn_Dashboard.backgroundColor = .white
            btn_Dashboard.tintColor = .black
            btn_Report.backgroundColor = App_Colors.ThemeColor
            btn_Report.tintColor = .white
            tbl_ReportSection.isHidden = false
            btn_filter.image = (UIImage(named: ""))
            btn_filter.isEnabled = false
            btn_filterView.image = (UIImage(named: ""))
            btn_filterView.isEnabled = false
        }
    }
    override public var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    override public var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return .portrait
    }
}
extension HomeVC : UITableViewDataSource ,UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Arr_Report_Section.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell :ReportTblCell = tableView.dequeueReusableCell(withIdentifier: "ReportTblCell") as! ReportTblCell
        cell.lbl_Name.text = String(describing: Arr_Report_Section[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 { //DetailFigure
            let report_vc = Config.StoryBoard2.instantiateViewController(identifier: "DReportVC") as! DReportVC
            report_vc.pageName = "Detail Figure Report"
            self.navigationController?.pushViewController(report_vc, animated: true)
        } else if indexPath.row == 1 { //MarkWise
            let MarkwiseReport_VC = Config.StoryBoard2.instantiateViewController(identifier: "R_MarkwiseReportVC") as! R_MarkwiseReportVC
            self.navigationController?.pushViewController(MarkwiseReport_VC, animated: true)
        }  else if indexPath.row == 2 { //MarkWiseCummulative
            let MarkwiseCumulativeReport_VC = Config.StoryBoard2.instantiateViewController(identifier: "MarkwiseCumulativeReportVC") as! MarkwiseCumulativeReportVC
            self.navigationController?.pushViewController(MarkwiseCumulativeReport_VC, animated: true)
        } else if indexPath.row == 3 { //Packagewise
            let report_vc = Config.StoryBoard2.instantiateViewController(identifier: "DReportVC") as! DReportVC
            report_vc.pageName = "Packagewise Report"
            self.navigationController?.pushViewController(report_vc, animated: true)
        } else if indexPath.row == 4 { //PackingList
            let report_vc = Config.StoryBoard2.instantiateViewController(identifier: "PackingListReport_VC") as! PackingListReport_VC
            self.navigationController?.pushViewController(report_vc, animated: true)
        } else if indexPath.row == 5 { //POPosition
            let report_vc = Config.StoryBoard2.instantiateViewController(identifier: "DReportVC") as! DReportVC
            report_vc.pageName = "PO Positionwise Report"
            self.navigationController?.pushViewController(report_vc, animated: true)
        } else if indexPath.row == 6 {//IdentCode Wise
            let report_vc = Config.StoryBoard2.instantiateViewController(identifier: "DReportVC") as! DReportVC
            report_vc.pageName = "Ident Codewise Report"
            self.navigationController?.pushViewController(report_vc, animated: true)
        } else if indexPath.row == 7 { //StrucherwiseWise
            let report_vc = Config.StoryBoard2.instantiateViewController(identifier: "StructurewiseReportVC") as! StructurewiseReportVC
            self.navigationController?.pushViewController(report_vc, animated: true)
        } else if indexPath.row == 8 {// Group Structurewise Report
            let report_vc = Config.StoryBoard2.instantiateViewController(identifier: "GroupStructurewiseReportVC") as! GroupStructurewiseReportVC
            self.navigationController?.pushViewController(report_vc, animated: true)
        } else { // Summary report
            let report_vc =  Config.StoryBoard2.instantiateViewController(identifier: "DReportVC") as! DReportVC
            report_vc.pageName = "Summary Report"
            self.navigationController?.pushViewController(report_vc, animated: true)
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
//MARK:- SWRevealViewController Methods
extension HomeVC : SWRevealViewControllerDelegate {
    // MARK: - Reveal View Controller Delagate Methods
    func revealController(_ revealController: SWRevealViewController, didMoveTo position: FrontViewPosition) {
        Utils.Disable_Front_ViewController(viewController: self, position: position)
    }
    func revealController(_ revealController: SWRevealViewController, willMoveTo position: FrontViewPosition) {
        Utils.Disable_Front_ViewController(viewController: self, position: position)
    }
}
