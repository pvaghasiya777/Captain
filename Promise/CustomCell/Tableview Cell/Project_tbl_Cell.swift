//
//  Project_tbl_Cell.swift
//  Promise
//  Created by Promise Inspection on 30/07/20.
//  Copyright © 2020 Promise . All rights reserved.
//

import UIKit

class Project_tbl_Cell: UITableViewCell
{
    @IBOutlet var View_tbl: UIView!
    @IBOutlet var lbl_Project_Status: UILabel!
    @IBOutlet var lbl_Project_Code: UILabel!
    @IBOutlet var lbl_Project_Name: UILabel!
    override func awakeFromNib()
    {
        super.awakeFromNib()
        self.setcornerRadius(cornerradius: 10)
        // Initialization code
    }
    func DisplayCell(arr: [MasterProjectModel], indexPath: Int) {
        let rowdata = arr[indexPath]
        self.lbl_Project_Name.text = rowdata.code!
        self.lbl_Project_Code.text = rowdata.name!
        self.lbl_Project_Status.text = (rowdata.isActive == true) ? "Yes" : "No"
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
