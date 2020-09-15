//
//  DrwaingViewCell_2.swift
//  report
//
//  Created by macbook on 02/06/1942 Saka.
//  Copyright © 1942 com.mac. All rights reserved.
//

import UIKit

class DrwaingViewCell_2: UITableViewCell {

    @IBOutlet weak var lbl_SubLot: UILabel!
    @IBOutlet weak var lbl_WBS: UILabel!
    @IBOutlet weak var lbl_ConstructionArea: UILabel!
    @IBOutlet weak var lbl_SubArea: UILabel!
    @IBOutlet weak var lbl_Marklength: UILabel!
    @IBOutlet weak var lbl_ProfileUnitWeight: UILabel!
    @IBOutlet weak var lbl_MarkUnitWeight: UILabel!
    @IBOutlet weak var lbl_MarkNumber: UILabel!
    @IBOutlet weak var lbl_MarkSequence: UILabel!
    @IBOutlet weak var lbl_MarkSurfacePaint: UILabel!
    @IBOutlet weak var lbl_MarkSurfaceFireproofing: UILabel!
    @IBOutlet weak var lbl_Profile: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
     func DisplayCell(arr : [DrwaingViewModel],indexPath : IndexPath) {
        let rowdata = arr[indexPath.row]
        
        lbl_SubLot.text = rowdata.sub_lot
        lbl_WBS.text = rowdata.wbs
        lbl_ConstructionArea.text = rowdata.construction_area
        lbl_SubArea.text = rowdata.sub_area
        lbl_Marklength.text = rowdata.mark_length
        lbl_ProfileUnitWeight.text = String(describing:rowdata.profile_unit_weight!)
        lbl_MarkUnitWeight.text = String(describing: rowdata.mark_unit_weight!)
        lbl_MarkNumber.text = String(describing:rowdata.mr_no!)
        lbl_MarkSequence.text = String(describing: rowdata.mark_sequence!)
        lbl_MarkSurfacePaint.text = String(describing: rowdata.mark_surface_paint!)
        lbl_MarkSurfaceFireproofing.text = String(describing:rowdata.mark_surface_fireproofing!)
        lbl_Profile.text = rowdata.profile
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
class DrwaingViewHeaderCell_2: UITableViewCell {

   

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
