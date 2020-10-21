//
//  ReportsFiltersVC.swift
//  report
//
//  Created by macbook on 25/06/1942 Saka.
//  Copyright © 1942 com.mac. All rights reserved.
//

import UIKit

class ViewSelectFilter: UIViewController {
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Initialisation()
               // Do any additional setup after loading the view.
           }
       //MARK:- Initialisation
       func Initialisation(){
           Utils.Set_Corner_Radius(views: [btnSteel,btnBolt,btnReleased,btnNotReleased,btnShipped,btnNotShipped,btnOnsite,btnNotOnsite,btnWithExtraPieces,btnWithoutExtraPieces], radius: 5)
           Utils.Set_Same_View_Border(views:[btnSteel,btnBolt,btnReleased,btnNotReleased,btnShipped,btnNotShipped,btnOnsite,btnNotOnsite,btnWithExtraPieces,btnWithoutExtraPieces] , borderColor: .gray, border_Width: 1)
        Utils.EnableTextField(textFields: [dropStructure,dropPackingList,dropPurchaseOrder,dropProject])
        setfilterdata()
       }
    //MARK:- set data From geting filter
    func setfilterdata() {
        let Project = DEFAULTS.Get_View_Filter().value(forKey: "Project")!
        self.dropProject.text = (Project as AnyObject).componentsJoined(by: ",")
        let PurchaseOrder = DEFAULTS.Get_View_Filter().value(forKey: "PurchaseOrder")!
        self.dropPurchaseOrder.text = (PurchaseOrder as AnyObject).componentsJoined(by: ",")
        let Strucher = DEFAULTS.Get_View_Filter().value(forKey: "Strucher")!
        self.dropStructure.text = (Strucher as AnyObject).componentsJoined(by: ",")
        let PackingList = DEFAULTS.Get_View_Filter().value(forKey: "PackingList")!
        self.dropPackingList.text = (PackingList as AnyObject).componentsJoined(by: ",")
        
        //Material Type
        btnSteel.setBackgroundImage(DEFAULTS.Get_View_Filter().value(forKey: "is_Steel") as! Bool == true ? UIImage(named: "ic_check") : UIImage(named: " "), for:  .normal)
        btnBolt.setBackgroundImage(DEFAULTS.Get_View_Filter().value(forKey: "is_Bolt") as! Bool == true ? UIImage(named: "ic_check") : UIImage(named: " "), for:  .normal)

//       Material Status
        btnReleased.setBackgroundImage(DEFAULTS.Get_View_Filter().value(forKey: "Released") as! Bool == true ? UIImage(named: "ic_check") : UIImage(named: " "), for:  .normal)
        btnNotReleased.setBackgroundImage(DEFAULTS.Get_View_Filter().value(forKey: "Released") as! Bool == true ? UIImage(named: "") : UIImage(named: "ic_check"), for:  .normal)
//
        
        btnShipped.setBackgroundImage(DEFAULTS.Get_View_Filter().value(forKey: "Shipped") as! Bool == true ? UIImage(named: "ic_check") : UIImage(named: " "), for:  .normal)
        btnNotShipped.setBackgroundImage(DEFAULTS.Get_View_Filter().value(forKey: "Shipped") as! Bool == true ? UIImage(named: "") : UIImage(named: "ic_check"), for:  .normal)
        
        btnOnsite.setBackgroundImage(DEFAULTS.Get_View_Filter().value(forKey: "Onsite") as! Bool == true ? UIImage(named: "ic_check") : UIImage(named: " "), for:  .normal)
        btnNotOnsite.setBackgroundImage(DEFAULTS.Get_View_Filter().value(forKey: "Onsite") as! Bool == true ? UIImage(named: "") : UIImage(named: "ic_check"), for:  .normal)
        
//        Excess Quantity
        btnWithExtraPieces.setBackgroundImage(DEFAULTS.Get_View_Filter().value(forKey: "is_Extra") as! Bool == true ? UIImage(named: "ic_check") : UIImage(named: " "), for:  .normal)
        btnWithoutExtraPieces.setBackgroundImage(DEFAULTS.Get_View_Filter().value(forKey: "is_Steel") as! Bool == true ? UIImage(named: "Without_Extra") : UIImage(named: " "), for:  .normal)
    }
    
    
    @IBAction func btnMaterialTypeClick(_ sender: UIButton) {
          if sender.tag == 1 {
              btnSteel.setBackgroundImage(UIImage(named: "ic_check"), for: .normal)
              btnBolt.setBackgroundImage(UIImage(named: ""), for: .normal)
          } else if sender.tag == 2 {
              btnSteel.setBackgroundImage(UIImage(named: ""), for: .normal)
              btnBolt.setBackgroundImage(UIImage(named: "ic_check"), for: .normal)
          }
      }
      
      @IBAction func btnMaterialStatusClick(_ sender: UIButton) {
          //Released & Not Released
          if sender.tag == 3 {
              btnReleased.setBackgroundImage(UIImage(named: "ic_check"), for: .normal)
              btnNotReleased.setBackgroundImage(UIImage(named: ""), for: .normal)
          } else if sender.tag == 6 {
             btnReleased.setBackgroundImage(UIImage(named: ""), for: .normal)
             btnNotReleased.setBackgroundImage(UIImage(named: "ic_check"), for: .normal)
          }
          //Shipped & Not Shipped
          if sender.tag == 4 {
              btnShipped.setBackgroundImage(UIImage(named: "ic_check"), for: .normal)
              btnNotShipped.setBackgroundImage(UIImage(named: ""), for: .normal)
          } else if sender.tag == 7 {
             btnShipped.setBackgroundImage(UIImage(named: ""), for: .normal)
             btnNotShipped.setBackgroundImage(UIImage(named: "ic_check"), for: .normal)
          }
          //Onsite & Not Onsite
          if sender.tag == 5 {
             btnOnsite.setBackgroundImage(UIImage(named: "ic_check"), for: .normal)
             btnNotOnsite.setBackgroundImage(UIImage(named: ""), for: .normal)
          } else if sender.tag == 8 {
             btnOnsite.setBackgroundImage(UIImage(named: ""), for: .normal)
             btnNotOnsite.setBackgroundImage(UIImage(named: "ic_check"), for: .normal)
          }
      }
    @IBAction func btnExcessQuantityClick(_ sender: UIButton) {
        if sender.tag == 9 {
            btnWithExtraPieces.setBackgroundImage(UIImage(named: "ic_check"), for: .normal)
            btnWithoutExtraPieces.setBackgroundImage(UIImage(named: ""), for: .normal)
        } else if sender.tag == 10 {
           btnWithExtraPieces.setBackgroundImage(UIImage(named: ""), for: .normal)
           btnWithoutExtraPieces.setBackgroundImage(UIImage(named: "ic_check"), for: .normal)
        }
    }
    @IBAction func btnOKClick(_ sender: UIButton) {
       //Button Ok Set Save data
        self.dismiss(animated: true, completion: nil)
    }
}
