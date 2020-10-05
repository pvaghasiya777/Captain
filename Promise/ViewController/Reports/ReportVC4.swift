//
//  ReportVC4.swift
//  report
//
//  Created by macbook on 22/06/1942 Saka.
//  Copyright © 1942 com.mac. All rights reserved.
//

import UIKit
import Alamofire
class ReportVC4: UIViewController {

    @IBOutlet weak var tbl_SummaryReport: UITableView!
    @IBOutlet weak var tbl_SummaryReport1: UITableView!
    
    @IBOutlet weak var view_PackagewiseReport: UIView!
    //    Markwise Report
    @IBOutlet weak var btn_PackingListReport_1: UIButton!
    @IBOutlet weak var btn_PackingListReport_2: UIButton!
    @IBOutlet weak var lbl_SummaryReportPageNumber: UILabel!
    
    @IBOutlet weak var btn_Previous_SummaryReport: UIButton!
    @IBOutlet weak var btn_Next_SummaryReport: UIButton!
    @IBOutlet weak var lbl_ShowPage_Count_SummaryReport: UILabel!
    @IBOutlet weak var lbl_PageNum_SummaryReport: UILabel!
    
    
    
    var Arr_Summary = [SummaryReportModel]()
    var pageName = String()
    var param : NSDictionary = NSDictionary()
var PageCount = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        barbuttonheader()
        title = "Summary Report"
        tbl_SummaryReport.isHidden = false
        tbl_SummaryReport1.isHidden = true
        ReportAPI.shareInstance.Get_ReportList(ViewController: self, Api_Str: Api_Urls.GET_API_SummaryReport, params: (param.count == 0) ? ["project_id":"1"] : param as! [String : Any] , tag: 10)
        btn_Next_SummaryReport.addTarget(self, action: #selector(btn_Next_SummaryReport(_:)), for: .touchUpInside)
              btn_Previous_SummaryReport.addTarget(self, action: #selector(btn_Previous_SummaryReport(_:)), for: .touchUpInside)
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
        case  "Summary Report" :
            ReportAPI.shareInstance.Get_ReportList(ViewController: self, Api_Str: Api_Urls.GET_API_SummaryReport, params: param as! Parameters, tag: 10)
        default:
            print(pageName)
        }
    }
    //MARK:- Button next previous Click
   //Markwise Report
      @objc func btn_Next_SummaryReport(_ sender: UIButton) {
      
      if Arr_Summary[0].next != nil {
          ReportAPI.shareInstance.Get_ReportList(ViewController: self, Api_Str: Arr_Summary[0].next!, params: [:],tag: 10)
          self.PageCount = PageCount + 1
          self.lbl_ShowPage_Count_SummaryReport.text = String(describing: PageCount)
      }else {
          Utils.showToastWithMessageAtCenter(message: "Next Data not Available")
      }
       }
      @objc func btn_Previous_SummaryReport(_ sender: UIButton) {
          if Arr_Summary[0].next != nil {
              ReportAPI.shareInstance.Get_ReportList(ViewController: self, Api_Str: Arr_Summary[0].next!, params: [:],tag: 10)
              self.PageCount = PageCount - 1
              self.lbl_ShowPage_Count_SummaryReport.text = String(describing: PageCount)
          }else {
              Utils.showToastWithMessageAtCenter(message: "Next Data not Available")
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

   
