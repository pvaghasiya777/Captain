//
//  PackingListReportVC.swift
//  Promise
//
//  Created by Promise Inspection
//  Copyright © 2020 Promise. All rights reserved.
//

import UIKit

class PackingListReportVC: UIViewController,SWRevealViewControllerDelegate
{

    @IBOutlet weak var tbl_data: UITableView!
    @IBOutlet weak var searchview: UISearchBar!
    @IBOutlet weak var btn_Action: UIButton!
    @IBOutlet weak var btn_Filter: UIButton!
    @IBOutlet weak var btn_Short: UIButton!
    @IBOutlet weak var btn_More: UIButton!
    @IBOutlet weak var btn_PackingList: UIButton!
    @IBOutlet weak var btn_Draft: UIButton!
    @IBOutlet weak var btn_Submitted: UIButton!
    @IBOutlet weak var btn_Level1Approved: UIButton!
    @IBOutlet weak var btn_Level2Approved: UIButton!
    @IBOutlet weak var btn_Last: UIButton!
    @IBOutlet weak var lbl_ShowPageNum: UILabel!
    @IBOutlet weak var lbl_PageNum: UILabel!
    @IBOutlet var menu_Barbutton: UIBarButtonItem!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.Initialization()
    }
    func Initialization() {
        if revealViewController() != nil {
            self.revealViewController().delegate = self
            menu_Barbutton.target = self.revealViewController()
            menu_Barbutton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            self.revealViewController()?.rearViewRevealWidth = 280
        }
        tbl_data.register(UINib(nibName: "PackageDetailsCell", bundle: nil), forCellReuseIdentifier: "PackageDetailsCell")
        Utils.setborder(view: btn_Draft, bordercolor: App_Colors.boderColor, borderwidth: 1)
        Utils.setborder(view: btn_Submitted, bordercolor: App_Colors.boderColor, borderwidth: 1)
        Utils.setborder(view: btn_Level1Approved, bordercolor: App_Colors.boderColor, borderwidth: 1)
        Utils.setborder(view: btn_Level2Approved, bordercolor: App_Colors.boderColor, borderwidth: 1)
         NotificationCenter.default.addObserver(self, selector: #selector(PackingListReportVC.rotated), name: UIDevice.orientationDidChangeNotification, object: nil)
        let value = UIInterfaceOrientation.landscapeRight.rawValue
               UIDevice.current.setValue(value, forKey: "orientation")
    }
    deinit {
       NotificationCenter.default.removeObserver(self, name: UIDevice.orientationDidChangeNotification, object: nil)
    }
    @objc func rotated() {
        if UIDevice.current.orientation.isLandscape {
            print("Landscape")
        } else {
            print("Portrait")
            let value = UIInterfaceOrientation.landscapeRight.rawValue
            UIDevice.current.setValue(value, forKey: "orientation")
        }
    }
    override func viewWillAppear(_ animated: Bool)
    {
       super.viewWillAppear(animated)
    }
    override public var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscapeRight
    }
    override public var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return .landscapeRight
    }
}
extension PackingListReportVC : UITableViewDataSource,UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1{
            return 1
        } else {
            return 5
        }
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PackageDetailsCell") as! PackageDetailsCell
        
        return cell
        } else if indexPath.section == 1 {
             let cell : tblCustomDetailsHeaderCell = tableView.dequeueReusableCell(withIdentifier: "tblCustomDetailsHeaderCell") as! tblCustomDetailsHeaderCell
            return cell
        } else {
            let cell : tblCustomDetailsCell = tableView.dequeueReusableCell(withIdentifier: "tblCustomDetailsCell") as! tblCustomDetailsCell
                       return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
        return 957
        } else {
            return 50
        }
    }
}
