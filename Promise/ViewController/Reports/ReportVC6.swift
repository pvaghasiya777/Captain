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
    //MARK:- Variable
    var pageName = String()
    var Arr_DetailFigureReport = [DetailFigureReportModel]()
    var Arr_MarkWiseReport : NSMutableArray = NSMutableArray()
    var Str_markWiseReportNext = ""
    var Str_markWiseReportPrevious = ""
    var Arr_MarkWiseCumulativeReport = [MarkWiseCumulativeReportModel]()
    var param : NSDictionary = NSDictionary()
    //MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.Initialization()
    }
    func Initialization() {
        if pageName == "Detail Figure Report" {
            title = "Detail Figure Report"
            ReportAPI.shareInstance.Get_ReportList(ViewController: self, Api_Str: Api_Urls.GET_API_DetailFigureReport, params: ["project_id":"1"],tag: 1)
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
        } else {
            title = "Markwise Cumulative Report"
            ReportAPI.shareInstance.Get_ReportList(ViewController: self, Api_Str: Api_Urls.GET_API_MarkCummReport, params: ["project_id":"1"], tag: 3)
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
