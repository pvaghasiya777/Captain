//
//  ReportsFiltersVC.swift
//  report
//  Created by macbook on 25/06/1942 Saka.
//  Copyright © 1942 com.mac. All rights reserved.
//

import UIKit
import Alamofire
class ReportsFiltersVC: UIViewController {
    //MARK:- Outlet
    //Filter Details
    @IBOutlet weak var dropProject: UITextField!
    @IBOutlet weak var dropPurchaseOrder: UITextField!
    @IBOutlet weak var dropStructure: UITextField!
    @IBOutlet weak var dropPackingList: UITextField!
    //Material Type
    @IBOutlet weak var btnSteel: UIButton!
    @IBOutlet weak var btnBolt: UIButton!
    //Material Status
    @IBOutlet weak var btnReleased: UIButton!
    @IBOutlet weak var btnNotReleased: UIButton!
    @IBOutlet weak var btnShipped: UIButton!
    @IBOutlet weak var btnNotShipped: UIButton!
    @IBOutlet weak var btnOnsite: UIButton!
    @IBOutlet weak var btnNotOnsite: UIButton!
    // Excess Quantity
    @IBOutlet weak var btnWithExtraPieces: UIButton!
    @IBOutlet weak var btnWithoutExtraPieces: UIButton!
    @IBOutlet weak var btn_OK: UIButton!
    //MARK :- Variable
    var StrNavigate = ""
    @IBOutlet  var popup : KLCPopup!
    @IBOutlet var popup_Select : multiselectpopup?
    var Arr_Project = [FilterProjectModel]()
    var Arr_PurchaseOrder = [FilterPurchaseOrderModel]()
    var Arr_Strucher = [FilterStructureModel]()
    var Arr_PackingList = [FilterPackingListModel]()
    var Arr_Mark = [MarkResult]()
    var str_FilterName = ""
    var Arr_Project_Name : NSMutableArray = NSMutableArray()
    var text_tag = Int()
    var DParam : NSDictionary = NSDictionary()
    //Filter Param
    var str_Filter_ProjectID = "1"
    var str_Filter_PurchaseOrder = ""
    var str_Filter_Strucher = ""
    var str_Filter_PackingList = ""
    var str_Filter_Mark = ""
    //Filter Param
    var str_FilterParam_Project = "project_id"
    var str_FilterParam_PurchaseOrder = ""
    var str_FilterParam_Strucher = ""
    var str_FilterParam_PackingList = ""
    var str_FilterParam_Mark = ""
    //MaterialType
    var Is_Select_Steel : Bool = false
    var Is_Select_Bolt : Bool = false
    var checkMarkSteel = false
    var checkMarkBolt = false
    //Excess Quantity
    var Is_Select_With_Extra_Pieces : Bool = false
    var Is_Select_Without_Extra_Pieces : Bool = true
    var checkMarkExtra_Pieces  = false
    var checkMarkWithout_Extra_Pieces = true
    //Material Status
    var Is_Select_Released : Bool = false
    var Is_Select_NotReleased : Bool = false
    var Is_Select_Shipped : Bool = false
    var Is_Select_NotShipped : Bool = false
    var Is_Select_Onsite : Bool = false
    var Is_Select_NotOnsite : Bool = false
    var checkMarkReleased  = false
    var checkMarkNotReleased = false
    var checkMarkShipped  = false
    var checkMarkNotShipped = false
    var checkMarkOnsite  = false
    var checkMarkNotOnsite = false
    //MARK :- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        Initialisation()
    }
    override func viewWillAppear(_ animated: Bool) {
       super.viewWillAppear(animated)
       self.navigationItem.title = "Select Filter"
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationItem.title = ""
    }
    //MARK:- Initialisation
    func Initialisation(){
        Utils.Set_Corner_Radius(views: [btnSteel,btnBolt,btnReleased,btnNotReleased,btnShipped,btnNotShipped,btnOnsite,btnNotOnsite,btnWithExtraPieces,btnWithoutExtraPieces,btn_OK], radius: 5)
        Utils.Set_Same_View_Border(views:[btnSteel,btnBolt,btnReleased,btnNotReleased,btnShipped,btnNotShipped,btnOnsite,btnNotOnsite,btnWithExtraPieces,btnWithoutExtraPieces] , borderColor: .gray, border_Width: 1)
        MasterServiceCall.shareInstance.Get_FilterApi(Api_Str: Api_Urls.GET_API_filterProject, tag: 1,param: [:],ViewController: self,VC_Tag: 2)
        MasterServiceCall.shareInstance.Get_FilterApi(Api_Str: Api_Urls.GET_API_filterPurchaseOrder, tag: 2,param: ["project_id": DEFAULTS.Get_ProjectID()],ViewController: self,VC_Tag: 2)
        MasterServiceCall.shareInstance.Get_FilterApi(Api_Str: Api_Urls.GET_API_filterStrucher, tag: 3,param: ["project_id": DEFAULTS.Get_ProjectID()],ViewController: self,VC_Tag: 2)
        MasterServiceCall.shareInstance.Get_FilterApi(Api_Str: Api_Urls.GET_API_filterPackingList, tag: 4,param: ["project_id": DEFAULTS.Get_ProjectID()],ViewController: self,VC_Tag: 2)
        MasterServiceCall.shareInstance.Get_FilterApi(Api_Str: Api_Urls.GET_API_filterMark, tag: 5,param: ["project_id": DEFAULTS.Get_ProjectID()],ViewController: self,VC_Tag: 2)
    }
    // MARK: - Mode Selection Popup
    func Mode_Selection(ArrContent:[Person] , arrProjectTab : Int) {
        self.popup_Select = multiselectpopup(nibName: "multiselectpopup", bundle: nil)
        popup_Select?.arrcontant = ArrContent
        popup_Select?.arrProjectTab = arrProjectTab
        self.popup_Select!.view.frame = CGRect.init(x: 0, y: 0, width: 310, height: 400)
        self.popup = KLCPopup(contentView: self.popup_Select?.view, showType: .growIn, dismissType: .growOut, maskType: .dimmed, dismissOnBackgroundTouch: false, dismissOnContentTouch: false)
        self.popup.didFinishDismissingCompletion = {() -> Void in
            if self.popup_Select?.arrchakdata != []
            {
                if self.popup_Select!.arrProjectTab == 1 { // Project
                    self.dropProject.text = self.popup_Select!.arrchakdata.map{($0 as! chack).poNo}[0]
                    self.dropProject.resignFirstResponder()
                    self.str_Filter_ProjectID = String(self.popup_Select!.arrchakdata.map{($0 as! chack).id}[0])
                    MasterServiceCall.shareInstance.Get_FilterApi(Api_Str: Api_Urls.GET_API_filterPurchaseOrder, tag: 2,param: ["project_id": self.str_Filter_ProjectID],ViewController: self,VC_Tag: 2)
                    MasterServiceCall.shareInstance.Get_FilterApi(Api_Str: Api_Urls.GET_API_filterStrucher, tag: 3,param: ["project_id": self.str_Filter_ProjectID],ViewController: self,VC_Tag: 2)
                    MasterServiceCall.shareInstance.Get_FilterApi(Api_Str: Api_Urls.GET_API_filterPackingList, tag: 4,param: ["project_id": self.str_Filter_ProjectID],ViewController: self,VC_Tag: 2)
                    MasterServiceCall.shareInstance.Get_FilterApi(Api_Str: Api_Urls.GET_API_filterMark, tag: 5,param: ["project_id": self.str_Filter_ProjectID],ViewController: self,VC_Tag: 2)
                    self.dropPurchaseOrder.text = ""
                    self.dropStructure.text = ""
                    self.dropPackingList.text = ""
                } else if self.popup_Select!.arrProjectTab == 2 { // Purchase Order
                    let id_count = self.popup_Select!.arrchakdata.count
                    var data = NSMutableArray(array: self.popup_Select!.arrchakdata.map{($0 as! chack).poNo})
                    let strData = data.componentsJoined(by: ",")
                    self.dropPurchaseOrder.text = strData
                    self.dropPurchaseOrder.resignFirstResponder()
                    self.str_Filter_PurchaseOrder = strData
                    self.str_FilterParam_PurchaseOrder = (self.popup_Select!.arrchakdata.count > 1) ? Multiple_Filter_Value.GET_PurchaseOrder : "po_no"
                    
                    MasterServiceCall.shareInstance.Get_FilterApi(Api_Str: Api_Urls.GET_API_filterStrucher, tag: 3,param: [self.str_FilterParam_PurchaseOrder : String(describing: strData)],ViewController: self,VC_Tag: 2)
                    MasterServiceCall.shareInstance.Get_FilterApi(Api_Str: Api_Urls.GET_API_filterPackingList, tag: 4,param: [self.str_FilterParam_PurchaseOrder : String(describing: strData)],ViewController: self,VC_Tag: 2)
                    MasterServiceCall.shareInstance.Get_FilterApi(Api_Str: Api_Urls.GET_API_filterMark, tag: 5,param: [self.str_FilterParam_PurchaseOrder : String(describing: strData)],ViewController: self,VC_Tag: 2)
                    self.dropStructure.text = ""
                    self.dropPackingList.text = ""
                    
                } else if self.popup_Select!.arrProjectTab == 3 { // Strucher
                    var data = NSMutableArray(array: self.popup_Select!.arrchakdata.map{($0 as! chack).poNo})
                    let strData = data.componentsJoined(by: ",")
                    self.dropStructure.text = strData
                    self.dropStructure.resignFirstResponder()
                    self.str_Filter_Strucher = String(describing: strData)
                    self.str_FilterParam_Strucher = (self.popup_Select!.arrchakdata.count > 1) ? Multiple_Filter_Value.GET_Strucher : "structure"
                    MasterServiceCall.shareInstance.Get_FilterApi(Api_Str: Api_Urls.GET_API_filterPackingList, tag: 4,param: [self.str_FilterParam_Strucher : String(describing: strData)],ViewController: self,VC_Tag: 2)
                    MasterServiceCall.shareInstance.Get_FilterApi(Api_Str: Api_Urls.GET_API_filterMark, tag: 5,param: [self.str_FilterParam_Strucher : String(describing: strData)],ViewController: self,VC_Tag: 2)
                    self.dropPackingList.text = ""
                } else if self.popup_Select!.arrProjectTab == 4 { // Packing List
                    var data = NSMutableArray(array: self.popup_Select!.arrchakdata.map{($0 as! chack).poNo})
                    let strData = data.componentsJoined(by: ",")
                    self.dropPackingList.text = strData
                    self.dropPackingList.resignFirstResponder()
                    self.str_Filter_PackingList = String(describing: strData)
                    self.str_FilterParam_PackingList = (self.popup_Select!.arrchakdata.count > 1) ? Multiple_Filter_Value.GET_PackingList : "pl_number"
                    MasterServiceCall.shareInstance.Get_FilterApi(Api_Str: Api_Urls.GET_API_filterMark, tag: 5,param: [self.str_FilterParam_PackingList : String(describing: strData)],ViewController: self,VC_Tag: 2)
                }
            }
        }
        self.popup.show(withRoot: self.view)
    }
     @IBAction func btnMaterialTypeClick(_ sender: UIButton) {
          if sender.tag == 1 {
            if checkMarkSteel == false {
                btnSteel.setBackgroundImage(UIImage(named: "ic_check"), for: .normal)
                checkMarkSteel = !checkMarkSteel
                checkMarkBolt = false
            } else {
                btnSteel.setBackgroundImage(UIImage(named: ""), for: .normal)
                checkMarkSteel = !checkMarkSteel
                 checkMarkBolt = false
            }
            btnBolt.setBackgroundImage(UIImage(named: ""), for: .normal)
            self.Is_Select_Bolt = true
            self.Is_Select_Steel = false
          } else if sender.tag == 2 {
            if checkMarkBolt == false {
                btnBolt.setBackgroundImage(UIImage(named: "ic_check"), for: .normal)
                checkMarkBolt = !checkMarkBolt
                checkMarkSteel = false
            } else {
                btnBolt.setBackgroundImage(UIImage(named: ""), for: .normal)
                checkMarkBolt = !checkMarkBolt
                checkMarkSteel = false
            }
            btnSteel.setBackgroundImage(UIImage(named: ""), for: .normal)
            self.Is_Select_Bolt = false
            self.Is_Select_Steel = true
          }
      }
      @IBAction func btnMaterialStatusClick(_ sender: UIButton) {
          //Released & Not Released
          if sender.tag == 3 {
            if checkMarkReleased == false {
                btnReleased.setBackgroundImage(UIImage(named: "ic_check"), for: .normal)
                checkMarkReleased = !checkMarkReleased
                checkMarkNotReleased = false
            } else {
                btnReleased.setBackgroundImage(UIImage(named: ""), for: .normal)
                checkMarkReleased = !checkMarkReleased
                checkMarkNotReleased = false
            }
            btnNotReleased.setBackgroundImage(UIImage(named: ""), for: .normal)
            self.Is_Select_Released = true
            self.Is_Select_NotReleased = false
          } else if sender.tag == 6 {
            
            if checkMarkNotReleased == false {
                btnNotReleased.setBackgroundImage(UIImage(named: "ic_check"), for: .normal)
                checkMarkNotReleased = !checkMarkNotReleased
                checkMarkReleased = false
            } else {
                btnNotReleased.setBackgroundImage(UIImage(named: ""), for: .normal)
                checkMarkNotReleased = !checkMarkNotReleased
                checkMarkReleased = false
            }
            btnReleased.setBackgroundImage(UIImage(named: ""), for: .normal)
            self.Is_Select_Released = false
            self.Is_Select_NotReleased = true
          }
          //Shipped & Not Shipped
          if sender.tag == 4 {
            
            if checkMarkShipped == false {
                btnShipped.setBackgroundImage(UIImage(named: "ic_check"), for: .normal)
                checkMarkShipped = !checkMarkShipped
                checkMarkNotShipped = false
            } else {
                btnShipped.setBackgroundImage(UIImage(named: ""), for: .normal)
                checkMarkShipped = !checkMarkShipped
                checkMarkNotShipped = false
            }
            btnNotShipped.setBackgroundImage(UIImage(named: ""), for: .normal)
            self.Is_Select_Shipped = true
            self.Is_Select_NotShipped = false
          } else if sender.tag == 7 {
            
            if checkMarkNotShipped == false {
                btnNotShipped.setBackgroundImage(UIImage(named: "ic_check"), for: .normal)
                checkMarkNotShipped = !checkMarkNotShipped
                checkMarkShipped = false
            } else {
                btnNotShipped.setBackgroundImage(UIImage(named: ""), for: .normal)
                checkMarkNotShipped = !checkMarkNotShipped
                checkMarkShipped = false
            }
            btnShipped.setBackgroundImage(UIImage(named: ""), for: .normal)
            self.Is_Select_Shipped = false
            self.Is_Select_NotShipped = true
          }
          //Onsite & Not Onsite
          if sender.tag == 5 {
            if checkMarkOnsite == false {
                btnOnsite.setBackgroundImage(UIImage(named: "ic_check"), for: .normal)
                checkMarkOnsite = !checkMarkOnsite
                checkMarkNotOnsite = false
            } else {
                btnOnsite.setBackgroundImage(UIImage(named: ""), for: .normal)
                checkMarkOnsite = !checkMarkOnsite
                checkMarkNotOnsite = false
            }
            btnNotOnsite.setBackgroundImage(UIImage(named: ""), for: .normal)
            self.Is_Select_Onsite = true
            self.Is_Select_NotOnsite = false
          } else if sender.tag == 8 {
            
            if checkMarkNotOnsite == false {
                btnNotOnsite.setBackgroundImage(UIImage(named: "ic_check"), for: .normal)
                checkMarkNotOnsite = !checkMarkNotOnsite
                checkMarkOnsite = false
            } else {
                btnNotOnsite.setBackgroundImage(UIImage(named: ""), for: .normal)
                checkMarkNotOnsite = !checkMarkNotOnsite
                checkMarkOnsite = false
            }
            btnOnsite.setBackgroundImage(UIImage(named: ""), for: .normal)
            self.Is_Select_Onsite = false
            self.Is_Select_NotOnsite = true
          }
      }
    @IBAction func btnExcessQuantityClick(_ sender: UIButton) {
        if sender.tag == 9 {
            if checkMarkExtra_Pieces != false {
                btnWithExtraPieces.setBackgroundImage(UIImage(named: ""), for: .normal)
                checkMarkExtra_Pieces = !checkMarkExtra_Pieces
                checkMarkWithout_Extra_Pieces = false
            } else {
                btnWithExtraPieces.setBackgroundImage(UIImage(named: "ic_check"), for: .normal)
                checkMarkExtra_Pieces = !checkMarkExtra_Pieces
                checkMarkWithout_Extra_Pieces = false
            }
            btnWithoutExtraPieces.setBackgroundImage(UIImage(named: ""), for: .normal)
            self.Is_Select_With_Extra_Pieces = true
            self.Is_Select_Without_Extra_Pieces = false
        } else if sender.tag == 10 {
            if checkMarkWithout_Extra_Pieces != false {
                btnWithoutExtraPieces.setBackgroundImage(UIImage(named: ""), for: .normal)
                checkMarkWithout_Extra_Pieces = !checkMarkWithout_Extra_Pieces
                checkMarkExtra_Pieces = false
            } else {
                btnWithoutExtraPieces.setBackgroundImage(UIImage(named: "ic_check"), for: .normal)
                checkMarkWithout_Extra_Pieces = !checkMarkWithout_Extra_Pieces
                checkMarkExtra_Pieces = false
            }
            btnWithExtraPieces.setBackgroundImage(UIImage(named: ""), for: .normal)
            self.Is_Select_With_Extra_Pieces = false
            self.Is_Select_Without_Extra_Pieces = true
        }
    }
    @IBAction func btnOKClick(_ sender: UIButton) {
        self.view.endEditing(true)
        switch StrNavigate {
        case "DFilter":
            self.SetDfilterParam()
            NotificationCenter.default.post(name: NSNotification.Name.DFilter, object: nil, userInfo: self.DParam as? [AnyHashable : Any])
            self.navigationController?.popViewController(animated: true)
        case "Sreport" :
            if str_FilterName == "Detail Figure Report" || str_FilterName == "Packagewise Report" || str_FilterName == "PO Positionwise Report" || str_FilterName == "Ident Codewise Report" || str_FilterName ==  "Summary Report" {
                let Report_VC = Config.StoryBoard2.instantiateViewController(identifier: "DReportVC") as! DReportVC
                Report_VC.pageName = str_FilterName
                self.SetFilterValue(Report_VC: Report_VC,tag:1)
                self.navigationController?.pushViewController(Report_VC, animated: true)
            }else if str_FilterName == "Markwise Report" {
                let Report_VC = Config.StoryBoard2.instantiateViewController(identifier: "R_MarkwiseReportVC") as! R_MarkwiseReportVC
                Report_VC.pageName = str_FilterName
                self.SetFilterValue(Report_VC: Report_VC,tag:6)
                self.navigationController?.pushViewController(Report_VC, animated: true)
            }else if str_FilterName == "Markwise Cumulative Report" {
                let Report_VC = Config.StoryBoard2.instantiateViewController(identifier: "MarkwiseCumulativeReportVC") as! MarkwiseCumulativeReportVC
                Report_VC.pageName = str_FilterName
                self.SetFilterValue(Report_VC: Report_VC,tag:5)
                self.navigationController?.pushViewController(Report_VC, animated: true)
            }else if str_FilterName == "Packing List Report" {
                let Report_VC = Config.StoryBoard2.instantiateViewController(identifier: "PackingListReport_VC") as! PackingListReport_VC
                Report_VC.pageName = str_FilterName
                self.SetFilterValue(Report_VC: Report_VC,tag:4)
                self.navigationController?.pushViewController(Report_VC, animated: true)
            }else if str_FilterName == "Structurewise Report" {
                let Report_VC = Config.StoryBoard2.instantiateViewController(identifier: "StructurewiseReportVC") as! StructurewiseReportVC
                Report_VC.pagename = str_FilterName
                self.SetFilterValue(Report_VC: Report_VC,tag:3)
                self.navigationController?.pushViewController(Report_VC, animated: true)
            }else { //"Group Structurewise Report"
                let Report_VC = Config.StoryBoard2.instantiateViewController(identifier: "GroupStructurewiseReportVC") as! GroupStructurewiseReportVC
                Report_VC.pageName = str_FilterName
                self.SetFilterValue(Report_VC: Report_VC,tag:2)
                self.navigationController?.pushViewController(Report_VC, animated: true)
            }
        default:
            print(StrNavigate)
        }
    }
    func SetDfilterParam(){
        let ArrSelected = [Is_Select_Steel,Is_Select_Bolt,Is_Select_Released,Is_Select_NotReleased,Is_Select_Shipped, Is_Select_NotShipped,Is_Select_Onsite,Is_Select_NotOnsite,Is_Select_With_Extra_Pieces, Is_Select_Without_Extra_Pieces]
        switch ArrSelected {
        case [false,false,false,false,false,false,false,false,false,true] :
            if dropProject.text == "" && dropStructure.text == "" && dropPurchaseOrder.text == "" && dropPackingList.text == "" {
                DParam = ["is_extra" : !Is_Select_Without_Extra_Pieces,str_FilterParam_Project : str_Filter_ProjectID]
            }else {
                DParam = [str_FilterParam_Project : str_Filter_ProjectID,
                          str_FilterParam_PurchaseOrder : str_Filter_PurchaseOrder,
                          str_FilterParam_Strucher : str_Filter_Strucher,
                          str_FilterParam_PackingList : str_Filter_PackingList,
                          "is_extra" : !Is_Select_Without_Extra_Pieces]
            }
        case [false,false,false,false,false,false,false,false,false,false] :
            if dropProject.text == "" && dropStructure.text == "" && dropPurchaseOrder.text == "" && dropPackingList.text == "" {
                DParam = ["is_extra" : !Is_Select_Without_Extra_Pieces,str_FilterParam_Project : str_Filter_ProjectID]
            }else {
                DParam = [str_FilterParam_Project : str_Filter_ProjectID,
                          str_FilterParam_PurchaseOrder : str_Filter_PurchaseOrder,
                          str_FilterParam_Strucher : str_Filter_Strucher,
                          str_FilterParam_PackingList : str_Filter_PackingList,
                          "is_extra" : Is_Select_Without_Extra_Pieces]
            }
        case [false,false,false,false,false,false,false,false,true,false] :
            if dropProject.text == "" && dropStructure.text == "" && dropPurchaseOrder.text == "" && dropPackingList.text == "" {
                DParam = ["is_extra" : !Is_Select_Without_Extra_Pieces,str_FilterParam_Project : str_Filter_ProjectID]
            }else {
                DParam = [str_FilterParam_Project : str_Filter_ProjectID,
                          str_FilterParam_PurchaseOrder : str_Filter_PurchaseOrder,
                          str_FilterParam_Strucher : str_Filter_Strucher,
                          str_FilterParam_PackingList : str_Filter_PackingList,
                          "is_extra" : !Is_Select_Without_Extra_Pieces]
            }
        //WithOut Extra Pis
        case [true,false,false,false,false,false,false,false,false,false] : //Is Bolt && Is without extra
            DParam = [str_FilterParam_Project : str_Filter_ProjectID,
                      str_FilterParam_PurchaseOrder : str_Filter_PurchaseOrder,
                      str_FilterParam_Strucher : str_Filter_Strucher,
                      str_FilterParam_PackingList : str_Filter_PackingList,
                      "is_bolt" : Is_Select_Bolt]
        case [false,true,false,false,false,false,false,false,false,false] : //Is Steel && Is without extra
            DParam = [str_FilterParam_Project : str_Filter_ProjectID,
                      str_FilterParam_PurchaseOrder : str_Filter_PurchaseOrder,
                      str_FilterParam_Strucher : str_Filter_Strucher,
                      str_FilterParam_PackingList : str_Filter_PackingList,
                      "is_bolt" : Is_Select_Steel]
        case [false,false,true,false,false,false,false,false,false,true] : //Is Release && Is without extra
            DParam = [str_FilterParam_Project : str_Filter_ProjectID,
                      str_FilterParam_PurchaseOrder : str_Filter_PurchaseOrder,
                      str_FilterParam_Strucher : str_Filter_Strucher,
                      str_FilterParam_PackingList : str_Filter_PackingList,
                      "is_released" : Is_Select_Released,"is_extra" : !Is_Select_Without_Extra_Pieces]
        case [false,false,false,true,false,false,false,false,false,true] : //Is Not Release && Is without extra
            DParam = [str_FilterParam_Project : str_Filter_ProjectID,
                      str_FilterParam_PurchaseOrder : str_Filter_PurchaseOrder,
                      str_FilterParam_Strucher : str_Filter_Strucher,
                      str_FilterParam_PackingList : str_Filter_PackingList,
                      "is_released" : Is_Select_NotReleased,"is_extra" : !Is_Select_Without_Extra_Pieces]
        case [false,false,false,false,true,false,false,false,false,true] : //Is Shipped && Is without extra
            DParam = [str_FilterParam_Project : str_Filter_ProjectID,
                      str_FilterParam_PurchaseOrder : str_Filter_PurchaseOrder,
                      str_FilterParam_Strucher : str_Filter_Strucher,
                      str_FilterParam_PackingList : str_Filter_PackingList,
                      "is_shipped" : Is_Select_Shipped,"is_extra" : !Is_Select_Without_Extra_Pieces]
        case [false,false,false,false,false,true,false,false,false,true] : //Is Not Shipped && Is without extra
            DParam = [str_FilterParam_Project : str_Filter_ProjectID,
                      str_FilterParam_PurchaseOrder : str_Filter_PurchaseOrder,
                      str_FilterParam_Strucher : str_Filter_Strucher,
                      str_FilterParam_PackingList : str_Filter_PackingList,
                      "is_shipped" : Is_Select_NotShipped,"is_extra" : !Is_Select_Without_Extra_Pieces]
        case [false,false,false,false,false,false,true,false,false,true] : //Is Onsite && Is without extra
            DParam = [str_FilterParam_Project : str_Filter_ProjectID,
                      str_FilterParam_PurchaseOrder : str_Filter_PurchaseOrder,
                      str_FilterParam_Strucher : str_Filter_Strucher,
                      str_FilterParam_PackingList : str_Filter_PackingList,
                      "is_on_site" : Is_Select_Onsite,"is_extra" : !Is_Select_Without_Extra_Pieces]
        case [false,false,false,false,false,false,false,true,false,true] : // Is Not Onsite && Is without extra
            DParam = [str_FilterParam_Project : str_Filter_ProjectID,
                      str_FilterParam_PurchaseOrder : str_Filter_PurchaseOrder,
                      str_FilterParam_Strucher : str_Filter_Strucher,
                      str_FilterParam_PackingList : str_Filter_PackingList,
                      "is_on_site" : Is_Select_NotOnsite,"is_extra" : !Is_Select_Without_Extra_Pieces]
            
        //With Extra Pis
        case [false,false,true,false,false,false,false,false,true,false] : //Is Release With Is Extra Pis
            DParam = [str_FilterParam_Project : str_Filter_ProjectID,
                      str_FilterParam_PurchaseOrder : str_Filter_PurchaseOrder,
                      str_FilterParam_Strucher : str_Filter_Strucher,
                      str_FilterParam_PackingList : str_Filter_PackingList,
                      "is_released" : Is_Select_Released,"is_extra" : Is_Select_With_Extra_Pieces]
        case [false,false,false,true,false,false,false,false,true,false] : //Is Not Release
            DParam = [str_FilterParam_Project : str_Filter_ProjectID,
                      str_FilterParam_PurchaseOrder : str_Filter_PurchaseOrder,
                      str_FilterParam_Strucher : str_Filter_Strucher,
                      str_FilterParam_PackingList : str_Filter_PackingList,
                      "is_released" : Is_Select_NotReleased,"is_extra" : Is_Select_With_Extra_Pieces]
        case [false,false,false,false,true,false,false,false,true,false] : //Is Shipped
            DParam = [str_FilterParam_Project : str_Filter_ProjectID,
                      str_FilterParam_PurchaseOrder : str_Filter_PurchaseOrder,
                      str_FilterParam_Strucher : str_Filter_Strucher,
                      str_FilterParam_PackingList : str_Filter_PackingList,
                      "is_shipped" : Is_Select_Shipped,"is_extra" : Is_Select_With_Extra_Pieces]
        case [false,false,false,false,false,true,false,false,true,false] : //Is Not Shipped
            DParam = [str_FilterParam_Project : str_Filter_ProjectID,
                      str_FilterParam_PurchaseOrder : str_Filter_PurchaseOrder,
                      str_FilterParam_Strucher : str_Filter_Strucher,
                      str_FilterParam_PackingList : str_Filter_PackingList,
                      "is_shipped" : Is_Select_NotShipped,"is_extra" : Is_Select_With_Extra_Pieces]
        case [false,false,false,false,false,false,true,false,true,false] : //Is Onsite
            DParam = [str_FilterParam_Project : str_Filter_ProjectID,
                      str_FilterParam_PurchaseOrder : str_Filter_PurchaseOrder,
                      str_FilterParam_Strucher : str_Filter_Strucher,
                      str_FilterParam_PackingList : str_Filter_PackingList,
                      "is_on_site" : Is_Select_Onsite,"is_extra" : Is_Select_With_Extra_Pieces]
        case [false,false,false,false,false,false,false,true,true,false] : // Is Not Onsite
            DParam = [str_FilterParam_Project : str_Filter_ProjectID,
                      str_FilterParam_PurchaseOrder : str_Filter_PurchaseOrder,
                      str_FilterParam_Strucher : str_Filter_Strucher,
                      str_FilterParam_PackingList : str_Filter_PackingList,
                      "is_on_site" : Is_Select_NotOnsite,"is_extra" : Is_Select_With_Extra_Pieces]
        //Not select Without extra and IsExtra
        case [false,false,true,false,false,false,false,false,false,false] : //Is Release && Is without extra
            DParam = [str_FilterParam_Project : str_Filter_ProjectID,
                      str_FilterParam_PurchaseOrder : str_Filter_PurchaseOrder,
                      str_FilterParam_Strucher : str_Filter_Strucher,
                      str_FilterParam_PackingList : str_Filter_PackingList,
                      "is_released" : Is_Select_Released,"is_extra" : false]
        case [false,false,false,true,false,false,false,false,false,false] : //Is Not Release && Is without extra
            DParam = [str_FilterParam_Project : str_Filter_ProjectID,
                      str_FilterParam_PurchaseOrder : str_Filter_PurchaseOrder,
                      str_FilterParam_Strucher : str_Filter_Strucher,
                      str_FilterParam_PackingList : str_Filter_PackingList,
                      "is_released" : Is_Select_NotReleased,"is_extra" : false]
        case [false,false,false,false,true,false,false,false,false,false] : //Is Shipped && Is without extra
            DParam = [str_FilterParam_Project : str_Filter_ProjectID,
                      str_FilterParam_PurchaseOrder : str_Filter_PurchaseOrder,
                      str_FilterParam_Strucher : str_Filter_Strucher,
                      str_FilterParam_PackingList : str_Filter_PackingList,
                      "is_shipped" : Is_Select_Shipped,"is_extra" : false]
        case [false,false,false,false,false,true,false,false,false,false] : //Is Not Shipped && Is without extra
            DParam = [str_FilterParam_Project : str_Filter_ProjectID,
                      str_FilterParam_PurchaseOrder : str_Filter_PurchaseOrder,
                      str_FilterParam_Strucher : str_Filter_Strucher,
                      str_FilterParam_PackingList : str_Filter_PackingList,
                      "is_shipped" : Is_Select_NotShipped,"is_extra" : false]
        case [false,false,false,false,false,false,true,false,false,false] : //Is Onsite && Is without extra
            DParam = [str_FilterParam_Project : str_Filter_ProjectID,
                      str_FilterParam_PurchaseOrder : str_Filter_PurchaseOrder,
                      str_FilterParam_Strucher : str_Filter_Strucher,
                      str_FilterParam_PackingList : str_Filter_PackingList,
                      "is_on_site" : Is_Select_Onsite,"is_extra" : false]
        case [false,false,false,false,false,false,false,true,false,false] : // Is Not Onsite && Is without extra
            DParam = [str_FilterParam_Project : str_Filter_ProjectID,
                      str_FilterParam_PurchaseOrder : str_Filter_PurchaseOrder,
                      str_FilterParam_Strucher : str_Filter_Strucher,
                      str_FilterParam_PackingList : str_Filter_PackingList,
                      "is_on_site" : Is_Select_NotOnsite,"is_extra" : false]
        default:
            DParam = [str_FilterParam_Project : str_Filter_ProjectID,
                      str_FilterParam_PurchaseOrder : str_Filter_PurchaseOrder,
                      str_FilterParam_Strucher : str_Filter_Strucher,
                      str_FilterParam_PackingList : str_Filter_PackingList]
        }
        //        DEFAULTS.Set_View_Filter(arr_Places: DParam)
    }
    func SetFilterValue(Report_VC:UIViewController,tag:Int) {
        if tag == 1 {
            let ReportVC = Report_VC as! DReportVC
            if Is_Select_Steel == false || Is_Select_Bolt == false || Is_Select_Released == false || Is_Select_NotReleased == false || Is_Select_Shipped == false || Is_Select_NotShipped == false || Is_Select_NotOnsite == false || Is_Select_Onsite == false || Is_Select_With_Extra_Pieces == false || Is_Select_Without_Extra_Pieces == true {
                if dropProject.text == "" && dropStructure.text == "" && dropPurchaseOrder.text == "" && dropPackingList.text == "" {
                    ReportVC.param = ["is_extra" : !Is_Select_Without_Extra_Pieces,str_FilterParam_Project : str_Filter_ProjectID]
                }else {
                    ReportVC.param = [str_FilterParam_Project : str_Filter_ProjectID,
                    str_FilterParam_PurchaseOrder : str_Filter_PurchaseOrder,
                    str_FilterParam_Strucher : str_Filter_Strucher,
                    str_FilterParam_PackingList : str_Filter_PackingList,
                    "is_extra" : !Is_Select_Without_Extra_Pieces]
                }
            }else if Is_Select_Steel == false || Is_Select_Bolt == false || Is_Select_Released == false || Is_Select_NotReleased == false || Is_Select_Shipped == false || Is_Select_NotShipped == false || Is_Select_NotOnsite == false || Is_Select_Onsite == false || Is_Select_With_Extra_Pieces == true || Is_Select_Without_Extra_Pieces == false {
                ReportVC.param = [str_FilterParam_Project : str_Filter_ProjectID,
                                   str_FilterParam_PurchaseOrder : str_Filter_PurchaseOrder,
                                   str_FilterParam_Strucher : str_Filter_Strucher,
                                   str_FilterParam_PackingList : str_Filter_PackingList,
                                   "is_extra" : !Is_Select_Without_Extra_Pieces]
            }else if Is_Select_Steel == true || Is_Select_Bolt == false || Is_Select_Released == false || Is_Select_NotReleased == false || Is_Select_Shipped == false || Is_Select_NotShipped == false || Is_Select_NotOnsite == false || Is_Select_Onsite == false || Is_Select_With_Extra_Pieces == false || Is_Select_Without_Extra_Pieces == false {
                ReportVC.param = [str_FilterParam_Project : str_Filter_ProjectID,
                                   str_FilterParam_PurchaseOrder : str_Filter_PurchaseOrder,
                                   str_FilterParam_Strucher : str_Filter_Strucher,
                                   str_FilterParam_PackingList : str_Filter_PackingList,
                                   "is_bolt" : Is_Select_Bolt]
            }else if Is_Select_Steel == false || Is_Select_Bolt == true || Is_Select_Released == false || Is_Select_NotReleased == false || Is_Select_Shipped == false || Is_Select_NotShipped == false || Is_Select_NotOnsite == false || Is_Select_Onsite == false || Is_Select_With_Extra_Pieces == false || Is_Select_Without_Extra_Pieces == false {
                ReportVC.param = [str_FilterParam_Project : str_Filter_ProjectID,
                                   str_FilterParam_PurchaseOrder : str_Filter_PurchaseOrder,
                                   str_FilterParam_Strucher : str_Filter_Strucher,
                                   str_FilterParam_PackingList : str_Filter_PackingList,
                                   "is_bolt" : !Is_Select_Bolt]
            }else if Is_Select_Steel == false || Is_Select_Bolt == false || Is_Select_Released == true || Is_Select_NotReleased == false || Is_Select_Shipped == false || Is_Select_NotShipped == false || Is_Select_NotOnsite == false || Is_Select_Onsite == false || Is_Select_With_Extra_Pieces == false || Is_Select_Without_Extra_Pieces == false {
                ReportVC.param = [str_FilterParam_Project : str_Filter_ProjectID,
                                   str_FilterParam_PurchaseOrder : str_Filter_PurchaseOrder,
                                   str_FilterParam_Strucher : str_Filter_Strucher,
                                   str_FilterParam_PackingList : str_Filter_PackingList,
                                   "is_released" : Is_Select_Released]
            }else if Is_Select_Steel == false || Is_Select_Bolt == false || Is_Select_Released == false || Is_Select_NotReleased == true || Is_Select_Shipped == false || Is_Select_NotShipped == false || Is_Select_NotOnsite == false || Is_Select_Onsite == false || Is_Select_With_Extra_Pieces == false || Is_Select_Without_Extra_Pieces == false {
                ReportVC.param = [str_FilterParam_Project : str_Filter_ProjectID,
                                   str_FilterParam_PurchaseOrder : str_Filter_PurchaseOrder,
                                   str_FilterParam_Strucher : str_Filter_Strucher,
                                   str_FilterParam_PackingList : str_Filter_PackingList,
                                   "is_released" : !Is_Select_Released]
            }else if Is_Select_Steel == false || Is_Select_Bolt == false || Is_Select_Released == false || Is_Select_NotReleased == false || Is_Select_Shipped == true || Is_Select_NotShipped == false || Is_Select_NotOnsite == false || Is_Select_Onsite == false || Is_Select_With_Extra_Pieces == false || Is_Select_Without_Extra_Pieces == false {
                ReportVC.param = [str_FilterParam_Project : str_Filter_ProjectID,
                                   str_FilterParam_PurchaseOrder : str_Filter_PurchaseOrder,
                                   str_FilterParam_Strucher : str_Filter_Strucher,
                                   str_FilterParam_PackingList : str_Filter_PackingList,
                                   "is_shipped" : Is_Select_Shipped]
            }else if Is_Select_Steel == false || Is_Select_Bolt == false || Is_Select_Released == false || Is_Select_NotReleased == false || Is_Select_Shipped == false || Is_Select_NotShipped == true || Is_Select_NotOnsite == false || Is_Select_Onsite == false || Is_Select_With_Extra_Pieces == false || Is_Select_Without_Extra_Pieces == false {
                ReportVC.param = [str_FilterParam_Project : str_Filter_ProjectID,
                                   str_FilterParam_PurchaseOrder : str_Filter_PurchaseOrder,
                                   str_FilterParam_Strucher : str_Filter_Strucher,
                                   str_FilterParam_PackingList : str_Filter_PackingList,
                                   "is_shipped" : !Is_Select_Shipped]
            }else if Is_Select_Steel == false || Is_Select_Bolt == false || Is_Select_Released == false || Is_Select_NotReleased == false || Is_Select_Shipped == false || Is_Select_NotShipped == false || Is_Select_NotOnsite == false || Is_Select_Onsite == true || Is_Select_With_Extra_Pieces == false || Is_Select_Without_Extra_Pieces == false {
                ReportVC.param = [str_FilterParam_Project : str_Filter_ProjectID,
                                   str_FilterParam_PurchaseOrder : str_Filter_PurchaseOrder,
                                   str_FilterParam_Strucher : str_Filter_Strucher,
                                   str_FilterParam_PackingList : str_Filter_PackingList,
                                   "is_on_site" : Is_Select_Onsite]
            }else if Is_Select_Steel == false || Is_Select_Bolt == false || Is_Select_Released == false || Is_Select_NotReleased == false || Is_Select_Shipped == false || Is_Select_NotShipped == false || Is_Select_NotOnsite == true || Is_Select_Onsite == false || Is_Select_With_Extra_Pieces == false || Is_Select_Without_Extra_Pieces == false {
                ReportVC.param = [str_FilterParam_Project : str_Filter_ProjectID,
                                   str_FilterParam_PurchaseOrder : str_Filter_PurchaseOrder,
                                   str_FilterParam_Strucher : str_Filter_Strucher,
                                   str_FilterParam_PackingList : str_Filter_PackingList,
                                   "is_on_site" : !Is_Select_Onsite]
            }else if Is_Select_Steel == false || Is_Select_Bolt == false || Is_Select_Released == false || Is_Select_NotReleased == false || Is_Select_Shipped == false || Is_Select_NotShipped == false || Is_Select_NotOnsite == false || Is_Select_Onsite == false || Is_Select_With_Extra_Pieces == false || Is_Select_Without_Extra_Pieces == false {
                ReportVC.param = [str_FilterParam_Project : str_Filter_ProjectID,
                                   str_FilterParam_PurchaseOrder : str_Filter_PurchaseOrder,
                                   str_FilterParam_Strucher : str_Filter_Strucher,
                                   str_FilterParam_PackingList : str_Filter_PackingList]
            }
        }else if tag == 2 {
            let ReportVC = Report_VC as! GroupStructurewiseReportVC
            if Is_Select_Steel == false || Is_Select_Bolt == false || Is_Select_Released == false || Is_Select_NotReleased == false || Is_Select_Shipped == false || Is_Select_NotShipped == false || Is_Select_NotOnsite == false || Is_Select_Onsite == false || Is_Select_With_Extra_Pieces == false || Is_Select_Without_Extra_Pieces == true {
               if dropProject.text == "" && dropStructure.text == "" && dropPurchaseOrder.text == "" && dropPackingList.text == "" {
                    ReportVC.param = ["is_extra" : !Is_Select_Without_Extra_Pieces,str_FilterParam_Project : str_Filter_ProjectID]
                }else {
                    ReportVC.param = [str_FilterParam_Project : str_Filter_ProjectID,
                    str_FilterParam_PurchaseOrder : str_Filter_PurchaseOrder,
                    str_FilterParam_Strucher : str_Filter_Strucher,
                    str_FilterParam_PackingList : str_Filter_PackingList,
                    "is_extra" : !Is_Select_Without_Extra_Pieces]
                }
            }else if Is_Select_Steel == false || Is_Select_Bolt == false || Is_Select_Released == false || Is_Select_NotReleased == false || Is_Select_Shipped == false || Is_Select_NotShipped == false || Is_Select_NotOnsite == false || Is_Select_Onsite == false || Is_Select_With_Extra_Pieces == true || Is_Select_Without_Extra_Pieces == false {
                ReportVC.param = [str_FilterParam_Project : str_Filter_ProjectID,
                                   str_FilterParam_PurchaseOrder : str_Filter_PurchaseOrder,
                                   str_FilterParam_Strucher : str_Filter_Strucher,
                                   str_FilterParam_PackingList : str_Filter_PackingList,
                                   "is_extra" : !Is_Select_Without_Extra_Pieces]
            }else if Is_Select_Steel == true || Is_Select_Bolt == false || Is_Select_Released == false || Is_Select_NotReleased == false || Is_Select_Shipped == false || Is_Select_NotShipped == false || Is_Select_NotOnsite == false || Is_Select_Onsite == false || Is_Select_With_Extra_Pieces == false || Is_Select_Without_Extra_Pieces == false {
                ReportVC.param = [str_FilterParam_Project : str_Filter_ProjectID,
                                   str_FilterParam_PurchaseOrder : str_Filter_PurchaseOrder,
                                   str_FilterParam_Strucher : str_Filter_Strucher,
                                   str_FilterParam_PackingList : str_Filter_PackingList,
                                   "is_bolt" : Is_Select_Bolt]
            }else if Is_Select_Steel == false || Is_Select_Bolt == true || Is_Select_Released == false || Is_Select_NotReleased == false || Is_Select_Shipped == false || Is_Select_NotShipped == false || Is_Select_NotOnsite == false || Is_Select_Onsite == false || Is_Select_With_Extra_Pieces == false || Is_Select_Without_Extra_Pieces == false {
                ReportVC.param = [str_FilterParam_Project : str_Filter_ProjectID,
                                   str_FilterParam_PurchaseOrder : str_Filter_PurchaseOrder,
                                   str_FilterParam_Strucher : str_Filter_Strucher,
                                   str_FilterParam_PackingList : str_Filter_PackingList,
                                   "is_bolt" : !Is_Select_Bolt]
            }else if Is_Select_Steel == false || Is_Select_Bolt == false || Is_Select_Released == true || Is_Select_NotReleased == false || Is_Select_Shipped == false || Is_Select_NotShipped == false || Is_Select_NotOnsite == false || Is_Select_Onsite == false || Is_Select_With_Extra_Pieces == false || Is_Select_Without_Extra_Pieces == false {
                ReportVC.param = [str_FilterParam_Project : str_Filter_ProjectID,
                                   str_FilterParam_PurchaseOrder : str_Filter_PurchaseOrder,
                                   str_FilterParam_Strucher : str_Filter_Strucher,
                                   str_FilterParam_PackingList : str_Filter_PackingList,
                                   "is_released" : Is_Select_Released]
            }else if Is_Select_Steel == false || Is_Select_Bolt == false || Is_Select_Released == false || Is_Select_NotReleased == true || Is_Select_Shipped == false || Is_Select_NotShipped == false || Is_Select_NotOnsite == false || Is_Select_Onsite == false || Is_Select_With_Extra_Pieces == false || Is_Select_Without_Extra_Pieces == false {
                ReportVC.param = [str_FilterParam_Project : str_Filter_ProjectID,
                                   str_FilterParam_PurchaseOrder : str_Filter_PurchaseOrder,
                                   str_FilterParam_Strucher : str_Filter_Strucher,
                                   str_FilterParam_PackingList : str_Filter_PackingList,
                                   "is_released" : !Is_Select_Released]
            }else if Is_Select_Steel == false || Is_Select_Bolt == false || Is_Select_Released == false || Is_Select_NotReleased == false || Is_Select_Shipped == true || Is_Select_NotShipped == false || Is_Select_NotOnsite == false || Is_Select_Onsite == false || Is_Select_With_Extra_Pieces == false || Is_Select_Without_Extra_Pieces == false {
                ReportVC.param = [str_FilterParam_Project : str_Filter_ProjectID,
                                   str_FilterParam_PurchaseOrder : str_Filter_PurchaseOrder,
                                   str_FilterParam_Strucher : str_Filter_Strucher,
                                   str_FilterParam_PackingList : str_Filter_PackingList,
                                   "is_shipped" : Is_Select_Shipped]
            }else if Is_Select_Steel == false || Is_Select_Bolt == false || Is_Select_Released == false || Is_Select_NotReleased == false || Is_Select_Shipped == false || Is_Select_NotShipped == true || Is_Select_NotOnsite == false || Is_Select_Onsite == false || Is_Select_With_Extra_Pieces == false || Is_Select_Without_Extra_Pieces == false {
                ReportVC.param = [str_FilterParam_Project : str_Filter_ProjectID,
                                   str_FilterParam_PurchaseOrder : str_Filter_PurchaseOrder,
                                   str_FilterParam_Strucher : str_Filter_Strucher,
                                   str_FilterParam_PackingList : str_Filter_PackingList,
                                   "is_shipped" : !Is_Select_Shipped]
            }else if Is_Select_Steel == false || Is_Select_Bolt == false || Is_Select_Released == false || Is_Select_NotReleased == false || Is_Select_Shipped == false || Is_Select_NotShipped == false || Is_Select_NotOnsite == false || Is_Select_Onsite == true || Is_Select_With_Extra_Pieces == false || Is_Select_Without_Extra_Pieces == false {
                ReportVC.param = [str_FilterParam_Project : str_Filter_ProjectID,
                                   str_FilterParam_PurchaseOrder : str_Filter_PurchaseOrder,
                                   str_FilterParam_Strucher : str_Filter_Strucher,
                                   str_FilterParam_PackingList : str_Filter_PackingList,
                                   "is_on_site" : Is_Select_Onsite]
            }else if Is_Select_Steel == false || Is_Select_Bolt == false || Is_Select_Released == false || Is_Select_NotReleased == false || Is_Select_Shipped == false || Is_Select_NotShipped == false || Is_Select_NotOnsite == true || Is_Select_Onsite == false || Is_Select_With_Extra_Pieces == false || Is_Select_Without_Extra_Pieces == false {
                ReportVC.param = [str_FilterParam_Project : str_Filter_ProjectID,
                                   str_FilterParam_PurchaseOrder : str_Filter_PurchaseOrder,
                                   str_FilterParam_Strucher : str_Filter_Strucher,
                                   str_FilterParam_PackingList : str_Filter_PackingList,
                                   "is_on_site" : !Is_Select_Onsite]
            }else if Is_Select_Steel == false || Is_Select_Bolt == false || Is_Select_Released == false || Is_Select_NotReleased == false || Is_Select_Shipped == false || Is_Select_NotShipped == false || Is_Select_NotOnsite == false || Is_Select_Onsite == false || Is_Select_With_Extra_Pieces == false || Is_Select_Without_Extra_Pieces == false {
                ReportVC.param = [str_FilterParam_Project : str_Filter_ProjectID,
                                   str_FilterParam_PurchaseOrder : str_Filter_PurchaseOrder,
                                   str_FilterParam_Strucher : str_Filter_Strucher,
                                   str_FilterParam_PackingList : str_Filter_PackingList]
            }
        }else if tag == 3 {
            let ReportVC = Report_VC as! StructurewiseReportVC
            if Is_Select_Steel == false || Is_Select_Bolt == false || Is_Select_Released == false || Is_Select_NotReleased == false || Is_Select_Shipped == false || Is_Select_NotShipped == false || Is_Select_NotOnsite == false || Is_Select_Onsite == false || Is_Select_With_Extra_Pieces == false || Is_Select_Without_Extra_Pieces == true {
                if dropProject.text == "" && dropStructure.text == "" && dropPurchaseOrder.text == "" && dropPackingList.text == "" {
                    ReportVC.param = ["is_extra" : !Is_Select_Without_Extra_Pieces,str_FilterParam_Project : str_Filter_ProjectID]
                }else {
                    ReportVC.param = [str_FilterParam_Project : str_Filter_ProjectID,
                    str_FilterParam_PurchaseOrder : str_Filter_PurchaseOrder,
                    str_FilterParam_Strucher : str_Filter_Strucher,
                    str_FilterParam_PackingList : str_Filter_PackingList,
                    "is_extra" : !Is_Select_Without_Extra_Pieces]
                }
            }else if Is_Select_Steel == false || Is_Select_Bolt == false || Is_Select_Released == false || Is_Select_NotReleased == false || Is_Select_Shipped == false || Is_Select_NotShipped == false || Is_Select_NotOnsite == false || Is_Select_Onsite == false || Is_Select_With_Extra_Pieces == true || Is_Select_Without_Extra_Pieces == false {
                ReportVC.param = [str_FilterParam_Project : str_Filter_ProjectID,
                                   str_FilterParam_PurchaseOrder : str_Filter_PurchaseOrder,
                                   str_FilterParam_Strucher : str_Filter_Strucher,
                                   str_FilterParam_PackingList : str_Filter_PackingList,
                                   "is_extra" : !Is_Select_Without_Extra_Pieces]
            }else if Is_Select_Steel == true || Is_Select_Bolt == false || Is_Select_Released == false || Is_Select_NotReleased == false || Is_Select_Shipped == false || Is_Select_NotShipped == false || Is_Select_NotOnsite == false || Is_Select_Onsite == false || Is_Select_With_Extra_Pieces == false || Is_Select_Without_Extra_Pieces == false {
                ReportVC.param = [str_FilterParam_Project : str_Filter_ProjectID,
                                   str_FilterParam_PurchaseOrder : str_Filter_PurchaseOrder,
                                   str_FilterParam_Strucher : str_Filter_Strucher,
                                   str_FilterParam_PackingList : str_Filter_PackingList,
                                   "is_bolt" : Is_Select_Bolt]
            }else if Is_Select_Steel == false || Is_Select_Bolt == true || Is_Select_Released == false || Is_Select_NotReleased == false || Is_Select_Shipped == false || Is_Select_NotShipped == false || Is_Select_NotOnsite == false || Is_Select_Onsite == false || Is_Select_With_Extra_Pieces == false || Is_Select_Without_Extra_Pieces == false {
                ReportVC.param = [str_FilterParam_Project : str_Filter_ProjectID,
                                   str_FilterParam_PurchaseOrder : str_Filter_PurchaseOrder,
                                   str_FilterParam_Strucher : str_Filter_Strucher,
                                   str_FilterParam_PackingList : str_Filter_PackingList,
                                   "is_bolt" : !Is_Select_Bolt]
            }else if Is_Select_Steel == false || Is_Select_Bolt == false || Is_Select_Released == true || Is_Select_NotReleased == false || Is_Select_Shipped == false || Is_Select_NotShipped == false || Is_Select_NotOnsite == false || Is_Select_Onsite == false || Is_Select_With_Extra_Pieces == false || Is_Select_Without_Extra_Pieces == false {
                ReportVC.param = [str_FilterParam_Project : str_Filter_ProjectID,
                                   str_FilterParam_PurchaseOrder : str_Filter_PurchaseOrder,
                                   str_FilterParam_Strucher : str_Filter_Strucher,
                                   str_FilterParam_PackingList : str_Filter_PackingList,
                                   "is_released" : Is_Select_Released]
            }else if Is_Select_Steel == false || Is_Select_Bolt == false || Is_Select_Released == false || Is_Select_NotReleased == true || Is_Select_Shipped == false || Is_Select_NotShipped == false || Is_Select_NotOnsite == false || Is_Select_Onsite == false || Is_Select_With_Extra_Pieces == false || Is_Select_Without_Extra_Pieces == false {
                ReportVC.param = [str_FilterParam_Project : str_Filter_ProjectID,
                                   str_FilterParam_PurchaseOrder : str_Filter_PurchaseOrder,
                                   str_FilterParam_Strucher : str_Filter_Strucher,
                                   str_FilterParam_PackingList : str_Filter_PackingList,
                                   "is_released" : !Is_Select_Released]
            }else if Is_Select_Steel == false || Is_Select_Bolt == false || Is_Select_Released == false || Is_Select_NotReleased == false || Is_Select_Shipped == true || Is_Select_NotShipped == false || Is_Select_NotOnsite == false || Is_Select_Onsite == false || Is_Select_With_Extra_Pieces == false || Is_Select_Without_Extra_Pieces == false {
                ReportVC.param = [str_FilterParam_Project : str_Filter_ProjectID,
                                   str_FilterParam_PurchaseOrder : str_Filter_PurchaseOrder,
                                   str_FilterParam_Strucher : str_Filter_Strucher,
                                   str_FilterParam_PackingList : str_Filter_PackingList,
                                   "is_shipped" : Is_Select_Shipped]
            }else if Is_Select_Steel == false || Is_Select_Bolt == false || Is_Select_Released == false || Is_Select_NotReleased == false || Is_Select_Shipped == false || Is_Select_NotShipped == true || Is_Select_NotOnsite == false || Is_Select_Onsite == false || Is_Select_With_Extra_Pieces == false || Is_Select_Without_Extra_Pieces == false {
                ReportVC.param = [str_FilterParam_Project : str_Filter_ProjectID,
                                   str_FilterParam_PurchaseOrder : str_Filter_PurchaseOrder,
                                   str_FilterParam_Strucher : str_Filter_Strucher,
                                   str_FilterParam_PackingList : str_Filter_PackingList,
                                   "is_shipped" : !Is_Select_Shipped]
            }else if Is_Select_Steel == false || Is_Select_Bolt == false || Is_Select_Released == false || Is_Select_NotReleased == false || Is_Select_Shipped == false || Is_Select_NotShipped == false || Is_Select_NotOnsite == false || Is_Select_Onsite == true || Is_Select_With_Extra_Pieces == false || Is_Select_Without_Extra_Pieces == false {
                ReportVC.param = [str_FilterParam_Project : str_Filter_ProjectID,
                                   str_FilterParam_PurchaseOrder : str_Filter_PurchaseOrder,
                                   str_FilterParam_Strucher : str_Filter_Strucher,
                                   str_FilterParam_PackingList : str_Filter_PackingList,
                                   "is_on_site" : Is_Select_Onsite]
            }else if Is_Select_Steel == false || Is_Select_Bolt == false || Is_Select_Released == false || Is_Select_NotReleased == false || Is_Select_Shipped == false || Is_Select_NotShipped == false || Is_Select_NotOnsite == true || Is_Select_Onsite == false || Is_Select_With_Extra_Pieces == false || Is_Select_Without_Extra_Pieces == false {
                ReportVC.param = [str_FilterParam_Project : str_Filter_ProjectID,
                                   str_FilterParam_PurchaseOrder : str_Filter_PurchaseOrder,
                                   str_FilterParam_Strucher : str_Filter_Strucher,
                                   str_FilterParam_PackingList : str_Filter_PackingList,
                                   "is_on_site" : !Is_Select_Onsite]
            }else if Is_Select_Steel == false || Is_Select_Bolt == false || Is_Select_Released == false || Is_Select_NotReleased == false || Is_Select_Shipped == false || Is_Select_NotShipped == false || Is_Select_NotOnsite == false || Is_Select_Onsite == false || Is_Select_With_Extra_Pieces == false || Is_Select_Without_Extra_Pieces == false {
                ReportVC.param = [str_FilterParam_Project : str_Filter_ProjectID,
                                   str_FilterParam_PurchaseOrder : str_Filter_PurchaseOrder,
                                   str_FilterParam_Strucher : str_Filter_Strucher,
                                   str_FilterParam_PackingList : str_Filter_PackingList]
            }
        }else if tag == 4 {
            let ReportVC = Report_VC as! PackingListReport_VC
            if Is_Select_Steel == false || Is_Select_Bolt == false || Is_Select_Released == false || Is_Select_NotReleased == false || Is_Select_Shipped == false || Is_Select_NotShipped == false || Is_Select_NotOnsite == false || Is_Select_Onsite == false || Is_Select_With_Extra_Pieces == false || Is_Select_Without_Extra_Pieces == true {
               if dropProject.text == "" && dropStructure.text == "" && dropPurchaseOrder.text == "" && dropPackingList.text == "" {
                    ReportVC.param = ["is_extra" : !Is_Select_Without_Extra_Pieces,str_FilterParam_Project : str_Filter_ProjectID]
                }else {
                    ReportVC.param = [str_FilterParam_Project : str_Filter_ProjectID,
                    str_FilterParam_PurchaseOrder : str_Filter_PurchaseOrder,
                    str_FilterParam_Strucher : str_Filter_Strucher,
                    str_FilterParam_PackingList : str_Filter_PackingList,
                    "is_extra" : !Is_Select_Without_Extra_Pieces]
                }
            }else if Is_Select_Steel == false || Is_Select_Bolt == false || Is_Select_Released == false || Is_Select_NotReleased == false || Is_Select_Shipped == false || Is_Select_NotShipped == false || Is_Select_NotOnsite == false || Is_Select_Onsite == false || Is_Select_With_Extra_Pieces == true || Is_Select_Without_Extra_Pieces == false {
                ReportVC.param = [str_FilterParam_Project : str_Filter_ProjectID,
                                   str_FilterParam_PurchaseOrder : str_Filter_PurchaseOrder,
                                   str_FilterParam_Strucher : str_Filter_Strucher,
                                   str_FilterParam_PackingList : str_Filter_PackingList,
                                   "is_extra" : !Is_Select_Without_Extra_Pieces]
            }else if Is_Select_Steel == true || Is_Select_Bolt == false || Is_Select_Released == false || Is_Select_NotReleased == false || Is_Select_Shipped == false || Is_Select_NotShipped == false || Is_Select_NotOnsite == false || Is_Select_Onsite == false || Is_Select_With_Extra_Pieces == false || Is_Select_Without_Extra_Pieces == false {
                ReportVC.param = [str_FilterParam_Project : str_Filter_ProjectID,
                                   str_FilterParam_PurchaseOrder : str_Filter_PurchaseOrder,
                                   str_FilterParam_Strucher : str_Filter_Strucher,
                                   str_FilterParam_PackingList : str_Filter_PackingList,
                                   "is_bolt" : Is_Select_Bolt]
            }else if Is_Select_Steel == false || Is_Select_Bolt == true || Is_Select_Released == false || Is_Select_NotReleased == false || Is_Select_Shipped == false || Is_Select_NotShipped == false || Is_Select_NotOnsite == false || Is_Select_Onsite == false || Is_Select_With_Extra_Pieces == false || Is_Select_Without_Extra_Pieces == false {
                ReportVC.param = [str_FilterParam_Project : str_Filter_ProjectID,
                                   str_FilterParam_PurchaseOrder : str_Filter_PurchaseOrder,
                                   str_FilterParam_Strucher : str_Filter_Strucher,
                                   str_FilterParam_PackingList : str_Filter_PackingList,
                                   "is_bolt" : !Is_Select_Bolt]
            }else if Is_Select_Steel == false || Is_Select_Bolt == false || Is_Select_Released == true || Is_Select_NotReleased == false || Is_Select_Shipped == false || Is_Select_NotShipped == false || Is_Select_NotOnsite == false || Is_Select_Onsite == false || Is_Select_With_Extra_Pieces == false || Is_Select_Without_Extra_Pieces == false {
                ReportVC.param = [str_FilterParam_Project : str_Filter_ProjectID,
                                   str_FilterParam_PurchaseOrder : str_Filter_PurchaseOrder,
                                   str_FilterParam_Strucher : str_Filter_Strucher,
                                   str_FilterParam_PackingList : str_Filter_PackingList,
                                   "is_released" : Is_Select_Released]
            }else if Is_Select_Steel == false || Is_Select_Bolt == false || Is_Select_Released == false || Is_Select_NotReleased == true || Is_Select_Shipped == false || Is_Select_NotShipped == false || Is_Select_NotOnsite == false || Is_Select_Onsite == false || Is_Select_With_Extra_Pieces == false || Is_Select_Without_Extra_Pieces == false {
                ReportVC.param = [str_FilterParam_Project : str_Filter_ProjectID,
                                   str_FilterParam_PurchaseOrder : str_Filter_PurchaseOrder,
                                   str_FilterParam_Strucher : str_Filter_Strucher,
                                   str_FilterParam_PackingList : str_Filter_PackingList,
                                   "is_released" : !Is_Select_Released]
            }else if Is_Select_Steel == false || Is_Select_Bolt == false || Is_Select_Released == false || Is_Select_NotReleased == false || Is_Select_Shipped == true || Is_Select_NotShipped == false || Is_Select_NotOnsite == false || Is_Select_Onsite == false || Is_Select_With_Extra_Pieces == false || Is_Select_Without_Extra_Pieces == false {
                ReportVC.param = [str_FilterParam_Project : str_Filter_ProjectID,
                                   str_FilterParam_PurchaseOrder : str_Filter_PurchaseOrder,
                                   str_FilterParam_Strucher : str_Filter_Strucher,
                                   str_FilterParam_PackingList : str_Filter_PackingList,
                                   "is_shipped" : Is_Select_Shipped]
            }else if Is_Select_Steel == false || Is_Select_Bolt == false || Is_Select_Released == false || Is_Select_NotReleased == false || Is_Select_Shipped == false || Is_Select_NotShipped == true || Is_Select_NotOnsite == false || Is_Select_Onsite == false || Is_Select_With_Extra_Pieces == false || Is_Select_Without_Extra_Pieces == false {
                ReportVC.param = [str_FilterParam_Project : str_Filter_ProjectID,
                                   str_FilterParam_PurchaseOrder : str_Filter_PurchaseOrder,
                                   str_FilterParam_Strucher : str_Filter_Strucher,
                                   str_FilterParam_PackingList : str_Filter_PackingList,
                                   "is_shipped" : !Is_Select_Shipped]
            }else if Is_Select_Steel == false || Is_Select_Bolt == false || Is_Select_Released == false || Is_Select_NotReleased == false || Is_Select_Shipped == false || Is_Select_NotShipped == false || Is_Select_NotOnsite == false || Is_Select_Onsite == true || Is_Select_With_Extra_Pieces == false || Is_Select_Without_Extra_Pieces == false {
                ReportVC.param = [str_FilterParam_Project : str_Filter_ProjectID,
                                   str_FilterParam_PurchaseOrder : str_Filter_PurchaseOrder,
                                   str_FilterParam_Strucher : str_Filter_Strucher,
                                   str_FilterParam_PackingList : str_Filter_PackingList,
                                   "is_on_site" : Is_Select_Onsite]
            }else if Is_Select_Steel == false || Is_Select_Bolt == false || Is_Select_Released == false || Is_Select_NotReleased == false || Is_Select_Shipped == false || Is_Select_NotShipped == false || Is_Select_NotOnsite == true || Is_Select_Onsite == false || Is_Select_With_Extra_Pieces == false || Is_Select_Without_Extra_Pieces == false {
                ReportVC.param = [str_FilterParam_Project : str_Filter_ProjectID,
                                   str_FilterParam_PurchaseOrder : str_Filter_PurchaseOrder,
                                   str_FilterParam_Strucher : str_Filter_Strucher,
                                   str_FilterParam_PackingList : str_Filter_PackingList,
                                   "is_on_site" : !Is_Select_Onsite]
            }else if Is_Select_Steel == false || Is_Select_Bolt == false || Is_Select_Released == false || Is_Select_NotReleased == false || Is_Select_Shipped == false || Is_Select_NotShipped == false || Is_Select_NotOnsite == false || Is_Select_Onsite == false || Is_Select_With_Extra_Pieces == false || Is_Select_Without_Extra_Pieces == false {
                ReportVC.param = [str_FilterParam_Project : str_Filter_ProjectID,
                                   str_FilterParam_PurchaseOrder : str_Filter_PurchaseOrder,
                                   str_FilterParam_Strucher : str_Filter_Strucher,
                                   str_FilterParam_PackingList : str_Filter_PackingList]
            }
        }else if tag == 5 {
            let ReportVC = Report_VC as! MarkwiseCumulativeReportVC
            if Is_Select_Steel == false || Is_Select_Bolt == false || Is_Select_Released == false || Is_Select_NotReleased == false || Is_Select_Shipped == false || Is_Select_NotShipped == false || Is_Select_NotOnsite == false || Is_Select_Onsite == false || Is_Select_With_Extra_Pieces == false || Is_Select_Without_Extra_Pieces == true {
                if dropProject.text == "" && dropStructure.text == "" && dropPurchaseOrder.text == "" && dropPackingList.text == "" {
                    ReportVC.param = ["is_extra" : !Is_Select_Without_Extra_Pieces,str_FilterParam_Project : str_Filter_ProjectID]
                }else {
                    ReportVC.param = [str_FilterParam_Project : str_Filter_ProjectID,
                    str_FilterParam_PurchaseOrder : str_Filter_PurchaseOrder,
                    str_FilterParam_Strucher : str_Filter_Strucher,
                    str_FilterParam_PackingList : str_Filter_PackingList,
                    "is_extra" : !Is_Select_Without_Extra_Pieces]
                }
            }else if Is_Select_Steel == false || Is_Select_Bolt == false || Is_Select_Released == false || Is_Select_NotReleased == false || Is_Select_Shipped == false || Is_Select_NotShipped == false || Is_Select_NotOnsite == false || Is_Select_Onsite == false || Is_Select_With_Extra_Pieces == true || Is_Select_Without_Extra_Pieces == false {
                ReportVC.param = [str_FilterParam_Project : str_Filter_ProjectID,
                                   str_FilterParam_PurchaseOrder : str_Filter_PurchaseOrder,
                                   str_FilterParam_Strucher : str_Filter_Strucher,
                                   str_FilterParam_PackingList : str_Filter_PackingList,
                                   "is_extra" : !Is_Select_Without_Extra_Pieces]
            }else if Is_Select_Steel == true || Is_Select_Bolt == false || Is_Select_Released == false || Is_Select_NotReleased == false || Is_Select_Shipped == false || Is_Select_NotShipped == false || Is_Select_NotOnsite == false || Is_Select_Onsite == false || Is_Select_With_Extra_Pieces == false || Is_Select_Without_Extra_Pieces == false {
                ReportVC.param = [str_FilterParam_Project : str_Filter_ProjectID,
                                   str_FilterParam_PurchaseOrder : str_Filter_PurchaseOrder,
                                   str_FilterParam_Strucher : str_Filter_Strucher,
                                   str_FilterParam_PackingList : str_Filter_PackingList,
                                   "is_bolt" : Is_Select_Bolt]
            }else if Is_Select_Steel == false || Is_Select_Bolt == true || Is_Select_Released == false || Is_Select_NotReleased == false || Is_Select_Shipped == false || Is_Select_NotShipped == false || Is_Select_NotOnsite == false || Is_Select_Onsite == false || Is_Select_With_Extra_Pieces == false || Is_Select_Without_Extra_Pieces == false {
                ReportVC.param = [str_FilterParam_Project : str_Filter_ProjectID,
                                   str_FilterParam_PurchaseOrder : str_Filter_PurchaseOrder,
                                   str_FilterParam_Strucher : str_Filter_Strucher,
                                   str_FilterParam_PackingList : str_Filter_PackingList,
                                   "is_bolt" : !Is_Select_Bolt]
            }else if Is_Select_Steel == false || Is_Select_Bolt == false || Is_Select_Released == true || Is_Select_NotReleased == false || Is_Select_Shipped == false || Is_Select_NotShipped == false || Is_Select_NotOnsite == false || Is_Select_Onsite == false || Is_Select_With_Extra_Pieces == false || Is_Select_Without_Extra_Pieces == false {
                ReportVC.param = [str_FilterParam_Project : str_Filter_ProjectID,
                                   str_FilterParam_PurchaseOrder : str_Filter_PurchaseOrder,
                                   str_FilterParam_Strucher : str_Filter_Strucher,
                                   str_FilterParam_PackingList : str_Filter_PackingList,
                                   "is_released" : Is_Select_Released]
            }else if Is_Select_Steel == false || Is_Select_Bolt == false || Is_Select_Released == false || Is_Select_NotReleased == true || Is_Select_Shipped == false || Is_Select_NotShipped == false || Is_Select_NotOnsite == false || Is_Select_Onsite == false || Is_Select_With_Extra_Pieces == false || Is_Select_Without_Extra_Pieces == false {
                ReportVC.param = [str_FilterParam_Project : str_Filter_ProjectID,
                                   str_FilterParam_PurchaseOrder : str_Filter_PurchaseOrder,
                                   str_FilterParam_Strucher : str_Filter_Strucher,
                                   str_FilterParam_PackingList : str_Filter_PackingList,
                                   "is_released" : !Is_Select_Released]
            }else if Is_Select_Steel == false || Is_Select_Bolt == false || Is_Select_Released == false || Is_Select_NotReleased == false || Is_Select_Shipped == true || Is_Select_NotShipped == false || Is_Select_NotOnsite == false || Is_Select_Onsite == false || Is_Select_With_Extra_Pieces == false || Is_Select_Without_Extra_Pieces == false {
                ReportVC.param = [str_FilterParam_Project : str_Filter_ProjectID,
                                   str_FilterParam_PurchaseOrder : str_Filter_PurchaseOrder,
                                   str_FilterParam_Strucher : str_Filter_Strucher,
                                   str_FilterParam_PackingList : str_Filter_PackingList,
                                   "is_shipped" : Is_Select_Shipped]
            }else if Is_Select_Steel == false || Is_Select_Bolt == false || Is_Select_Released == false || Is_Select_NotReleased == false || Is_Select_Shipped == false || Is_Select_NotShipped == true || Is_Select_NotOnsite == false || Is_Select_Onsite == false || Is_Select_With_Extra_Pieces == false || Is_Select_Without_Extra_Pieces == false {
                ReportVC.param = [str_FilterParam_Project : str_Filter_ProjectID,
                                   str_FilterParam_PurchaseOrder : str_Filter_PurchaseOrder,
                                   str_FilterParam_Strucher : str_Filter_Strucher,
                                   str_FilterParam_PackingList : str_Filter_PackingList,
                                   "is_shipped" : !Is_Select_Shipped]
            }else if Is_Select_Steel == false || Is_Select_Bolt == false || Is_Select_Released == false || Is_Select_NotReleased == false || Is_Select_Shipped == false || Is_Select_NotShipped == false || Is_Select_NotOnsite == false || Is_Select_Onsite == true || Is_Select_With_Extra_Pieces == false || Is_Select_Without_Extra_Pieces == false {
                ReportVC.param = [str_FilterParam_Project : str_Filter_ProjectID,
                                   str_FilterParam_PurchaseOrder : str_Filter_PurchaseOrder,
                                   str_FilterParam_Strucher : str_Filter_Strucher,
                                   str_FilterParam_PackingList : str_Filter_PackingList,
                                   "is_on_site" : Is_Select_Onsite]
            }else if Is_Select_Steel == false || Is_Select_Bolt == false || Is_Select_Released == false || Is_Select_NotReleased == false || Is_Select_Shipped == false || Is_Select_NotShipped == false || Is_Select_NotOnsite == true || Is_Select_Onsite == false || Is_Select_With_Extra_Pieces == false || Is_Select_Without_Extra_Pieces == false {
                ReportVC.param = [str_FilterParam_Project : str_Filter_ProjectID,
                                   str_FilterParam_PurchaseOrder : str_Filter_PurchaseOrder,
                                   str_FilterParam_Strucher : str_Filter_Strucher,
                                   str_FilterParam_PackingList : str_Filter_PackingList,
                                   "is_on_site" : !Is_Select_Onsite]
            }else if Is_Select_Steel == false || Is_Select_Bolt == false || Is_Select_Released == false || Is_Select_NotReleased == false || Is_Select_Shipped == false || Is_Select_NotShipped == false || Is_Select_NotOnsite == false || Is_Select_Onsite == false || Is_Select_With_Extra_Pieces == false || Is_Select_Without_Extra_Pieces == false {
                ReportVC.param = [str_FilterParam_Project : str_Filter_ProjectID,
                                   str_FilterParam_PurchaseOrder : str_Filter_PurchaseOrder,
                                   str_FilterParam_Strucher : str_Filter_Strucher,
                                   str_FilterParam_PackingList : str_Filter_PackingList]
            }
        }else {
                let ReportVC = Report_VC as! R_MarkwiseReportVC
                if Is_Select_Steel == false || Is_Select_Bolt == false || Is_Select_Released == false || Is_Select_NotReleased == false || Is_Select_Shipped == false || Is_Select_NotShipped == false || Is_Select_NotOnsite == false || Is_Select_Onsite == false || Is_Select_With_Extra_Pieces == false || Is_Select_Without_Extra_Pieces == true {
                    if dropProject.text == "" && dropStructure.text == "" && dropPurchaseOrder.text == "" && dropPackingList.text == "" {
                        ReportVC.param = ["is_extra" : !Is_Select_Without_Extra_Pieces,str_FilterParam_Project : str_Filter_ProjectID]
                    }else {
                        ReportVC.param = [str_FilterParam_Project : str_Filter_ProjectID,
                        str_FilterParam_PurchaseOrder : str_Filter_PurchaseOrder,
                        str_FilterParam_Strucher : str_Filter_Strucher,
                        str_FilterParam_PackingList : str_Filter_PackingList,
                        "is_extra" : !Is_Select_Without_Extra_Pieces]
                    }
                }else if Is_Select_Steel == false || Is_Select_Bolt == false || Is_Select_Released == false || Is_Select_NotReleased == false || Is_Select_Shipped == false || Is_Select_NotShipped == false || Is_Select_NotOnsite == false || Is_Select_Onsite == false || Is_Select_With_Extra_Pieces == true || Is_Select_Without_Extra_Pieces == false {
                    ReportVC.param = [str_FilterParam_Project : str_Filter_ProjectID,
                                       str_FilterParam_PurchaseOrder : str_Filter_PurchaseOrder,
                                       str_FilterParam_Strucher : str_Filter_Strucher,
                                       str_FilterParam_PackingList : str_Filter_PackingList,
                                       "is_extra" : !Is_Select_Without_Extra_Pieces]
                }else if Is_Select_Steel == true || Is_Select_Bolt == false || Is_Select_Released == false || Is_Select_NotReleased == false || Is_Select_Shipped == false || Is_Select_NotShipped == false || Is_Select_NotOnsite == false || Is_Select_Onsite == false || Is_Select_With_Extra_Pieces == false || Is_Select_Without_Extra_Pieces == false {
                    ReportVC.param = [str_FilterParam_Project : str_Filter_ProjectID,
                                       str_FilterParam_PurchaseOrder : str_Filter_PurchaseOrder,
                                       str_FilterParam_Strucher : str_Filter_Strucher,
                                       str_FilterParam_PackingList : str_Filter_PackingList,
                                       "is_bolt" : Is_Select_Bolt]
                }else if Is_Select_Steel == false || Is_Select_Bolt == true || Is_Select_Released == false || Is_Select_NotReleased == false || Is_Select_Shipped == false || Is_Select_NotShipped == false || Is_Select_NotOnsite == false || Is_Select_Onsite == false || Is_Select_With_Extra_Pieces == false || Is_Select_Without_Extra_Pieces == false {
                    ReportVC.param = [str_FilterParam_Project : str_Filter_ProjectID,
                                       str_FilterParam_PurchaseOrder : str_Filter_PurchaseOrder,
                                       str_FilterParam_Strucher : str_Filter_Strucher,
                                       str_FilterParam_PackingList : str_Filter_PackingList,
                                       "is_bolt" : !Is_Select_Bolt]
                }else if Is_Select_Steel == false || Is_Select_Bolt == false || Is_Select_Released == true || Is_Select_NotReleased == false || Is_Select_Shipped == false || Is_Select_NotShipped == false || Is_Select_NotOnsite == false || Is_Select_Onsite == false || Is_Select_With_Extra_Pieces == false || Is_Select_Without_Extra_Pieces == false {
                    ReportVC.param = [str_FilterParam_Project : str_Filter_ProjectID,
                                       str_FilterParam_PurchaseOrder : str_Filter_PurchaseOrder,
                                       str_FilterParam_Strucher : str_Filter_Strucher,
                                       str_FilterParam_PackingList : str_Filter_PackingList,
                                       "is_released" : Is_Select_Released]
                }else if Is_Select_Steel == false || Is_Select_Bolt == false || Is_Select_Released == false || Is_Select_NotReleased == true || Is_Select_Shipped == false || Is_Select_NotShipped == false || Is_Select_NotOnsite == false || Is_Select_Onsite == false || Is_Select_With_Extra_Pieces == false || Is_Select_Without_Extra_Pieces == false {
                    ReportVC.param = [str_FilterParam_Project : str_Filter_ProjectID,
                                       str_FilterParam_PurchaseOrder : str_Filter_PurchaseOrder,
                                       str_FilterParam_Strucher : str_Filter_Strucher,
                                       str_FilterParam_PackingList : str_Filter_PackingList,
                                       "is_released" : !Is_Select_Released]
                }else if Is_Select_Steel == false || Is_Select_Bolt == false || Is_Select_Released == false || Is_Select_NotReleased == false || Is_Select_Shipped == true || Is_Select_NotShipped == false || Is_Select_NotOnsite == false || Is_Select_Onsite == false || Is_Select_With_Extra_Pieces == false || Is_Select_Without_Extra_Pieces == false {
                    ReportVC.param = [str_FilterParam_Project : str_Filter_ProjectID,
                                       str_FilterParam_PurchaseOrder : str_Filter_PurchaseOrder,
                                       str_FilterParam_Strucher : str_Filter_Strucher,
                                       str_FilterParam_PackingList : str_Filter_PackingList,
                                       "is_shipped" : Is_Select_Shipped]
                }else if Is_Select_Steel == false || Is_Select_Bolt == false || Is_Select_Released == false || Is_Select_NotReleased == false || Is_Select_Shipped == false || Is_Select_NotShipped == true || Is_Select_NotOnsite == false || Is_Select_Onsite == false || Is_Select_With_Extra_Pieces == false || Is_Select_Without_Extra_Pieces == false {
                    ReportVC.param = [str_FilterParam_Project : str_Filter_ProjectID,
                                       str_FilterParam_PurchaseOrder : str_Filter_PurchaseOrder,
                                       str_FilterParam_Strucher : str_Filter_Strucher,
                                       str_FilterParam_PackingList : str_Filter_PackingList,
                                       "is_shipped" : !Is_Select_Shipped]
                }else if Is_Select_Steel == false || Is_Select_Bolt == false || Is_Select_Released == false || Is_Select_NotReleased == false || Is_Select_Shipped == false || Is_Select_NotShipped == false || Is_Select_NotOnsite == false || Is_Select_Onsite == true || Is_Select_With_Extra_Pieces == false || Is_Select_Without_Extra_Pieces == false {
                    ReportVC.param = [str_FilterParam_Project : str_Filter_ProjectID,
                                       str_FilterParam_PurchaseOrder : str_Filter_PurchaseOrder,
                                       str_FilterParam_Strucher : str_Filter_Strucher,
                                       str_FilterParam_PackingList : str_Filter_PackingList,
                                       "is_on_site" : Is_Select_Onsite]
                }else if Is_Select_Steel == false || Is_Select_Bolt == false || Is_Select_Released == false || Is_Select_NotReleased == false || Is_Select_Shipped == false || Is_Select_NotShipped == false || Is_Select_NotOnsite == true || Is_Select_Onsite == false || Is_Select_With_Extra_Pieces == false || Is_Select_Without_Extra_Pieces == false {
                    ReportVC.param = [str_FilterParam_Project : str_Filter_ProjectID,
                                       str_FilterParam_PurchaseOrder : str_Filter_PurchaseOrder,
                                       str_FilterParam_Strucher : str_Filter_Strucher,
                                       str_FilterParam_PackingList : str_Filter_PackingList,
                                       "is_on_site" : !Is_Select_Onsite]
                }else if Is_Select_Steel == false || Is_Select_Bolt == false || Is_Select_Released == false || Is_Select_NotReleased == false || Is_Select_Shipped == false || Is_Select_NotShipped == false || Is_Select_NotOnsite == false || Is_Select_Onsite == false || Is_Select_With_Extra_Pieces == false || Is_Select_Without_Extra_Pieces == false {
                    ReportVC.param = [str_FilterParam_Project : str_Filter_ProjectID,
                                       str_FilterParam_PurchaseOrder : str_Filter_PurchaseOrder,
                                       str_FilterParam_Strucher : str_Filter_Strucher,
                                       str_FilterParam_PackingList : str_Filter_PackingList]
                }
        }
    }
}

extension ReportsFiltersVC : UITextFieldDelegate {
// MARK: - TextField Delegate Methods
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        return false
    }
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    func textFieldDidBeginEditing(_ textField: UITextField)
    {
        if textField.tag == 1 {
            self.text_tag = 1
            self.Arr_Project_Name = NSMutableArray(array: Arr_Project.map{($0.project!)} as NSArray)
            let id1  = Arr_Project.compactMap{$0.id}
            let pon  = Arr_Project.compactMap{$0.project}
            var parsonmodel = [Person]()
            parsonmodel.append(Person(id: id1, poNo: pon))
            self.Mode_Selection(ArrContent: parsonmodel, arrProjectTab: 1)
        } else if textField.tag == 2  {
            self.text_tag = 2
            let id1 : [Int] = Arr_PurchaseOrder.compactMap{$0.id!}
            let pon : [String] = Arr_PurchaseOrder.compactMap{$0.poNo!}
            var parsonmodel = [Person]()
            parsonmodel.append(Person(id: id1, poNo: pon))
            self.Mode_Selection(ArrContent: parsonmodel, arrProjectTab: 2)
        } else if textField.tag == 3  {
            self.text_tag = 3
            let id1 : [Int] = Arr_Strucher.compactMap{$0.id!}
            let pon : [String] = Arr_Strucher.compactMap{$0.structure!}
            var parsonmodel = [Person]()
            parsonmodel.append(Person(id: id1, poNo: pon))
            self.Mode_Selection(ArrContent: parsonmodel, arrProjectTab: 3)
        } else if textField.tag == 4  {
            self.text_tag = 4
            let id1 : [Int] = Arr_PackingList.compactMap{$0.id!}
            let pon : [String] = Arr_PackingList.compactMap{$0.packingList!}
            var parsonmodel = [Person]()
            parsonmodel.append(Person(id: id1, poNo: pon))
            self.Mode_Selection(ArrContent: parsonmodel, arrProjectTab: 4)
        }
    }
}
