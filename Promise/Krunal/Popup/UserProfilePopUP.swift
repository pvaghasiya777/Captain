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
    var Arr_Disciple = [DDResult]()
    var Arr_ProjectID : NSMutableArray = NSMutableArray()
    var str_Navigate = ""
    var Is_CancelButtonClick : Bool = false
    var str_Selected = ""
    var Str_id = ""
    //MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.Initlization()
    }
    //MARK:- initlization
    func Initlization() {
        self.Arr_Data = (str_Navigate == "TimeZone") ? NSMutableArray(array: DEFAULTS.Get_UserPermission().data?.timezone! as! NSArray) : NSMutableArray(array: DEFAULTS.Get_UserPermission().data!.projects!.map{($0.name!)} as NSArray)
        self.Arr_ProjectID = NSMutableArray(array: DEFAULTS.Get_UserPermission().data!.projects!.map{($0.id!)} as NSArray)
        if str_Navigate == "Disciple"{
            self.Arr_Disciple = DEFAULTS.Get_Discipline()[0].results!
        }
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
        cell.textLabel?.text = (str_Navigate == "Disciple") ? self.Arr_Disciple[indexPath.section].name! : self.Arr_Data[indexPath.section] as! String
        cell.textLabel?.textColor = .black
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.sizeToFit()
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if str_Navigate == "Project" {
            self.Str_id = String(describing:Arr_ProjectID[indexPath.section])
            self.str_Selected = (Arr_Data[indexPath.section]) as! String
        }else if str_Navigate == "TimeZone" {
            self.Str_id = (Arr_Data[indexPath.section]) as! String
            self.str_Selected = (Arr_Data[indexPath.section]) as! String
        }else {
            self.Str_id = String(describing: self.Arr_Disciple[indexPath.section].id!)
            self.str_Selected = Arr_Disciple[indexPath.section].name!
        }
        self.view.dismissPresentingPopup()
    }
}
