//
//  DrwaingViewCell_1.swift
//  report
//
//  Created by macbook on 02/06/1942 Saka.
//  Copyright © 1942 com.mac. All rights reserved.
//

import UIKit

class DrwaingViewCell_1: UITableViewCell {

    @IBOutlet weak var lbl_Mark: UILabel!
    @IBOutlet weak var lbl_Structure: UILabel!
    @IBOutlet weak var lbl_PLNumber: UILabel!
    @IBOutlet weak var lbl_RevisionNumber: UILabel!
    @IBOutlet weak var lbl_DocumentNumber: UILabel!
    @IBOutlet weak var lbl_AvailableQuantity: UILabel!
    @IBOutlet weak var lbl_PLQuantity: UILabel!
    @IBOutlet weak var lbl_Quantity: UILabel!
    @IBOutlet weak var lbl_ExcessQuantity: UILabel!
    @IBOutlet weak var lbl_Lot: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func DisplayCell(arr : [DrwaingViewModel],indexPath : IndexPath) {
        let rowdata = arr[indexPath.row]
        lbl_Mark.text = rowdata.mark
        lbl_Structure.text = rowdata.structure
        lbl_PLNumber.text = rowdata.pl_number
        lbl_RevisionNumber.text = rowdata.rev_no
        lbl_DocumentNumber.text = rowdata.document_no
        lbl_AvailableQuantity.text = String(describing: rowdata.available_quantity!)
        lbl_PLQuantity.text = String(describing:rowdata.pl_quantity!)
        lbl_Quantity.text = String(describing:rowdata.quantity!)
        lbl_ExcessQuantity.text = String(describing:rowdata.excess_quantity!)
        lbl_Lot.text = rowdata.lot
//        lbl_SubLot.text = rowdata.sub_lot
//        lbl_WBS.text = rowdata.wbs
//        lbl_ConstructionArea.text = rowdata.construction_area
//        lbl_SubArea.text = rowdata.sub_area
//        lbl_Marklength.text = rowdata.mark_length
//        lbl_ProfileUnitWeight.text = String(describing:rowdata.profile_unit_weight)
//        lbl_MarkUnitWeight.text = String(describing: rowdata.mark_unit_weight)
        
        
        
        
           
       }
       
       

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
class DrwaingViewHeaderCell_1: UITableViewCell {

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
