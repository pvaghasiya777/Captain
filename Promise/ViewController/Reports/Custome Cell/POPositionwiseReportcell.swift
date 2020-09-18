//
//  POPositionwiseReportcell.swift
//  report
//
//  Created by macbook on 18/06/1942 Saka.
//  Copyright © 1942 com.mac. All rights reserved.
//

import UIKit

class POPositionwiseReportcell: UITableViewCell {
    //MARK:- IBOutlet
    @IBOutlet weak var lbl_Vendor: UILabel!
    @IBOutlet weak var lbl_PurchaseOrder: UILabel!
    @IBOutlet weak var lbl_ShortDescription: UILabel!
    @IBOutlet weak var lbl_POPosition: UILabel!
    @IBOutlet weak var lbl_IdentCode: UILabel!
    @IBOutlet weak var lbl_UOM: UILabel!
    @IBOutlet weak var lbl_POQuantitykg: UILabel!
    @IBOutlet weak var lbl_POValue€: UILabel!
    @IBOutlet weak var lbl_MBLQuantity: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    //MARK:- Display Cell
    func DisplayCell(Arr_Data :[POPositionWiseReportModel],indexpath: IndexPath) {
        let Arr_PoPosition = Arr_Data[0].results![indexpath.row]
        print(Arr_PoPosition)
        self.lbl_Vendor.text = Arr_PoPosition.vendor!
        self.lbl_PurchaseOrder.text = Arr_PoPosition.po!
        self.lbl_ShortDescription.text = Arr_PoPosition.short_des!
        self.lbl_POPosition.text = String(describing: Arr_PoPosition.po_position!)
        self.lbl_IdentCode.text = Arr_PoPosition.ident_code!
        self.lbl_UOM.text = Arr_PoPosition.uom!
        self.lbl_POQuantitykg.text = String(describing: Arr_PoPosition.po_qty!)
        self.lbl_POValue€.text = String(describing: Arr_PoPosition.po_value!)
        self.lbl_MBLQuantity.text = String(describing: Arr_PoPosition.mbl_qty!)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
class POPositionwiseReportHeadercell: UITableViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
//MARK:- PO Position wise Report cell 1
class POPositionwiseReportcell1: UITableViewCell {
    //MARK:- IBOutlet
    @IBOutlet weak var lbl_PLQuantity: UILabel!
    @IBOutlet weak var lbl_ReleasedQuantitykg: UILabel!
    @IBOutlet weak var lbl_ReleasedPieces: UILabel!
    @IBOutlet weak var lbl_ReleasedValue€: UILabel!
    @IBOutlet weak var lbl_ProgressQuantity: UILabel!
    @IBOutlet weak var lbl_ProgressValue: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    //MARK:- Display Cell
    func DisplayCell(Arr_Data :[POPositionWiseReportModel],indexpath: IndexPath) {
        let Arr_PoPosition = Arr_Data[0].results![indexpath.row]
        print(Arr_PoPosition)
        self.lbl_PLQuantity.text = String(describing: Arr_PoPosition.pl_qty!)
        self.lbl_ReleasedQuantitykg.text = String(describing: Arr_PoPosition.released_qty!)
        self.lbl_ReleasedPieces.text = String(describing: Arr_PoPosition.released_pieces!)
        self.lbl_ReleasedValue€.text = String(describing: Arr_PoPosition.released_value!)
        self.lbl_ProgressQuantity.text = String(describing: Arr_PoPosition.progress_qty!)
        self.lbl_ProgressValue.text = String(describing: Arr_PoPosition.progress_value!)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
class POPositionwiseReportHeadercell1: UITableViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
