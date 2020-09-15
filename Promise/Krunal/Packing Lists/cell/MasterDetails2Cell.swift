//
//  MasterDetails2Cell.swift
//  Promise
//
//  Created by macbook on 13/06/1942 Saka.
//  Copyright © 1942 Captain. All rights reserved.
//

import UIKit

class MasterDetails2Cell: UITableViewCell {

    @IBOutlet weak var lbl_GrossWeightkg: UILabel!
    @IBOutlet weak var lbl_NetWeightkg: UILabel!
    @IBOutlet weak var lbl_Stackable: UILabel!
    @IBOutlet weak var lbl_MinTemperatureC: UILabel!
    @IBOutlet weak var lbl_MaxTemperatureC: UILabel!
    @IBOutlet weak var lbl_TruckNumber: UILabel!
    @IBOutlet weak var lbl_KindofPackage: UILabel!
    @IBOutlet weak var lbl_ReleasedDate: UILabel!
    @IBOutlet weak var lbl_ShippedDate: UILabel!
    @IBOutlet weak var lbl_OnsiteDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func DisplayCell(Arr_Data : [PackinglistIDModel],indexPath : IndexPath) {
        let Arr_MasterDetail = Arr_Data[0].pl_master_ids![indexPath.row]
        print(Arr_MasterDetail)
        lbl_GrossWeightkg.text = String(Arr_MasterDetail.gross_weight!)
        lbl_NetWeightkg.text = String(Arr_MasterDetail.net_weight!)
        lbl_MinTemperatureC.text = String(Arr_MasterDetail.min_temp!)
        lbl_MaxTemperatureC.text = String(Arr_MasterDetail.max_temp!)
        lbl_TruckNumber.text = String(Arr_MasterDetail.truck_number!)
        lbl_KindofPackage.text = Arr_MasterDetail.kind_of_package
        lbl_ReleasedDate.text = Arr_MasterDetail.released_date
        lbl_ShippedDate.text = Arr_MasterDetail.shipped_date
        lbl_OnsiteDate.text = Arr_MasterDetail.onsite_date
          
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

class MasterDetailshedear2Cell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
