//
//  DrawingCell.swift
//  PromiseApiCall
//
//  Created by macbook on 20/05/1942 Saka.
//  Copyright © 1942 com.mac. All rights reserved.
//

import UIKit

class DrawingCell: UITableViewCell {

    @IBOutlet weak var lbl_ProjectName: UILabel!
    @IBOutlet weak var lbl_VendorName: UILabel!
    @IBOutlet weak var lbl_PurchaseOrder: UILabel!
    @IBOutlet weak var lbl_GroupName: UILabel!
    @IBOutlet weak var lbl_StructureId: UILabel!
    @IBOutlet weak var lbl_Lot: UILabel!
    @IBOutlet weak var lbl_RevisionNumber: UILabel!
    @IBOutlet weak var lbl_ApprovalStatus: UILabel!
    @IBOutlet weak var lbl_ActiveStatus: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
     func DisplayCell(arr : [Result],indexPath : IndexPath) {
        let rowdata = arr[indexPath.row]
        lbl_ProjectName.text = rowdata.projectName
        lbl_VendorName.text = rowdata.vendorName
        lbl_PurchaseOrder.text = rowdata.purchaseID
        lbl_GroupName.text = rowdata.groupName
        lbl_StructureId.text = rowdata.structureID
        lbl_Lot.text = rowdata.lot
        lbl_RevisionNumber.text = rowdata.revNo
        lbl_ApprovalStatus.text = rowdata.approveStatus
        lbl_ActiveStatus.text = (rowdata.isActive == true) ? "Active" : "Deactivated"
        
    }
    
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
