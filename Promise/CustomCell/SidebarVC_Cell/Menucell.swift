//
//  Menucell.swift
//  Promise Inspection
//
//  Created by Prime Inspection
//  Copyright © 2019 Jayesh Shenmare. All rights reserved.
//

import UIKit

class Menucell: UITableViewCell
{
    @IBOutlet weak var img_logo: UIImageView!
    @IBOutlet weak var lbl_SecondName: UILabel!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
//        lbl_SecondName?.textColor = UIColor(hexString: "616161")//App_Colors.DarkGrayColor
//        lbl_SecondName.font = UIFont(name:"BebasNeue-Regular", size: 20)
////        img_logo!.setimage_tintColor(color: UIColor(hexString: "009193"))
//        img_logo.tintColor = UIColor(hexString: "616161")
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
    }
    
}
