//
//  SummaryReportcell.swift
//  report
//
//  Created by macbook on 21/06/1942 Saka.
//  Copyright © 1942 com.mac. All rights reserved.
//

import UIKit

class SummaryReportcell: UITableViewCell {
    @IBOutlet weak var lbl_Vendor: UILabel!
    @IBOutlet weak var lbl_PurchaseOrder: UILabel!
    @IBOutlet weak var lbl_OrderedbyPOton: UILabel!
    @IBOutlet weak var lbl_MBLAvailableton: UILabel!
    @IBOutlet weak var lbl_IFbyVendorton: UILabel!
    @IBOutlet weak var lbl_IPSpreparedbyP4ton: UILabel!
    @IBOutlet weak var lbl_Releasedton: UILabel!
    @IBOutlet weak var lbl_ShippedWeightton: UILabel!
    
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func DisplayCell(Arr_Data :[SummaryReportModel],indexpath: IndexPath) {
    let Arr_Summary = Arr_Data[0].results![indexpath.row]
        print(Arr_Summary)
        self.lbl_Vendor.text = Arr_Summary.vendor!
        self.lbl_PurchaseOrder.text = String(describing: Arr_Summary.number!)
        self.lbl_OrderedbyPOton.text = String(describing: Arr_Summary.ordered!)
        self.lbl_MBLAvailableton.text = String(describing: Arr_Summary.mblWeight!)
        self.lbl_IFbyVendorton.text = String(describing: Arr_Summary.ifByVendor!)
        self.lbl_IPSpreparedbyP4ton.text = ""
        self.lbl_Releasedton.text = String(describing:  Arr_Summary.released!)
        self.lbl_ShippedWeightton.text = String(describing: Arr_Summary.shippedWeight!)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
class SummaryReportHeadercell: UITableViewCell {
    
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


class SummaryReportcell1: UITableViewCell {
    
   @IBOutlet weak var lbl_OnsiteWeightton: UILabel!
   @IBOutlet weak var lbl_TobeShippedton: UILabel!
   @IBOutlet weak var lbl_TobeReleasedton: UILabel!
   @IBOutlet weak var lbl_VendorMonthlyCommitmentton: UILabel!
   @IBOutlet weak var lbl_BalanceReleasedVsAgreementton: UILabel!
   @IBOutlet weak var lbl_BalanceIFVsAgreementton: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func DisplayCell(Arr_Data :[SummaryReportModel],indexpath: IndexPath) {
       let Arr_Summary = Arr_Data[0].results![indexpath.row]
           print(Arr_Summary)
        self.lbl_OnsiteWeightton.text = String(describing: Arr_Summary.onsiteWeight!)
        self.lbl_TobeShippedton.text = String(describing: Arr_Summary.toBeShipped!)
        self.lbl_TobeReleasedton.text = String(describing: Arr_Summary.toBeReleased!)
        self.lbl_VendorMonthlyCommitmentton.text = ""
        self.lbl_BalanceReleasedVsAgreementton.text = ""
        self.lbl_BalanceIFVsAgreementton.text = ""
       }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
class SummaryReportHeadercell1: UITableViewCell {
    
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
