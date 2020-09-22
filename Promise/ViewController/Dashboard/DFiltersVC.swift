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
    
    //MARK:- ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        Initialisation()
        // Do any additional setup after loading the view.
    }
    //MARK:- Initialisation
    func Initialisation(){
        Utils.Set_Corner_Radius(views: [btnAll,btnSteel,btnBolt,btnReleased,btnNotReleased,btnShipped,btnNotShipped,btnOnsite,btnNotOnsite,btnWithExtraPieces,btnWithoutExtraPieces], radius: 5)
        Utils.Set_Same_View_Border(views:[btnAll,btnSteel,btnBolt,btnReleased,btnNotReleased,btnShipped,btnNotShipped,btnOnsite,btnNotOnsite,btnWithExtraPieces,btnWithoutExtraPieces] , borderColor: .gray, border_Width: 1)
        self.Arr_Project = DEFAULTS.Get_FilterProject()
        self.Arr_PurchaseOrder = DEFAULTS.Get_FilterPurchaseOrder()
        self.Arr_Strucher = DEFAULTS.Get_FilterStrucher()
        self.Arr_PackingList = DEFAULTS.Get_FilterPackingList()
        self.Arr_Mark = DEFAULTS.Get_FilterMark()
    }
    
    //MARK:- Button Click Action
    @IBAction func btnMaterialTypeClick(_ sender: UIButton) {
        if sender.tag == 1 {
            btnAll.setBackgroundImage(UIImage(named: "correct"), for: .normal)
            btnSteel.setBackgroundImage(UIImage(named: ""), for: .normal)
            btnBolt.setBackgroundImage(UIImage(named: ""), for: .normal)
        } else if sender.tag == 2 {
            btnAll.setBackgroundImage(UIImage(named: ""), for: .normal)
            btnSteel.setBackgroundImage(UIImage(named: "correct"), for: .normal)
            btnBolt.setBackgroundImage(UIImage(named: ""), for: .normal)
        } else if sender.tag == 3{
            btnAll.setBackgroundImage(UIImage(named: ""), for: .normal)
            btnSteel.setBackgroundImage(UIImage(named: ""), for: .normal)
            btnBolt.setBackgroundImage(UIImage(named: "correct"), for: .normal)
        }
        
    }
    @IBAction func btnExcessQuantityClick(_ sender: UIButton) {
        if sender.tag == 4 {
            btnWithExtraPieces.setBackgroundImage(UIImage(named: "correct"), for: .normal)
            btnWithoutExtraPieces.setBackgroundImage(UIImage(named: ""), for: .normal)
        } else if sender.tag == 5 {
            btnWithExtraPieces.setBackgroundImage(UIImage(named: ""), for: .normal)
            btnWithoutExtraPieces.setBackgroundImage(UIImage(named: "correct"), for: .normal)
        }
    }
    @IBAction func btnMaterialStatusClick(_ sender: UIButton) {
        //Released & Not Released
        if sender.tag == 6 {
            btnReleased.setBackgroundImage(UIImage(named: "correct"), for: .normal)
            btnNotReleased.setBackgroundImage(UIImage(named: ""), for: .normal)
        } else if sender.tag == 7 {
            btnReleased.setBackgroundImage(UIImage(named: ""), for: .normal)
            btnNotReleased.setBackgroundImage(UIImage(named: "correct"), for: .normal)
        }
        //Shipped & Not Shipped
        if sender.tag == 8 {
            btnShipped.setBackgroundImage(UIImage(named: "correct"), for: .normal)
            btnNotShipped.setBackgroundImage(UIImage(named: ""), for: .normal)
        } else if sender.tag == 9 {
            btnShipped.setBackgroundImage(UIImage(named: ""), for: .normal)
            btnNotShipped.setBackgroundImage(UIImage(named: "correct"), for: .normal)
        }
        //Onsite & Not Onsite
        if sender.tag == 10 {
            btnOnsite.setBackgroundImage(UIImage(named: "correct"), for: .normal)
            btnNotOnsite.setBackgroundImage(UIImage(named: ""), for: .normal)
        } else if sender.tag == 11 {
            btnOnsite.setBackgroundImage(UIImage(named: ""), for: .normal)
            btnNotOnsite.setBackgroundImage(UIImage(named: "correct"), for: .normal)
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
           if searchActive && self.searchMark.text!.trimmed != "" {
               return self.Search_Mark.count
           }else {
               return self.Arr_Mark.count
           }
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell = UITableViewCell()
        cell.textLabel?.textColor = .black
        cell.textLabel?.textAlignment = .center
        if tableView == tblproject {
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
            if searchActive && self.searchMark.text!.trimmed != "" {
                cell.textLabel?.text = Search_Mark[indexPath.row].mark!
            }else {
                cell.textLabel?.text = Arr_Mark[indexPath.row].mark!
            }
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let Arr = Arr_PackingList[indexPath.row].isSelected = true
    }
}
extension DFiltersVC : UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        if searchBar == searchProject {
            
        }
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
        if searchActive
        {
            if(searchText == "")
            {
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
            }
            else
            {
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
                    self.Search_Mark = (NSMutableArray().mutableCopy() as! NSMutableArray) as! [MarkResult]
                    let filtered = Arr_Mark.filter{(($0.mark!).lowercased()).contains(searchText.trimmed.lowercased())}
                    self.Search_Mark = filtered
                    print(filtered)
                    self.tblMark?.reloadData()
                }
            }
        }
    }
}
