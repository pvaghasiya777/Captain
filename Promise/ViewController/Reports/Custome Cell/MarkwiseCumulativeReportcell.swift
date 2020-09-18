//
//  MarkwiseCumulativeReportcell.swift
//  report
//
//  Created by macbook on 17/06/1942 Saka.
//  Copyright © 1942 com.mac. All rights reserved.
//

import UIKit
//MARK:-  Markwise Cumulative Report cell
class MarkwiseCumulativeReportcell: UITableViewCell {
    //MARK:- IBOutlet
    @IBOutlet weak var lbl_StructureMWP: UILabel!
    @IBOutlet weak var lbl_Mark: UILabel!
    @IBOutlet weak var lbl_NumberOfReleasedPieces: UILabel!
    @IBOutlet weak var lbl_PurchaseOrder: UILabel!
    @IBOutlet weak var lbl_Structure: UILabel!
    @IBOutlet weak var lbl_Description: UILabel!
    @IBOutlet weak var lbl_MBLRevision: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    //MARK:- Initialization
    func DisplayCell(Arr_Data : [MarkWiseCumulativeReportModel],indexpath : IndexPath) {
        let Arr_MarkCommReport = Arr_Data[0].results![indexpath.row]
        print(Arr_MarkCommReport)
        self.lbl_StructureMWP.text = Arr_MarkCommReport.group_structure_name!
        self.lbl_Mark.text = Arr_MarkCommReport.mark!
        self.lbl_NumberOfReleasedPieces.text = String(describing: Arr_MarkCommReport.quantity!)
        self.lbl_PurchaseOrder.text = Arr_MarkCommReport.purchase_id!
        self.lbl_Structure.text = Arr_MarkCommReport.structure_id!
        self.lbl_Description.text = Arr_MarkCommReport.pl_desc!
        self.lbl_MBLRevision.text = Arr_MarkCommReport.rev_no!
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
class MarkwiseCumulativeReportHeadercell: UITableViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
//MARK:-  Markwise Cumulative Report cell 1
class MarkwiseCumulativeReportcell1: UITableViewCell {
    //MARK:- IBOutlet
    @IBOutlet weak var lbl_SIdentCode: UILabel!
    @IBOutlet weak var lbl_SWeightkg: UILabel!
    @IBOutlet weak var lbl_PIdentCode: UILabel!
    @IBOutlet weak var lbl_PWeightkg: UILabel!
    @IBOutlet weak var lbl_FIdentCode: UILabel!
    @IBOutlet weak var lbl_FWeightkg: UILabel!
    @IBOutlet weak var lbl_HeatCastNumber: UILabel!
    @IBOutlet weak var lbl_MTCNumber: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    //MARK:- Initialization
    func DisplayCell(Arr_Data : [MarkWiseCumulativeReportModel],indexpath : IndexPath) {
        let Arr_MarkCommReport = Arr_Data[0].results![indexpath.row]
        print(Arr_MarkCommReport)
        self.lbl_SIdentCode.text = Arr_MarkCommReport.mark_ident_code!
        self.lbl_SWeightkg.text = Arr_MarkCommReport.net_weight!
        self.lbl_PIdentCode.text = Arr_MarkCommReport.paint_ident_code!
        self.lbl_PWeightkg.text = String(describing: Arr_MarkCommReport.painting_weight!)
        self.lbl_FIdentCode.text = Arr_MarkCommReport.fire_ident_code!
        self.lbl_FWeightkg.text =  String(describing: Arr_MarkCommReport.fire_weight!)
        self.lbl_HeatCastNumber.text = Arr_MarkCommReport.heat_no!
        self.lbl_MTCNumber.text = Arr_MarkCommReport.mtc_no!
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
class MarkwiseCumulativeReportHeadercell1: UITableViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
//MARK:-  Markwise Cumulative Report cell 2
class MarkwiseCumulativeReportcell2: UITableViewCell {
    //MARK:- IBOutlet
    @IBOutlet weak var lbl_PLNumber: UILabel!
    @IBOutlet weak var lbl_PLProgressiveNumber: UILabel!
    @IBOutlet weak var lbl_NetWeightkg: UILabel!
    @IBOutlet weak var lbl_PackageGrossWeightkg: UILabel!
    @IBOutlet weak var lbl_PackageVolumecm: UILabel!
    @IBOutlet weak var lbl_ShippedDate: UILabel!
    @IBOutlet weak var lbl_OnsiteDate: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    //MARK:- Initialization
    func DisplayCell(Arr_Data : [MarkWiseCumulativeReportModel],indexpath : IndexPath) {
        let Arr_MarkCommReport = Arr_Data[0].results![indexpath.row]
        print(Arr_MarkCommReport)
        self.lbl_PLNumber.text = Arr_MarkCommReport.pl_name!
        self.lbl_PLProgressiveNumber.text = Arr_MarkCommReport.progressive!
        self.lbl_NetWeightkg.text = Arr_MarkCommReport.net_weight!
        self.lbl_PackageGrossWeightkg.text = Arr_MarkCommReport.master_gross_weight!
        self.lbl_PackageVolumecm.text = Arr_MarkCommReport.master_total_volume!
        self.lbl_ShippedDate.text = (Arr_MarkCommReport.shipped_date != nil) ? Arr_MarkCommReport.shipped_date! : "No Date"
        self.lbl_OnsiteDate.text = (Arr_MarkCommReport.shipped_date != nil) ? Arr_MarkCommReport.onsite_date! : "No Date"
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
class MarkwiseCumulativeReportHeadercell12: UITableViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
