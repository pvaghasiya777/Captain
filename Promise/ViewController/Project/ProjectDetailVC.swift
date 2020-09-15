//
//  ProjectDetailVC.swift
//  Promise
//
//  Created by Promise Inspection on 31/07/20.
//  Copyright © 2020 Promise. All rights reserved.
//

import UIKit

class ProjectDetailVC: UIViewController
{

    @IBOutlet var tbl_ProjectDetail: UITableView!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.Initialization()
    }
    func Initialization()
    {
        self.tbl_ProjectDetail.register(UINib(nibName: "ProjectDetail_Cell", bundle: nil), forCellReuseIdentifier: "ProjectDetail_Cell")
        let value = UIInterfaceOrientation.landscapeRight.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
    }
    override public var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscapeRight
    }
    override public var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return .landscapeRight
    }
}
extension ProjectDetailVC : UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
            return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : ProjectDetail_Cell = tableView.dequeueReusableCell(withIdentifier: "ProjectDetail_Cell") as! ProjectDetail_Cell
    //        cell.Display_Basic_Cell(index : indexPath.row , Arr_Data :arr_DiteRecall )
        cell.selectionStyle = .none
        return cell

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 581
    }
}

