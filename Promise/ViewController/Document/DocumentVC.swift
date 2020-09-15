//
//  DocumentVC.swift
//  Promise
//
//  Created by Captain on 15/09/20.
//  Copyright © 2020 Captain. All rights reserved.
//

import UIKit

class DocumentVC: UIViewController {

    @IBOutlet weak var sampleTreeView: CITreeView!
    let treeViewCellIdentifier = "TreeViewCellIdentifier"
    let treeViewCellNibName = "CITreeViewCell"
    var Home_Barbutton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.InitlizationView()
    }
    override func viewWillAppear(_ animated: Bool) {
       super.viewWillAppear(animated)
       
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationItem.title = ""
        self.revealViewController()?.delegate = nil
    }
    func InitlizationView() {
        sampleTreeView.register(UINib(nibName: treeViewCellNibName, bundle: nil), forCellReuseIdentifier: treeViewCellIdentifier)
        MasterServiceCall.shareInstance.Get_Document(Api_Str: Api_Urls.GET_API_Document, Viewcontroller: self)
        self.Load_Dashboard()
    }
    func Load_Dashboard() {
        self.Home_Barbutton = Utils.Get_Navigation_Bar_Button(str_Iconname: "ic_dashboard", action: #selector(SWRevealViewController.revealToggle(_:)), viewController: self.revealViewController())
        if revealViewController() != nil {
            self.revealViewController().delegate = self
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            self.revealViewController()?.rearViewRevealWidth = 280
        }
        self.navigationItem.setLeftBarButton(Home_Barbutton, animated: true)
    }
    @IBAction func reloadBarButtonAction(_ sender: UIBarButtonItem) {
        sampleTreeView.expandAllRows()
    }
}
//MARK:- SWRevealViewController Methods
extension DocumentVC : SWRevealViewControllerDelegate {
    // MARK: - Reveal View Controller Delagate Methods
    func revealController(_ revealController: SWRevealViewController, didMoveTo position: FrontViewPosition) {
        print(position)
        print("HomeVC")
        Utils.Disable_Front_ViewController(viewController: self, position: position)
    }
    func revealController(_ revealController: SWRevealViewController, willMoveTo position: FrontViewPosition) {
        print(position)
        print("HomeVC")
        Utils.Disable_Front_ViewController(viewController: self, position: position)
    }
}
