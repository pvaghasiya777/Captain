//
//  MasterDetails2Cell.swift
//  Promise
//
//  Created by macbook on 13/06/1942 Saka.
//  Copyright © 1942 Captain. All rights reserved.
//

import UIKit

class PackageView_MasterDetails2Cell: UITableViewCell {
    //MARK:- IBOutlet
    @IBOutlet weak var lbl_Storage_Symbol: UILabel!
    @IBOutlet weak var lbl_Min_Temperature: UILabel!
    @IBOutlet weak var lbl_Max_Temperature: UILabel!
    @IBOutlet weak var lbl_PL_Sequence: UILabel!
    @IBOutlet weak var lbl_Vendor_Package: UILabel!
    @IBOutlet weak var lbl_Truck_Number: UILabel!
    //MARK:- Variable
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    //MARK:- Display Cell
    func DisplayCell(Arr_Data : [PlreportDetailModel] ,indexPath : IndexPath) {
        let Arr_MasterDetail = Arr_Data[0].inputMasterIDS![indexPath.row]
        print(Arr_MasterDetail)
        self.lbl_Storage_Symbol.text = Arr_MasterDetail.storageSymbol!
        self.lbl_Min_Temperature.text = Arr_MasterDetail.minTemp!
        self.lbl_Max_Temperature.text = Arr_MasterDetail.maxTemp!
        self.lbl_PL_Sequence.text = Arr_MasterDetail.plSequence!
        self.lbl_Vendor_Package.text = Arr_MasterDetail.vendorPackage!
        self.lbl_Truck_Number.text = Arr_MasterDetail.truckNumber!
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
//MARK:- MasterDetail Header Cell 2
class PackageView_MasterDetailshedear2Cell: UITableViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
