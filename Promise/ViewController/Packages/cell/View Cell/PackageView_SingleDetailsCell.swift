//
//  PackageView_SingleDetailsCell.swift
//  Promise
//
//  Created by macbook on 13/06/1942 Saka.
//  Copyright © 1942 Captain. All rights reserved.
//

import UIKit

class PackageView_SingleDetailsCell: UITableViewCell {
    //MARK:- IBOutlet
    @IBOutlet weak var lbl_PackageName: UILabel!
    @IBOutlet weak var lbl_Mark: UILabel!
    @IBOutlet weak var lbl_Quantity: UILabel!
    @IBOutlet weak var lbl_MTCNumber: UILabel!
    @IBOutlet weak var lbl_HeatCastNumber: UILabel!
    @IBOutlet weak var lbl_NetWeightkg: UILabel!
    @IBOutlet weak var lbl_ExtraQuantity: UILabel!
    //MARK:- Variable
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    //MARK:- Display Cell
    func DisplayCell(ViewController : PlinputViewVC ,indexPath : IndexPath) {
        let cellIndex = ViewController.startIndex + indexPath.row
        let Arr_SingleInputData = ViewController.Arr_SingleDetail[cellIndex]
        self.lbl_PackageName.text = String(describing: Arr_SingleInputData.package!)
        self.lbl_Mark.text = Arr_SingleInputData.mark!
        self.lbl_Quantity.text = String(describing: Arr_SingleInputData.marksQty!)
        self.lbl_MTCNumber.text = Arr_SingleInputData.mtcNo!
        self.lbl_HeatCastNumber.text = Arr_SingleInputData.heatNo!
        self.lbl_NetWeightkg.text = Arr_SingleInputData.netWeight!
        self.lbl_ExtraQuantity.text = String(describing: Arr_SingleInputData.excessQuantity!)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
//MARK:- Single Detail Header Cell
class PackageView_SingleDetailsHeaderCell: UITableViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
