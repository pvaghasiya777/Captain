//
//  SingleDetailsCell.swift
//  Promise
//
//  Created by macbook on 13/06/1942 Saka.
//  Copyright © 1942 Captain. All rights reserved.
//

import UIKit

class SingleDetailsCell: UITableViewCell {

    @IBOutlet weak var lbl_PLNumber: UILabel!
    @IBOutlet weak var lbl_Revision: UILabel!
    @IBOutlet weak var lbl_PackageName: UILabel!
    @IBOutlet weak var lbl_Mark: UILabel!
    @IBOutlet weak var lbl_Quantity: UILabel!
    @IBOutlet weak var lbl_MTCNumber: UILabel!
    @IBOutlet weak var lbl_HeatCastNumber: UILabel!
    @IBOutlet weak var lbl_NetWeightkg: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func DisplayCell(Arr_Data : [Pl_single_ids],indexPath : IndexPath) {
        let Arr_SingleDetail = Arr_Data[indexPath.row]
        print(Arr_SingleDetail)
        lbl_PLNumber.text = Arr_SingleDetail.number
        lbl_Revision.text = Arr_SingleDetail.revision
        lbl_PackageName.text =  String(Arr_SingleDetail.package!)
        lbl_Mark.text = Arr_SingleDetail.mark
        lbl_Quantity.text = String(Arr_SingleDetail.marks_qty!)
        lbl_MTCNumber.text = Arr_SingleDetail.mtc_no
        lbl_HeatCastNumber.text = Arr_SingleDetail.heat_no
        lbl_NetWeightkg.text = String(Arr_SingleDetail.net_weight!)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
class SingleDetailsHeaderCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
