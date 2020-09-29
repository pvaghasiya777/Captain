//
//  DFiltersVC.swift
//  report
//
//  Created by macbook on 23/06/1942 Saka.
//  Copyright © 1942 com.mac. All rights reserved.
//

import UIKit

class DFiltersVC: UIViewController {
    //MARK:- Outlet
    //Material Type
    @IBOutlet weak var btnAll: UIButton!
    @IBOutlet weak var btnSteel: UIButton!
    @IBOutlet weak var btnBolt: UIButton!
    // Excess Quantity
    @IBOutlet weak var btnWithExtraPieces: UIButton!
    @IBOutlet weak var btnWithoutExtraPieces: UIButton!
    //Material Status
    @IBOutlet weak var btnReleased: UIButton!
    @IBOutlet weak var btnNotReleased: UIButton!
    @IBOutlet weak var btnShipped: UIButton!
    @IBOutlet weak var btnNotShipped: UIButton!
    @IBOutlet weak var btnOnsite: UIButton!
    @IBOutlet weak var btnNotOnsite: UIButton!
    //project
    @IBOutlet weak var searchProject: UISearchBar!
    @IBOutlet weak var tblproject: UITableView!
    //Purchase Order
    @IBOutlet weak var searchPurchaseOrder: UISearchBar!
    @IBOutlet weak var tblPurchaseOrder: UITableView!
    // Structure
    @IBOutlet weak var searchStructure: UISearchBar!
    @IBOutlet weak var tblStructure: UITableView!
    //Packing List
    @IBOutlet weak var searchPackingList: UISearchBar!
    @IBOutlet weak var tblPackingList: UITableView!
    //Mark
    @IBOutlet weak var searchMark: UISearchBar!
    @IBOutlet weak var tblMark: UITableView!
    //MARK:- variable
    var Arr_Project = [FilterProjectModel]()
    var Arr_PurchaseOrder = [FilterPurchaseOrderModel]()
    var Arr_Strucher = [FilterStructureModel]()
    var Arr_PackingList = [FilterPackingListModel]()
    var Arr_Mark = [MarkResult]()
    var Search_Project = [FilterProjectModel]()
    var Search_PurchaseOrder = [FilterPurchaseOrderModel]()
    var Search_Strucher = [FilterStructureModel]()
    var Search_PackingList = [FilterPackingListModel]()
    var Search_Mark = [MarkResult]()
    var searchActive : Bool = false
    //MaterialType
    var Is_Select_AllMaterialType : Bool = false
    var Is_Select_SteelMaterialType : Bool = false
    var Is_Select_BoltMaterialType : Bool = false
    //Excess Quantity
    var Is_Select_With_Extra_Pieces : Bool = false
    var Is_Select_Without_Extra_Pieces : Bool = false
    //TableView Selection
    var Selected_tag = 0
    var Str_Selected_Filter : String = String()
    //Filter Selected Data  
    var arrSearch_Project = NSMutableArray()
    var arrProject = NSMutableArray()
    var arrSearch_PurchaseOrder = NSMutableArray()
    var arrPurchaseOrder = NSMutableArray()
    var arrSearch_Strucher = NSMutableArray()
    var arrStrucher = NSMutableArray()
    var arrSearch_PackingList = NSMutableArray()
    var arrPackingList = NSMutableArray()
    var arrSearch_Mark = NSMutableArray()
    var arrMark = NSMutableArray()
    //MARK:- ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        Initialisation()
    }
    //MARK:- Initialisation
    func Initialisation(){
        Utils.Set_Corner_Radius(views: [btnAll,btnSteel,btnBolt,btnReleased,btnNotReleased,btnShipped,btnNotShipped,btnOnsite,btnNotOnsite,btnWithExtraPieces,btnWithoutExtraPieces], radius: 5)
        Utils.Set_Same_View_Border(views:[btnAll,btnSteel,btnBolt,btnReleased,btnNotReleased,btnShipped,btnNotShipped,btnOnsite,btnNotOnsite,btnWithExtraPieces,btnWithoutExtraPieces] , borderColor: .gray, border_Width: 1)
//        self.Arr_Project = DEFAULTS.Get_FilterProject()
//        self.Arr_PurchaseOrder = DEFAULTS.Get_FilterPurchaseOrder()
//        self.Arr_Strucher = DEFAULTS.Get_FilterStrucher()
//        self.Arr_PackingList = DEFAULTS.Get_FilterPackingList()
//        self.Arr_Mark = DEFAULTS.Get_FilterMark()
        MasterServiceCall.shareInstance.Get_FilterApi(Api_Str: Api_Urls.GET_API_filterProject, tag: 1,param: [:],ViewController: self,VC_Tag: 1)
        MasterServiceCall.shareInstance.Get_FilterApi(Api_Str: Api_Urls.GET_API_filterPurchaseOrder, tag: 2,param: ["project_id": DEFAULTS.Get_ProjectID()],ViewController: self,VC_Tag: 1)
        MasterServiceCall.shareInstance.Get_FilterApi(Api_Str: Api_Urls.GET_API_filterStrucher, tag: 3,param: ["project_id": DEFAULTS.Get_ProjectID()],ViewController: self,VC_Tag: 1)
        MasterServiceCall.shareInstance.Get_FilterApi(Api_Str: Api_Urls.GET_API_filterPackingList, tag: 4,param: ["project_id": DEFAULTS.Get_ProjectID()],ViewController: self,VC_Tag: 1)
        MasterServiceCall.shareInstance.Get_FilterApi(Api_Str: Api_Urls.GET_API_filterMark, tag: 5,param: ["project_id": DEFAULTS.Get_ProjectID()],ViewController: self,VC_Tag: 1)
    }
    
    //MARK:- Button Click Action
    @IBAction func btnMaterialTypeClick(_ sender: UIButton) {
        if sender.tag == 1 {
            btnAll.setBackgroundImage(UIImage(named: "ic_check"), for: .normal)
            btnSteel.setBackgroundImage(UIImage(named: ""), for: .normal)
            btnBolt.setBackgroundImage(UIImage(named: ""), for: .normal)
            self.Is_Select_AllMaterialType = true
            self.Is_Select_SteelMaterialType = false
            self.Is_Select_BoltMaterialType = false
        } else if sender.tag == 2 {
            btnAll.setBackgroundImage(UIImage(named: ""), for: .normal)
            btnSteel.setBackgroundImage(UIImage(named: "ic_check"), for: .normal)
            btnBolt.setBackgroundImage(UIImage(named: ""), for: .normal)
            self.Is_Select_AllMaterialType = false
            self.Is_Select_SteelMaterialType = true
            self.Is_Select_BoltMaterialType = false
        } else if sender.tag == 3{
            btnAll.setBackgroundImage(UIImage(named: ""), for: .normal)
            btnSteel.setBackgroundImage(UIImage(named: ""), for: .normal)
            btnBolt.setBackgroundImage(UIImage(named: "ic_check"), for: .normal)
            self.Is_Select_AllMaterialType = false
            self.Is_Select_SteelMaterialType = false
            self.Is_Select_BoltMaterialType = true
        }
    }
    @IBAction func btnExcessQuantityClick(_ sender: UIButton) {
        if sender.tag == 4 {
            btnWithExtraPieces.setBackgroundImage(UIImage(named: "ic_check"), for: .normal)
            btnWithoutExtraPieces.setBackgroundImage(UIImage(named: ""), for: .normal)
            self.Is_Select_With_Extra_Pieces = true
            self.Is_Select_Without_Extra_Pieces = false
        } else if sender.tag == 5 {
            btnWithExtraPieces.setBackgroundImage(UIImage(named: ""), for: .normal)
            btnWithoutExtraPieces.setBackgroundImage(UIImage(named: "ic_check"), for: .normal)
            self.Is_Select_With_Extra_Pieces = false
            self.Is_Select_Without_Extra_Pieces = true
        }
    }
    @IBAction func btnMaterialStatusClick(_ sender: UIButton) {
        //Released & Not Released
        if sender.tag == 6 {
            btnReleased.setBackgroundImage(UIImage(named: "ic_check"), for: .normal)
            btnNotReleased.setBackgroundImage(UIImage(named: ""), for: .normal)
        } else if sender.tag == 7 {
            btnReleased.setBackgroundImage(UIImage(named: ""), for: .normal)
            btnNotReleased.setBackgroundImage(UIImage(named: "ic_check"), for: .normal)
        }
        //Shipped & Not Shipped
        if sender.tag == 8 {
            btnShipped.setBackgroundImage(UIImage(named: "ic_check"), for: .normal)
            btnNotShipped.setBackgroundImage(UIImage(named: ""), for: .normal)
        } else if sender.tag == 9 {
            btnShipped.setBackgroundImage(UIImage(named: ""), for: .normal)
            btnNotShipped.setBackgroundImage(UIImage(named: "ic_check"), for: .normal)
        }
        //Onsite & Not Onsite
        if sender.tag == 10 {
            btnOnsite.setBackgroundImage(UIImage(named: "ic_check"), for: .normal)
            btnNotOnsite.setBackgroundImage(UIImage(named: ""), for: .normal)
        } else if sender.tag == 11 {
            btnOnsite.setBackgroundImage(UIImage(named: ""), for: .normal)
            btnNotOnsite.setBackgroundImage(UIImage(named: "ic_check"), for: .normal)
        }
    }
    @IBAction func btn_Click_CancellAndApply(_ sender: UIButton) {
        if sender.tag == 12 {
            print("Reset Button Click")
        }else if sender.tag == 13 {
            print("Apply Button Click")
            let filterData : NSDictionary = ["Str_SelectedFilter": Str_Selected_Filter,"SelectedTag" : Selected_tag]
            NotificationCenter.default.post(name: NSNotification.Name.selected_Filter, object: nil, userInfo: filterData as? [AnyHashable : Any])
            self.navigationController?.popViewController(animated: true)
        }
    }
    
}
extension DFiltersVC : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tblproject {
            if searchActive && self.searchProject.text!.trimmed != "" {
                return self.Search_Project.count
            }else {
                return self.Arr_Project.count
            }
        }else if tableView == tblPurchaseOrder {
           if searchActive && self.searchPurchaseOrder.text!.trimmed != "" {
               return self.Search_PurchaseOrder.count
           }else {
               return self.Arr_PurchaseOrder.count
           }
        }else if tableView == tblStructure {
          if searchActive && self.searchStructure.text!.trimmed != "" {
               return self.Search_Strucher.count
           }else {
               return self.Arr_Strucher.count
           }
        }else if tableView == tblPackingList {
           if searchActive && self.searchPackingList.text!.trimmed != "" {
               return self.Search_PackingList.count
           }else {
               return self.Arr_PackingList.count
           }
        }else { // tblmark
             return self.Arr_Mark.count
//           if searchActive && self.searchMark.text!.trimmed != "" {
//               return self.Search_Mark.count
//           }else {
//
//           }
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell = UITableViewCell()
        cell.textLabel?.textColor = .black
        cell.textLabel?.textAlignment = .center
        cell.selectionStyle = .none
        if tableView == tblproject {
//            cell.sele
            if searchActive && self.searchProject.text!.trimmed != "" {
                cell.textLabel?.text = Search_Project[indexPath.row].project!
            }else {
                cell.textLabel?.text = Arr_Project[indexPath.row].project!
            }
        }else if tableView == tblPurchaseOrder {
            if searchActive && self.searchPurchaseOrder.text!.trimmed != "" {
                cell.textLabel?.text = Search_PurchaseOrder[indexPath.row].poNo!
            }else {
                cell.textLabel?.text = Arr_PurchaseOrder[indexPath.row].poNo!
            }
        }else if tableView == tblStructure {
            if searchActive && self.searchStructure.text!.trimmed != "" {
                cell.textLabel?.text = Search_Strucher[indexPath.row].structure!
            }else {
                cell.textLabel?.text = Arr_Strucher[indexPath.row].structure!
            }
        }else if tableView == tblPackingList {
            if searchActive && self.searchPackingList.text!.trimmed != "" {
                cell.textLabel?.text = Search_PackingList[indexPath.row].packingList!
            }else {
                cell.textLabel?.text = Arr_PackingList[indexPath.row].packingList!
            }
        }else { // tblmark
            cell.textLabel?.text = Arr_Mark[indexPath.row].mark!
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       if tableView == tblproject {
        self.Selected_tag = 1
        self.Str_Selected_Filter = String(describing: Arr_Project[indexPath.row].id!)
           MasterServiceCall.shareInstance.Get_FilterApi(Api_Str: Api_Urls.GET_API_filterPurchaseOrder, tag: 2,param: ["project_id": String(describing: Arr_Project[indexPath.row].id!)],ViewController: self,VC_Tag: 1)
           MasterServiceCall.shareInstance.Get_FilterApi(Api_Str: Api_Urls.GET_API_filterStrucher, tag: 3,param: ["project_id": String(describing: Arr_Project[indexPath.row].id!)],ViewController: self,VC_Tag: 1)
           MasterServiceCall.shareInstance.Get_FilterApi(Api_Str: Api_Urls.GET_API_filterPackingList, tag: 4,param: ["project_id": String(describing: Arr_Project[indexPath.row].id!)],ViewController: self,VC_Tag: 1)
           MasterServiceCall.shareInstance.Get_FilterApi(Api_Str: Api_Urls.GET_API_filterMark, tag: 5,param: ["project_id": String(describing: Arr_Project[indexPath.row].id!)],ViewController: self,VC_Tag: 1)
            if let cell = tableView.cellForRow(at: indexPath) {
                resetChecks()
                cell.accessoryType = .checkmark
            }
       }else if tableView == tblPurchaseOrder {
        self.Selected_tag = 2
         self.Str_Selected_Filter = String(describing: Arr_PurchaseOrder[indexPath.row].id!)
          MasterServiceCall.shareInstance.Get_FilterApi(Api_Str: Api_Urls.GET_API_filterStrucher, tag: 3,param: ["po_no": Arr_PurchaseOrder[indexPath.row].poNo!],ViewController: self,VC_Tag: 1)
          MasterServiceCall.shareInstance.Get_FilterApi(Api_Str: Api_Urls.GET_API_filterPackingList, tag: 4,param: ["po_no": Arr_PurchaseOrder[indexPath.row].poNo!],ViewController: self,VC_Tag: 1)
          MasterServiceCall.shareInstance.Get_FilterApi(Api_Str: Api_Urls.GET_API_filterMark, tag: 5,param: ["po_no": Arr_PurchaseOrder[indexPath.row].poNo!],ViewController: self,VC_Tag: 1)
        if let cell = tableView.cellForRow(at: indexPath as IndexPath) {
            if cell.accessoryType == .checkmark{
                cell.accessoryType = .none
            }
            else{
                cell.accessoryType = .checkmark
            }
        }
       }else if tableView == tblStructure {
        self.Selected_tag = 3
         self.Str_Selected_Filter = String(describing: Arr_Strucher[indexPath.row].id!)
           MasterServiceCall.shareInstance.Get_FilterApi(Api_Str: Api_Urls.GET_API_filterPackingList, tag: 4,param: ["structure_id": Arr_Strucher[indexPath.row].structure!],ViewController: self,VC_Tag: 1)
           MasterServiceCall.shareInstance.Get_FilterApi(Api_Str: Api_Urls.GET_API_filterMark, tag: 5,param: ["structure_id": Arr_Strucher[indexPath.row].structure!],ViewController: self,VC_Tag: 1)
        if let cell = tableView.cellForRow(at: indexPath as IndexPath) {
            if cell.accessoryType == .checkmark{
                cell.accessoryType = .none
            }
            else{
                cell.accessoryType = .checkmark
            }
        }
       }else if tableView == tblPackingList {
        self.Selected_tag = 4
         self.Str_Selected_Filter = String(describing: Arr_PackingList[indexPath.row].id!)
           MasterServiceCall.shareInstance.Get_FilterApi(Api_Str: Api_Urls.GET_API_filterMark, tag: 5,param: ["pl_number": Arr_PackingList[indexPath.row].packingList!],ViewController: self,VC_Tag: 1)
        if let cell = tableView.cellForRow(at: indexPath as IndexPath) {
            if cell.accessoryType == .checkmark{
                cell.accessoryType = .none
            }
            else{
                cell.accessoryType = .checkmark
            }
        }
       }else { // tblmark
           self.Selected_tag = 5
         self.Str_Selected_Filter = Arr_Mark[indexPath.row].mark!
        if let cell = tableView.cellForRow(at: indexPath as IndexPath) {
            if cell.accessoryType == .checkmark{
                cell.accessoryType = .none
            }
            else{
                cell.accessoryType = .checkmark
            }
        }
       }
   }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if tableView == tblproject {
            self.tblproject.cellForRow(at: indexPath)?.accessoryType = .none
        } else if tableView == tblPurchaseOrder {
            self.selectcellrow(tableview: tblPurchaseOrder, indexPath: indexPath)
        } else if tableView == tblStructure {
            self.selectcellrow(tableview: tblStructure, indexPath: indexPath)
        } else if tableView == tblPackingList {
            self.selectcellrow(tableview: tblPackingList, indexPath: indexPath)
        } else if tableView == tblMark {
            self.selectcellrow(tableview: tblMark, indexPath: indexPath)
        }
    }
}

extension DFiltersVC {
    func selectcellrow(tableview : UITableView , indexPath : IndexPath) {
        if tableview == tblproject {
            if Search_Project.isEmpty {
                let array_Project = NSMutableArray()
                arrSearch_Project.removeAllObjects()
                array_Project.add(Arr_Project[indexPath.row].project!)
                arrProject = array_Project
                print(array_Project,arrProject)
            } else {
                arrProject.removeAllObjects()
                let array_Search_Project = NSMutableArray()
                array_Search_Project.add(Search_Project[indexPath.row].project!)
                arrSearch_Project = array_Search_Project
                print(array_Search_Project,arrSearch_Project)
            }
        } else if tableview == tblPurchaseOrder {
            if Search_PurchaseOrder.isEmpty  {
                arrSearch_PurchaseOrder.removeAllObjects()
                arrPurchaseOrder.add(Arr_PurchaseOrder[indexPath.row].poNo!)
                print(arrPurchaseOrder)
            } else {
                arrPurchaseOrder.removeAllObjects()
                arrSearch_PurchaseOrder.add(Search_PurchaseOrder[indexPath.row].poNo!)
                print(arrSearch_PurchaseOrder)
            }
        } else if tableview == tblStructure {
            if Search_Strucher.isEmpty {
                arrSearch_Strucher.removeAllObjects()
                arrStrucher.add(Arr_Strucher[indexPath.row].structure!)
                print(arrStrucher)
            } else {
                arrStrucher.removeAllObjects()
                arrSearch_Strucher.add(Search_Strucher[indexPath.row].structure!)
                print(arrSearch_Strucher)
            }
        } else if tableview == tblPackingList {
            if Search_PackingList.isEmpty {
                arrSearch_PackingList.removeAllObjects()
                arrPackingList.add(Arr_PackingList[indexPath.row].packingList!)
                print(arrPackingList)
            } else {
                arrSearch_PackingList.add(Search_PackingList[indexPath.row].packingList!)
                print(arrSearch_PackingList)
                arrPackingList.removeAllObjects()
            }
        } else if tableview == tblMark {
            if Search_Mark.isEmpty  {
                arrSearch_Mark.removeAllObjects()
                arrMark.add(Arr_Mark[indexPath.row].mark!)
                print(arrMark)
            } else {
                arrMark.removeAllObjects()
                arrSearch_Mark.add(Search_Mark[indexPath.row].mark!)
                print(arrSearch_Mark)
            }
        }
    }
    func resetChecks() {
        for i in 0..<tblproject.numberOfSections {
            for j in 0..<tblproject.numberOfRows(inSection: i) {
                if let cell = tblproject.cellForRow(at: IndexPath(row: j, section: i)) {
                    cell.accessoryType = .none
                }
            }
        }
    }
}

extension DFiltersVC : UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchActive = true;
    }
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchActive = false;
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
       searchActive = false;
       self.view.endEditing(true)
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchActive {
            if(searchText == "") {
                if searchBar == searchProject {
                    self.Search_Project = Arr_Project
                    self.tblproject?.reloadData()
                }else if searchBar == searchPurchaseOrder {
                    self.Search_PurchaseOrder = Arr_PurchaseOrder
                    self.tblPurchaseOrder?.reloadData()
                }else if searchBar == searchStructure {
                        self.Search_Strucher = Arr_Strucher
                        self.tblStructure?.reloadData()
                }else if searchBar == searchPackingList {
                    self.Search_PackingList = Arr_PackingList
                    self.tblPackingList?.reloadData()
                }else if searchBar == searchMark {
                    self.Search_Mark = Arr_Mark
                    self.tblMark?.reloadData()
                }
            } else {
                if searchBar == searchProject {
                    self.Search_Project = (NSMutableArray().mutableCopy() as! NSMutableArray) as! [FilterProjectModel]
                    let filtered = Arr_Project.filter{(($0.project!).lowercased()).contains(searchText.trimmed.lowercased())}
                    self.Search_Project = filtered
                    print(filtered)
                    self.tblproject?.reloadData()
                }else if searchBar == searchPurchaseOrder {
                    self.Search_PurchaseOrder = (NSMutableArray().mutableCopy() as! NSMutableArray) as! [FilterPurchaseOrderModel]
                    let filtered = Arr_PurchaseOrder.filter{(($0.poNo!).lowercased()).contains(searchText.trimmed.lowercased())}
                    self.Search_PurchaseOrder = filtered
                    print(filtered)
                    self.tblPurchaseOrder?.reloadData()
                }else if searchBar == searchStructure {
                        self.Search_Strucher = (NSMutableArray().mutableCopy() as! NSMutableArray) as! [FilterStructureModel]
                        let filtered = Arr_Strucher.filter{(($0.structure!).lowercased()).contains(searchText.trimmed.lowercased())}
                        self.Search_Strucher = filtered
                        print(filtered)
                        self.tblStructure?.reloadData()
                }else if searchBar == searchPackingList {
                    self.Search_PackingList = (NSMutableArray().mutableCopy() as! NSMutableArray) as! [FilterPackingListModel]
                    let filtered = Arr_PackingList.filter{(($0.packingList!).lowercased()).contains(searchText.trimmed.lowercased())}
                    self.Search_PackingList = filtered
                    print(filtered)
                    self.tblPackingList?.reloadData()
                }else if searchBar == searchMark {
                     MasterServiceCall.shareInstance.Get_FilterApi(Api_Str: Api_Urls.GET_API_filterMark, tag: 5,param: ["search": searchText.trimmed.lowercased()],ViewController: self,VC_Tag: 1)
//                    self.Search_Mark = (NSMutableArray().mutableCopy() as! NSMutableArray) as! [MarkResult]
//                    let filtered = Arr_Mark.filter{(($0.mark!).lowercased()).contains(searchText.trimmed.lowercased())}
//                    self.Search_Mark = filtered
//                    print(filtered)
//                    self.tblMark?.reloadData()
                }
            }
        }
    }
}


