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
    @IBOutlet weak var serarchproject: UISearchBar!
    @IBOutlet weak var tblproject: UITableView!
    //Purchase Order
    @IBOutlet weak var serarchPurchaseOrder: UISearchBar!
    @IBOutlet weak var tblPurchaseOrder: UITableView!
    // Structure
    @IBOutlet weak var serarchStructure: UISearchBar!
    @IBOutlet weak var tblStructure: UITableView!
    //Packing List
    @IBOutlet weak var serarchPackingList: UISearchBar!
    @IBOutlet weak var tblPackingList: UITableView!
    //Mark
    @IBOutlet weak var serarchMark: UISearchBar!
    @IBOutlet weak var tblMark: UITableView!
      //MARK:- variable
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
