//
//  PL_PackageDetailsCell.swift
//  Promise
//
//  Created by Captain on 18/08/20.
//  Copyright © 2020 Captain. All rights reserved.
//

import UIKit

class PL_PackageDetailsCell: UITableViewCell {
    
    @IBOutlet var lbl_PackageName: UILabel!
    @IBOutlet var lbl_KindofPackage: UILabel!
    @IBOutlet var lbl_Length: UILabel!
    @IBOutlet var lbl_Width: UILabel!
    @IBOutlet var lbl_Height: UILabel!
    @IBOutlet var lbl_GrossWeight: UILabel!
    @IBOutlet var lbl_NetWeight: UILabel!
    @IBOutlet var lbl_PLSeq: UILabel!
    @IBOutlet weak var btn_view: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func Display_Cell(viewController : PLinputDetails , indexPath : IndexPath) {
        let cellIndex = viewController.startIndex + indexPath.row
        let Arr_Data = viewController.Arr_PLDetail[0].inputMasterIDS![cellIndex]
        let KOP = DEFAULTS.Get_MasterKindOfPackage().filter {$0.id! == Arr_Data.packageID!}
        self.lbl_PackageName.text = String(describing: Arr_Data.package!)
        self.lbl_KindofPackage.text = KOP[0].name!
        self.lbl_Length.text = Arr_Data.length!
        self.lbl_Width.text = Arr_Data.width!
        self.lbl_Height.text = Arr_Data.height!
        self.lbl_GrossWeight.text = Arr_Data.grossWeight!
        self.lbl_NetWeight.text =  Arr_Data.netWeight!
        self.lbl_PLSeq.text = Arr_Data.plSequence!
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
