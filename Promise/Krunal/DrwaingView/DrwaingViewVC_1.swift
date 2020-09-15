//
//  DrwaingViewVC_1.swift
//  Promise
//
//  Created by macbook on 03/06/1942 Saka.
//  Copyright © 1942 Captain. All rights reserved.
//

import UIKit

class DrwaingViewVC_1: UIViewController {

    @IBOutlet weak var tbl_DrwaingView: UITableView!
    @IBOutlet weak var tbl_DrwaingView_2: UITableView!
    @IBOutlet weak var tbl_DrwaingView_3: UITableView!
    @IBOutlet weak var tbl_DrwaingView_4: UITableView!
    @IBOutlet weak var tbl_DrwaingView_5: UITableView!
    @IBOutlet weak var lbl_1: UILabel!
    @IBOutlet weak var lbl_2: UILabel!
    @IBOutlet weak var lbl_3: UILabel!
    @IBOutlet weak var lbl_4: UILabel!
    @IBOutlet weak var lbl_5: UILabel!
    var id = String()
    var arrviewData = [DrwaingViewModel]()
    override func viewDidLoad() {
        super.viewDidLoad()

         ServiceCall.shareInstance.Get_getDrwaingView(ViewController: self, Api_Str: Api_Urls.GET_API_drawing + id + "/" + "lines/")
        tbl_DrwaingView.isHidden = false
        tbl_DrwaingView_2.isHidden = true
        tbl_DrwaingView_3.isHidden = true
        tbl_DrwaingView_4.isHidden = true
        tbl_DrwaingView_5.isHidden = true
        
        lbl_1.backgroundColor = UIColor(red: 0.21, green: 0.20, blue: 0.51, alpha: 1.00)
        lbl_2.backgroundColor = .white
        lbl_3.backgroundColor = .white
        lbl_4.backgroundColor = .white
        lbl_5.backgroundColor = .white
    }
    @IBAction func btn_PageNum(_ sender: UIButton) {
        if sender.tag == 1 {
            tbl_DrwaingView.isHidden = false
            tbl_DrwaingView_2.isHidden = true
            tbl_DrwaingView_3.isHidden = true
            tbl_DrwaingView_4.isHidden = true
            tbl_DrwaingView_5.isHidden = true
            
            lbl_1.backgroundColor = UIColor(red: 0.21, green: 0.20, blue: 0.51, alpha: 1.00)
            lbl_2.backgroundColor = .white
            lbl_3.backgroundColor = .white
            lbl_4.backgroundColor = .white
            lbl_5.backgroundColor = .white
        } else if sender.tag == 2 {
            tbl_DrwaingView.isHidden = true
            tbl_DrwaingView_2.isHidden = false
            tbl_DrwaingView_3.isHidden = true
            tbl_DrwaingView_4.isHidden = true
            tbl_DrwaingView_5.isHidden = true
            
            lbl_1.backgroundColor = .white
            lbl_2.backgroundColor = UIColor(red: 0.21, green: 0.20, blue: 0.51, alpha: 1.00)
            lbl_3.backgroundColor = .white
            lbl_4.backgroundColor = .white
            lbl_5.backgroundColor = .white
        } else if sender.tag == 3 {
            tbl_DrwaingView.isHidden = true
            tbl_DrwaingView_2.isHidden = true
            tbl_DrwaingView_3.isHidden = false
            tbl_DrwaingView_4.isHidden = true
            tbl_DrwaingView_5.isHidden = true
            
            lbl_1.backgroundColor = .white
            lbl_2.backgroundColor = .white
            lbl_3.backgroundColor = UIColor(red: 0.21, green: 0.20, blue: 0.51, alpha: 1.00)
            lbl_4.backgroundColor = .white
            lbl_5.backgroundColor = .white
        } else if sender.tag == 4 {
            tbl_DrwaingView.isHidden = true
            tbl_DrwaingView_2.isHidden = true
            tbl_DrwaingView_3.isHidden = true
            tbl_DrwaingView_4.isHidden = false
            tbl_DrwaingView_5.isHidden = true
            
            lbl_1.backgroundColor = .white
            lbl_2.backgroundColor = .white
            lbl_3.backgroundColor = .white
            lbl_4.backgroundColor = UIColor(red: 0.21, green: 0.20, blue: 0.51, alpha: 1.00)
            lbl_5.backgroundColor = .white
        } else {
            tbl_DrwaingView.isHidden = true
            tbl_DrwaingView_2.isHidden = true
            tbl_DrwaingView_3.isHidden = true
            tbl_DrwaingView_4.isHidden = true
            tbl_DrwaingView_5.isHidden = false
            
            lbl_1.backgroundColor = .white
            lbl_2.backgroundColor = .white
            lbl_3.backgroundColor = .white
            lbl_4.backgroundColor = .white
            lbl_5.backgroundColor = UIColor(red: 0.21, green: 0.20, blue: 0.51, alpha: 1.00)
        }
        
    }
    
    
    
    
}

extension DrwaingViewVC_1 : UITableViewDataSource , UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        if tableView == tbl_DrwaingView {
            return 2
        } else if tableView == tbl_DrwaingView_2 {
            return 2
        } else if tableView == tbl_DrwaingView_3 {
            return 2
        } else if tableView == tbl_DrwaingView_4 {
            return 2
        } else {
            return 2
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tbl_DrwaingView {
            if section == 0 {
                return 1
            } else {
                return arrviewData.count
            }
        } else if tableView == tbl_DrwaingView_2 {
            if section == 0 {
                return 1
            } else {
                return arrviewData.count
            }
        } else if tableView == tbl_DrwaingView_3 {
            if section == 0 {
                return 1
            } else {
                return arrviewData.count
            }
        } else if tableView == tbl_DrwaingView_4 {
            if section == 0 {
                return 1
            } else {
                return arrviewData.count
            }
        } else {
            if section == 0 {
                return 1
            } else {
                return arrviewData.count
            }
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        if tableView == tbl_DrwaingView {
            if indexPath.section == 0 {
                let cell : DrwaingViewHeaderCell_1 = tableView.dequeueReusableCell(withIdentifier: "DrwaingViewHeaderCell_1") as! DrwaingViewHeaderCell_1
                   return cell
            } else {
                let cell : DrwaingViewCell_1 = tableView.dequeueReusableCell(withIdentifier: "DrwaingViewCell_1") as! DrwaingViewCell_1
                cell.DisplayCell(arr : arrviewData,indexPath : indexPath)
                return cell
            }
        } else if tableView == tbl_DrwaingView_2 {
            if indexPath.section == 0 {
                let cell : DrwaingViewHeaderCell_2 = tableView.dequeueReusableCell(withIdentifier: "DrwaingViewHeaderCell_2") as! DrwaingViewHeaderCell_2
                   return cell
            } else {
                let cell : DrwaingViewCell_2 = tableView.dequeueReusableCell(withIdentifier: "DrwaingViewCell_2") as! DrwaingViewCell_2
                cell.DisplayCell(arr : arrviewData,indexPath : indexPath)
                return cell
            }
        } else if tableView == tbl_DrwaingView_3 {
           if indexPath.section == 0 {
                let cell : DrwaingViewHeaderCell_3 = tableView.dequeueReusableCell(withIdentifier: "DrwaingViewHeaderCell_3") as! DrwaingViewHeaderCell_3
                return cell
                   } else {
                let cell : DrwaingViewCell_3 = tableView.dequeueReusableCell(withIdentifier: "DrwaingViewCell_3") as! DrwaingViewCell_3
                cell.DisplayCell(arr : arrviewData,indexPath : indexPath)
                return cell
            }
        } else if tableView == tbl_DrwaingView_4 {
              if indexPath.section == 0 {
               let cell : DrwaingViewHeaderCell_4 = tableView.dequeueReusableCell(withIdentifier: "DrwaingViewHeaderCell_4") as! DrwaingViewHeaderCell_4
               return cell
                  } else {
               let cell : DrwaingViewCell_4 = tableView.dequeueReusableCell(withIdentifier: "DrwaingViewCell_4") as! DrwaingViewCell_4
               cell.DisplayCell(arr : arrviewData,indexPath : indexPath)
               return cell
               }
        } else {
            if indexPath.section == 0 {
                let cell : DrwaingViewHeaderCell_5 = tableView.dequeueReusableCell(withIdentifier: "DrwaingViewHeaderCell_5") as! DrwaingViewHeaderCell_5
                return cell
                   } else {
                let cell : DrwaingViewCell_5 = tableView.dequeueReusableCell(withIdentifier: "DrwaingViewCell_5") as! DrwaingViewCell_5
                cell.DisplayCell(arr : arrviewData,indexPath : indexPath)
                return cell
            }
        }

    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
