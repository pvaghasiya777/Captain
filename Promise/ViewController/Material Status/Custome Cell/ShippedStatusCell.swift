//
//  ShippedStatusCell.swift
//  Promise
//
//  Created by macbook on 30/05/1942 Saka.
//  Copyright © 1942 Captain. All rights reserved.
//

import UIKit

class ShippedStatusCell: UITableViewCell {
    //MARK:- IBOutlet
    @IBOutlet weak var lbl_ProjectName: UILabel!
    @IBOutlet weak var lbl_PLNumber: UILabel!
    @IBOutlet weak var lbl_Package: UILabel!
    @IBOutlet weak var lbl_Revision: UILabel!
    @IBOutlet weak var img_released: UIImageView!
    @IBOutlet weak var img_Shipped: UIImageView!
    @IBOutlet weak var txt_OnsiteDate: UITextField!
    @IBOutlet weak var btn_Action: UIButton!
    @IBOutlet weak var btn_Select: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        Utils.set_Image_on_RightView_of_Textfield(textfield: txt_OnsiteDate, imagename: "ic_calendar", width: 30, height: 30)
        Utils.setborder(view: btn_Select, bordercolor: .gray, borderwidth: 1)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    //MARK:- Display
    func Display_Cell(viewController : ShippedStatusVC , indexPath : IndexPath) {
           var Arr_data = viewController.Arr_onSiteStatusData[indexPath.row] as! onSiteStatusModel
           self.lbl_ProjectName.text = Arr_data.projectName!
           self.lbl_PLNumber.text = Arr_data.number!
           self.lbl_Package.text = String(describing: Arr_data.packageField!)
           self.lbl_Revision.text = Arr_data.revision!
           self.txt_OnsiteDate.text = (Arr_data.onsiteDate != nil) ? Arr_data.onsiteDate! : ""
           self.img_released.image = UIImage(named: (Arr_data.isReleased == true) ? "ic_correct" : "ic_not_released")
           self.img_Shipped.image = UIImage(named: (Arr_data.shipped == true) ? "ic_correct" : "ic_not_released")
       }
}

class ShippedStatusHeaderCell: UITableViewCell {
    @IBOutlet weak var btn_Select: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
