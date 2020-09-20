//
//  AddedItemsCell.swift
//  report
//
//  Created by macbook on 05/06/1942 Saka.
//  Copyright © 1942 com.mac. All rights reserved.
//

import UIKit

class AddedItemsCell: UITableViewCell {
    //MARK:- IBOutlet
    @IBOutlet var lbl_Mark: UILabel!
    @IBOutlet var lbl_AvailableQuantity: UILabel!
    @IBOutlet var txt_QuantityToModify: UITextField!
    @IBOutlet var lbl_PLQuantity: UILabel!
    @IBOutlet var txt_ExcessQuantity: UITextField!
    @IBOutlet var txt_MTCNumber: UITextField!
    @IBOutlet var txt_Heat_CastNumber: UITextField!
    @IBOutlet var lbl_MarkUnitWeightkg: UILabel!
    @IBOutlet var lbl_NetWeightkg: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        Utils.EnableTextField(textFields: [txt_QuantityToModify,txt_ExcessQuantity,txt_MTCNumber,txt_Heat_CastNumber])
    }
    func DisplayCell(Arr_Data : [PlreportDetailModel],indexpath : IndexPath){
        let Arr_SingleData = Arr_Data[0].inputMasterIDS![0].inputSingleIDS![indexpath.row]
        self.lbl_Mark.text = Arr_SingleData.mark! ?? ""
        self.lbl_NetWeightkg.text = Arr_SingleData.netWeight!
        self.lbl_PLQuantity.text = String(describing: Arr_SingleData.marksQty!)
        self.txt_Heat_CastNumber.text = Arr_SingleData.heatNo!
//        self.txt_QuantityToModify.text =
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
class AddedItemsHeaderCell: UITableViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
