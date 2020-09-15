//
//  tblCustomDetailsCell.swift
//  Promise
//
//  Created by macbook on 07/05/1942 Saka.
//  Copyright © 1942 Captain. All rights reserved.
//

import UIKit

class tblCustomDetailsCell: UITableViewCell {
    @IBOutlet var lbl_PackageName: UILabel!
    @IBOutlet var lbl_KindofPackage: UILabel!
    @IBOutlet var lbl_Widthcm: UILabel!
    @IBOutlet var lbl_Lengthcm: UILabel!
    @IBOutlet var lbl_Heightcm: UILabel!
    @IBOutlet var lbl_GrossWeightkg: UILabel!
    @IBOutlet var lbl_NetWeightkg: UILabel!
    @IBOutlet var lbl_PLSequence: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
