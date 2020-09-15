//
//  DrwaingViewCell_5.swift
//  Promise
//
//  Created by macbook on 03/06/1942 Saka.
//  Copyright © 1942 Captain. All rights reserved.
//

import UIKit

class DrwaingViewCell_5: UITableViewCell {
    @IBOutlet weak var lbl_MarkTotalWeight: UILabel!
    @IBOutlet weak var lbl_PaintingTotalWeight: UILabel!
    @IBOutlet weak var lbl_FireproofingTotalWeight: UILabel!
    @IBOutlet weak var lbl_POUOM: UILabel!
    @IBOutlet weak var lbl_SingleMarkPOUOM: UILabel!
    @IBOutlet weak var lbl_TotalMarkPOUOM: UILabel!
    @IBOutlet weak var img_Active: UIImageView!
    @IBOutlet weak var img_Bolt: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func DisplayCell(arr : [DrwaingViewModel],indexPath : IndexPath) {
      let rowdata = arr[indexPath.row]
        lbl_MarkTotalWeight.text = String(describing: rowdata.mark_total_weight!)
        lbl_PaintingTotalWeight.text = String(describing: rowdata.painting_unit_weight!)
        lbl_FireproofingTotalWeight.text = String(describing: rowdata.fireproofing_total_weight!)
        lbl_POUOM.text = rowdata.po_uom
        lbl_SingleMarkPOUOM.text = String(describing: rowdata.single_mark_qty_po_uom!)
        img_Active?.image = UIImage(named: (rowdata.is_active == true) ? "ic_correct":"ic_not_released")
        img_Bolt?.image = UIImage(named: (rowdata.is_bolt == true) ? "ic_correct":"ic_not_released")
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
class DrwaingViewHeaderCell_5: UITableViewCell {
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
