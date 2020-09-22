//
//  Project_CollectionCell.swift
//  Promise
//
//  Created by Promise Inspection
//  Copyright © 2020 Promise. All rights reserved.
//

import UIKit

class Project_CollectionCell: UICollectionViewCell
{
    @IBOutlet weak var view_Project: UIView!
    @IBOutlet weak var lbl_ProjectName: UILabel!
//    @IBOutlet weak var lbl_ProjectName: UILabel!
    @IBOutlet weak var lbl_ProjectCode: UILabel!
    @IBOutlet weak var lbl_Active: UILabel!
    @IBOutlet weak var lbl_TotalNo: UILabel!
    @IBOutlet weak var lbl_Structures: UILabel!
    
    @IBOutlet weak var lbl_TPackingLists: UILabel!
    @IBOutlet weak var lbl_Weight: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        Utils.add_shadow_around_view(view: view_Project, color: .gray, radius: 5, opacity: 3)
        Utils.setcornerRadius(view: view_Project, cornerradius: 5)
    }
    func DisplayCell(arr : [MasterProjectModel], indexPath: IndexPath) {
        let rowdata = arr[indexPath.row]
        print(rowdata)
        self.lbl_ProjectName.text = rowdata.name!
        self.lbl_ProjectCode.text = "Code : \(rowdata.code!)"
        self.lbl_Active.text = "Active : \((rowdata.isActive! ? "Yes" : "No"))"
        self.lbl_Structures.text = "- Structures : \(rowdata.drawingCount!)"
        self.lbl_TPackingLists.text = "- Packing Lists : \(rowdata.packingCount!)"
        self.lbl_Weight.text = "- Weight : \(rowdata.structureWeight!)"
    }
}
