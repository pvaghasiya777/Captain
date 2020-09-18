//
//  Report2.swift
//  report
//
//  Created by macbook on 18/06/1942 Saka.
//  Copyright © 1942 com.mac. All rights reserved.
//

import UIKit

class Report2: UIViewController {
    //MARK:- IBOutlet
    @IBOutlet weak var tbl_POPositionwiseReport: UITableView!
    @IBOutlet weak var tbl_POPositionwiseReport_1: UITableView!
    @IBOutlet weak var tbl_StructurewiseReport: UITableView!
    @IBOutlet weak var tbl_StructurewiseReport_1: UITableView!
    @IBOutlet weak var tbl_StructurewiseReport_2: UITableView!
    @IBOutlet weak var tbl_StructurewiseReport_3: UITableView!
    @IBOutlet weak var tbl_StructurewiseReport_4: UITableView!
    // View
    @IBOutlet weak var view_POPositionwiseReport: UIView!
    @IBOutlet weak var view_StructurewiseReport: UIView!
    //Button
    @IBOutlet weak var btn_POPositionwiseReport_1: UIButton!
    @IBOutlet weak var btn_POPositionwiseReport_2: UIButton!
    @IBOutlet weak var btn_StructurewiseReport_1: UIButton!
    @IBOutlet weak var btn_StructurewiseReport_2: UIButton!
    @IBOutlet weak var btn_StructurewiseReport_3: UIButton!
    @IBOutlet weak var btn_StructurewiseReport_4: UIButton!
    @IBOutlet weak var btn_StructurewiseReport_5: UIButton!
    //MARK:- Variable
    var pageName = String()
    var Arr_PoPositionReport = [POPositionWiseReportModel]()
    var Arr_IdentCodeReport = [IdentCodewiseReportModel]()
    var Arr_StrucherWiseReport : NSMutableArray = NSMutableArray()
    var Str_markWiseReportNext = ""
    var Str_markWiseReportPrevious = ""
    
    //MARK:-
    override func viewDidLoad() {
        super.viewDidLoad()
        self.Initlization()
    }
    func Initlization(){
        if pageName == "PO Positionwise Report" {
            title = "PO Positionwise Report"
            ReportAPI.shareInstance.Get_ReportList(ViewController: self, Api_Str: Api_Urls.GET_API_POPositionReport, params: ["project_id":"1"], tag: 6)
            tbl_POPositionwiseReport.isHidden = false
            tbl_POPositionwiseReport_1.isHidden = true
            view_StructurewiseReport.isHidden = true
            view_POPositionwiseReport.isHidden = false
            tbl_StructurewiseReport.isHidden = true
            tbl_StructurewiseReport_1.isHidden = true
            tbl_StructurewiseReport_2.isHidden = true
            tbl_StructurewiseReport_3.isHidden = true
            tbl_StructurewiseReport_4.isHidden = true
        } else if pageName == "Ident Codewise Report"{
            //load array
            title = "Ident Codewise Report"
            ReportAPI.shareInstance.Get_ReportList(ViewController: self, Api_Str: Api_Urls.GET_API_IdentCodeWiseReport, params: ["project_id":"1"], tag: 7)
            tbl_POPositionwiseReport.isHidden = false
            tbl_POPositionwiseReport_1.isHidden = true
            view_StructurewiseReport.isHidden = true
            view_POPositionwiseReport.isHidden = false
            tbl_StructurewiseReport.isHidden = true
            tbl_StructurewiseReport_1.isHidden = true
            tbl_StructurewiseReport_2.isHidden = true
            tbl_StructurewiseReport_3.isHidden = true
            tbl_StructurewiseReport_4.isHidden = true
        } else if pageName == "Structurewise Report" {
            title = "Structurewise Report"
            ReportAPI.shareInstance.Get_ReportList(ViewController: self, Api_Str: Api_Urls.GET_API_StrucherWiseReport, params: ["project_id":"1"], tag: 8)
            tbl_POPositionwiseReport.isHidden = true
            tbl_POPositionwiseReport_1.isHidden = true
            view_StructurewiseReport.isHidden = false
            view_POPositionwiseReport.isHidden = true
            tbl_StructurewiseReport.isHidden = false
            tbl_StructurewiseReport_1.isHidden = true
            tbl_StructurewiseReport_2.isHidden = true
            tbl_StructurewiseReport_3.isHidden = true
            tbl_StructurewiseReport_4.isHidden = true
        }
    }
    //MARK:-
    @IBAction func btn_POPositionwiseReportNum(_ sender: UIButton) {
        if sender.tag == 1 {
            tbl_POPositionwiseReport.isHidden = false
            tbl_POPositionwiseReport_1.isHidden = true
            self.tbl_POPositionwiseReport.reloadData()
        } else if sender.tag == 2 {
            tbl_POPositionwiseReport.isHidden = true
            tbl_POPositionwiseReport_1.isHidden =  false
            self.tbl_POPositionwiseReport_1.reloadData()
        }
    }
    @IBAction func btn_StructurewiseReportNum(_ sender: UIButton) {
        if sender.tag == 3 {
            tbl_StructurewiseReport.isHidden = false
            tbl_StructurewiseReport_1.isHidden = true
            tbl_StructurewiseReport_2.isHidden = true
            tbl_StructurewiseReport_3.isHidden = true
            tbl_StructurewiseReport_4.isHidden = true
            self.tbl_StructurewiseReport.reloadData()
        } else if sender.tag == 4 {
            tbl_StructurewiseReport.isHidden = true
            tbl_StructurewiseReport_1.isHidden = false
            tbl_StructurewiseReport_2.isHidden = true
            tbl_StructurewiseReport_3.isHidden = true
            tbl_StructurewiseReport_4.isHidden = true
            self.tbl_StructurewiseReport_1.reloadData()
        } else if sender.tag == 5 {
            tbl_StructurewiseReport.isHidden = true
            tbl_StructurewiseReport_1.isHidden = true
            tbl_StructurewiseReport_2.isHidden = false
            tbl_StructurewiseReport_3.isHidden = true
            tbl_StructurewiseReport_4.isHidden = true
            self.tbl_StructurewiseReport_2.reloadData()
        } else if sender.tag == 6 {
            tbl_StructurewiseReport.isHidden = true
            tbl_StructurewiseReport_1.isHidden = true
            tbl_StructurewiseReport_2.isHidden = true
            tbl_StructurewiseReport_3.isHidden = false
            tbl_StructurewiseReport_4.isHidden = true
            self.tbl_StructurewiseReport_3.reloadData()
        } else if sender.tag == 7 {
            tbl_StructurewiseReport.isHidden = true
            tbl_StructurewiseReport_1.isHidden = true
            tbl_StructurewiseReport_2.isHidden = true
            tbl_StructurewiseReport_3.isHidden = true
            tbl_StructurewiseReport_4.isHidden = false
            self.tbl_StructurewiseReport_4.reloadData()
        }
    }
}
extension Report2 : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }else {
            if tableView == tbl_POPositionwiseReport {
                return (Arr_PoPositionReport.count == 0) ? Arr_PoPositionReport.count : Arr_PoPositionReport[0].results!.count
            } else if tableView == tbl_POPositionwiseReport_1 {
                return (Arr_PoPositionReport.count == 0) ? Arr_PoPositionReport.count : Arr_PoPositionReport[0].results!.count
            } else if tableView == tbl_StructurewiseReport {
                return Arr_StrucherWiseReport.count
            } else if tableView == tbl_StructurewiseReport_1 {
                return Arr_StrucherWiseReport.count
            } else if tableView == tbl_StructurewiseReport_2 {
                return Arr_StrucherWiseReport.count
                
            } else if tableView == tbl_StructurewiseReport_3 {
                return Arr_StrucherWiseReport.count
            } else  {
                return Arr_StrucherWiseReport.count
            }
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == tbl_POPositionwiseReport {
            if indexPath.section == 0 {
                let cell : POPositionwiseReportHeadercell = tableView.dequeueReusableCell(withIdentifier: "POPositionwiseReportHeadercell") as! POPositionwiseReportHeadercell
                return cell
            } else {
                let cell : POPositionwiseReportcell = tableView.dequeueReusableCell(withIdentifier: "POPositionwiseReportcell") as! POPositionwiseReportcell
                cell.DisplayCell(Arr_Data: Arr_PoPositionReport, indexpath: indexPath)
                return cell
            }
        } else if tableView == tbl_POPositionwiseReport_1 {
            if indexPath.section == 0 {
                let cell : POPositionwiseReportHeadercell1 = tableView.dequeueReusableCell(withIdentifier: "POPositionwiseReportHeadercell1") as! POPositionwiseReportHeadercell1
                return cell
            } else {
                let cell : POPositionwiseReportcell1 = tableView.dequeueReusableCell(withIdentifier: "POPositionwiseReportcell1") as! POPositionwiseReportcell1
                cell.DisplayCell(Arr_Data: Arr_PoPositionReport, indexpath: indexPath)
                return cell
            }
        } else if tableView == tbl_StructurewiseReport {
            if indexPath.section == 0 {
                let cell : StructurewiseReportHeadercell = tableView.dequeueReusableCell(withIdentifier: "StructurewiseReportHeadercell") as! StructurewiseReportHeadercell
                return cell
            } else {
                let cell : StructurewiseReportcell = tableView.dequeueReusableCell(withIdentifier: "StructurewiseReportcell") as! StructurewiseReportcell
                cell.DisplayCell(Arr_Data: Arr_StrucherWiseReport, indexpath: indexPath)
                return cell
            }
        } else if tableView == tbl_StructurewiseReport_1 {
            if indexPath.section == 0 {
                let cell : StructurewiseReportHeadercell1 = tableView.dequeueReusableCell(withIdentifier: "StructurewiseReportHeadercell1") as! StructurewiseReportHeadercell1
                return cell
            } else {
                let cell : StructurewiseReportcell1 = tableView.dequeueReusableCell(withIdentifier: "StructurewiseReportcell1") as! StructurewiseReportcell1
                cell.DisplayCell(Arr_Data: Arr_StrucherWiseReport, indexpath: indexPath)
                return cell
            }
        } else if tableView == tbl_StructurewiseReport_2 {
            if indexPath.section == 0 {
                let cell : StructurewiseReportHeadercell2 = tableView.dequeueReusableCell(withIdentifier: "StructurewiseReportHeadercell2") as! StructurewiseReportHeadercell2
                return cell
            } else {
                let cell : StructurewiseReportcell2 = tableView.dequeueReusableCell(withIdentifier: "StructurewiseReportcell2") as! StructurewiseReportcell2
                cell.DisplayCell(Arr_Data: Arr_StrucherWiseReport, indexpath: indexPath)
                return cell
            }
        } else if tableView == tbl_StructurewiseReport_3 {
            if indexPath.section == 0 {
                let cell : StructurewiseReportHeadercell3 = tableView.dequeueReusableCell(withIdentifier: "StructurewiseReportHeadercell3") as! StructurewiseReportHeadercell3
                return cell
            } else {
                let cell : StructurewiseReportcell3 = tableView.dequeueReusableCell(withIdentifier: "StructurewiseReportcell3") as! StructurewiseReportcell3
                cell.DisplayCell(Arr_Data: Arr_StrucherWiseReport, indexpath: indexPath)
                return cell
            }
        } else {
            if indexPath.section == 0 {
                let cell : StructurewiseReportHeadercell4 = tableView.dequeueReusableCell(withIdentifier: "StructurewiseReportHeadercell4") as! StructurewiseReportHeadercell4
                return cell
            } else {
                let cell : StructurewiseReportcell4 = tableView.dequeueReusableCell(withIdentifier: "StructurewiseReportcell4") as! StructurewiseReportcell4
                cell.DisplayCell(Arr_Data: Arr_StrucherWiseReport, indexpath: indexPath)
                return cell
            }
        }
        
    }
}
