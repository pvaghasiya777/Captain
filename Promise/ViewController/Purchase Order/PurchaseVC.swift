//
//  PurchaseVC.swift
//  Promise
//
//  Created by macbook on 28/05/1942 Saka.
//  Copyright © 1942 Captain. All rights reserved.
//

import UIKit

class PurchaseVC: UIViewController {
    //MARK:- IBOutlet
    @IBOutlet weak var tbl_Purchase: UITableView!
    @IBOutlet var menu_Barbutton: UIBarButtonItem!
    @IBOutlet weak var btn_Previous: UIButton!
    @IBOutlet weak var btn_Next: UIButton!
    @IBOutlet weak var lbl_ShowPageNum: UILabel!
    @IBOutlet weak var lbl_PageNum: UILabel!
    //MARK:- variable
    var Arr_PurchaseDetail = [MasterPurchseListModel]()
    //MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.Initialization()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "Purchase"
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationItem.title = ""
        self.revealViewController()?.delegate = nil
    }
    //MARK:- Initialization
    func Initialization() {
        if revealViewController() != nil {
            self.revealViewController().delegate = self
            menu_Barbutton.target = self.revealViewController()
            menu_Barbutton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            self.revealViewController()?.rearViewRevealWidth = 280
           
        }
        self.tbl_Purchase.tableFooterView = UIView()
        self.tbl_Purchase.rowHeight = UITableView.automaticDimension
        self.tbl_Purchase.separatorStyle = .singleLine
        MasterServiceCall.shareInstance.Get_masterPurchaseList(Api_Str: Api_Urls.GET_API_masterPurchaselist, ViewController: self)
        btn_Next.addTarget(self, action: #selector(btn_NextClick(_:)), for: .touchUpInside)
        btn_Previous.addTarget(self, action: #selector(btn_PreviousClick(_:)), for: .touchUpInside)
    }
    
   @objc func btn_NextClick(_ sender: UIButton) {
    
   }
   @objc func btn_PreviousClick(_ sender: UIButton) {
     
   }  
}
//MARK:- TableView Initialization
extension PurchaseVC : UITableViewDataSource,UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return Arr_PurchaseDetail.count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell : PurchaseHeaderCell = tableView.dequeueReusableCell(withIdentifier: "PurchaseHeaderCell") as! PurchaseHeaderCell
            return cell
        } else {
            let cell : PurchaseCell = tableView.dequeueReusableCell(withIdentifier: "PurchaseCell") as! PurchaseCell
           
            cell.DisplayCell(Arr_PurchaseData: Arr_PurchaseDetail, indexpath: indexPath)
            return cell
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            let PurchaseOrder_VC = Config.StoryBoard.instantiateViewController(identifier: "PurchaseOrderVC") as! PurchaseOrderVC
            PurchaseOrder_VC.Str_Number = Arr_PurchaseDetail[indexPath.row].number!
            self.navigationController?.pushViewController(PurchaseOrder_VC, animated: true)
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
//MARK:- SWRevealViewController Methods
extension PurchaseVC : SWRevealViewControllerDelegate {
    // MARK: - Reveal View Controller Delagate Methods
    func revealController(_ revealController: SWRevealViewController, didMoveTo position: FrontViewPosition) {
        print(position)
        Utils.Disable_Front_ViewController(viewController: self, position: position)
    }
    func revealController(_ revealController: SWRevealViewController, willMoveTo position: FrontViewPosition) {
        print(position)
        Utils.Disable_Front_ViewController(viewController: self, position: position)
    }
}
