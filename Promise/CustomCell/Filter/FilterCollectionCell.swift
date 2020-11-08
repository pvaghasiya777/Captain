//
//  FilterCollectionCell.swift
//  report
//
//  Created by macbook on 01/08/1942 Saka.
//  Copyright © 1942 com.mac. All rights reserved.
//
class FilterData: NSObject
{
    var SelectAttribute = String()
    var SelectCriteria = String()
    var FilterParam = String()
    var Value : String?
    init(SelectAttribute: String, SelectCriteria: String, FilterParam: String, Value: String)
    {
        self.SelectAttribute = SelectAttribute
        self.SelectCriteria = SelectCriteria
        self.FilterParam = FilterParam
        self.Value = Value

    }
}
import UIKit

class FilterCollectionCell: UICollectionViewCell {
    @IBOutlet weak var view_BG: UIView!
    @IBOutlet weak var lbl_SelectAttribute: UILabel!
    @IBOutlet weak var lbl_SelectCriteria: UILabel!
    @IBOutlet weak var lbl_Value: UILabel!
    @IBOutlet weak var btn_Close: UIButton!
    @IBOutlet weak var Constraint_AttributeWidth: NSLayoutConstraint!
    @IBOutlet weak var Constraint_AttributeLeft: NSLayoutConstraint!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    func DisplayCell(arr: [FilterData], indexPath: Int) {
        let rowdata = arr[indexPath]
        lbl_SelectAttribute.text = rowdata.SelectAttribute
        lbl_SelectCriteria.text = rowdata.SelectCriteria
        if rowdata.Value == "" {
            Constraint_AttributeLeft.constant = 0
            Constraint_AttributeWidth.constant = 0
        } else {
            lbl_Value.text = rowdata.Value
        }
        
        
    }
}

