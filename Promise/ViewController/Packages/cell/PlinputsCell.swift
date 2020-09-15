//
//  PlinputsCell.swift
//  Packages
//
//  Created by macbook on 23/05/1942 Saka.
//  Copyright © 1942 com.mac. All rights reserved.
//

import UIKit

class PlinputsCell: UITableViewCell {

    @IBOutlet var lbl_InputNumber: UILabel!
    @IBOutlet var lbl_ProjectName: UILabel!
    @IBOutlet var lbl_vendorName: UILabel!
    @IBOutlet var lbl_purchaseOrder: UILabel!
    @IBOutlet var lbl_strucherID: UILabel!
    @IBOutlet var lbl_approvalStatus: UILabel!
    @IBOutlet var lbl_ActiveStatus: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func Display_Cell(viewController : PlinputsVc , indexPath : IndexPath) {
        print(indexPath.row)
        var Arr_data = viewController.Arr_PLInputs_Data[indexPath.row] as! PLreportsModel
        print(Arr_data)
        self.lbl_InputNumber.text = Arr_data.name!
        self.lbl_ProjectName.text = Arr_data.projectName!
        self.lbl_vendorName.text = Arr_data.vendorName!
        self.lbl_purchaseOrder.text = Arr_data.purchaseId!
        self.lbl_strucherID.text = Arr_data.shopDrawingName!
        self.lbl_approvalStatus.text = Arr_data.approveStatus!
        self.lbl_ActiveStatus.text = (Arr_data.isActive == true) ? "Active" : "Deactivated"
        
    }

}
