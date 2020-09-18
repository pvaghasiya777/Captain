//
//  ReportVC3.swift
//  report
//
//  Created by macbook on 19/06/1942 Saka.
//  Copyright © 1942 com.mac. All rights reserved.
//

import UIKit

class ReportVC3: UIViewController {

    @IBOutlet weak var tbl_GroupStructurewiseReport: UITableView!
    @IBOutlet weak var tbl_GroupStructurewiseReport1: UITableView!
    @IBOutlet weak var tbl_GroupStructurewiseReport2: UITableView!
    @IBOutlet weak var tbl_GroupStructurewiseReport3: UITableView!
    @IBOutlet weak var tbl_GroupStructurewiseReport4: UITableView!
    @IBOutlet weak var tbl_GroupStructurewiseReport5: UITableView!
    @IBOutlet weak var view_PackagewiseReport: UIView!
    //    Markwise Report
    @IBOutlet weak var btn_PackingListReport_1: UIButton!
    @IBOutlet weak var btn_PackingListReport_2: UIButton!
    @IBOutlet weak var btn_PackingListReport_3: UIButton!
    @IBOutlet weak var btn_PackingListReport_4: UIButton!
    @IBOutlet weak var btn_PackingListReport_5: UIButton!
    @IBOutlet weak var btn_PackingListReport_6: UIButton!
    var pageName = String()
    var Arr_GroupSReport = [GroupStrucherWiseReportModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Group Structure wise Report"
        ReportAPI.shareInstance.Get_ReportList(ViewController: self, Api_Str: Api_Urls.GET_API_GroupStrucherWiseReport, params: ["project_id":"1"], tag: 9)
        tbl_GroupStructurewiseReport.isHidden = false
        tbl_GroupStructurewiseReport1.isHidden = true
        tbl_GroupStructurewiseReport2.isHidden = true
        tbl_GroupStructurewiseReport3.isHidden = true
        tbl_GroupStructurewiseReport4.isHidden = true
        tbl_GroupStructurewiseReport5.isHidden = true
    }
    
    @IBAction func btn_MarkwiseReportNum(_ sender: UIButton) {
        if sender.tag == 1 {
            tbl_GroupStructurewiseReport.isHidden = false
            tbl_GroupStructurewiseReport1.isHidden = true
            tbl_GroupStructurewiseReport2.isHidden = true
            tbl_GroupStructurewiseReport3.isHidden = true
            tbl_GroupStructurewiseReport4.isHidden = true
            tbl_GroupStructurewiseReport5.isHidden = true
            self.tbl_GroupStructurewiseReport.reloadData()
        } else if sender.tag == 2 {
            tbl_GroupStructurewiseReport.isHidden = true
            tbl_GroupStructurewiseReport1.isHidden = false
            tbl_GroupStructurewiseReport2.isHidden = true
            tbl_GroupStructurewiseReport3.isHidden = true
            tbl_GroupStructurewiseReport4.isHidden = true
            tbl_GroupStructurewiseReport5.isHidden = true
            self.tbl_GroupStructurewiseReport1.reloadData()
        } else if sender.tag == 3 {
            tbl_GroupStructurewiseReport.isHidden = true
            tbl_GroupStructurewiseReport1.isHidden = true
            tbl_GroupStructurewiseReport2.isHidden = false
            tbl_GroupStructurewiseReport3.isHidden = true
            tbl_GroupStructurewiseReport4.isHidden = true
            tbl_GroupStructurewiseReport5.isHidden = true
            self.tbl_GroupStructurewiseReport2.reloadData()
        } else if sender.tag == 4 {
            tbl_GroupStructurewiseReport.isHidden = true
            tbl_GroupStructurewiseReport1.isHidden = true
            tbl_GroupStructurewiseReport2.isHidden = true
            tbl_GroupStructurewiseReport3.isHidden = false
            tbl_GroupStructurewiseReport4.isHidden = true
            tbl_GroupStructurewiseReport5.isHidden = true
            self.tbl_GroupStructurewiseReport3.reloadData()
        } else if sender.tag == 5 {
            tbl_GroupStructurewiseReport.isHidden = true
            tbl_GroupStructurewiseReport1.isHidden = true
            tbl_GroupStructurewiseReport2.isHidden = true
            tbl_GroupStructurewiseReport3.isHidden = true
            tbl_GroupStructurewiseReport4.isHidden = false
            tbl_GroupStructurewiseReport5.isHidden = true
            self.tbl_GroupStructurewiseReport4.reloadData()
        } else {
            tbl_GroupStructurewiseReport.isHidden = true
            tbl_GroupStructurewiseReport1.isHidden = true
            tbl_GroupStructurewiseReport2.isHidden = true
            tbl_GroupStructurewiseReport3.isHidden = true
            tbl_GroupStructurewiseReport4.isHidden = true
            tbl_GroupStructurewiseReport5.isHidden = false
            self.tbl_GroupStructurewiseReport5.reloadData()
        }
    }
}
extension ReportVC3 : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }else {
            return (Arr_GroupSReport.count == 0) ? Arr_GroupSReport.count : Arr_GroupSReport[0].groupresults!.count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == tbl_GroupStructurewiseReport {
            if indexPath.section == 0 {
                let cell : GroupStructurewiseReportHeadercell = tableView.dequeueReusableCell(withIdentifier: "GroupStructurewiseReportHeadercell") as! GroupStructurewiseReportHeadercell
                return cell
            } else {
                let cell : GroupStructurewiseReportcell = tableView.dequeueReusableCell(withIdentifier: "GroupStructurewiseReportcell") as! GroupStructurewiseReportcell
                cell.DisplayCell(Arr_Data: Arr_GroupSReport, indexpath: indexPath)
                return cell
            }
        } else if tableView == tbl_GroupStructurewiseReport1 {
            if indexPath.section == 0 {
                let cell : GroupStructurewiseReportHeadercell1 = tableView.dequeueReusableCell(withIdentifier: "GroupStructurewiseReportHeadercell1") as! GroupStructurewiseReportHeadercell1
                return cell
            } else {
                let cell : GroupStructurewiseReportcell1 = tableView.dequeueReusableCell(withIdentifier: "GroupStructurewiseReportcell1") as! GroupStructurewiseReportcell1
                cell.DisplayCell(Arr_Data: Arr_GroupSReport, indexpath: indexPath)
                return cell
            }
        } else if tableView == tbl_GroupStructurewiseReport2 {
            if indexPath.section == 0 {
                let cell : GroupStructurewiseReportHeadercell2 = tableView.dequeueReusableCell(withIdentifier: "GroupStructurewiseReportHeadercell2") as! GroupStructurewiseReportHeadercell2
                return cell
            } else {
                let cell : GroupStructurewiseReportcell2 = tableView.dequeueReusableCell(withIdentifier: "GroupStructurewiseReportcell2") as! GroupStructurewiseReportcell2
                return cell
            }
        } else if tableView == tbl_GroupStructurewiseReport3 {
            if indexPath.section == 0 {
                let cell : GroupStructurewiseReportHeadercell3 = tableView.dequeueReusableCell(withIdentifier: "GroupStructurewiseReportHeadercell3") as! GroupStructurewiseReportHeadercell3
                return cell
            } else {
                let cell : GroupStructurewiseReportcell3 = tableView.dequeueReusableCell(withIdentifier: "GroupStructurewiseReportcell3") as! GroupStructurewiseReportcell3
                cell.DisplayCell(Arr_Data: Arr_GroupSReport, indexpath: indexPath)
                return cell
            }
        } else if tableView == tbl_GroupStructurewiseReport4 {
            if indexPath.section == 0 {
                let cell : GroupStructurewiseReportHeadercell4 = tableView.dequeueReusableCell(withIdentifier: "GroupStructurewiseReportHeadercell4") as! GroupStructurewiseReportHeadercell4
                return cell
            } else {
                let cell : GroupStructurewiseReportcell4 = tableView.dequeueReusableCell(withIdentifier: "GroupStructurewiseReportcell4") as! GroupStructurewiseReportcell4
                cell.DisplayCell(Arr_Data: Arr_GroupSReport, indexpath: indexPath)
                return cell
            }
        } else {
            if indexPath.section == 0 {
                let cell : GroupStructurewiseReportHeadercell5 = tableView.dequeueReusableCell(withIdentifier: "GroupStructurewiseReportHeadercell5") as! GroupStructurewiseReportHeadercell5
                return cell
            } else {
                let cell : GroupStructurewiseReportcell5 = tableView.dequeueReusableCell(withIdentifier: "GroupStructurewiseReportcell5") as! GroupStructurewiseReportcell5
                cell.DisplayCell(Arr_Data: Arr_GroupSReport, indexpath: indexPath)
                return cell
            }
        }
        
    }
}
