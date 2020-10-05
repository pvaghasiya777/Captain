
//
//  PurchaseOrderVC.swift
//  Promise
//
//  Created by macbook on 08/05/1942 Saka.
//  Copyright © 1942 Captain. All rights reserved.
//

import UIKit

class PurchaseOrderVC: UIViewController {

    
    @IBOutlet weak var tbl_PurchaseOrder: UITableView!
    @IBOutlet weak var txt_searchbar: UISearchBar!
    @IBOutlet weak var btn_Discard: UIButton!
    @IBOutlet weak var btn_Save: UIButton!
    @IBOutlet weak var btn_ImportPurchase: UIButton!
    @IBOutlet weak var btn_PackingList: UIButton!
    @IBOutlet weak var btn_Packages: UIButton!
    @IBOutlet weak var btn_Structure: UIButton!
    @IBOutlet weak var btn_First: UIButton!
    @IBOutlet weak var btn_Previous: UIButton!
    @IBOutlet weak var btn_Next: UIButton!
    @IBOutlet weak var btn_Last: UIButton!
    @IBOutlet weak var lbl_ShowPageNum: UILabel!
    @IBOutlet weak var lbl_PageNum: UILabel!
    
    var Arr_PurchaseOrder = [SingleMasterPurchaseModel]()
    var Str_Number = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.InitlizationView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "Purchase Order"
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationItem.title = ""
        self.revealViewController()?.delegate = nil
    }
    func InitlizationView() {
        tbl_PurchaseOrder.register(UINib(nibName: "PurchaseOrderformCell", bundle: nil), forCellReuseIdentifier: "PurchaseOrderformCell")
        tbl_PurchaseOrder.register(UINib(nibName: "PurchaseOrderCell", bundle: nil), forCellReuseIdentifier: "PurchaseOrderCell")
        let value = UIInterfaceOrientation.landscapeRight.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        MasterServiceCall.shareInstance.Get_SingleMasterPurchase(Api_Str: Api_Urls.GET_API_masterPurchase + Str_Number + "/", Viewcontroller: self)
        Utils.setcornerRadius(view: btn_Discard, cornerradius: 5)
        Utils.setcornerRadius(view: btn_Save, cornerradius: 5)
    }
    func setData() {
        self.btn_Structure.addSubview(Utils.set_Badge(Count: Arr_PurchaseOrder[0].structure_count!))
        self.btn_Packages.addSubview(Utils.set_Badge(Count: Arr_PurchaseOrder[0].package_count!))
        self.btn_PackingList.addSubview(Utils.set_Badge(Count: Arr_PurchaseOrder[0].packing_count!))
    }
    override public var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscapeRight
    }
    override public var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return .landscapeRight
    }
    @IBAction func btn_Click_Action(_ sender: UIButton) {
        if sender.tag == 1 {
            print("Strucher Click")
            let Drawing_VC = Config.StoryBoard.instantiateViewController(identifier: "DrawingVC") as! DrawingVC
            Drawing_VC.Str_NavigateFrom = "Purchase"
            Drawing_VC.Str_ID = String(describing: Arr_PurchaseOrder[0].number!)
            self.navigationController?.pushViewController(Drawing_VC, animated: true)
        }else if sender.tag == 2 {
            print("Packges Click")
            let Plinputs_Vc = Config.StoryBoard.instantiateViewController(identifier: "PlinputsVc") as! PlinputsVc
            Plinputs_Vc.Str_NavigateFrom = "Purchase"
            Plinputs_Vc.Str_ID = String(describing: Arr_PurchaseOrder[0].number!)
            self.navigationController?.pushViewController(Plinputs_Vc, animated: true)
        }else if sender.tag == 3 {
            print("Packing List Click")
            let PackingList_VC = Config.StoryBoard.instantiateViewController(identifier: "PackingListVC") as! PackingListVC
            PackingList_VC.Str_NavigateFrom = "Purchase"
            PackingList_VC.Str_ID = String(describing: Arr_PurchaseOrder[0].number!)
            self.navigationController?.pushViewController(PackingList_VC, animated: true)
        }
    }
    @IBAction func btn_SaveClick_Action(_ sender: UIButton) {
    }
    @IBAction func btn_DiscardClick_Action(_ sender: UIButton) {
    }
    
}
extension PurchaseOrderVC : UITableViewDataSource , UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 {
            return 1
        } else {
            return ((Arr_PurchaseOrder.count == 0) ? Arr_PurchaseOrder.count : Arr_PurchaseOrder[0].purchase_lines!.count)
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0  {
            let cell : PurchaseOrderformCell = tableView.dequeueReusableCell(withIdentifier: "PurchaseOrderformCell") as! PurchaseOrderformCell
            cell.DisplayCell(Arr_Data: Arr_PurchaseOrder, indexpath: indexPath)
            return cell
        } else if indexPath.section == 1 {
            let cell : PurchaseOrderHeaderCell = tableView.dequeueReusableCell(withIdentifier: "PurchaseOrderHeaderCell") as! PurchaseOrderHeaderCell
            return cell
        } else {
            let cell : PurchaseOrderCell = tableView.dequeueReusableCell(withIdentifier: "PurchaseOrderCell") as! PurchaseOrderCell
            cell.DisplayCell(Arr_Data: Arr_PurchaseOrder, indexpath: indexPath)
            cell.selectionStyle = .none 
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 576
        } else if indexPath.section == 1 {
            return 70
        } else {
            return UITableView.automaticDimension
        }
    }
}
