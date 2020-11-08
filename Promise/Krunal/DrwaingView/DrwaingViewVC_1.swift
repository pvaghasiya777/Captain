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
    @IBOutlet weak var btn_Previous: UIButton!
    @IBOutlet weak var btn_Next: UIButton!
    @IBOutlet weak var lbl_ShowPageNum: UILabel!
    @IBOutlet weak var lbl_PageNum: UILabel!
    var id = String()
    var arrviewData = [DrwaingViewModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.Initialization()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "Shop Drawing View"
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationItem.title = ""
    }
    func Initialization() {
        ServiceCall.shareInstance.Get_getDrwaingView(ViewController: self, Api_Str: Api_Urls.GET_API_drawing + id + "/" + "lines/")
        tbl_DrwaingView.register(UINib(nibName: "DrwaingViewCell", bundle: nil), forCellReuseIdentifier: "DrwaingViewCell")
        tbl_DrwaingView.register(UINib(nibName: "DrwaingViewRowCell", bundle: nil), forCellReuseIdentifier: "DrwaingViewRowCell")
    }
    @IBAction func btn_PageNum(_ sender: UIButton) {
        if sender.tag == 1 {
        } else if sender.tag == 2 {
        } else if sender.tag == 3 {
        } else if sender.tag == 4 {
        } else {
        }
    }
}

extension DrwaingViewVC_1 : UITableViewDataSource , UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
       
            return 2
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return arrviewData.count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        if indexPath.section == 0 {
            let cell : DrwaingViewCell = tableView.dequeueReusableCell(withIdentifier: "DrwaingViewCell") as! DrwaingViewCell
               return cell
        } else {
            let cell : DrwaingViewRowCell = tableView.dequeueReusableCell(withIdentifier: "DrwaingViewRowCell") as! DrwaingViewRowCell
            cell.DisplayCell(arr : arrviewData,indexPath : indexPath)
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
