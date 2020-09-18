//
//  PackingListReportcell.swift
//  report
//
//  Created by macbook on 18/06/1942 Saka.
//  Copyright © 1942 com.mac. All rights reserved.
//

import UIKit

class PackingListReportcell: UITableViewCell {
    //MARK:- IBOutlet
    @IBOutlet weak var lbl_StructureMWP: UILabel!
    @IBOutlet weak var lbl_PLInput: UILabel!
    @IBOutlet weak var lbl_LoadingMap: UILabel!
    @IBOutlet weak var lbl_PLNumber: UILabel!
    @IBOutlet weak var lbl_ReleaseNote: UILabel!
    @IBOutlet weak var lbl_RNDate: UILabel!
    @IBOutlet weak var lbl_Structure: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    //MARK:-  Initialization
    func DisplayCell(Arr_Data :[PackingListReportModel],indexpath: IndexPath) {
        let Arr_PackingList = Arr_Data[0].results![indexpath.row]
        print(Arr_PackingList)
        self.lbl_StructureMWP.text = Arr_PackingList.struct_mwp!
        self.lbl_PLInput.text = Arr_PackingList.pl_input!
        self.lbl_LoadingMap.text = Arr_PackingList.loading_map!
        self.lbl_PLNumber.text = Arr_PackingList.pl_number!
        self.lbl_ReleaseNote.text = (Arr_PackingList.release_note != nil) ? Arr_PackingList.release_note! : ""
        self.lbl_RNDate.text = Arr_PackingList.rn_date!
        self.lbl_Structure.text = Arr_PackingList.structure!
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
class PackingListReportHeadercell: UITableViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
//MARK:- PackingListReportcell1
class PackingListReportcell1: UITableViewCell {
    //MARK:- IBOutlet
    @IBOutlet weak var lbl_Lot: UILabel!
    @IBOutlet weak var lbl_MBLRevision: UILabel!
    @IBOutlet weak var lbl_NetWeightkg: UILabel!
    @IBOutlet weak var lbl_GrossWeightkg: UILabel!
    @IBOutlet weak var lbl_MainSteelkg: UILabel!
    @IBOutlet weak var lbl_ChequeredPlateskg: UILabel!
    @IBOutlet weak var lbl_Gratingskg: UILabel!
    @IBOutlet weak var lbl_Handrailskg: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    //MARK:-  Initialization
    func DisplayCell(Arr_Data :[PackingListReportModel],indexpath: IndexPath) {
        let Arr_PackingList = Arr_Data[0].results![indexpath.row]
        print(Arr_PackingList)
        self.lbl_Lot.text = Arr_PackingList.lot!
        self.lbl_MBLRevision.text = Arr_PackingList.mbl_rev!
        self.lbl_NetWeightkg.text = String(describing: Arr_PackingList.net_weight!)
        self.lbl_GrossWeightkg.text = String(describing: Arr_PackingList.gross_weight!)
        self.lbl_MainSteelkg.text = String(describing: Arr_PackingList.i11329215!)
        self.lbl_ChequeredPlateskg.text = String(describing: Arr_PackingList.i11329218!)
        self.lbl_Gratingskg.text = String(describing: Arr_PackingList.i11329217!)
        self.lbl_Handrailskg.text = String(describing: Arr_PackingList.i11329219!)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
//MARK:- PackingListReportHeadercell1
class PackingListReportHeadercell1: UITableViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}

//MARK:- PackingListReportcell2
class PackingListReportcell2: UITableViewCell {
    //MARK:- IBOutlet
    @IBOutlet weak var lbl_Ladderskg: UILabel!
    @IBOutlet weak var lbl_SnowBarrierkg: UILabel!
    @IBOutlet weak var lbl_Fastenerskg: UILabel!
    @IBOutlet weak var lbl_PaintMisckg: UILabel!
    @IBOutlet weak var lbl_PaintingMainSteelkg: UILabel!
    @IBOutlet weak var lbl_Fireproofingkg: UILabel!
    @IBOutlet weak var lbl_KindOfPackage: UILabel!
    @IBOutlet weak var lbl_Volumecm: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    //MARK:-  Initialization
    func DisplayCell(Arr_Data :[PackingListReportModel],indexpath: IndexPath) {
        let Arr_PackingList = Arr_Data[0].results![indexpath.row]
        print(Arr_PackingList)
        self.lbl_Ladderskg.text = String(describing: Arr_PackingList.i11329220!)
        self.lbl_SnowBarrierkg.text = String(describing: Arr_PackingList.i11364508!)
        self.lbl_Fastenerskg.text = String(describing: Arr_PackingList.fasteners!)
        self.lbl_PaintMisckg.text = String(describing: Arr_PackingList.i11329222!)
        self.lbl_PaintingMainSteelkg.text = String(describing: Arr_PackingList.i11330947!)
        self.lbl_Fireproofingkg.text = String(describing: Arr_PackingList.i11330946!)
        self.lbl_KindOfPackage.text = Arr_PackingList.kind_of_package!
        self.lbl_Volumecm.text = String(describing: Arr_PackingList.volume!)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
//MARK:- PackingListReportHeadercell2
class PackingListReportHeadercell2: UITableViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
//MARK:- PackingListReportcell3
class PackingListReportcell3: UITableViewCell {
    //MARK:- IBOutlet
    @IBOutlet weak var lbl_ShippedDate: UILabel!
    @IBOutlet weak var lbl_PLWiseShippedStatus: UILabel!
    @IBOutlet weak var lbl_OnsiteDate: UILabel!
    @IBOutlet weak var lbl_PLWiseOnsiteStatus: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    //MARK:-  Initialization
    func DisplayCell(Arr_Data :[PackingListReportModel],indexpath: IndexPath) {
        let Arr_PackingList = Arr_Data[0].results![indexpath.row]
        print(Arr_PackingList)
        self.lbl_ShippedDate.text = (Arr_PackingList.shipped_date != nil) ? Arr_PackingList.shipped_date : ""
        self.lbl_PLWiseShippedStatus.text = Arr_PackingList.shipped_status!
        self.lbl_OnsiteDate.text = (Arr_PackingList.on_site_date != nil) ? Arr_PackingList.on_site_date : ""
        self.lbl_PLWiseOnsiteStatus.text = Arr_PackingList.on_site_status!
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
class PackingListReportHeadercell3: UITableViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
