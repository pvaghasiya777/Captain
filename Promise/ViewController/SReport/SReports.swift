//
//  SReports.swift
//  report
//
//  Created by macbook on 02/07/1942 Saka.
//  Copyright © 1942 com.mac. All rights reserved.
//

import UIKit

class SReports: UIViewController, SWRevealViewControllerDelegate {
    
    @IBOutlet var btn_menubar: UIBarButtonItem!
//Mark Reports
    @IBOutlet weak var btn_MarkwiseReport: UIButton!
    @IBOutlet weak var btn_MarkwiseCumulativeReport: UIButton!
//    Structure Reports
    @IBOutlet weak var btn_StructurewiseReport: UIButton!
    @IBOutlet weak var btn_GroupStructurewiseReport: UIButton!
//    PL Reports
    @IBOutlet weak var btn_PackagewiseReport: UIButton!
    @IBOutlet weak var btn_PackingListReport: UIButton!
    @IBOutlet weak var btn_POPositionwiseReport: UIButton!
    @IBOutlet weak var btn_IdentCodewiseReport: UIButton!
//    Custom Reports
    @IBOutlet weak var btn_DetailFigureReport:UIButton!
    @IBOutlet weak var btn_SummaryReport: UIButton!
    
    var arrheader : NSMutableArray = ["Mark Reports","Structure Reports","PL Reports",""]
    override func viewDidLoad() {
        super.viewDidLoad()
       if revealViewController() != nil {
           self.revealViewController().delegate = self
           btn_menubar.target = self.revealViewController()
           btn_menubar.action = #selector(SWRevealViewController.revealToggle(_:))
           self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
           self.revealViewController()?.rearViewRevealWidth = 280
       }
    }
    override func viewWillAppear(_ animated: Bool){
       super.viewWillAppear(animated)
        self.navigationItem.title = "Reports"
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationItem.title = ""
    }
    //Mark Reports
    @IBAction func btn_MarkReportsClick(_ sender: UIButton) {
        let Filter_VC = Config.StoryBoard.instantiateViewController(identifier: "ReportsFiltersVC") as! ReportsFiltersVC
        Filter_VC.str_FilterName = sender.currentTitle!
        Filter_VC.StrNavigate = "Sreport" 
        self.navigationController?.pushViewController(Filter_VC, animated: true)
    }
    //Structure Reports
    @IBAction func btn_StructureReportsClick(_ sender: UIButton) {
        if sender.tag == 3 {
            let Filter_VC = Config.StoryBoard.instantiateViewController(identifier: "ReportsFiltersVC") as! ReportsFiltersVC
            Filter_VC.str_FilterName = sender.currentTitle!
            Filter_VC.StrNavigate = "Sreport" 
            self.navigationController?.pushViewController(Filter_VC, animated: true)
        } else if sender.tag == 4 {
            let Filter_VC = Config.StoryBoard.instantiateViewController(identifier: "ReportsFiltersVC") as! ReportsFiltersVC
            Filter_VC.str_FilterName = sender.currentTitle!
            Filter_VC.StrNavigate = "Sreport"
            self.navigationController?.pushViewController(Filter_VC, animated: true)
        }
    }
//    PL Reports
    @IBAction func btn_PLReports(_ sender: UIButton) {
        if sender.tag == 5 {
            let Filter_VC = Config.StoryBoard.instantiateViewController(identifier: "ReportsFiltersVC") as! ReportsFiltersVC
            Filter_VC.str_FilterName = sender.currentTitle!
            Filter_VC.StrNavigate = "Sreport"
            self.navigationController?.pushViewController(Filter_VC, animated: true)
        } else if sender.tag == 6 {
            let Filter_VC = Config.StoryBoard.instantiateViewController(identifier: "ReportsFiltersVC") as! ReportsFiltersVC
            Filter_VC.str_FilterName = sender.currentTitle!
            Filter_VC.StrNavigate = "Sreport"
            self.navigationController?.pushViewController(Filter_VC, animated: true)
        } else if sender.tag == 7 {
           let Filter_VC = Config.StoryBoard.instantiateViewController(identifier: "ReportsFiltersVC") as! ReportsFiltersVC
            Filter_VC.str_FilterName = sender.currentTitle!
            Filter_VC.StrNavigate = "Sreport"
           self.navigationController?.pushViewController(Filter_VC, animated: true)
        } else if sender.tag == 8 {
           let Filter_VC = Config.StoryBoard.instantiateViewController(identifier: "ReportsFiltersVC") as! ReportsFiltersVC
            Filter_VC.str_FilterName = sender.currentTitle!
            Filter_VC.StrNavigate = "Sreport"
           self.navigationController?.pushViewController(Filter_VC, animated: true)
        }
    }
//    Custom Reports
    @IBAction func btn_CustomReportsClick(_ sender: UIButton) {
        if sender.tag == 9 {
           let Filter_VC = Config.StoryBoard.instantiateViewController(identifier: "ReportsFiltersVC") as! ReportsFiltersVC
            Filter_VC.str_FilterName = sender.currentTitle!
            Filter_VC.StrNavigate = "Sreport"
           self.navigationController?.pushViewController(Filter_VC, animated: true)
        } else if sender.tag == 10 {
           let Filter_VC = Config.StoryBoard.instantiateViewController(identifier: "ReportsFiltersVC") as! ReportsFiltersVC
            Filter_VC.str_FilterName = sender.currentTitle!
            Filter_VC.StrNavigate = "Sreport"
           self.navigationController?.pushViewController(Filter_VC, animated: true)
        }
    }
}


