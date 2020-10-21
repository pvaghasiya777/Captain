//
//  PurchaseOrderCell.swift
//  Promise
//
//  Created by macbook on 09/05/1942 Saka.
//  Copyright © 1942 Captain. All rights reserved.
//

import UIKit

class PurchaseOrderCell: UITableViewCell {
    //MARK:- IBOutlet
    @IBOutlet var lbl_POamd: UILabel!
    @IBOutlet var lbl_POPosition: UILabel!
    @IBOutlet var lbl_Item: UILabel!
    @IBOutlet var lbl_Description: UILabel!
    @IBOutlet var lbl_IdentCode: UILabel!
    @IBOutlet var lbl_CommodityCode: UILabel!
    @IBOutlet var lbl_Quantity: UILabel!
    @IBOutlet var lbl_UnitofMeasure: UILabel!
    @IBOutlet var lbl_UnitPrice: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    //MARK:- Data Display Cell
    func DisplayCell(Arr_Data : [SingleMasterPurchaseModel],indexpath : IndexPath,viewController : PurchaseOrderVC) {
        let cellIndex = viewController.startIndex + indexpath.row
        let Arr_PurchaseData = Arr_Data[0].purchase_lines![cellIndex]
        print(Arr_PurchaseData)
        self.lbl_POamd.text = Arr_PurchaseData.amendment!
        self.lbl_POPosition.text = String(describing: Arr_PurchaseData.po_position!)
        self.lbl_Item.text = Arr_PurchaseData.item!
        self.lbl_Description.text = Arr_PurchaseData.description!
        self.lbl_IdentCode.text = Arr_PurchaseData.ident_code!
        self.lbl_CommodityCode.text = Arr_PurchaseData.commodity_code!
        self.lbl_Quantity.text = Arr_PurchaseData.quantity!
        self.lbl_UnitofMeasure.text = Arr_PurchaseData.units_of_measure!
        self.lbl_UnitPrice.text = Arr_PurchaseData.unit_price!
    }
}
