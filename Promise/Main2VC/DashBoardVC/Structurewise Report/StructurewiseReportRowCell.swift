//
//  StructurewiseReportRowCell.swift
//  Promise
//
//  Created by macbook on 10/08/1942 Saka.
//  Copyright © 1942 Captain. All rights reserved.
//

import UIKit

class StructurewiseReportRowCell: UITableViewCell {
    //MARK:- IBOutlet
    //view 1
    @IBOutlet weak var lbl_SerialID: UILabel!
    @IBOutlet weak var lbl_Vendor: UILabel!
    @IBOutlet weak var lbl_PurchaseOrder: UILabel!
    @IBOutlet weak var lbl_StructureMWP: UILabel!
    @IBOutlet weak var lbl_Structure: UILabel!
    @IBOutlet weak var lbl_Lot: UILabel!
    @IBOutlet weak var lbl_MBLRevision: UILabel!
    @IBOutlet weak var lbl_StructureWeightWithoutFastenerskg: UILabel!
    //view 2
    @IBOutlet weak var lbl_MFastenersWeightkg: UILabel!
    @IBOutlet weak var lbl_MTotalWeightkg: UILabel!
    @IBOutlet weak var lbl_MReleasedWeightkg: UILabel!
    @IBOutlet weak var lbl_MProgressWeight: UILabel!
    @IBOutlet weak var lbl_HTotalWeightkg: UILabel!
    @IBOutlet weak var lbl_HReleasedWeightkg: UILabel!
    @IBOutlet weak var lbl_HProgressWeight: UILabel!
    //view 3
    @IBOutlet weak var lbl_BReleasedWeight: UILabel!
    @IBOutlet weak var lbl_TotalPieces: UILabel!
    @IBOutlet weak var lbl_ReleasedPieces: UILabel!
    @IBOutlet weak var lbl_BProgressPieces: UILabel!
    @IBOutlet weak var lbl_ProgressWeight: UILabel!
    @IBOutlet weak var lbl_OProgressPieces: UILabel!
    @IBOutlet weak var lbl_TotalNoofPiecesasperMBL: UILabel!
    //view 4
    @IBOutlet weak var lbl_OReleasedPieces: UILabel!
    @IBOutlet weak var lbl_ReleasedBalancePieces: UILabel!
    @IBOutlet weak var lbl_ReleasedExtraPieces: UILabel!
    @IBOutlet weak var lbl_ReleasedExtraWeightkg: UILabel!
    @IBOutlet weak var lbl_ReleasedBalanceWeightkg: UILabel!
    @IBOutlet weak var lbl_LastRNDate: UILabel!
    @IBOutlet weak var lbl_ReleaseStatus: UILabel!
    //view 5
    @IBOutlet weak var lbl_ShippedWeightkg: UILabel!
    @IBOutlet weak var lbl_ShippedPieces: UILabel!
    @IBOutlet weak var lbl_ShippedWeightProgress: UILabel!
    @IBOutlet weak var lbl_ShippedPiecesProgress: UILabel!
    @IBOutlet weak var lbl_OnsiteWeightkg: UILabel!
    @IBOutlet weak var lbl_OnsitePieces: UILabel!
    @IBOutlet weak var lbl_OnsiteWeightProgress: UILabel!
    @IBOutlet weak var lbl_OnsitePiecesProgress: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    //MARK:- Display Cell
    func DisplayCell(Arr_Data :NSMutableArray,indexpath: IndexPath) {
        let Arr_StrucherReport = Arr_Data[indexpath.row] as! StrucherWiseReportModel
        self.lbl_SerialID.text = String(describing: Arr_StrucherReport.serialNo!)
        self.lbl_Vendor.text = Arr_StrucherReport.vendorName!
        self.lbl_PurchaseOrder.text = Arr_StrucherReport.purchaseId!
        self.lbl_StructureMWP.text = Arr_StrucherReport.groupStructureName!
        self.lbl_Structure.text = Arr_StrucherReport.structureId!
        self.lbl_Lot.text = Arr_StrucherReport.lot!
        self.lbl_MBLRevision.text = Arr_StrucherReport.revNo!
        self.lbl_StructureWeightWithoutFastenerskg.text = (Arr_StrucherReport.steelWeight != nil) ? String(describing: Arr_StrucherReport.steelWeight!) : ""
        self.lbl_MFastenersWeightkg.text = (Arr_StrucherReport.boltWeight != nil) ? String(describing: Arr_StrucherReport.boltWeight!) : ""
        self.lbl_MTotalWeightkg.text = (Arr_StrucherReport.mainSteelWeight != nil) ? String(describing: Arr_StrucherReport.mainSteelWeight!) :"0.0"
        self.lbl_MReleasedWeightkg.text = (Arr_StrucherReport.mainReleasedWeight != nil) ? String(describing: Arr_StrucherReport.mainReleasedWeight!) : "0.0"
        self.lbl_MProgressWeight.text = (Arr_StrucherReport.mainProgressWeight != nil) ? String(describing: Double(Arr_StrucherReport.mainProgressWeight!)) : "0.0"
        self.lbl_HTotalWeightkg.text = (Arr_StrucherReport.othersSteelWeight != nil) ? String(describing: Arr_StrucherReport.othersSteelWeight!) : "0.0"
        self.lbl_HReleasedWeightkg.text = String(describing: Arr_StrucherReport.othersReleasedWeight!)
        self.lbl_HProgressWeight.text = (Arr_StrucherReport.othersSteelWeight != nil) ? String(describing: Arr_StrucherReport.othersSteelWeight!) : "0.0"
        self.lbl_BReleasedWeight.text = (Arr_StrucherReport.boltWeight != nil) ? String(describing: Arr_StrucherReport.boltWeight) : ""
        self.lbl_TotalPieces.text = String(describing: Arr_StrucherReport.boltPieces!)
        self.lbl_ReleasedPieces.text = String(describing: Arr_StrucherReport.boltPiecesReleased!)
        self.lbl_BProgressPieces.text = String(describing: Arr_StrucherReport.boltPieceProgress!)
        self.lbl_ProgressWeight.text = (Arr_StrucherReport.overallProgressWeight != nil) ? String(describing: Arr_StrucherReport.overallProgressWeight!) : "0.0"
        self.lbl_OProgressPieces.text = (Arr_StrucherReport.overallProgressPiece != nil) ? String(describing: Arr_StrucherReport.overallProgressPiece!) : "0.0"
        self.lbl_TotalNoofPiecesasperMBL.text = String(describing: Arr_StrucherReport.totalPieces!)
        self.lbl_OReleasedPieces.text = (Arr_StrucherReport.overallProgressPiece != nil) ? String(describing: Arr_StrucherReport.overallProgressPiece!) : "0.0"
        self.lbl_ReleasedBalancePieces.text = String(describing: Arr_StrucherReport.overallPiecesReleased!)
        self.lbl_ReleasedExtraPieces.text = String(describing: Arr_StrucherReport.extraPiecesReleased!)
        self.lbl_ReleasedExtraWeightkg.text = String(describing: Arr_StrucherReport.extraWeightReleased!)
        self.lbl_ReleasedBalanceWeightkg.text = (Arr_StrucherReport.balanceWeight != nil) ? String(describing: Arr_StrucherReport.balanceWeight!) : "0.0"
        self.lbl_LastRNDate.text = Arr_StrucherReport.releasedDate!
        self.lbl_ReleaseStatus.text = Arr_StrucherReport.releasedStatus!
        self.lbl_ShippedWeightkg.text = (Arr_StrucherReport.shippedWeight != nil) ? String(describing: Arr_StrucherReport.shippedWeight!) : ""
        self.lbl_ShippedPieces.text = String(describing: Arr_StrucherReport.shippedPieces!)
        self.lbl_ShippedPiecesProgress.text = (Arr_StrucherReport.shippedProgressPiece != nil) ? String(describing: Arr_StrucherReport.shippedProgressPiece!) : ""
        self.lbl_ShippedWeightProgress.text = (Arr_StrucherReport.shippedProgressWeight != nil) ? String(describing: Arr_StrucherReport.shippedProgressWeight!) : ""
        self.lbl_OnsiteWeightkg.text = (Arr_StrucherReport.onsiteWeight != nil) ? String(describing: Arr_StrucherReport.onsiteWeight!) : ""
        self.lbl_OnsitePieces.text = String(describing: Arr_StrucherReport.onsitePieces!)
        self.lbl_OnsiteWeightProgress.text = String(describing: Arr_StrucherReport.onsiteProgressWeight!)
        self.lbl_OnsitePiecesProgress.text = String(describing: Arr_StrucherReport.onsiteProgressPiece!)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
