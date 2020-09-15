//
//  DrwaingViewCell_3.swift
//  report
//
//  Created by macbook on 02/06/1942 Saka.
//  Copyright © 1942 com.mac. All rights reserved.
//

import UIKit

class DrwaingViewCell_3: UITableViewCell {

    @IBOutlet weak var lbl_MaterialGrade: UILabel!
    @IBOutlet weak var lbl_StructureRole: UILabel!
    @IBOutlet weak var lbl_PaintingUnitWeight: UILabel!
    @IBOutlet weak var lbl_FireproofingUnitWeight: UILabel!
    @IBOutlet weak var lbl_ShopDrawingNumber: UILabel!
    @IBOutlet weak var lbl_MarkCommodityCode: UILabel!
    @IBOutlet weak var lbl_PaintCommodityCode: UILabel!
    @IBOutlet weak var lbl_FireCommodityCode: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func DisplayCell(arr : [DrwaingViewModel],indexPath : IndexPath) {
       let rowdata = arr[indexPath.row]
        lbl_MaterialGrade.text = rowdata.material_grade
        lbl_StructureRole.text = rowdata.structure_role
        lbl_PaintingUnitWeight.text = String(describing: rowdata.painting_unit_weight!)
        lbl_FireCommodityCode.text = rowdata.fire_commodity_code
        lbl_ShopDrawingNumber.text = rowdata.shop_drawing_no
        lbl_MarkCommodityCode.text = rowdata.mark_commodity_code
        lbl_FireCommodityCode.text = rowdata.fire_commodity_code
        
       
   }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

class DrwaingViewHeaderCell_3: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
