//
//  Project_CollectionCell.swift
//  Promise
//
//  Created by Promise Inspection
//  Copyright © 2020 Promise. All rights reserved.
//

import UIKit

class Project_CollectionCell: UICollectionViewCell
{
    @IBOutlet weak var lbl_ProjectName: UILabel!
    
    @IBOutlet weak var lbl_ProjectCode: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func DisplayCell(arr : [MasterProjectModel], indexPath: Int) {
        let rowdata = arr[indexPath]
        print(rowdata)
//        let Arr_Data = DEFAULTS.Get_MasterProject().filter{$0.id! == rowdata.id!}
//        print(Arr_Data)
        self.lbl_ProjectName.text = rowdata.name!
        self.lbl_ProjectCode.text = rowdata.code! 
    }


}
