//
//  PackageDetailsVC.swift
//  report
//
//  Created by macbook on 04/06/1942 Saka.
//  Copyright © 1942 com.mac. All rights reserved.
//

import UIKit
import iOSDropDown
class PackageDetailsVC: UIViewController {
    //MARK:- IBOutlet
    @IBOutlet weak var txt_PackageName: UITextField!
    @IBOutlet weak var txt_KindOfPackage: DropDown!
    @IBOutlet weak var txt_Length_ft: UITextField!
    @IBOutlet weak var txt_WidthFt: UITextField!
    @IBOutlet weak var txt_Heightft: UITextField!
    @IBOutlet weak var txt_GrossWeightlb: UITextField!
//    Storage
    @IBOutlet weak var txt_Stackable: DropDown!
    @IBOutlet weak var txt_OnDeckShipment: DropDown!
    @IBOutlet weak var txt_StorageSymbol: UITextField!
    @IBOutlet weak var txt_MinTemperature_F: UITextField!
    @IBOutlet weak var txt_MaxTemperature_F: UITextField!
    @IBOutlet weak var txt_PLSequence: UITextField!
    @IBOutlet weak var txt_VendorPackage: UITextField!
    @IBOutlet weak var txt_TruckNumber: UITextField!
     
    var Arr_PLDetail = [PlreportDetailModel]()
    var IndexpathRow = 0
    //MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initializeview()
    }
   //MARK:- Initialisation
    func initializeview() {
        Utils.EnableTextField(textFields: [txt_PackageName,txt_KindOfPackage,txt_Length_ft,txt_WidthFt,txt_Heightft,txt_GrossWeightlb,txt_Stackable,txt_OnDeckShipment,txt_StorageSymbol,txt_MinTemperature_F,txt_MaxTemperature_F,txt_PLSequence,txt_VendorPackage,txt_TruckNumber])
        self.SetData()
    }
    func SetData() {
        let Arr_InputMasterID = Arr_PLDetail[0].inputMasterIDS![IndexpathRow]
        let KOP = DEFAULTS.Get_MasterKindOfPackage().filter {$0.id! == Arr_InputMasterID.packageID!}
        self.txt_PackageName.text = String(describing: Arr_InputMasterID.package!)
        self.txt_KindOfPackage.text = KOP[0].name!
        self.txt_Length_ft.text = Arr_InputMasterID.length!
        self.txt_WidthFt.text = Arr_InputMasterID.width!
        self.txt_Heightft.text = Arr_InputMasterID.height!
        self.txt_GrossWeightlb.text = Arr_InputMasterID.grossWeight!
        self.txt_StorageSymbol.text = Arr_InputMasterID.storageSymbol!
        self.txt_MinTemperature_F.text = Arr_InputMasterID.minTemp!
        self.txt_MaxTemperature_F.text = Arr_InputMasterID.maxTemp!
        self.txt_PLSequence.text = Arr_InputMasterID.plSequence!
        self.txt_VendorPackage.text = Arr_InputMasterID.vendorPackage!
        self.txt_TruckNumber.text = Arr_InputMasterID.truckNumber!
    }
}
