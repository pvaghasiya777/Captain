//
//  ReportVC4.swift
//  report
//
//  Created by macbook on 22/06/1942 Saka.
//  Copyright © 1942 com.mac. All rights reserved.
//

import UIKit

class ReportVC4: UIViewController {

    @IBOutlet weak var tbl_SummaryReport: UITableView!
    @IBOutlet weak var tbl_SummaryReport1: UITableView!
    
    @IBOutlet weak var view_PackagewiseReport: UIView!
    //    Markwise Report
    @IBOutlet weak var btn_PackingListReport_1: UIButton!
    @IBOutlet weak var btn_PackingListReport_2: UIButton!
    
    var Arr_Summary = [SummaryReportModel]()
    var pageName = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Summary Report"
        tbl_SummaryReport.isHidden = false
        tbl_SummaryReport1.isHidden = true
        ReportAPI.shareInstance.Get_ReportList(ViewController: self, Api_Str: Api_Urls.GET_API_SummaryReport, params: ["project_id":"1"], tag: 10)
    }
    
    @IBAction func btn_MarkwiseReportNum(_ sender: UIButton) {
        if sender.tag == 1 {
            tbl_SummaryReport.isHidden = false
            tbl_SummaryReport1.isHidden = true
            self.tbl_SummaryReport.reloadData()
           
        } else {
            tbl_SummaryReport.isHidden = true
            tbl_SummaryReport1.isHidden = false
            self.tbl_SummaryReport1.reloadData()
        }
    }
}
extension ReportVC4 : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }else {
            return (Arr_Summary.count == 0) ? Arr_Summary.count : Arr_Summary[0].results!.count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == tbl_SummaryReport {
            if indexPath.section == 0 {
                let cell : SummaryReportHeadercell = tableView.dequeueReusableCell(withIdentifier: "SummaryReportHeadercell") as! SummaryReportHeadercell
                return cell
            } else {
                let cell : SummaryReportcell = tableView.dequeueReusableCell(withIdentifier: "SummaryReportcell") as! SummaryReportcell
                cell.DisplayCell(Arr_Data: Arr_Summary, indexpath: indexPath)
                return cell
            }
        } else {
            if indexPath.section == 0 {
                let cell : SummaryReportHeadercell1 = tableView.dequeueReusableCell(withIdentifier: "SummaryReportHeadercell1") as! SummaryReportHeadercell1
                return cell
            } else {
                let cell : SummaryReportcell1 = tableView.dequeueReusableCell(withIdentifier: "SummaryReportcell1") as! SummaryReportcell1
                cell.DisplayCell(Arr_Data: Arr_Summary, indexpath: indexPath)
                return cell
            }
        }
        
    }
}

   
