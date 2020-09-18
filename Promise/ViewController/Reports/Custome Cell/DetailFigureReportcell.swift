//
//  DetailFigureReportcell.swift
//  report
//
//  Created by macbook on 17/06/1942 Saka.
//  Copyright © 1942 com.mac. All rights reserved.
//

import UIKit

class DetailFigureReportcell: UITableViewCell {
    
    @IBOutlet weak var lbl_SerialID: UILabel!
    @IBOutlet weak var lbl_StructureMWP: UILabel!
    @IBOutlet weak var lbl_Structure: UILabel!
    @IBOutlet weak var lbl_Lot: UILabel!
    @IBOutlet weak var lbl_MBLRevision: UILabel!
    @IBOutlet weak var lbl_TotalWeightkg: UILabel!
    @IBOutlet weak var lbl_TotalPieces: UILabel!
    @IBOutlet weak var lbl_ReleasedWeightkg: UILabel!
    @IBOutlet weak var lbl_ReleasedPieces: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    //MARK:- Initialization
    func DisplayCell(Arr_Data : [DetailFigureReportModel],indexpath : IndexPath) {
        let Arr_DetailReport = Arr_Data[0].results![indexpath.row]
        print(Arr_DetailReport)
        self.lbl_SerialID.text = String(describing: Arr_DetailReport.serialNo!)
        self.lbl_StructureMWP.text = Arr_DetailReport.groupStructureName!
        self.lbl_Structure.text = Arr_DetailReport.structureID!
        self.lbl_Lot.text = Arr_DetailReport.lot!
        self.lbl_MBLRevision.text = Arr_DetailReport.revNo!
        self.lbl_TotalWeightkg.text = String(describing: Arr_DetailReport.totalWeight!)
        self.lbl_TotalPieces.text = String(describing: Arr_DetailReport.totalPieces!)
        self.lbl_ReleasedWeightkg.text = String(describing: Arr_DetailReport.totalWeightReleased!)
        self.lbl_ReleasedPieces.text = String(describing: Arr_DetailReport.totalPiecesReleased!)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
class DetailFigureReportHeadercell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

// MARK: -  Detail Figure Report 1
class DetailFigureReportcell1: UITableViewCell {
    
    @IBOutlet weak var lbl_BalancePieces: UILabel!
    @IBOutlet weak var lbl_ExtraPieces: UILabel!
    @IBOutlet weak var lbl_BalanceWeightkg: UILabel!
    @IBOutlet weak var lbl_ProgressWeight: UILabel!
    @IBOutlet weak var lbl_ProgressPieces: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    //MARK:- Initialization
    func DisplayCell(Arr_Data : [DetailFigureReportModel],indexpath : IndexPath) {
        let Arr_DetailReport = Arr_Data[0].results![indexpath.row]
        print(Arr_DetailReport)
        self.lbl_BalancePieces.text = String(describing: Arr_DetailReport.balancePieces!)
        self.lbl_ExtraPieces.text = String(describing: Arr_DetailReport.extraPieces!)
        self.lbl_BalanceWeightkg.text = String(describing: Arr_DetailReport.balanceWeight!)
        self.lbl_ProgressWeight.text = String(describing: Arr_DetailReport.progressWeight!)
        self.lbl_ProgressPieces.text = String(describing: Arr_DetailReport.progressPiece!)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
class DetailFigureReportHeadercell1: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
