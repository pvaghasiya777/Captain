//
//  ReportVC1.swift
//  report
//
//  Created by macbook on 17/06/1942 Saka.
//  Copyright © 1942 com.mac. All rights reserved.
//

import UIKit

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
    //MARK:- Variable
    var pageName = String()
    var Arr_PackagWiseReport = [packageWiseReportModel]()
    var Arr_PackingListReport = [PackingListReportModel]()
    //MARK:- LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.Initialization()
    }
    func Initialization(){
        if pageName == "Packagewise Report" {
             title = "Packagewise Report"
            ReportAPI.shareInstance.Get_ReportList(ViewController: self, Api_Str: Api_Urls.GET_API_PackagWiseReport, params: ["project_id":"1"], tag: 4)
            tbl_PackagewiseReport.isHidden = false
            tbl_PackagewiseReport_1.isHidden = true
            tbl_PackingListReport.isHidden = true
            tbl_PackingListReport_1.isHidden = true
            tbl_PackingListReport_2.isHidden = true
            tbl_PackingListReport_3.isHidden = true
            view_PackingListReport.isHidden = true
        } else if pageName == "Packing List Report"{
             title = "Packing List Report"
            ReportAPI.shareInstance.Get_ReportList(ViewController: self, Api_Str: Api_Urls.GET_API_PackingListReport, params: ["project_id":"1"], tag: 5)
            tbl_PackagewiseReport.isHidden = true
            tbl_PackagewiseReport_1.isHidden = true
            tbl_PackingListReport.isHidden = false
            tbl_PackingListReport_1.isHidden = true
            tbl_PackingListReport_2.isHidden = true
            tbl_PackingListReport_3.isHidden = true
            view_PackagewiseReport.isHidden = true
        }
    }
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
//    func SetTableView(HidenTable :UITableView,ShowTable:UITableView) {
//        HidenTable.isHidden
//    }
   
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
