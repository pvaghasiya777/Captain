//
//  DashBoardVC.swift
//  Promise
//
//  Created by Captain on 17/09/20.
//  Copyright © 2020 Captain. All rights reserved.
//

import UIKit

class DashBoardVC: UIViewController {
    //MARK:- IBOutlet
    @IBOutlet var btn_filter: UIBarButtonItem!
    @IBOutlet var menu_Barbutton: UIBarButtonItem!
    @IBOutlet var Select_segment: UISegmentedControl!
    @IBOutlet weak var tbl_ReportSection: UITableView!
    
    @IBOutlet var View_DashBoard: UIView!
    @IBOutlet var View_TotalPiece: UIView!
    @IBOutlet var View_TotalWeight: UIView!
    @IBOutlet var View_Total: UIView!
    
    var Arr_Report_Section : NSMutableArray = ["Detail Figure Report","Markwise Report","Markwise Cumulative Report","Packagewise Report","Packing List Report","PO Positionwise Reportm","Ident Codewise Report","Structurewise Report","Group Structurewise Report","Summary Report"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.Initialization()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "DashBoard"
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationItem.title = ""
        self.revealViewController()?.delegate = nil
    }
   //MARK:- Initialization
    func Initialization() {
        self.View_DashBoard.isHidden = false
        self.tbl_ReportSection.isHidden = true
        if revealViewController() != nil {
            self.revealViewController().delegate = self
            menu_Barbutton.target = self.revealViewController()
            menu_Barbutton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            self.revealViewController()?.rearViewRevealWidth = 280
        }
        MasterServiceCall.shareInstance.Get_FilterApi(Api_Str: Api_Urls.GET_API_filterProject, tag: 1)
        MasterServiceCall.shareInstance.Get_FilterApi(Api_Str: Api_Urls.GET_API_filterPurchaseOrder, tag: 2)
        MasterServiceCall.shareInstance.Get_FilterApi(Api_Str: Api_Urls.GET_API_filterStrucher, tag: 3)
        MasterServiceCall.shareInstance.Get_FilterApi(Api_Str: Api_Urls.GET_API_filterPackingList, tag: 4)
        let value = UIInterfaceOrientation.portrait.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
//        if UIDevice.isPad == true {
//            self.lbl_shipping_Weight.font = lbl_shipping_Weight.font.withSize(25)
//            self.lbl_Shipping_Weight_Height.constant = 25
//
//            self.lbl_Released_Weight.font = lbl_shipping_Weight.font.withSize(25)
//            self.lbl_Released_Weight_Height.constant = 25
//
//            self.lbl_Released_Pieces.font = lbl_shipping_Weight.font.withSize(25)
//            self.lbl_Released_Pieces_Height.constant = 25
//
//            self.lbl_Shipping_Pieces.font = lbl_shipping_Weight.font.withSize(25)
//            self.lbl_Shipping_Pieces_Height.constant = 25
//        }
        self.Design()
    }
    func Design() {
        Utils.Set_Same_Corner_Radius(views: [View_TotalPiece,View_TotalWeight], cornerRadius: 10)
        Select_segment.setTitleTextAttributes( [NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
    }
    override public var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }

       override public var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
              return .portrait
       }
    @IBAction func btn_Filter_Click(_ sender: UIBarButtonItem) {
        print("Filter Button Click")
        let DFilters_VC = Config.StoryBoard.instantiateViewController(withIdentifier: "DFiltersVC") as! DFiltersVC
        self.navigationController?.pushViewController(DFilters_VC, animated: true)
    }
    @IBAction func btn_ViewFilter_Click(_ sender: UIBarButtonItem) {
        print("Filter Button Click")
        let ViewFilterVC = Config.StoryBoard.instantiateViewController(withIdentifier: "ViewSelectFilter") as! ViewSelectFilter
        self.present(ViewFilterVC, animated: true, completion: nil)
    }
    @IBAction func Change_segment(_ sender: UISegmentedControl) {
        let GetIndx = Select_segment.selectedSegmentIndex
        switch (GetIndx) {
        case 0:
            self.View_DashBoard.isHidden = false
            self.tbl_ReportSection.isHidden = true
        default:
            self.tbl_ReportSection.isHidden = false
            self.View_DashBoard.isHidden = true
        }
    }
}

extension DashBoardVC : UITableViewDataSource ,UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Arr_Report_Section.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell :ReportSectioncell = tableView.dequeueReusableCell(withIdentifier: "ReportSectioncell") as! ReportSectioncell
        cell.lbl_SectionName.text = Arr_Report_Section[indexPath.row] as! String
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let report_vc = Config.StoryBoard.instantiateViewController(identifier: "ReportVC6") as! ReportVC6
            report_vc.pageName = "Detail Figure Report"
            self.navigationController?.pushViewController(report_vc, animated: true)
        } else if indexPath.row == 1 {
           let report_vc = Config.StoryBoard.instantiateViewController(identifier: "ReportVC6") as! ReportVC6
            report_vc.pageName = "Markwise Report"
            self.navigationController?.pushViewController(report_vc, animated: true)
        }  else if indexPath.row == 2 {
            let report_vc = Config.StoryBoard.instantiateViewController(identifier: "ReportVC6") as! ReportVC6
            report_vc.pageName = "Markwise Cumulative Report"
            self.navigationController?.pushViewController(report_vc, animated: true)
        } else if indexPath.row == 3 {
           let report_vc = Config.StoryBoard.instantiateViewController(identifier: "ReportVC1") as! ReportVC1
            report_vc.pageName = "Packagewise Report"
            self.navigationController?.pushViewController(report_vc, animated: true)
        } else if indexPath.row == 4 {
            let report_vc = Config.StoryBoard.instantiateViewController(identifier: "ReportVC1") as! ReportVC1
            report_vc.pageName = "Packing List Report"
            self.navigationController?.pushViewController(report_vc, animated: true)
        } else if indexPath.row == 5 {
            let report_vc = Config.StoryBoard.instantiateViewController(identifier: "Report2") as! Report2
            report_vc.pageName = "PO Positionwise Report"
            self.navigationController?.pushViewController(report_vc, animated: true)
        } else if indexPath.row == 6 {
            let report_vc = Config.StoryBoard.instantiateViewController(identifier: "Report2") as! Report2
            report_vc.pageName = "Ident Codewise Report"
            self.navigationController?.pushViewController(report_vc, animated: true)
        } else if indexPath.row == 7 {
            let report_vc = Config.StoryBoard.instantiateViewController(identifier: "Report2") as! Report2
            report_vc.pageName = "Structurewise Report"
            self.navigationController?.pushViewController(report_vc, animated: true)
        } else if indexPath.row == 8 {
            let report_vc = Config.StoryBoard.instantiateViewController(identifier: "ReportVC3") as! ReportVC3
            report_vc.pageName = "Group Structurewise Report"
            self.navigationController?.pushViewController(report_vc, animated: true)
        } else {
            let report_vc = Config.StoryBoard.instantiateViewController(identifier: "ReportVC4") as! ReportVC4
            report_vc.pageName = "Summary Report"
            self.navigationController?.pushViewController(report_vc, animated: true)
        }
    }
    
}

//MARK:- SWRevealViewController Methods
extension DashBoardVC : SWRevealViewControllerDelegate {
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
