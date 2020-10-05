//
//  ReportVC.swift
//  Promise
//
//  Created by Captain on 29/07/20.
//  Copyright © 2020 Captain. All rights reserved.
//

import UIKit

class ReportVC: UIViewController,SWRevealViewControllerDelegate {

    @IBOutlet weak var tbl_data: UITableView!
    @IBOutlet weak var searchview: UISearchBar!
    @IBOutlet weak var btn_Action: UIButton!
    @IBOutlet weak var btn_Filter: UIButton!
    @IBOutlet weak var btn_Short: UIButton!
    @IBOutlet weak var btn_More: UIButton!
    @IBOutlet weak var btn_M_Released: UIButton!
    @IBOutlet weak var btn_Unlock: UIButton!
    @IBOutlet weak var btn_Previous: UIButton!
    @IBOutlet weak var btn_Next: UIButton!
    @IBOutlet weak var lbl_ShowPageNum: UILabel!
    @IBOutlet weak var lbl_PageNum: UILabel!
    @IBOutlet var menu_Barbutton: UIBarButtonItem!
    
    var selectedIndex = -1
    var isCoollaspe = false
    override func viewDidLoad() {
        super.viewDidLoad()
        tbl_data.estimatedRowHeight = 243
        tbl_data.rowHeight = 50
        tbl_data.register(UINib(nibName: "PackingReportHeaderCell", bundle: nil), forCellReuseIdentifier: "PackingReportHeaderCell")
         tbl_data.register(UINib(nibName: "PackingReportCell", bundle: nil), forCellReuseIdentifier: "PackingReportCell")
        self.navigationItem.title = "Report"
        self.Initialization()
    }
    func Initialization() {
        if revealViewController() != nil {
            self.revealViewController().delegate = self
            menu_Barbutton.target = self.revealViewController()
            menu_Barbutton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            self.revealViewController()?.rearViewRevealWidth = 280
        }
    }
}
extension ReportVC : UITableViewDataSource ,UITableViewDelegate{
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return arrdata.count
//    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if selectedIndex == indexPath.row && isCoollaspe == true {
            return 221
        } else {
            return  60
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : PackingReportCell = tableView.dequeueReusableCell(withIdentifier: "PackingReportCell") as! PackingReportCell
        if isCoollaspe {
             cell.accessoryView = UIImageView(image: UIImage(named: "ic_down_arrow"))
        } else {
            cell.accessoryView = UIImageView(image: UIImage(named: "ic_grey_right"))
        }
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if selectedIndex == indexPath.row {
            if isCoollaspe == false {
                self.isCoollaspe == true
            } else {
                self.isCoollaspe == false
            }
        } else {
            self.isCoollaspe = true
        }
        self.selectedIndex = indexPath.row
        tbl_data.reloadRows(at: [indexPath], with: .automatic)
    }
}

