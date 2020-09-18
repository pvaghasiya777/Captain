//
//  MarkwiseReportcell.swift
//  report
//
//  Created by macbook on 17/06/1942 Saka.
//  Copyright © 1942 com.mac. All rights reserved.
//

import UIKit

class MarkwiseReportcell: UITableViewCell {
    //MARK:- IBOutlet
    @IBOutlet weak var lbl_StructureMWP: UILabel!
    @IBOutlet weak var lbl_Mark: UILabel!
    @IBOutlet weak var lbl_ProgressivePieceNumber: UILabel!
    @IBOutlet weak var lbl_TotalNumberofPieces: UILabel!
    @IBOutlet weak var lbl_PurchaseOrder: UILabel!
    @IBOutlet weak var lbl_Structure: UILabel!
    @IBOutlet weak var lbl_Description: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    //MARK:- Initialization
    func DisplayCell(Arr_Data : NSMutableArray,indexpath : IndexPath) {
        let Arr_MarkWiseReport = Arr_Data[indexpath.row] as! MarkWiseReportModel
        print(Arr_MarkWiseReport)
        self.lbl_Structure.text = Arr_MarkWiseReport.groupStructureName!
        self.lbl_Mark.text = Arr_MarkWiseReport.mark!
        self.lbl_ProgressivePieceNumber.text = String(describing: Arr_MarkWiseReport.progressivePieceNr!)
        self.lbl_TotalNumberofPieces.text = String(describing: Arr_MarkWiseReport.quantity!)
        self.lbl_PurchaseOrder.text = Arr_MarkWiseReport.purchaseId!
        self.lbl_Structure.text = Arr_MarkWiseReport.structureId!
        self.lbl_Description.text = Arr_MarkWiseReport.descriptionField!
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
class MarkwiseReportHeadercell: UITableViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}

//MARK:-  Markwise Report cell 1
class MarkwiseReportcell1: UITableViewCell {
    //MARK:- IBOutlet
    @IBOutlet weak var lbl_MBLRevision: UILabel!
    @IBOutlet weak var lbl_SIdentCode: UILabel!
    @IBOutlet weak var lbl_SWeightkg: UILabel!
    @IBOutlet weak var lbl_PIdentCode: UILabel!
    @IBOutlet weak var lbl_PWeightkg: UILabel!
    @IBOutlet weak var lbl_FIdentCode: UILabel!
    @IBOutlet weak var lbl_FWeightkg: UILabel!
    @IBOutlet weak var lbl_HeatCastNumber: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    //MARK:- Initialization
    func DisplayCell(Arr_Data : NSMutableArray,indexpath : IndexPath) {
        let Arr_MarkWiseReport = Arr_Data[indexpath.row] as! MarkWiseReportModel
        print(Arr_MarkWiseReport)
        self.lbl_MBLRevision.text = Arr_MarkWiseReport.revNo!
        self.lbl_SIdentCode.text = Arr_MarkWiseReport.markIdentCode!
        self.lbl_SWeightkg.text = (Arr_MarkWiseReport.markWeight != nil) ? String(describing: Arr_MarkWiseReport.markWeight!) : ""
        self.lbl_PIdentCode.text = String(describing: Arr_MarkWiseReport.paintIdentCode!)
        self.lbl_PWeightkg.text = (Arr_MarkWiseReport.paintingWeight != nil) ? String(describing: Arr_MarkWiseReport.paintingWeight!) : ""
        self.lbl_FIdentCode.text = Arr_MarkWiseReport.fireIdentCode!
        self.lbl_FWeightkg.text = (Arr_MarkWiseReport.fireproofingWeight != nil) ? String(describing: Arr_MarkWiseReport.fireproofingWeight!) : ""
        self.lbl_HeatCastNumber.text = Arr_MarkWiseReport.heatNo!
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
class MarkwiseReportHeadercell1: UITableViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
//MARK:-  Markwise Report cell 2
class MarkwiseReportcell2: UITableViewCell {
    //MARK:- IBOutlet
    @IBOutlet weak var lbl_MTCNumber: UILabel!
    @IBOutlet weak var lbl_PLNumber: UILabel!
    @IBOutlet weak var lbl_PLProgressiveNumber: UILabel!
    @IBOutlet weak var lbl_NetWeightkg: UILabel!
    @IBOutlet weak var lbl_PackageGrossWeightkg: UILabel!
    @IBOutlet weak var lbl_PackageVolumecm: UILabel!
    @IBOutlet weak var lbl_ShippedDate: UILabel!
    @IBOutlet weak var lbl_OnsiteDate: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        // Initialization code
    }
    //MARK:- Initialization
    func DisplayCell(Arr_Data : NSMutableArray,indexpath : IndexPath) {
        let Arr_MarkWiseReport = Arr_Data[indexpath.row] as! MarkWiseReportModel
        print(Arr_MarkWiseReport)
        self.lbl_MTCNumber.text = Arr_MarkWiseReport.mtcNo!
        self.lbl_PLNumber.text = Arr_MarkWiseReport.plName!
        self.lbl_PLProgressiveNumber.text = Arr_MarkWiseReport.progressive!
        self.lbl_NetWeightkg.text = (Arr_MarkWiseReport.netWeight != nil) ? String(describing: Arr_MarkWiseReport.netWeight!) : ""
        self.lbl_PackageGrossWeightkg.text = (Arr_MarkWiseReport.masterGrossWeight != nil) ? String(describing: Arr_MarkWiseReport.masterGrossWeight!) : ""
        self.lbl_PackageVolumecm.text = (Arr_MarkWiseReport.masterTotalVolume != nil) ? String(describing: Arr_MarkWiseReport.masterTotalVolume!) : ""
        self.lbl_ShippedDate.text = (Arr_MarkWiseReport.shippedDate != nil) ? Arr_MarkWiseReport.shippedDate! : "No Date"
        self.lbl_OnsiteDate.text = (Arr_MarkWiseReport.onsiteDate != nil) ? Arr_MarkWiseReport.onsiteDate! : "No Date"
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
class MarkwiseReportHeadercell2: UITableViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
