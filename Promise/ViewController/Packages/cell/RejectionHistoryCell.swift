//
//  RejectionHistoryCell.swift
//  Packages
//
//  Created by macbook on 23/05/1942 Saka.
//  Copyright © 1942 com.mac. All rights reserved.
//

import UIKit

class RejectionHistoryCell: UITableViewCell {

    @IBOutlet weak var lbl_RejectedLevel: UILabel!
    @IBOutlet weak var lbl_RejectedBy: UILabel!
    @IBOutlet weak var lbl_ReasonforRejection: UILabel!
    @IBOutlet weak var lbl_Description: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func Display_Cell(arr : [RejectReason] , indexPath : Int) {
        
        let Arr_Data = arr[indexPath]
        lbl_RejectedLevel.text = Arr_Data.rejectLevel
        lbl_RejectedBy.text = Arr_Data.rejectedBy
        lbl_ReasonforRejection.text = Arr_Data.reason
        lbl_Description.text = Arr_Data.rejectReasonDescription

    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
