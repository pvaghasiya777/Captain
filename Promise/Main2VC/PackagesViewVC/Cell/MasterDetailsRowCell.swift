//
//  MasterDetailsRowCell.swift
//  Promise
//
//  Created by macbook on 13/08/1942 Saka.
//  Copyright © 1942 Captain. All rights reserved.
//

import UIKit

class MasterDetailsRowCell: UITableViewCell {
    //MARK:- IBOutlet
    //view 1
    @IBOutlet weak var lbl_PackageName: UILabel!
    @IBOutlet weak var lbl_KindOfPackage: UILabel!
    @IBOutlet weak var lbl_Length: UILabel!
    @IBOutlet weak var lbl_Width: UILabel!
    @IBOutlet weak var lbl_Height: UILabel!
    @IBOutlet weak var lbl_GrossWeight: UILabel!
    @IBOutlet weak var lbl_NetWeight: UILabel!
    @IBOutlet weak var lbl_Stackable: UILabel!
    @IBOutlet weak var lbl_OndeckShipp: UILabel!
    //view 2
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
    func DisplayCell(ViewController : PlinputViewVC ,indexPath : IndexPath) {
        let cellIndex = ViewController.startIndex + indexPath.row
        let Arr_MasterDetail = ViewController.Arr_PLDetail[0].inputMasterIDS![cellIndex]
        self.lbl_PackageName.text = String(describing: Arr_MasterDetail.package!)
        self.lbl_Length.text = Arr_MasterDetail.length!
        self.lbl_Width.text = Arr_MasterDetail.width!
        self.lbl_Height.text = Arr_MasterDetail.height!
        self.lbl_GrossWeight.text = Arr_MasterDetail.grossWeight!
        self.lbl_NetWeight.text = Arr_MasterDetail.netWeight!
        self.lbl_Stackable.text = Arr_MasterDetail.stackable!
        self.lbl_OndeckShipp.text = Arr_MasterDetail.onDeckShipment!
        let KOP = DEFAULTS.Get_MasterKindOfPackage().filter {$0.id! == Arr_MasterDetail.packageID!}
        self.lbl_KindOfPackage.text = KOP[0].name!
        self.lbl_Storage_Symbol.text = Arr_MasterDetail.storageSymbol!
        self.lbl_Min_Temperature.text = Arr_MasterDetail.minTemp!
        self.lbl_Max_Temperature.text = Arr_MasterDetail.maxTemp!
        self.lbl_PL_Sequence.text = Arr_MasterDetail.plSequence!
        self.lbl_Vendor_Package.text = Arr_MasterDetail.vendorPackage!
        self.lbl_Truck_Number.text = Arr_MasterDetail.truckNumber!
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
