//
//  PackingListsEditCell.swift
//  Promise
//
//  Created by macbook on 27/05/1942 Saka.
//  Copyright © 1942 Captain. All rights reserved.
//

import UIKit

class PackingListsEditCell: UITableViewCell {
    @IBOutlet weak var lbl_RejectedLevel: UILabel!
    @IBOutlet weak var lbl_RejectedBy: UILabel!
    @IBOutlet weak var lbl_ReasonforRejection: UILabel!
    @IBOutlet weak var lbl_Description: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func Display_Cell(Arr_Data : [PackinglistIDModel], indexPath: IndexPath) {
        let Arr_RejectReson = Arr_Data[0].reject_reasons![indexPath.row]
        print(Arr_RejectReson)
//        self.lbl_RejectedBy.text = Arr_RejectReson
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

class PackingListsEditHeaderCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
