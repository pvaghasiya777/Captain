//
//  ReportVC3.swift
//  report
//
//  Created by macbook on 19/06/1942 Saka.
//  Copyright © 1942 com.mac. All rights reserved.
//

import UIKit
import Alamofire
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
    @IBOutlet weak var lbl_GroupStrucherPageNumber: UILabel!
    
    @IBOutlet weak var btn_Previous_GroupStructurewiseReport: UIButton!
    @IBOutlet weak var btn_Next_GroupStructurewiseReport: UIButton!
    @IBOutlet weak var lbl_ShowPage_Count_GroupStructurewiseReport: UILabel!
    @IBOutlet weak var lbl_PageNum_GroupStructurewiseReport: UILabel!
    
    
    var pageName = String()
    var Arr_GroupSReport = [GroupStrucherWiseReportModel]()
    var param : NSDictionary = NSDictionary()
    var PageCount = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        barbuttonheader()
        title = "Group Structure wise Report"
        ReportAPI.shareInstance.Get_ReportList(ViewController: self, Api_Str: Api_Urls.GET_API_GroupStrucherWiseReport, params: (param.count == 0) ? ["project_id":"1"] : param as! [String : Any] , tag: 9)
        tbl_GroupStructurewiseReport.isHidden = false
        tbl_GroupStructurewiseReport1.isHidden = true
        tbl_GroupStructurewiseReport2.isHidden = true
        tbl_GroupStructurewiseReport3.isHidden = true
        tbl_GroupStructurewiseReport4.isHidden = true
        tbl_GroupStructurewiseReport5.isHidden = true
        btn_Next_GroupStructurewiseReport.addTarget(self, action: #selector(btn_Next_GroupStructurewiseReport(_:)), for: .touchUpInside)
        btn_Previous_GroupStructurewiseReport.addTarget(self, action: #selector(btn_Previous_GroupStructurewiseReport(_:)), for: .touchUpInside)
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
        switch pageName {
        case "Group Structure wise Report":
            ReportAPI.shareInstance.Get_ReportList(ViewController: self, Api_Str: Api_Urls.GET_API_GroupStrucherWiseReport, params: param as! Parameters, tag: 9)
        default:
            print(pageName)
        }
    }
    //MARK:- Button next previous Click
    //Group Structure wise Report
    @objc func btn_Next_GroupStructurewiseReport(_ sender: UIButton) {
        if Arr_GroupSReport[0].next != nil {
            ReportAPI.shareInstance.Get_ReportList(ViewController: self, Api_Str: Arr_GroupSReport[0].next!, params: [:],tag: 9)
            self.PageCount = PageCount + 1
            self.lbl_ShowPage_Count_GroupStructurewiseReport.text = String(describing: PageCount)
        }else {
            Utils.showToastWithMessageAtCenter(message: "Next Data not Available")
        }
    }
    @objc func btn_Previous_GroupStructurewiseReport(_ sender: UIButton) {
        if Arr_GroupSReport[0].next != nil {
            ReportAPI.shareInstance.Get_ReportList(ViewController: self, Api_Str: Arr_GroupSReport[0].next!, params: [:],tag: 9)
            self.PageCount = PageCount + 1
            self.lbl_ShowPage_Count_GroupStructurewiseReport.text = String(describing: PageCount)
        }else {
            Utils.showToastWithMessageAtCenter(message: "Next Data not Available")
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
