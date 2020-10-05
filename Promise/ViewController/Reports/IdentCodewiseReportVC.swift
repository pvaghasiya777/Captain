//
//  IdentCodewiseReportVC.swift
//  report
//
//  Created by macbook on 09/07/1942 Saka.
//  Copyright © 1942 com.mac. All rights reserved.
//

import UIKit

class IdentCodewiseReportVC: UIViewController {
    @IBOutlet weak var tbl_IdentCodewiseReport: UITableView!
    @IBOutlet weak var tbl_IdentCodewiseReport_1: UITableView!
    @IBOutlet weak var view_IdentCodewiseReport: UIView!
    @IBOutlet weak var btn_IdentCodewiseReport_1: UIButton!
    @IBOutlet weak var btn_PackagewiseReport_2: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
            tbl_IdentCodewiseReport.isHidden = false
            tbl_IdentCodewiseReport_1.isHidden = true
    }
    @IBAction func btn_DetailFigureReportNum(_ sender: UIButton) {
        if sender.tag == 1 {
            tbl_IdentCodewiseReport.isHidden = false
            tbl_IdentCodewiseReport_1.isHidden = true
        } else if sender.tag == 2{
            tbl_IdentCodewiseReport.isHidden = true
            tbl_IdentCodewiseReport_1.isHidden =  false
        }
    }
}
extension IdentCodewiseReportVC : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        if tableView == tbl_IdentCodewiseReport {
            return 2
        } else {
            return 2
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tbl_IdentCodewiseReport {
            if section == 0 {
                return 1
            } else {
                return 2
            }
        } else {
            if section == 0 {
                return 1
            } else {
                return 2
            }
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == tbl_IdentCodewiseReport {
            if indexPath.section == 0 {
                let cell : IdentCodewiseReportHeaderCell = tableView.dequeueReusableCell(withIdentifier: "IdentCodewiseReportHeaderCell") as! IdentCodewiseReportHeaderCell
                return cell
            } else {
                let cell : IdentCodewiseReportCell = tableView.dequeueReusableCell(withIdentifier: "IdentCodewiseReportCell") as! IdentCodewiseReportCell
                return cell
            }
        } else {
            if indexPath.section == 0 {
                let cell : IdentCodewiseReportHeaderCell1 = tableView.dequeueReusableCell(withIdentifier: "IdentCodewiseReportHeaderCell1") as! IdentCodewiseReportHeaderCell1
                return cell
            } else {
                let cell : IdentCodewiseReportCell1 = tableView.dequeueReusableCell(withIdentifier: "IdentCodewiseReportCell1") as! IdentCodewiseReportCell1
                return cell
            }
        }
        
    }
}
