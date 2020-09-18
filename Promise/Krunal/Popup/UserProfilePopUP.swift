//
//  UserProfilePopUP.swift
//  Promise
//
//  Created by Captain on 18/09/20.
//  Copyright © 2020 Captain. All rights reserved.
//

import UIKit

class UserProfilePopUP: UIViewController {
    //MARK:- IBOutlet
    @IBOutlet var tbl_Data: UITableView!
    @IBOutlet weak var btn_Cancel: UIButton!
    //MARK:- Variable
    var Arr_Data : NSMutableArray = NSMutableArray()
    var str_Navigate = ""
    var Is_CancelButtonClick : Bool = false
    var str_Selected = ""

    //MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.Initlization()
    }
    //MARK:- initlization
    func Initlization() {
        self.Arr_Data = (str_Navigate == "TimeZone") ? NSMutableArray(array: DEFAULTS.Get_UserPermission().data?.timezone! as! NSArray) : NSMutableArray(array: DEFAULTS.Get_UserPermission().data!.projects!.map{($0.name!)} as NSArray)
        self.tbl_Data.rowHeight = UITableView.automaticDimension
        self.tbl_Data.tableFooterView = UIView()
        self.tbl_Data.separatorStyle = .singleLine
        self.btn_Cancel.addTarget(self, action: #selector(btn_Cancel_Click(_:)), for: .touchUpInside)
        Utils.Set_Same_Corner_Radius(views: [btn_Cancel], cornerRadius: 5)
    }
    @objc func btn_Cancel_Click(_ Button : UIButton) {
        self.view.dismissPresentingPopup()
        self.Is_CancelButtonClick = true
    }
}
extension UserProfilePopUP : UITableViewDataSource,UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return Arr_Data.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell = UITableViewCell()
        cell.textLabel?.text = self.Arr_Data[indexPath.section] as! String
        cell.textLabel?.textColor = .black
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.sizeToFit()
//        cell.textLabel!.setborder(bordercolor: .lightGray, borderwidth: 1)
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Select Value :- \(Arr_Data[indexPath.section])")
        self.str_Selected = (Arr_Data[indexPath.section]) as! String
        self.view.dismissPresentingPopup()
    }
}
