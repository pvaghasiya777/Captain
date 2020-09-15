//
//  DrwaingViewCell_4.swift
//  Promise
//
//  Created by macbook on 03/06/1942 Saka.
//  Copyright © 1942 Captain. All rights reserved.
//

import UIKit

class DrwaingViewCell_4: UITableViewCell {

    @IBOutlet weak var lbl_MarkIdentCode: UILabel!
    @IBOutlet weak var lbl_PaintIdentCode: UILabel!
    @IBOutlet weak var lbl_FireIdentCode: UILabel!
    @IBOutlet weak var lbl_PosMark: UILabel!
    @IBOutlet weak var lbl_PosPainting: UILabel!
    @IBOutlet weak var lbl_PosFireproofing: UILabel!
    @IBOutlet weak var lbl_HSCode: UILabel!
    @IBOutlet weak var lbl_Priority: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func DisplayCell(arr : [DrwaingViewModel],indexPath : IndexPath) {
        let rowdata = arr[indexPath.row]
        lbl_MarkIdentCode.text = rowdata.mark_ident_code
        lbl_PaintIdentCode.text = rowdata.paint_ident_code
        lbl_FireIdentCode.text = rowdata.fire_ident_code
        lbl_PosMark.text = rowdata.po_ref_mark
        lbl_PosPainting.text = rowdata.po_ref_paint
        lbl_PosFireproofing.text = rowdata.po_ref_fireproofing
        lbl_HSCode.text = rowdata.hs_code
        lbl_Priority.text = rowdata.priority
      }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
class DrwaingViewHeaderCell_4: UITableViewCell {

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
