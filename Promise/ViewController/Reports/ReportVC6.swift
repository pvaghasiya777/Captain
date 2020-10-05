//
//  ReportVC.swift
//  report
//
//  Created by macbook on 16/06/1942 Saka.
//  Copyright © 1942 com.mac. All rights reserved.
//

import UIKit
import Alamofire
class ReportVC6: UIViewController {
    //MARK:- IBOutlet
    @IBOutlet weak var tbl_DetailFigureReport: UITableView!
    @IBOutlet weak var tbl_DetailFigureReport_1: UITableView!
    @IBOutlet weak var tbl_MarkwiseReport: UITableView!
    @IBOutlet weak var tbl_MarkwiseReport_1: UITableView!
    @IBOutlet weak var tbl_MarkwiseReport_2: UITableView!
    @IBOutlet weak var tbl_MarkwiseCumulativeReport: UITableView!
    @IBOutlet weak var tbl_MarkwiseCumulativeReport_1: UITableView!
    @IBOutlet weak var tbl_MarkwiseCumulativeReport_2: UITableView!
    @IBOutlet weak var view_DetailFigureReport: UIView!
    @IBOutlet weak var view_MarkwiseReport: UIView!
    @IBOutlet weak var view_MarkwiseCumulativeReport: UIView!
    //  Detail Figure Report
    @IBOutlet weak var btn_DetailFigureReport_1: UIButton!
    @IBOutlet weak var btn_DetailFigureReport_2: UIButton!
    //  Markwise Report
    @IBOutlet weak var btn_MarkwiseReport_1: UIButton!
    @IBOutlet weak var btn_MarkwiseReport_2: UIButton!
    @IBOutlet weak var btn_MarkwiseReport_3: UIButton!
    //  Mark wise Cumulative Report
    @IBOutlet weak var btn_MarkwiseCumulativeReport_1: UIButton!
    @IBOutlet weak var btn_MarkwiseCumulativeReport_2: UIButton!
    @IBOutlet weak var btn_MarkwiseCumulativeReport_3: UIButton!
    //Show Page Number
    @IBOutlet weak var lbl_MarkwisePageNum: UILabel!
    @IBOutlet weak var lbl_MarkwiseCumulativePageNum: UILabel!
    @IBOutlet weak var lbl_DetailFPageNum : UILabel!
    
    
    @IBOutlet weak var btn_Previous_FigureReport: UIButton!
    @IBOutlet weak var btn_Next_FigureReport: UIButton!
    @IBOutlet weak var lbl_ShowPage_Count_FigureReport: UILabel!
    @IBOutlet weak var lbl_PageNum_FigureReport: UILabel!
    
    @IBOutlet weak var btn_Previous_MarkwiseReport: UIButton!
    @IBOutlet weak var btn_Next_MarkwiseReport: UIButton!
    @IBOutlet weak var lbl_ShowPage_Count_MarkwiseReport: UILabel!
    @IBOutlet weak var lbl_PageNum_MarkwiseReport: UILabel!
    
    @IBOutlet weak var btn_Previous_MarkwiseCumulativeReport: UIButton!
    @IBOutlet weak var btn_Next_MarkwiseCumulativeReport: UIButton!
    @IBOutlet weak var lbl_ShowPage_Count_MarkwiseCumulativeReport: UILabel!
    @IBOutlet weak var lbl_PageNum_MarkwiseCumulativeReport: UILabel!
    //MARK:- Variable
    var pageName = String()
    var Arr_DetailFigureReport = [DetailFigureReportModel]()
    var Arr_MarkWiseReport : NSMutableArray = NSMutableArray()
    var Str_markWiseReportNext = ""
    var Str_markWiseReportPrevious = ""
    var Arr_MarkWiseCumulativeReport = [MarkWiseCumulativeReportModel]()
    var param : NSDictionary = NSDictionary()
    var PageCount = 1
    //MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.Initialization()
    }
    func Initialization() {
        barbuttonheader()
        if pageName == "Detail Figure Report" {
            title = "Detail Figure Report"
            ReportAPI.shareInstance.Get_ReportList(ViewController: self, Api_Str: Api_Urls.GET_API_DetailFigureReport, params: (param.count == 0) ? ["project_id":"1"] : param as! [String : Any] ,tag: 1)
            tbl_DetailFigureReport.isHidden = false
            tbl_DetailFigureReport_1.isHidden = true
            tbl_MarkwiseReport.isHidden = true
            tbl_MarkwiseReport_1.isHidden = true
            tbl_MarkwiseReport_2.isHidden = true
            tbl_MarkwiseCumulativeReport.isHidden = true
            tbl_MarkwiseCumulativeReport_1.isHidden = true
            tbl_MarkwiseCumulativeReport_2.isHidden = true
            view_MarkwiseReport.isHidden = true
            view_MarkwiseCumulativeReport.isHidden = true
            btn_Next_FigureReport.addTarget(self, action: #selector(btn_NextFigureReport(_:)), for: .touchUpInside)
            btn_Previous_FigureReport.addTarget(self, action: #selector(btn_PreviousFigureReport(_:)), for: .touchUpInside)
        } else if pageName == "Markwise Report"{
            title = "Markwise Report"
            ReportAPI.shareInstance.Get_ReportList(ViewController: self, Api_Str: Api_Urls.GET_API_MarkWiseReport, params: (param.count == 0) ? ["project_id":"1"] : param as! [String : Any] , tag: 2)
            tbl_DetailFigureReport.isHidden = true
            tbl_DetailFigureReport_1.isHidden = true
            tbl_MarkwiseReport.isHidden = false
            tbl_MarkwiseReport_1.isHidden = true
            tbl_MarkwiseReport_2.isHidden = true
            tbl_MarkwiseCumulativeReport.isHidden = true
            tbl_MarkwiseCumulativeReport_1.isHidden = true
            tbl_MarkwiseCumulativeReport_2.isHidden = true
            view_DetailFigureReport.isHidden = true
            view_MarkwiseCumulativeReport.isHidden = true
            btn_Next_MarkwiseReport.addTarget(self, action: #selector(btn_NextMarkwiseReport), for: .touchUpInside)
            btn_Previous_MarkwiseReport.addTarget(self, action: #selector(btn_PreviousFigureReport(_:)), for: .touchUpInside)
            
        } else {
            title = "Markwise Cumulative Report"
            ReportAPI.shareInstance.Get_ReportList(ViewController: self, Api_Str: Api_Urls.GET_API_MarkCummReport, params: (param.count == 0) ? ["project_id":"1"] : param as! [String : Any] , tag: 3)
            tbl_DetailFigureReport.isHidden = true
            tbl_DetailFigureReport_1.isHidden = true
            tbl_MarkwiseReport.isHidden = true
            tbl_MarkwiseReport_1.isHidden = true
            tbl_MarkwiseReport_2.isHidden = true
            tbl_MarkwiseCumulativeReport.isHidden = false
            tbl_MarkwiseCumulativeReport_1.isHidden = true
            tbl_MarkwiseCumulativeReport_2.isHidden = true
            view_MarkwiseReport.isHidden = true
            view_DetailFigureReport.isHidden = true
            btn_Next_MarkwiseCumulativeReport.addTarget(self, action: #selector(btn_NextMarkwiseCumulativeReport), for: .touchUpInside)
            btn_Previous_MarkwiseCumulativeReport.addTarget(self, action: #selector(btn_PreviousMarkwiseCumulativeReport), for: .touchUpInside)
        }
    }
    //MARK:- Button Action Event
    @IBAction func btn_DetailFigureReportNum(_ sender: UIButton) {
        if sender.tag == 1 {
            self.tbl_DetailFigureReport.isHidden = false
            self.tbl_DetailFigureReport_1.isHidden = true
            self.tbl_DetailFigureReport.reloadData()
        } else {
            tbl_DetailFigureReport.isHidden = true
            tbl_DetailFigureReport_1.isHidden = false
            self.tbl_DetailFigureReport_1.reloadData()
        }
    }
    //MArkWise Report
    @IBAction func btn_MarkwiseReportNum(_ sender: UIButton) {
        if sender.tag == 3 {
            tbl_MarkwiseReport.isHidden = false
            tbl_MarkwiseReport_1.isHidden = true
            tbl_MarkwiseReport_2.isHidden = true
            self.tbl_MarkwiseReport.reloadData()
        } else if sender.tag == 4 {
            tbl_MarkwiseReport.isHidden = true
            tbl_MarkwiseReport_1.isHidden = false
            tbl_MarkwiseReport_2.isHidden = true
            self.tbl_MarkwiseReport_1.reloadData()
        } else if sender.tag == 5 {
            tbl_MarkwiseReport.isHidden = true
            tbl_MarkwiseReport_1.isHidden = true
            tbl_MarkwiseReport_2.isHidden = false
            self.tbl_MarkwiseReport_2.reloadData()
        }
    }
    //MarkWise Cumulative Report
    @IBAction func btn_MarkwiseCumulativeReportNum(_ sender: UIButton) {
        if sender.tag == 6 {
            tbl_MarkwiseCumulativeReport.isHidden = false
            tbl_MarkwiseCumulativeReport_1.isHidden = true
            tbl_MarkwiseCumulativeReport_2.isHidden = true
            self.tbl_MarkwiseCumulativeReport.reloadData()
        } else if sender.tag == 7 {
            tbl_MarkwiseCumulativeReport.isHidden = true
            tbl_MarkwiseCumulativeReport_1.isHidden = false
            tbl_MarkwiseCumulativeReport_2.isHidden = true
            self.tbl_MarkwiseCumulativeReport_1.reloadData()
        } else {
            tbl_MarkwiseCumulativeReport.isHidden = true
            tbl_MarkwiseCumulativeReport_1.isHidden = true
            tbl_MarkwiseCumulativeReport_2.isHidden = false
            self.tbl_MarkwiseCumulativeReport_2.reloadData()
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
           ReportAPI.shareInstance.Get_ReportList(ViewController: self, Api_Str: Api_Urls.GET_API_DetailFigureReport, params: param as! Parameters,tag: 1)
        case "Markwise Report" :
            ReportAPI.shareInstance.Get_ReportList(ViewController: self, Api_Str: Api_Urls.GET_API_MarkWiseReport, params: param as! Parameters , tag: 2)
        case "Markwise Cumulative Report" :
            ReportAPI.shareInstance.Get_ReportList(ViewController: self, Api_Str: Api_Urls.GET_API_MarkCummReport, params: param as! Parameters, tag: 3)
        default:
            print(pageName)
        }
    }
    //Figure Report
    @objc func btn_NextFigureReport(_ sender: UIButton) {
        if Arr_DetailFigureReport[0].next != nil {
            ReportAPI.shareInstance.Get_ReportList(ViewController: self, Api_Str: Arr_DetailFigureReport[0].next!, params: [:],tag: 1)
            self.PageCount = PageCount + 1
            self.lbl_ShowPage_Count_FigureReport.text = String(describing: PageCount)
        }else {
            Utils.showToastWithMessageAtCenter(message: "Next Data not Available")
        }
    }
    @objc func btn_PreviousFigureReport(_ sender: UIButton) {
        if Arr_DetailFigureReport[0].next != nil {
            ReportAPI.shareInstance.Get_ReportList(ViewController: self, Api_Str: Arr_DetailFigureReport[0].next!, params: [:],tag: 1)
            self.PageCount = PageCount - 1
            self.lbl_ShowPage_Count_FigureReport.text = String(describing: PageCount)
        }else {
            Utils.showToastWithMessageAtCenter(message: "Next Data not Available")
        }
    }
    //Markwise Report
    @objc func btn_NextMarkwiseReport(_ sender: UIButton) {
        
        if Str_markWiseReportNext != "" {
            ReportAPI.shareInstance.Get_ReportList(ViewController: self, Api_Str: Str_markWiseReportNext, params: [:],tag: 2)
            self.PageCount = PageCount + 1
            self.lbl_ShowPage_Count_MarkwiseReport.text = String(describing: PageCount)
        }else {
            Utils.showToastWithMessageAtCenter(message: "Next Data not Available")
        }
    }
    @objc func btn_PreviousMarkwiseReport(_ sender: UIButton) {
        if Str_markWiseReportPrevious != "" {
            ReportAPI.shareInstance.Get_ReportList(ViewController: self, Api_Str: Str_markWiseReportPrevious, params: [:],tag: 2)
            self.PageCount = PageCount - 1
            self.lbl_ShowPage_Count_MarkwiseReport.text = String(describing: PageCount)
        }else {
            Utils.showToastWithMessageAtCenter(message: "Previous Data not Available")
        }
    }
    //Mark wise Cumulative Report
    @objc func btn_NextMarkwiseCumulativeReport(_ sender: UIButton) {
        if Arr_MarkWiseCumulativeReport[0].next != nil {
            ReportAPI.shareInstance.Get_ReportList(ViewController: self, Api_Str: Arr_MarkWiseCumulativeReport[0].next!, params: [:],tag: 3)
            self.PageCount = PageCount + 1
            self.lbl_ShowPage_Count_MarkwiseCumulativeReport.text = String(describing: PageCount)
        }else {
            Utils.showToastWithMessageAtCenter(message: "Next Data not Available")
        }
    }
    @objc func btn_PreviousMarkwiseCumulativeReport(_ sender: UIButton) {
        if Arr_DetailFigureReport[0].next != nil {
            ReportAPI.shareInstance.Get_ReportList(ViewController: self, Api_Str: Arr_MarkWiseCumulativeReport[0].next!, params: [:],tag: 3)
            self.PageCount = PageCount - 1
            self.lbl_ShowPage_Count_MarkwiseCumulativeReport.text = String(describing: PageCount)
        }else {
            Utils.showToastWithMessageAtCenter(message: "Next Data not Available")
        }
    }
}
//MARK:- TableView Methode
extension ReportVC6 : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tbl_DetailFigureReport {
            if section == 0 {
                return 1
            } else {
                return (Arr_DetailFigureReport.count == 0) ? Arr_DetailFigureReport.count :Arr_DetailFigureReport[0].results!.count
            }
        } else if tableView == tbl_DetailFigureReport_1 {
            if section == 0 {
                return 1
            } else {
                return (Arr_DetailFigureReport.count == 0) ? Arr_DetailFigureReport.count :Arr_DetailFigureReport[0].results!.count
            }
        } else if tableView == tbl_MarkwiseReport {
            if section == 0 {
                return 1
            } else {
                return Arr_MarkWiseReport.count
            }
        } else if tableView == tbl_MarkwiseReport_1 {
            if section == 0 {
                return 1
            } else {
                return Arr_MarkWiseReport.count
            }
        } else if tableView == tbl_MarkwiseReport_2 {
            if section == 0 {
                return 1
            } else {
                return Arr_MarkWiseReport.count
            }
        } else if tableView == tbl_MarkwiseCumulativeReport {
            if section == 0 {
                return 1
            } else {
                return (Arr_MarkWiseCumulativeReport.count == 0) ? Arr_MarkWiseCumulativeReport.count : Arr_MarkWiseCumulativeReport[0].results!.count
            }
        } else if tableView == tbl_MarkwiseCumulativeReport_1 {
            if section == 0 {
                return 1
            } else {
                return (Arr_MarkWiseCumulativeReport.count == 0) ? Arr_MarkWiseCumulativeReport.count : Arr_MarkWiseCumulativeReport[0].results!.count
            }
        } else {
            if section == 0 {
                return 1
            } else {
                return (Arr_MarkWiseCumulativeReport.count == 0) ? Arr_MarkWiseCumulativeReport.count : Arr_MarkWiseCumulativeReport[0].results!.count
            }
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == tbl_DetailFigureReport {
            if indexPath.section == 0 {
                let cell : DetailFigureReportHeadercell = tableView.dequeueReusableCell(withIdentifier: "DetailFigureReportHeadercell") as! DetailFigureReportHeadercell
                return cell
            } else {
                let cell : DetailFigureReportcell = tableView.dequeueReusableCell(withIdentifier: "DetailFigureReportcell") as! DetailFigureReportcell
                cell.DisplayCell(Arr_Data: Arr_DetailFigureReport, indexpath: indexPath)
                return cell
            }
        } else if tableView == tbl_DetailFigureReport_1 {
            if indexPath.section == 0 {
                let cell : DetailFigureReportHeadercell1 = tableView.dequeueReusableCell(withIdentifier: "DetailFigureReportHeadercell1") as! DetailFigureReportHeadercell1
                return cell
            } else {
                let cell : DetailFigureReportcell1 = tableView.dequeueReusableCell(withIdentifier: "DetailFigureReportcell1") as! DetailFigureReportcell1
                cell.DisplayCell(Arr_Data: Arr_DetailFigureReport, indexpath: indexPath)
                return cell
            }
        } else if tableView == tbl_MarkwiseReport {
            if indexPath.section == 0 {
                let cell : MarkwiseReportHeadercell = tableView.dequeueReusableCell(withIdentifier: "MarkwiseReportHeadercell") as! MarkwiseReportHeadercell
                return cell
            } else {
                let cell : MarkwiseReportcell = tableView.dequeueReusableCell(withIdentifier: "MarkwiseReportcell") as! MarkwiseReportcell
                cell.DisplayCell(Arr_Data: Arr_MarkWiseReport, indexpath: indexPath)
                return cell
            }
        } else if tableView == tbl_MarkwiseReport_1 {
            if indexPath.section == 0 {
                let cell : MarkwiseReportHeadercell1 = tableView.dequeueReusableCell(withIdentifier: "MarkwiseReportHeadercell1") as! MarkwiseReportHeadercell1
                return cell
            } else {
                let cell : MarkwiseReportcell1 = tableView.dequeueReusableCell(withIdentifier: "MarkwiseReportcell1") as! MarkwiseReportcell1
                cell.DisplayCell(Arr_Data: Arr_MarkWiseReport, indexpath: indexPath)
                return cell
            }
        } else if tableView == tbl_MarkwiseReport_2 {
            if indexPath.section == 0 {
                let cell : MarkwiseReportHeadercell2 = tableView.dequeueReusableCell(withIdentifier: "MarkwiseReportHeadercell2") as! MarkwiseReportHeadercell2
                return cell
            } else {
                let cell : MarkwiseReportcell2 = tableView.dequeueReusableCell(withIdentifier: "MarkwiseReportcell") as! MarkwiseReportcell2
                cell.DisplayCell(Arr_Data: Arr_MarkWiseReport, indexpath: indexPath)
                return cell
            }
        } else if tableView == tbl_MarkwiseCumulativeReport {
            if indexPath.section == 0 {
                let cell : MarkwiseCumulativeReportHeadercell = tableView.dequeueReusableCell(withIdentifier: "MarkwiseCumulativeReportHeadercell") as! MarkwiseCumulativeReportHeadercell
                return cell
            } else {
                let cell : MarkwiseCumulativeReportcell = tableView.dequeueReusableCell(withIdentifier: "MarkwiseCumulativeReportcell") as! MarkwiseCumulativeReportcell
                cell.DisplayCell(Arr_Data: Arr_MarkWiseCumulativeReport, indexpath: indexPath)
                return cell
            }
        } else if tableView == tbl_MarkwiseCumulativeReport_1 {
            if indexPath.section == 0 {
                let cell : MarkwiseCumulativeReportHeadercell1 = tableView.dequeueReusableCell(withIdentifier: "MarkwiseCumulativeReportHeadercell1") as! MarkwiseCumulativeReportHeadercell1
                return cell
            } else {
                let cell : MarkwiseCumulativeReportcell1 = tableView.dequeueReusableCell(withIdentifier: "MarkwiseCumulativeReportcell1") as! MarkwiseCumulativeReportcell1
                cell.DisplayCell(Arr_Data: Arr_MarkWiseCumulativeReport, indexpath: indexPath)
                return cell
            }
        } else {
            if indexPath.section == 0 {
                let cell : MarkwiseCumulativeReportHeadercell12 = tableView.dequeueReusableCell(withIdentifier: "MarkwiseCumulativeReportHeadercell12") as! MarkwiseCumulativeReportHeadercell12
                return cell
            } else {
                let cell : MarkwiseCumulativeReportcell2 = tableView.dequeueReusableCell(withIdentifier: "MarkwiseCumulativeReportcell2") as! MarkwiseCumulativeReportcell2
                cell.DisplayCell(Arr_Data: Arr_MarkWiseCumulativeReport, indexpath: indexPath)
                return cell
            }
        }
        
    }
}
