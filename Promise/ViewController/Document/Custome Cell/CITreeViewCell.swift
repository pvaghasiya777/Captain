//
//  CITreeViewCell.swift
//  CITreeView
//
//

import UIKit

class CITreeViewCell: UITableViewCell {
    
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    let leadingValueForChildrenCell:CGFloat = 30
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupCell(level:Int)
    {
        self.leadingConstraint.constant = leadingValueForChildrenCell * CGFloat(level + 1)
        self.avatarImageView.layer.cornerRadius = self.avatarImageView.frame.size.height / 2
//        switch level {
//        case 0:
//            self.avatarImageView.image = UIImage(named: "icfolderOpen")
////           self.avatarImageView.backgroundColor = UIColor.orange
//        case 1:
//            self.avatarImageView.image = UIImage(named: "icfolderOpen")
////            self.avatarImageView.backgroundColor = UIColor.green
//        case 2:
//            self.avatarImageView.image = UIImage(named: "icfolderOpen")
////            self.avatarImageView.backgroundColor = UIColor.blue
//        default:
//            self.avatarImageView.image = UIImage(named: "icfolder")
////           self.avatarImageView.backgroundColor = UIColor.black
//        }
        self.layoutIfNeeded()
    }
    
    func getRandomColor() -> UIColor{
        
        let red:CGFloat = CGFloat(drand48())
        let green:CGFloat = CGFloat(drand48())
        let blue:CGFloat = CGFloat(drand48())
        
        return UIColor(red:red, green: green, blue: blue, alpha: 1.0)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
