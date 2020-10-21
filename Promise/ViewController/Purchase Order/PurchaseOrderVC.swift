
//
//  PurchaseOrderVC.swift
//  Promise
//
//  Created by macbook on 08/05/1942 Saka.
//  Copyright © 1942 Captain. All rights reserved.
//

import UIKit
import iOSDropDown
class PurchaseOrderVC: UIViewController {

    //MARK :- IBOutlet
    @IBOutlet weak var tbl_PurchaseOrder: UITableView!
    @IBOutlet weak var btn_PackingList: UIButton!
    @IBOutlet weak var btn_Packages: UIButton!
    @IBOutlet weak var btn_Structure: UIButton!
    @IBOutlet var view_PurchaseDetails: UIView!
    @IBOutlet var view_PurchaseDetails2: UIView!
    //ViewPurchase Details First
    @IBOutlet var txt_Number: UITextField!
    @IBOutlet var txt_Vendor: DropDown!
    @IBOutlet var txt_Project: DropDown!
    @IBOutlet var txt_POType: UITextField!
    @IBOutlet var txt_Address: UITextField!
    @IBOutlet var txt_ShipperDetails : UITextField!
    //ViewPurchase Detail Second
    @IBOutlet var txt_Date: UITextField!
    @IBOutlet var txt_DeliveryDate: DropDown!
    @IBOutlet var txt_Currency: DropDown!
    @IBOutlet var txt_WeightUOM: UITextField!
    @IBOutlet var txt_Dimension: UITextField!
    @IBOutlet var txt_Volume: UITextField!
    @IBOutlet var btn_isActive: UIButton!
    //Pagination View
    @IBOutlet weak var lbl_ShowPagination: UILabel!
    @IBOutlet weak var btn_Previous: UIButton!
    @IBOutlet weak var btn_Next: UIButton!
    @IBOutlet weak var lbl_PageNum: UILabel!
    //MARK:- Variable
    var Arr_PurchaseOrder = [SingleMasterPurchaseModel]()
    var Str_Number = ""
    var startIndex: Int = 0
    var PageNumber : Int = 1
    //MARK:- Life Cycle
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
    //MARK:-
    func InitlizationView() {
        tbl_PurchaseOrder.register(UINib(nibName: "PurchaseOrderCell", bundle: nil), forCellReuseIdentifier: "PurchaseOrderCell")
        let value = UIInterfaceOrientation.landscapeRight.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        MasterServiceCall.shareInstance.Get_SingleMasterPurchase(Api_Str: Api_Urls.GET_API_masterPurchase + Str_Number + "/", Viewcontroller: self)
        Utils.add_shadow_around_view_Multiple(views: [btn_Structure,btn_Packages,btn_PackingList], color: .gray, radius: 3, opacity: 1)
        self.btn_Next.addTarget(self, action: #selector(btn_NextClick(_:)), for: .valueChanged)
        self.btn_Previous.addTarget(self, action: #selector(btn_PreviousClick(_:)), for: .valueChanged)
    }
    func setData() {
        self.btn_Structure.addSubview(Utils.set_Badge(Count: Arr_PurchaseOrder[0].structure_count!))
        self.btn_Packages.addSubview(Utils.set_Badge(Count: Arr_PurchaseOrder[0].package_count!))
        self.btn_PackingList.addSubview(Utils.set_Badge(Count: Arr_PurchaseOrder[0].packing_count!))
        print(Arr_PurchaseOrder)
        if Arr_PurchaseOrder.count != 0 {
            self.txt_Number.text = Arr_PurchaseOrder[0].number!
            self.txt_WeightUOM.text = Arr_PurchaseOrder[0].weight_uom!
            self.txt_Dimension.text = Arr_PurchaseOrder[0].dimension_uom!
            self.txt_Volume.text = Arr_PurchaseOrder[0].volume_uom!
            self.txt_ShipperDetails.text = Arr_PurchaseOrder[0].shipper_details!
            self.txt_DeliveryDate.text = (Arr_PurchaseOrder[0].delivery_date != nil) ? Arr_PurchaseOrder[0].delivery_date! : "Select Date"
            self.txt_Date.text = (Arr_PurchaseOrder[0].date != nil) ? Arr_PurchaseOrder[0].delivery_date! : "Select Date"
            let Arr_Vendor = DEFAULTS.Get_MasterVendor().filter {$0.id! == Arr_PurchaseOrder[0].vendor_id!}
            let Arr_POType = DEFAULTS.Get_MasterPOType().filter {$0.id! == Arr_PurchaseOrder[0].po_type_id!}
            let Arr_Address = DEFAULTS.Get_AddressStruct().filter {$0.id! == Arr_PurchaseOrder[0].address_id!}
            let Arr_Currency = DEFAULTS.Get_MasterCurrency().filter {$0.id! == Arr_PurchaseOrder[0].currency_id!}
            let Arr_Project = DEFAULTS.Get_MasterProject().filter {$0.id! == Arr_PurchaseOrder[0].project_id!}
            
            self.txt_Vendor.text = Arr_Vendor[0].name!
            self.txt_Project.text = Arr_Project[0].name!
            self.txt_POType.text = Arr_POType[0].name!
            self.txt_Address.text = Arr_Address[0].name!
            self.txt_Currency.text = Arr_Address[0].name!
            self.lbl_PageNum.text = String(describing: PageNumber)
            self.lbl_ShowPagination.text = "Showing \(1) to \(startIndex + 10) of \(Arr_PurchaseOrder[0].purchase_lines!.count) results"
        }
    }
    override public var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscapeRight
    }
    override public var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return .landscapeRight
    }
    //MARK:- Button Click Event
    //Next And Previous Click
    @objc func btn_NextClick(_ sender: UIButton) {
        if startIndex + 10 > Arr_PurchaseOrder[0].purchase_lines!.count {
            Utils.showToastWithMessage(message: Strings.kNoMoreData)
        } else {
            startIndex = startIndex + 10
            self.PageNumber = PageNumber + 1
            self.lbl_PageNum.text = String(describing: PageNumber)
            self.lbl_ShowPagination.text = "Showing \(startIndex) to \(startIndex + 10) of \(Arr_PurchaseOrder[0].purchase_lines!.count) results"
            self.tbl_PurchaseOrder.reloadData()
        }
    }
    @objc func btn_PreviousClick(_ sender: UIButton) {
        if startIndex - 10 < 0 {
            Utils.showToastWithMessage(message: Strings.kNoMoreData)
        } else {
            startIndex = startIndex - 10
            self.PageNumber = PageNumber - 1
            self.lbl_ShowPagination.text = "Showing \(startIndex) to \((startIndex == 0) ? 10 : startIndex - 10 ) of \(Arr_PurchaseOrder[0].purchase_lines!.count) results"
            self.lbl_PageNum.text = String(describing: PageNumber)
            self.tbl_PurchaseOrder.reloadData()
        }
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
}
extension PurchaseOrderVC : UITableViewDataSource , UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return min (10,((Arr_PurchaseOrder.count == 0) ? Arr_PurchaseOrder.count : Arr_PurchaseOrder[0].purchase_lines!.count))
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : PurchaseOrderCell = tableView.dequeueReusableCell(withIdentifier: "PurchaseOrderCell") as! PurchaseOrderCell
        cell.DisplayCell(Arr_Data: Arr_PurchaseOrder, indexpath: indexPath, viewController: self)
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
