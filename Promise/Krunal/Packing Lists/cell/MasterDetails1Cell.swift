//
//  MasterDetails1Cell.swift
//  Promise
//
//  Created by macbook on 13/06/1942 Saka.
//  Copyright © 1942 Captain. All rights reserved.
//

import UIKit

class MasterDetails1Cell: UITableViewCell {

    @IBOutlet weak var lbl_ProjectName: UILabel!
    @IBOutlet weak var lbl_lblVendorName: UILabel!
    @IBOutlet weak var lbl_PurchaseOrder: UILabel!
    @IBOutlet weak var lbl_PLNumber: UILabel!
    @IBOutlet weak var lbl_Revision: UILabel!
    @IBOutlet weak var lbl_PackageName: UILabel!
    @IBOutlet weak var lbl_Lengthcm: UILabel!
    @IBOutlet weak var lbl_Widthcm: UILabel!
    @IBOutlet weak var lbl_Height: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func DisplayCell(Arr_Data : [PackinglistIDModel],indexPath : IndexPath) {
        let Arr_MasterDetail = Arr_Data[0].pl_master_ids![indexPath.row]
        print(Arr_MasterDetail)
        lbl_ProjectName.text = Arr_MasterDetail.project_name
        lbl_lblVendorName.text = Arr_MasterDetail.vendor_name
        lbl_PurchaseOrder.text = Arr_MasterDetail.purchase_id
        lbl_PLNumber.text = Arr_MasterDetail.number
        lbl_Revision.text = Arr_MasterDetail.revision
        lbl_PackageName.text = String(Arr_MasterDetail.package!)
        lbl_Lengthcm.text = String(Arr_MasterDetail.length!)
        lbl_Widthcm.text = String(Arr_MasterDetail.width!)
        lbl_Height.text = String(Arr_MasterDetail.height!)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
class MasterDetailsHeader1Cell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
