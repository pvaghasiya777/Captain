//
//  ReportsFiltersVC.swift
//  report
//  Created by macbook on 25/06/1942 Saka.
//  Copyright © 1942 com.mac. All rights reserved.
//

import UIKit
import PatrickMultipleSelectionTableview
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
//    var arrContent : NSMutableArray = ["IPhone","IMac","IPad","MacBook","IPod","MacMini","Apple TV"]
    @IBOutlet  var popup : KLCPopup!
    @IBOutlet var popup_Select : multiselectpopup?
    var Arr_Project = [FilterProjectModel]()
    var Arr_PurchaseOrder = [FilterPurchaseOrderModel]()
    var Arr_Strucher = [FilterStructureModel]()
    var Arr_PackingList = [FilterPackingListModel]()
    var Arr_Mark = [MarkResult]()
    var str_FilterName = ""
    var Arr_Project_Name : NSMutableArray = NSMutableArray()
    var arrfiltervalue = String()
    var text_tag = Int()
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
    //Excess Quantity
    var Is_Select_With_Extra_Pieces : Bool = false
    var Is_Select_Without_Extra_Pieces : Bool = true
    //Material Status
    var Is_Select_Released : Bool = false
    var Is_Select_NotReleased : Bool = false
    var Is_Select_Shipped : Bool = false
    var Is_Select_NotShipped : Bool = false
    var Is_Select_Onsite : Bool = false
    var Is_Select_NotOnsite : Bool = false
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
    //MARK :- PickUp Filter Selection
    func showMultipleSelectionTableview(arrContent : NSMutableArray) -> String
    {
        let podBundle = Bundle(for: PKMulipleSelectionVC.self)
        var bundleURL = podBundle.url(forResource: "PatrickMultipleSelectionTableview", withExtension: "bundle")
        var bundle = Bundle(url: bundleURL!)!
        var storyboard = UIStoryboard(name: "Main", bundle: bundle)
        let vc:PKMulipleSelectionVC = storyboard.instantiateViewController(withIdentifier: "PKMulipleSelectionVC") as! PKMulipleSelectionVC
      //  vc.view.frame = CGRect(x: self.view.center.x - 100, y: self.view.center.y - 100, width: 300, height: 400)
        if self.text_tag == 1 {
            let arrdata : NSMutableArray = []
             arrdata.addObjects(from: arrContent as! [String])
            vc.arrContent = arrdata
        } else if self.text_tag == 2 {
            let arrdata : NSMutableArray = []
             arrdata.addObjects(from: arrContent as! [String])
            vc.arrContent = arrdata
        } else if self.text_tag == 3 {
            let arrdata : NSMutableArray = []
             arrdata.addObjects(from: arrContent as! [String])
            vc.arrContent = arrdata
        } else if self.text_tag == 4 {
            let arrdata : NSMutableArray = []
             arrdata.addObjects(from: arrContent as! [String])
            vc.arrContent = arrdata
        }
        vc.backgroundColorDoneButton = UIColor(hexString: "353283")
        (displayP3Red:87.0/255.0, green: 188.0/255.0, blue: 100.0/255.0, alpha: 1.0)
        vc.backgroundColorHeaderView = UIColor(hexString: "353283")
        
        vc.backgroundColorTableView = UIColor(hexString: "F3FAFF")
        vc.backgroundColorCellTitle = UIColor.black
        vc.backgroundColorDoneTitle = UIColor.white
        vc.backgroundColorSelectALlTitle = UIColor.white
        // Get Selected Index from PKMultipleSelectionVC
        UserDefaults.standard.set([], forKey: "indexPath")
        if let returnIndex = UserDefaults.standard.object(forKey: "indexPath") as? [Int] {
            vc.objGetSelectedIndex = returnIndex
        }
        // Data Passing Usning Block
         arrfiltervalue = ""
        vc.passDataWithIndex = { arrayData, selectedIndex in
            //Set data in TextField
            if self.text_tag == 1 { // Project
                let Arr_Selected = self.Arr_Project.filter{($0.project! == String(describing: arrayData))}
                self.dropProject.text = arrayData as? String
                self.str_Filter_ProjectID = String(describing: Arr_Selected[0].id!)
                MasterServiceCall.shareInstance.Get_FilterApi(Api_Str: Api_Urls.GET_API_filterPurchaseOrder, tag: 2,param: ["project_id": String(describing: Arr_Selected[0].id!)],ViewController: self,VC_Tag: 2)
                MasterServiceCall.shareInstance.Get_FilterApi(Api_Str: Api_Urls.GET_API_filterStrucher, tag: 3,param: ["project_id": String(describing: Arr_Selected[0].id!)],ViewController: self,VC_Tag: 2)
                MasterServiceCall.shareInstance.Get_FilterApi(Api_Str: Api_Urls.GET_API_filterPackingList, tag: 4,param: ["project_id": String(describing: Arr_Selected[0].id!)],ViewController: self,VC_Tag: 2)
                MasterServiceCall.shareInstance.Get_FilterApi(Api_Str: Api_Urls.GET_API_filterMark, tag: 5,param: ["project_id": String(describing: Arr_Selected[0].id!)],ViewController: self,VC_Tag: 2)
            } else if self.text_tag == 2 { // Purchase Order
                self.dropPurchaseOrder.text = arrayData as? String
                self.str_Filter_PurchaseOrder = String(describing: arrayData)
                self.str_FilterParam_PurchaseOrder = ((UserDefaults.standard.object(forKey: "indexPath") as! [Int]).count > 1) ? Multiple_Filter_Value.GET_PurchaseOrder : "po_no"
                MasterServiceCall.shareInstance.Get_FilterApi(Api_Str: Api_Urls.GET_API_filterStrucher, tag: 3,param: [self.str_FilterParam_PurchaseOrder : String(describing: arrayData)],ViewController: self,VC_Tag: 2)
                MasterServiceCall.shareInstance.Get_FilterApi(Api_Str: Api_Urls.GET_API_filterPackingList, tag: 4,param: [self.str_FilterParam_PurchaseOrder : String(describing: arrayData)],ViewController: self,VC_Tag: 2)
                MasterServiceCall.shareInstance.Get_FilterApi(Api_Str: Api_Urls.GET_API_filterMark, tag: 5,param: [self.str_FilterParam_PurchaseOrder : String(describing: arrayData)],ViewController: self,VC_Tag: 2)
            } else if self.text_tag == 3 { // Strucher
                self.dropStructure.text = arrayData as? String
                self.str_Filter_Strucher = String(describing: arrayData)
                self.str_FilterParam_Strucher = ((UserDefaults.standard.object(forKey: "indexPath") as! [Int]).count > 1) ? Multiple_Filter_Value.GET_Strucher : "structure"
                MasterServiceCall.shareInstance.Get_FilterApi(Api_Str: Api_Urls.GET_API_filterPackingList, tag: 4,param: [self.str_FilterParam_Strucher : String(describing: arrayData)],ViewController: self,VC_Tag: 2)
                MasterServiceCall.shareInstance.Get_FilterApi(Api_Str: Api_Urls.GET_API_filterMark, tag: 5,param: [self.str_FilterParam_Strucher : String(describing: arrayData)],ViewController: self,VC_Tag: 2)
            } else if self.text_tag == 4 { // Packing List
                self.dropPackingList.text = arrayData as? String
                self.str_Filter_PackingList = String(describing: arrayData)
                self.str_FilterParam_PackingList = ((UserDefaults.standard.object(forKey: "indexPath") as! [Int]).count > 1) ? Multiple_Filter_Value.GET_PackingList : "pl_number"
                 MasterServiceCall.shareInstance.Get_FilterApi(Api_Str: Api_Urls.GET_API_filterMark, tag: 5,param: [self.str_FilterParam_PackingList : String(describing: arrayData)],ViewController: self,VC_Tag: 2)
            }
            UserDefaults.standard.set(arrayData, forKey: "data")
            UserDefaults.standard.synchronize()
        }
        vc.willMove(toParent: self)
        self.view.addSubview(vc.view)
        self.addChild(vc)
        vc.didMove(toParent: self)
        return arrfiltervalue
    }
       // MARK: - Mode Selection Popup
    func Mode_Selection(ArrContent:NSMutableArray , arrProjectTab : Int) {
        self.popup_Select = multiselectpopup(nibName: "multiselectpopup", bundle: nil)
        popup_Select?.arrcontant = ArrContent
        popup_Select?.arrProjectTab = arrProjectTab
        self.popup_Select!.view.frame = CGRect.init(x: 0, y: 0, width: 330, height: 460)
        self.popup = KLCPopup(contentView: self.popup_Select?.view, showType: .growIn, dismissType: .growOut, maskType: .dimmed, dismissOnBackgroundTouch: false, dismissOnContentTouch: false)
        self.popup.didFinishDismissingCompletion = {() -> Void in
            print(self.popup_Select!.arrChack)
        }
        self.popup.show(withRoot: self.view)
    }
     @IBAction func btnMaterialTypeClick(_ sender: UIButton) {
          if sender.tag == 1 {
              btnSteel.setBackgroundImage(UIImage(named: "ic_check"), for: .normal)
              btnBolt.setBackgroundImage(UIImage(named: ""), for: .normal)
            self.Is_Select_Bolt = true
            self.Is_Select_Steel = false
          } else if sender.tag == 2 {
              btnSteel.setBackgroundImage(UIImage(named: ""), for: .normal)
              btnBolt.setBackgroundImage(UIImage(named: "ic_check"), for: .normal)
            self.Is_Select_Bolt = false
            self.Is_Select_Steel = true
          }
      }
      @IBAction func btnMaterialStatusClick(_ sender: UIButton) {
          //Released & Not Released
          if sender.tag == 3 {
              btnReleased.setBackgroundImage(UIImage(named: "ic_check"), for: .normal)
              btnNotReleased.setBackgroundImage(UIImage(named: ""), for: .normal)
            self.Is_Select_Released = true
            self.Is_Select_NotReleased = false
          } else if sender.tag == 6 {
             btnReleased.setBackgroundImage(UIImage(named: ""), for: .normal)
             btnNotReleased.setBackgroundImage(UIImage(named: "ic_check"), for: .normal)
            self.Is_Select_Released = false
            self.Is_Select_NotReleased = true
          }
          //Shipped & Not Shipped
          if sender.tag == 4 {
              btnShipped.setBackgroundImage(UIImage(named: "ic_check"), for: .normal)
              btnNotShipped.setBackgroundImage(UIImage(named: ""), for: .normal)
            self.Is_Select_Shipped = true
            self.Is_Select_NotShipped = false
          } else if sender.tag == 7 {
             btnShipped.setBackgroundImage(UIImage(named: ""), for: .normal)
             btnNotShipped.setBackgroundImage(UIImage(named: "ic_check"), for: .normal)
            self.Is_Select_Shipped = false
            self.Is_Select_NotShipped = true
          }
          //Onsite & Not Onsite
          if sender.tag == 5 {
             btnOnsite.setBackgroundImage(UIImage(named: "ic_check"), for: .normal)
             btnNotOnsite.setBackgroundImage(UIImage(named: ""), for: .normal)
            self.Is_Select_Onsite = true
            self.Is_Select_NotOnsite = false
          } else if sender.tag == 8 {
             btnOnsite.setBackgroundImage(UIImage(named: ""), for: .normal)
             btnNotOnsite.setBackgroundImage(UIImage(named: "ic_check"), for: .normal)
            self.Is_Select_Onsite = false
            self.Is_Select_NotOnsite = true
          }
      }
    @IBAction func btnExcessQuantityClick(_ sender: UIButton) {
        if sender.tag == 9 {
            btnWithExtraPieces.setBackgroundImage(UIImage(named: "ic_check"), for: .normal)
            btnWithoutExtraPieces.setBackgroundImage(UIImage(named: ""), for: .normal)
            self.Is_Select_With_Extra_Pieces = true
            self.Is_Select_Without_Extra_Pieces = false
        } else if sender.tag == 10 {
           btnWithExtraPieces.setBackgroundImage(UIImage(named: ""), for: .normal)
           btnWithoutExtraPieces.setBackgroundImage(UIImage(named: "ic_check"), for: .normal)
            self.Is_Select_With_Extra_Pieces = false
            self.Is_Select_Without_Extra_Pieces = true
        }
    }
    @IBAction func btnOKClick(_ sender: UIButton) {
       print("Ok Button Click")
        self.view.endEditing(true)
        if str_FilterName == "Markwise Report" || str_FilterName == "Detail Figure Report" || str_FilterName == "Markwise Cumulative Report" {
            let Report_VC = Config.StoryBoard.instantiateViewController(identifier: "ReportVC6") as! ReportVC6
            Report_VC.pageName = str_FilterName
            self.SetFilterValue(Report_VC: Report_VC,tag:1)
            self.navigationController?.pushViewController(Report_VC, animated: true)
        }else if str_FilterName == "Packagewise Report" || str_FilterName == "Packing List Report"{
            let Report_VC = Config.StoryBoard.instantiateViewController(identifier: "ReportVC1") as! ReportVC1
             Report_VC.pageName = str_FilterName
            self.SetFilterValue(Report_VC: Report_VC,tag:2)
            self.navigationController?.pushViewController(Report_VC, animated: true)
        }else if str_FilterName == "PO Positionwise Report" || str_FilterName == "Ident Codewise Report" || str_FilterName == "Structurewise Report"{
            let Report_VC = Config.StoryBoard.instantiateViewController(identifier: "Report2") as! Report2
            Report_VC.pageName = str_FilterName
            self.SetFilterValue(Report_VC: Report_VC,tag:3)
            self.navigationController?.pushViewController(Report_VC, animated: true)
        }else if str_FilterName == "Group Structurewise Report" {
            let Report_VC = Config.StoryBoard.instantiateViewController(identifier: "ReportVC3") as! ReportVC3
            Report_VC.pageName = str_FilterName
            self.SetFilterValue(Report_VC: Report_VC,tag:4)
            self.navigationController?.pushViewController(Report_VC, animated: true)
        }else if str_FilterName == "Summary Report" {
            let Report_VC = Config.StoryBoard.instantiateViewController(identifier: "ReportVC4") as! ReportVC4
            Report_VC.pageName = str_FilterName
            self.SetFilterValue(Report_VC: Report_VC,tag:5)
            self.navigationController?.pushViewController(Report_VC, animated: true)
        }
        
    }
    func SetFilterValue(Report_VC:UIViewController,tag:Int) {
        if tag == 1 {
            let ReportVC = Report_VC as! ReportVC6
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
            let ReportVC = Report_VC as! ReportVC1
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
            let ReportVC = Report_VC as! Report2
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
            let ReportVC = Report_VC as! ReportVC3
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
            let ReportVC = Report_VC as! ReportVC4
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
        return true
    }
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    func textFieldDidBeginEditing(_ textField: UITextField)
    {
        if textField.tag == 1 {
            self.text_tag = 1
            self.Arr_Project_Name = NSMutableArray(array: Arr_Project.map{($0.project!)} as NSArray)
//            self.Mode_Selection(ArrContent: Arr_Project_Name, arrProjectTab: 1)
            self.dropProject.text = showMultipleSelectionTableview(arrContent:NSMutableArray(array: Arr_Project_Name))
        } else if textField.tag == 2  {
            self.text_tag = 2
            self.Arr_Project_Name = NSMutableArray(array: Arr_PurchaseOrder.map{($0.poNo!)} as NSArray)
            self.dropPurchaseOrder.text = showMultipleSelectionTableview(arrContent:Arr_Project_Name)
        } else if textField.tag == 3  {
            self.text_tag = 3
            self.Arr_Project_Name = NSMutableArray(array: Arr_Strucher.map{($0.structure!)} as NSArray)
            self.dropStructure.text = showMultipleSelectionTableview(arrContent:Arr_Project_Name)
        } else if textField.tag == 4  {
            self.text_tag = 4
            self.Arr_Project_Name = NSMutableArray(array: Arr_PackingList.map{($0.packingList!)} as NSArray)
            self.dropPackingList.text = showMultipleSelectionTableview(arrContent:Arr_Project_Name)
        }
    }
}
