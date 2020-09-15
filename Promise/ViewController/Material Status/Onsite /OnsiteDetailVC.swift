//
//  OnsiteDetailVC.swift
//  Promise
//
//  Created by Captain on 11/08/20.
//  Copyright © 2020 Captain. All rights reserved.
//

import UIKit

class OnsiteDetailVC: UIViewController {

    @IBOutlet var lbl_MaterialStatus: UILabel!
    @IBOutlet var tbl_siteDetail: UITableView!
    @IBOutlet var btn_back: UIButton!

    var Str_ID = ""
    var Str_PLNumber = ""
    var Str_Navigate = ""
    var Arr_onSiteDetail : NSMutableArray = NSMutableArray()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.Initialization()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.isHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.navigationController?.navigationBar.isHidden = false
    }
    func Initialization() {
        self.tbl_siteDetail.register(UINib(nibName: "onSiteDetail_Cell", bundle: nil), forCellReuseIdentifier: "onSiteDetail_Cell")
        self.lbl_MaterialStatus.text = "\(Str_Navigate) /\(Str_PLNumber)"
        ServiceCall.shareInstance.Get_onSiteStatusDetail(ViewController: self, Str_ID: Str_ID)
    }
    @IBAction func btn_Click_Back(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
extension OnsiteDetailVC : UITableViewDataSource ,UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return Arr_onSiteDetail.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell : onSiteDetail_Cell = tableView.dequeueReusableCell(withIdentifier: "onSiteDetail_Cell") as! onSiteDetail_Cell
        cell.selectionStyle = .none
        cell.DisplayCell(Arr_Data: Arr_onSiteDetail, indexpath: indexPath)
       return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 600
    }
}
