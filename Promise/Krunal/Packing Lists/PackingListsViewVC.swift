//
//  PackingListsViewVC.swift
//  Promise
//
//  Created by macbook on 13/06/1942 Saka.
//  Copyright © 1942 Captain. All rights reserved.
//

import UIKit

class PackingListsViewVC: UIViewController {
    //MARK:- IBOutlet
    @IBOutlet weak var view_MasterDetailButton: UIView!
    @IBOutlet weak var tbl_MasterDetails_1: UITableView!
    @IBOutlet weak var tbl_MasterDetails_2: UITableView!
    @IBOutlet weak var tbl_SingleDetails: UITableView!
    @IBOutlet weak var btn_MasterDetails: UIButton!
    @IBOutlet weak var btn_SingleDetails: UIButton!
    @IBOutlet weak var btn_MasterDetails_P1: UIButton!
    @IBOutlet weak var btn_MasterDetails_P2: UIButton!
    @IBOutlet weak var lbl_MasterDetails: UILabel!
    @IBOutlet weak var lbl_SingleDetails: UILabel!
    //MARK:- variable
    var Arr_PackingListDetail = [PackinglistIDModel]()
    var Arr_SingleDetail = [Pl_single_ids]()
    var str_ID = ""
    
    //MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        Initialisation()
    }
    override func viewWillAppear(_ animated: Bool) {
       super.viewWillAppear(animated)
       self.navigationItem.title = "Packing List View"
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationItem.title = ""
    }
    //MARK:- Initialisation
    func Initialisation(){
        let appurl : String = Api_Urls.GET_API_packingList + "\(str_ID)" + "/"
        ServiceCall.shareInstance.Get_packingList_Edit(ViewController: self, Api_Str: appurl,tag: 1)
        tbl_MasterDetails_1.isHidden = false
        tbl_MasterDetails_2.isHidden = true
        tbl_SingleDetails.isHidden = true
        lbl_MasterDetails.backgroundColor = UIColor(red: 0.21, green: 0.20, blue: 0.51, alpha: 1.00)
        lbl_SingleDetails.backgroundColor = .white
        self.view_MasterDetailButton.isHidden = false
        
    }
    func SetSingleDetail() {
        let Arr_SingleID = Arr_PackingListDetail[0].pl_master_ids!.map{($0.pl_single_ids!)}.joined()
        Arr_SingleID.forEach { Arr_SingleDetail.append($0)}
    }
    //MARK:- Button Click
    @IBAction func btn_SegmentBtn(_ sender: UIButton) {
        if sender.tag == 0 {
            tbl_MasterDetails_1.isHidden = false
            tbl_MasterDetails_2.isHidden = true
            tbl_SingleDetails.isHidden = true
            self.view_MasterDetailButton.isHidden = false
            self.tbl_MasterDetails_1.reloadData()
            lbl_MasterDetails.backgroundColor = UIColor(red: 0.21, green: 0.20, blue: 0.51, alpha: 1.00)
            lbl_SingleDetails.backgroundColor = .white
        } else {
            tbl_MasterDetails_1.isHidden = true
            tbl_MasterDetails_2.isHidden = true
            tbl_SingleDetails.isHidden = false
            self.tbl_SingleDetails.reloadData()
            self.view_MasterDetailButton.isHidden = true
            lbl_MasterDetails.backgroundColor = .white
            lbl_SingleDetails.backgroundColor = UIColor(red: 0.21, green: 0.20, blue: 0.51, alpha: 1.00)
        }
    }
    @IBAction func btn_NextPrevious_Click(_ sender: UIButton) {
        if sender.tag == 1 {
            tbl_MasterDetails_1.isHidden = false
            tbl_MasterDetails_2.isHidden = true
            tbl_SingleDetails.isHidden = true
            self.tbl_MasterDetails_1.reloadData()
        } else {
            tbl_MasterDetails_1.isHidden = true
            tbl_MasterDetails_2.isHidden = false
            tbl_SingleDetails.isHidden = true
            self.tbl_MasterDetails_2.reloadData()
        }
    }
}
//MARK:- TableView Initialisation
extension PackingListsViewVC : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tbl_MasterDetails_1 {
            if section == 0 {
                return 1
            } else {
                return (Arr_PackingListDetail.count == 0) ? Arr_PackingListDetail.count : Arr_PackingListDetail[0].pl_master_ids!.count
            }
        } else if tableView == tbl_MasterDetails_2 {
            if section == 0 {
                return 1
            } else {
                return (Arr_PackingListDetail.count == 0) ? Arr_PackingListDetail.count : Arr_PackingListDetail[0].pl_master_ids!.count
            }
        } else {
            if section == 0 {
                return 1
            } else {
                return Arr_SingleDetail.count
            }
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == tbl_MasterDetails_1 {
            if indexPath.section == 0 {
                let cell : MasterDetailsHeader1Cell = tableView.dequeueReusableCell(withIdentifier: "MasterDetailsHeader1Cell") as! MasterDetailsHeader1Cell
                return cell
                
            } else {
                let cell : MasterDetails1Cell = tableView.dequeueReusableCell(withIdentifier: "MasterDetails1Cell") as! MasterDetails1Cell
                cell.DisplayCell(Arr_Data: Arr_PackingListDetail, indexPath: indexPath)
                return cell
            }
        } else if tableView == tbl_MasterDetails_2 {
            if indexPath.section == 0 {
                let cell : MasterDetailshedear2Cell = tableView.dequeueReusableCell(withIdentifier: "MasterDetailshedear2Cell") as! MasterDetailshedear2Cell
                return cell
                
            } else {
                let cell : MasterDetails2Cell = tableView.dequeueReusableCell(withIdentifier: "MasterDetails2Cell") as! MasterDetails2Cell
                cell.DisplayCell(Arr_Data: Arr_PackingListDetail, indexPath: indexPath)
                return cell
            }
        } else {
            if indexPath.section == 0 {
                let cell : SingleDetailsHeaderCell = tableView.dequeueReusableCell(withIdentifier: "SingleDetailsHeaderCell") as! SingleDetailsHeaderCell
                return cell
                
            } else {
                let cell : SingleDetailsCell = tableView.dequeueReusableCell(withIdentifier: "SingleDetailsCell") as! SingleDetailsCell
                cell.DisplayCell(Arr_Data: Arr_SingleDetail, indexPath: indexPath)
                return cell
            }
        }
        let cell = UITableViewCell()
        return cell
    }
}
