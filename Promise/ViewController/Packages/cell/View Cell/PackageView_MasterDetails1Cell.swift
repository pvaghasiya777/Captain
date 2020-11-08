//
//  MasterDetails1Cell.swift
//  Promise
//
//  Created by macbook on 13/06/1942 Saka.
//  Copyright © 1942 Captain. All rights reserved.
//

import UIKit

class PackageView_MasterDetails1Cell: UITableViewCell {
    //MARK:- IBOutlet
    @IBOutlet weak var lbl_PackageName: UILabel!
    @IBOutlet weak var lbl_KindOfPackage: UILabel!
    @IBOutlet weak var lbl_Length: UILabel!
    @IBOutlet weak var lbl_Width: UILabel!
    @IBOutlet weak var lbl_Height: UILabel!
    @IBOutlet weak var lbl_GrossWeight: UILabel!
    @IBOutlet weak var lbl_NetWeight: UILabel!
    @IBOutlet weak var lbl_Stackable: UILabel!
    @IBOutlet weak var lbl_OndeckShipp: UILabel!
    //MARK:- Variable
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    //MARK:- Display Cell
    func DisplayCell(Arr_Data : [PlreportDetailModel] ,indexPath : IndexPath) {
        let Arr_MasterDetail = Arr_Data[0].inputMasterIDS![indexPath.row]
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
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
//MARK:- MasterDetail Header Cell 1
class PackageView_MasterDetailsHeader1Cell: UITableViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
