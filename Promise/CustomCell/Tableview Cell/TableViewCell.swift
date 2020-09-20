//
//  TableViewCell.swift
//  as
//
//  Created by macbook on 05/05/1942 Saka.
//  Copyright © 1942 com.mac. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var view_BG: UIView!
    @IBOutlet weak var lbl_ProjectName: UILabel!
    @IBOutlet weak var lbl_VendorName: UILabel!
    @IBOutlet weak var lbl_PLNumber: UILabel!
    @IBOutlet weak var lbl_Revision: UILabel!
    @IBOutlet weak var img_Relesed: UIImageView!
    @IBOutlet weak var txt_ReleasedDate: UITextField!
    @IBOutlet weak var lbl_ApprovalStatus: UILabel!
    @IBOutlet weak var lbl_ActiveStatus: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        Utils.set_Image_on_RightView_of_Textfield(textfield: txt_ReleasedDate, imagename: "ic_calendar", width: 25, height: 25)
    }
    func Display_Cell(arr_data: NSMutableArray,indexPath:IndexPath) {
        //reverse Solution
//        arr_data.reversed()[indexPath.section] as! PackingListModel
        let Arr_PackData = arr_data[indexPath.row] as! PackingListModel
        self.lbl_ProjectName.text = Arr_PackData.projectName!
        self.lbl_VendorName.text = Arr_PackData.vendorName!
        self.lbl_PLNumber.text = Arr_PackData.number!
        self.lbl_Revision.text = Arr_PackData.revision!
        self.img_Relesed.image = UIImage(named: (Arr_PackData.isReleased == true) ? "ic_correct" : "ic_not_released")
//        arr_data.map{($0 as! PackingListModel).number!}
        self.txt_ReleasedDate.text = Arr_PackData.releasedDate!
        self.lbl_ApprovalStatus.text = Arr_PackData.approveStatus
        self.lbl_ActiveStatus.text = String(Arr_PackData.isActive)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
class TableViewHeaderCell: UITableViewCell {
//    @IBOutlet weak var view_BG: UIView!
//    @IBOutlet weak var lbl_ProjectName: UILabel!
//    @IBOutlet weak var lbl_VendorName: UILabel!
//    @IBOutlet weak var lbl_PLNumber: UILabel!
//    @IBOutlet weak var lbl_Revision: UILabel!
//    @IBOutlet weak var img_Relesed: UIImageView!
//    @IBOutlet weak var txt_ReleasedDate: UITextField!
    

    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
//    func Display_Cell(arr_data: NSMutableArray,indexPath:IndexPath) {
//        //reverse Solution
////        arr_data.reversed()[indexPath.section] as! PackingListModel
//        let Arr_PackData = arr_data[indexPath.section] as! PackingListModel
//        self.lbl_ProjectName.text = Arr_PackData.projectName!
//        self.lbl_VendorName.text = Arr_PackData.vendorName!
//        self.lbl_PLNumber.text = Arr_PackData.number!
//        self.lbl_Revision.text = Arr_PackData.revision!
//        self.img_Relesed.image = UIImage(named: (Arr_PackData.isReleased == true) ? "ic_correct" : "ic_not_released")
////        arr_data.map{($0 as! PackingListModel).number!}
//        self.txt_ReleasedDate.text = Arr_PackData.releasedDate!
//    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
