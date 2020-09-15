//
//  DRejectionHistoryCell.swift.swift
//  PromiseApiCall
//
//  Created by macbook on 21/05/1942 Saka.
//  Copyright © 1942 com.mac. All rights reserved.
//

import UIKit

class DRejectionHistoryCell: UITableViewCell {

    @IBOutlet weak var lbl_RejectedLevel: UILabel!
    @IBOutlet weak var lbl_RejectedBy: UILabel!
    @IBOutlet weak var lbl_ReasonforRejection: UILabel!
    @IBOutlet weak var lbl_Description: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func DisplayCell(arr : [Reject_reasons],indexPath : IndexPath) {
        let rowdata = arr[indexPath.row]
        lbl_RejectedLevel.text = rowdata.reject_level!
        lbl_RejectedBy.text = rowdata.rejected_by!
        lbl_ReasonforRejection.text = rowdata.reason!
        lbl_Description.text = rowdata.description!
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
