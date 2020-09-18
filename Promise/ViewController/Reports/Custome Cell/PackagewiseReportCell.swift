//
//  PackagewiseReportCell.swift
//  report
//
//  Created by macbook on 17/06/1942 Saka.
//  Copyright © 1942 com.mac. All rights reserved.
//

import UIKit

class PackagewiseReportCell: UITableViewCell {
    //MARK:- IBOutlet
    @IBOutlet weak var lbl_Vendor: UILabel!
    @IBOutlet weak var lbl_PurchaseOrder: UILabel!
    @IBOutlet weak var lbl_StructureMWP: UILabel!
    @IBOutlet weak var lbl_PackingList: UILabel!
    @IBOutlet weak var lbl_Package_Progressive: UILabel!
    @IBOutlet weak var lbl_PackageDenominator: UILabel!
    @IBOutlet weak var lbl_VendorPackageID: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    //MARK:-  Initialization
    func DisplayCell(Arr_Data :[packageWiseReportModel],indexpath: IndexPath) {
        let Arr_PackageWiseReport = Arr_Data[0].results![indexpath.row]
        print(Arr_PackageWiseReport)
        self.lbl_Vendor.text = Arr_PackageWiseReport.vendor_name!
        self.lbl_PurchaseOrder.text = Arr_PackageWiseReport.purchase_id!
        self.lbl_StructureMWP.text = Arr_PackageWiseReport.group_structure_name!
        self.lbl_PackingList.text = Arr_PackageWiseReport.pl_name!
        self.lbl_Package_Progressive.text = String(describing: Arr_PackageWiseReport.pl_package!)
        self.lbl_PackageDenominator.text = String(describing: Arr_PackageWiseReport.master_package_count!)
        self.lbl_VendorPackageID.text = Arr_PackageWiseReport.vendor_package!
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
class PackagewiseReportHeaderCell: UITableViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
//MARK:- PackagewiseReportCell1
class PackagewiseReportCell1: UITableViewCell {
    //MARK:- IBOutlet
    @IBOutlet weak var lbl_NetWeightkg: UILabel!
    @IBOutlet weak var lbl_GrossWeightkg: UILabel!
    @IBOutlet weak var lbl_RNDate: UILabel!
    @IBOutlet weak var lbl_ShippedDate: UILabel!
    @IBOutlet weak var lbl_OnsiteDate: UILabel!
    @IBOutlet weak var lbl_MWPReleaseStatus: UILabel!
    @IBOutlet weak var lbl_MWPShippedStatus: UILabel!
    @IBOutlet weak var lbl_MWPOnsiteStatus: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    //MARK:-  Initialization
    func DisplayCell(Arr_Data :[packageWiseReportModel],indexpath: IndexPath) {
       let Arr_PackageWiseReport = Arr_Data[0].results![indexpath.row]
        print(Arr_PackageWiseReport)
        self.lbl_NetWeightkg.text = Arr_PackageWiseReport.master_net_weight!
        self.lbl_GrossWeightkg.text = Arr_PackageWiseReport.master_gross_weight!
        self.lbl_RNDate.text = ""
        self.lbl_ShippedDate.text = (Arr_PackageWiseReport.shipped_date != nil) ? Arr_PackageWiseReport.shipped_date! : "No Date"
        self.lbl_OnsiteDate.text = (Arr_PackageWiseReport.onsite_date != nil) ? Arr_PackageWiseReport.onsite_date! : "No Date"
        self.lbl_MWPReleaseStatus.text = Arr_PackageWiseReport.released_status!
        self.lbl_MWPShippedStatus.text = Arr_PackageWiseReport.shipped_status!
        self.lbl_MWPOnsiteStatus.text = Arr_PackageWiseReport.onsite_status!
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
class PackagewiseReportHeaderCell1: UITableViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
