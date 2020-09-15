//
//  PurchaseCell.swift
//  Promise
//
//  Created by macbook on 28/05/1942 Saka.
//  Copyright © 1942 Captain. All rights reserved.
//

import UIKit

class PurchaseCell: UITableViewCell {

    @IBOutlet weak var lbl_ProjectName: UILabel!
    @IBOutlet weak var lbl_VendorName: UILabel!
    @IBOutlet weak var lbl_PurchaseOrderNumber: UILabel!
    @IBOutlet weak var lbl_PurchaseOrderType: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func DisplayCell(Arr_PurchaseData : [MasterPurchseListModel],indexpath: IndexPath) {
        let Arr_Data = Arr_PurchaseData[indexpath.row]
       
        self.lbl_ProjectName.text = Arr_Data.projectName!
        self.lbl_VendorName.text = Arr_Data.vendorName!
        self.lbl_PurchaseOrderNumber.text = Arr_Data.number!
        self.lbl_PurchaseOrderType.text = Arr_Data.poTypeName!
        
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
class PurchaseHeaderCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
