//
//  IdentCodewiseReportCell.swift
//  report
//
//  Created by macbook on 09/07/1942 Saka.
//  Copyright © 1942 com.mac. All rights reserved.
//

import UIKit

class IdentCodewiseReportCell: UITableViewCell {

    @IBOutlet weak var lbl_Vendor: UILabel!
    @IBOutlet weak var lbl_PurchaseOrder: UILabel!
    @IBOutlet weak var lbl_ShortDescription: UILabel!
    @IBOutlet weak var lbl_IdentCode: UILabel!
    @IBOutlet weak var lbl_UOM: UILabel!
    @IBOutlet weak var lbl_POQuantitykg: UILabel!
    @IBOutlet weak var lbl_POValue€: UILabel!
    @IBOutlet weak var lbl_MBLQuantity: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    //MARK:- Display Cell
    func DisplayCell(Arr_Data :[IdentCodeResults],indexpath: IndexPath) {
        let Arr_Ident = Arr_Data[indexpath.row]
        print(Arr_Ident)
        self.lbl_Vendor.text = Arr_Ident.vendor!
        self.lbl_PurchaseOrder.text = Arr_Ident.po!
        self.lbl_ShortDescription.text = Arr_Ident.short_des!
        self.lbl_IdentCode.text = Arr_Ident.ident_code!
        self.lbl_UOM.text = Arr_Ident.uom!
        self.lbl_POQuantitykg.text = String(describing: Arr_Ident.po_qty!)
        self.lbl_POValue€.text = String(describing: Arr_Ident.po_value!)
        self.lbl_MBLQuantity.text = String(describing: Arr_Ident.mbl_qty!)
    }

}
class IdentCodewiseReportHeaderCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
class IdentCodewiseReportCell1: UITableViewCell {

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
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
     //MARK:- Display Cell
       func DisplayCell(Arr_Data :[IdentCodeResults],indexpath: IndexPath) {
        let Arr_Ident = Arr_Data[indexpath.row]
           print(Arr_Ident)
        self.lbl_PLQuantity.text = String(describing: Arr_Ident.pl_qty!)
        self.lbl_ReleasedQuantitykg.text = String(describing: Arr_Ident.released_qty!)
        self.lbl_ReleasedPieces.text = String(describing: Arr_Ident.released_pieces!)
        self.lbl_ReleasedValue€.text = String(describing: Arr_Ident.released_value!)
        self.lbl_ProgressQuantity.text = String(describing: Arr_Ident.progress_qty!)
        self.lbl_ProgressValue.text = String(describing: Arr_Ident.progress_value!)
       }

}
class IdentCodewiseReportHeaderCell1: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
