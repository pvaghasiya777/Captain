//
//  GroupStructurewiseReportcell.swift
//  report
//
//  Created by macbook on 21/06/1942 Saka.
//  Copyright © 1942 com.mac. All rights reserved.
//

import UIKit

class GroupStructurewiseReportcell: UITableViewCell {
    @IBOutlet weak var lbl_SerialID: UILabel!
    @IBOutlet weak var lbl_Vendor: UILabel!
    @IBOutlet weak var lbl_PurchaseOrder: UILabel!
    @IBOutlet weak var lbl_StructureMWP: UILabel!
    @IBOutlet weak var lbl_Structure: UILabel!
    @IBOutlet weak var lbl_PackageDenominator: UILabel!
    @IBOutlet weak var lbl_StructureWeightWithoutFastenerskg: UILabel!
    @IBOutlet weak var lbl_FastenersWeightkg: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func DisplayCell(Arr_Data :[GroupStrucherWiseReportModel],indexpath: IndexPath) {
        let Arr_GroupSReport = Arr_Data[0].groupresults![indexpath.row]
        print(Arr_GroupSReport)
        self.lbl_SerialID.text = String(describing: Arr_GroupSReport.serialNo!)
        self.lbl_Vendor.text = Arr_GroupSReport.vendorName!
        self.lbl_PurchaseOrder.text = Arr_GroupSReport.purchaseID!
        self.lbl_StructureMWP.text = String(describing: Arr_GroupSReport.groupStructureName!)
        self.lbl_Structure.text = Arr_GroupSReport.structureID!
        self.lbl_PackageDenominator.text = String(describing: Arr_GroupSReport.masterPackageCount!)
        self.lbl_StructureWeightWithoutFastenerskg.text = String(describing: Arr_GroupSReport.steelWeight!)
        self.lbl_FastenersWeightkg.text = String(describing: Arr_GroupSReport.boltWeight!)
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
class GroupStructurewiseReportHeadercell: UITableViewCell {
    
        override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
class GroupStructurewiseReportcell1: UITableViewCell {
    @IBOutlet weak var lbl_MTotalWeightkg: UILabel!
    @IBOutlet weak var lbl_MReleasedWeightkg: UILabel!
    @IBOutlet weak var lbl_MProgressWeightkg: UILabel!
    @IBOutlet weak var lbl_HTotalWeightkg: UILabel!
    @IBOutlet weak var lbl_HReleasedWeightkg: UILabel!
    @IBOutlet weak var lbl_HProgressWeightkg: UILabel!
    @IBOutlet weak var lbl_BReleasedWeight: UILabel!
    @IBOutlet weak var lbl_BTotalPieces: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func DisplayCell(Arr_Data :[GroupStrucherWiseReportModel],indexpath: IndexPath) {
        let Arr_GroupSReport = Arr_Data[0].groupresults![indexpath.row]
        print(Arr_GroupSReport)
        self.lbl_MTotalWeightkg.text = String(describing: Arr_GroupSReport.mainSteelWeight!)
        self.lbl_MReleasedWeightkg.text = String(describing: Arr_GroupSReport.mainReleasedWeight!)
        self.lbl_MProgressWeightkg.text = String(describing: Arr_GroupSReport.mainProgressWeight!)
        self.lbl_HTotalWeightkg.text = String(describing: Arr_GroupSReport.othersSteelWeight!)
        self.lbl_HReleasedWeightkg.text = String(describing: Arr_GroupSReport.othersReleasedWeight!)
        self.lbl_HProgressWeightkg.text = String(describing: Arr_GroupSReport.othersProgressWeight!)
        self.lbl_BReleasedWeight.text = String(describing: Arr_GroupSReport.boltWeightReleased!)
        self.lbl_BTotalPieces.text = String(describing: Arr_GroupSReport.boltPieces!)
        
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
class GroupStructurewiseReportHeadercell1: UITableViewCell {
        override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
class GroupStructurewiseReportcell2: UITableViewCell {
    @IBOutlet weak var lbl_BReleasedPieces: UILabel!
    @IBOutlet weak var lbl_BProgressPieces: UILabel!
    @IBOutlet weak var lbl_OProgressWeight: UILabel!
    @IBOutlet weak var lbl_OProgressPieces: UILabel!
    @IBOutlet weak var lbl_TotalNoofPiecesasperMBL: UILabel!
    @IBOutlet weak var lbl_OReleasedPieces: UILabel!
    @IBOutlet weak var lbl_ReleasedBalancePieces: UILabel!
    @IBOutlet weak var lbl_ReleasedExtraPieces: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func DisplayCell(Arr_Data :[GroupStrucherWiseReportModel],indexpath: IndexPath) {
        let Arr_GroupSReport = Arr_Data[0].groupresults![indexpath.row]
        print(Arr_GroupSReport)
        self.lbl_BReleasedPieces.text = String(describing: Arr_GroupSReport.boltPiecesReleased!)
        self.lbl_BProgressPieces.text = String(describing: Arr_GroupSReport.boltPieceProgress!)
        self.lbl_OProgressWeight.text = String(describing: Arr_GroupSReport.overallProgressWeight!)
        self.lbl_OProgressPieces.text = String(describing: Arr_GroupSReport.overallProgressPiece!)
        self.lbl_TotalNoofPiecesasperMBL.text = String(describing: Arr_GroupSReport.totalPieces!)
        self.lbl_OReleasedPieces.text = String(describing: Arr_GroupSReport.overallPiecesReleased!)
        self.lbl_ReleasedBalancePieces.text = String(describing: Arr_GroupSReport.balancePieces!)
        self.lbl_ReleasedExtraPieces.text = String(describing: Arr_GroupSReport.extraPiecesReleased!)
        
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
class GroupStructurewiseReportHeadercell2: UITableViewCell {
        override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
class GroupStructurewiseReportcell3: UITableViewCell {
    @IBOutlet weak var lbl_ReleasedExtraWeightkg: UILabel!
    @IBOutlet weak var lbl_ReleasedBalanceWeightkg: UILabel!
    @IBOutlet weak var lbl_OLastRNDate: UILabel!
    @IBOutlet weak var lbl_ReleaseStatus: UILabel!
    @IBOutlet weak var lbl_ShippedWeightWithoutFastenerskg: UILabel!
    @IBOutlet weak var lbl_ShippedPiecesWithoutFastenerspcs: UILabel!
    @IBOutlet weak var lbl_ShippedWeightProgressWithoutFasteners: UILabel!
    @IBOutlet weak var lbl_ShippedPiecesProgressWithoutFasteners: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func DisplayCell(Arr_Data :[GroupStrucherWiseReportModel],indexpath: IndexPath) {
        let Arr_GroupSReport = Arr_Data[0].groupresults![indexpath.row]
        print(Arr_GroupSReport)
        self.lbl_ReleasedExtraWeightkg.text = String(describing: Arr_GroupSReport.extraWeightReleased!)
        self.lbl_ReleasedBalanceWeightkg.text = String(describing: Arr_GroupSReport.balanceWeight!)
        self.lbl_OLastRNDate.text = String(describing: Arr_GroupSReport.releasedDate!)
        self.lbl_ReleaseStatus.text = Arr_GroupSReport.releasedStatus!
        self.lbl_ShippedWeightWithoutFastenerskg.text = String(describing: Arr_GroupSReport.shippedFastnerWeight!)
            self.lbl_ShippedPiecesWithoutFastenerspcs.text = String(describing: Arr_GroupSReport.shippedFastnerPieces!)
            self.lbl_ShippedWeightProgressWithoutFasteners.text = String(describing: Arr_GroupSReport.shippedProgressWeight!)
        self.lbl_ShippedPiecesProgressWithoutFasteners.text = String(describing: Arr_GroupSReport.shippedProgressPiece!)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
class GroupStructurewiseReportHeadercell3: UITableViewCell {
        override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
class GroupStructurewiseReportcell4: UITableViewCell {
    @IBOutlet weak var lbl_ShippedFastenerskg: UILabel!
    @IBOutlet weak var lbl_ShippedFastenerspcs: UILabel!
    @IBOutlet weak var lbl_ShippedFastenersprogress: UILabel!
    @IBOutlet weak var lbl_ShippedPackages: UILabel!
    @IBOutlet weak var lbl_ShippedStatus: UILabel!
    @IBOutlet weak var lbl_OnsiteWeightWithoutFastenerskg: UILabel!
    @IBOutlet weak var lbl_OnsitePiecesWithoutFastenerspcs: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func DisplayCell(Arr_Data :[GroupStrucherWiseReportModel],indexpath: IndexPath) {
        let Arr_GroupSReport = Arr_Data[0].groupresults![indexpath.row]
        print(Arr_GroupSReport)
        self.lbl_ShippedFastenerskg.text = String(describing: Arr_GroupSReport.shippedFastnerPieces!)
        self.lbl_ShippedFastenersprogress.text = String(describing: Arr_GroupSReport.shippedFastnerProgressPiece!)
        self.lbl_ShippedFastenerspcs.text = String(describing: Arr_GroupSReport.shippedFastnerProgressPiece!)
        self.lbl_ShippedPackages.text = String(describing: Arr_GroupSReport.shippedPieces!)
        self.lbl_ShippedStatus.text = Arr_GroupSReport.shippedStatus!
        self.lbl_OnsiteWeightWithoutFastenerskg.text = String(describing: Arr_GroupSReport.onsiteFastnerWeight!)
        self.lbl_OnsitePiecesWithoutFastenerspcs.text = String(describing: Arr_GroupSReport.onsiteFastnerPieces!)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
class GroupStructurewiseReportHeadercell4: UITableViewCell {
    
        override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
class GroupStructurewiseReportcell5: UITableViewCell {
    @IBOutlet weak var lbl_OnsiteWeightProgressWithoutFasteners: UILabel!
    @IBOutlet weak var lbl_OnsitePiecesProgressWithoutFasteners: UILabel!
    @IBOutlet weak var lbl_OnsiteFastenerskg: UILabel!
    @IBOutlet weak var lbl_OnsiteFastenerspcs: UILabel!
    @IBOutlet weak var lbl_OnsiteFastenersprogress: UILabel!
    @IBOutlet weak var lbl_OnsitePackages: UILabel!
    @IBOutlet weak var lbl_OnsiteStatus: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func DisplayCell(Arr_Data :[GroupStrucherWiseReportModel],indexpath: IndexPath) {
        let Arr_GroupSReport = Arr_Data[0].groupresults![indexpath.row]
        print(Arr_GroupSReport)
        self.lbl_OnsiteWeightProgressWithoutFasteners.text = String(describing: Arr_GroupSReport.onsiteFastnerWeight!)
        self.lbl_OnsitePiecesProgressWithoutFasteners.text = String(describing: Arr_GroupSReport.onsitePieces!)
        self.lbl_OnsiteFastenerskg.text = String(describing: Arr_GroupSReport.onsiteFastnerWeight!)
        self.lbl_OnsiteFastenerspcs.text = String(describing: Arr_GroupSReport.onsiteFastnerPieces!)
        self.lbl_OnsiteFastenersprogress.text = String(describing: Arr_GroupSReport.onsiteFastnerProgressPiece!)
        self.lbl_OnsitePackages.text = String(describing: Arr_GroupSReport.onsitePieces!)
        self.lbl_OnsiteStatus.text = Arr_GroupSReport.onsiteStatus!        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
class GroupStructurewiseReportHeadercell5: UITableViewCell {
    
    
        override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
