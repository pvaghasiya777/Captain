
import UIKit
import MessageUI
extension UITapGestureRecognizer {
    func didTapAttributedTextInLabel(label: UILabel, inRange targetRange: NSRange) -> Bool {
        // Create instances of NSLayoutManager, NSTextContainer and NSTextStorage
        let layoutManager = NSLayoutManager()
        let textContainer = NSTextContainer(size: CGSize.zero)
        let textStorage = NSTextStorage(attributedString: label.attributedText!)
        // Configure layoutManager and textStorage
        layoutManager.addTextContainer(textContainer)
        textStorage.addLayoutManager(layoutManager)
        // Configure textContainer
        textContainer.lineFragmentPadding = 0.0
        textContainer.lineBreakMode = label.lineBreakMode
        textContainer.maximumNumberOfLines = label.numberOfLines
        let labelSize = label.bounds.size
        textContainer.size = labelSize
        // Find the tapped character location and compare it to the specified range
        let locationOfTouchInLabel = self.location(in: label)
        let textBoundingBox = layoutManager.usedRect(for: textContainer)
        let textContainerOffset = CGPoint(x: (labelSize.width - textBoundingBox.size.width) * 0.5 - textBoundingBox.origin.x,
                                          y: (labelSize.height - textBoundingBox.size.height) * 0.5 - textBoundingBox.origin.y);
        let locationOfTouchInTextContainer = CGPoint(x: locationOfTouchInLabel.x - textContainerOffset.x,
                                                     y: locationOfTouchInLabel.y - textContainerOffset.y);
        let indexOfCharacter = layoutManager.characterIndex(for: locationOfTouchInTextContainer, in: textContainer, fractionOfDistanceBetweenInsertionPoints: nil)
        return NSLocationInRange(indexOfCharacter, targetRange)
    }
}
import UIKit
class Pair: NSObject {
    var key = UIImage()
    var value = ""
    init(key: UIImage, value: String) {
        self.key = key
        self.value = value
    }
}
class State: NSObject {
    var name = ""
    var parameters = NSMutableOrderedSet()
}
class SidebarVC: DropDownTableViewController
{
    //MARK:- Outlet
    @IBOutlet var tbl_sidebar: UITableView!
    //MARK:- variable
    var Arr_Header : NSMutableArray = ["0","View Profile","Dashboard","Project","Purchase Order","Marks & Bolts","Packages","Packing List","Material Status","Document","Report","Logout"]
    var Arr_SubMainu : NSMutableArray = ["MBL","Shipped Status","Onsite Status"]
    var Arr_Header_img : NSMutableArray = ["","icuser","icAnalytics","ic_Project","ic_purchase","ic_shop_drwaing","ic_packages","ic_list","icMaterial","icDocument","ic_report","ic_logout"]
    var Arr_SubMenu_Image : NSMutableArray = ["","ic_shop_drwaing","icMaterialstatus","icMaterialstatus"]
    var Arr_sideMenu : NSMutableArray = NSMutableArray()
    var data: [State] = []
    //MARK:- ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        Initialization()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
        self.title = " "
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = true
        self.title = ""
    }
    
    func Initialization()
    {
        self.tbl_sidebar.register(UINib(nibName: "BannerCell", bundle: nil), forCellReuseIdentifier: "BannerCell")
        self.tbl_sidebar.register(UINib(nibName: "Menucell", bundle: nil), forCellReuseIdentifier: "Menucell")
        self.tbl_sidebar.register(UINib(nibName: "SubMenuCell", bundle: nil), forCellReuseIdentifier: "SubMenuCell")
        tbl_sidebar.separatorStyle = .none
        let imgbanner = State()
        imgbanner.name = "0,"
        let ViewProfile = State()
        ViewProfile.name = "View Profile"
        let DASHBOARD = State()
        DASHBOARD.name = "Dashboard"
        let PROJECT = State()
        PROJECT.name = "Project"
        let PURCHASEORDER = State()
        PURCHASEORDER.name = "Purchase Order"
        let MarksBolts = State()
        MarksBolts.name = "Marks & Bolts"
        MarksBolts.parameters.add(Pair(key: UIImage(named: Arr_SubMenu_Image[1] as! String)!, value: Arr_SubMainu[0] as! String))
        let PACKAGES = State()
        PACKAGES.name = "Packages"
        let PACKINGLIST = State()
        PACKINGLIST.name = "Packing List"
        let MaterialStatus = State()
        MaterialStatus.name = "Material Status"
        MaterialStatus.parameters.add(Pair(key: UIImage(named: Arr_SubMenu_Image[2] as! String)!, value: Arr_SubMainu[1] as! String))
        MaterialStatus.parameters.add(Pair(key: UIImage(named: Arr_SubMenu_Image[3] as! String)!, value: Arr_SubMainu[2] as! String))
        let DOCUMENT = State()
        DOCUMENT.name = "Document"
        let REPORT = State()
        REPORT.name = "Report"
        let LogOut = State()
        LogOut.name = "Logout"
        self.data = [imgbanner,ViewProfile,DASHBOARD,PROJECT,PURCHASEORDER,MarksBolts,PACKAGES,PACKINGLIST,MaterialStatus,DOCUMENT,REPORT,LogOut]
    }
    
    override func numberOfRows(in tableView: UITableView) -> Int {
        return  self.data.count
    }
    override func tableView(_ tableView: UITableView, numberOfSubrowsInRow row: Int) -> Int {
        return self.data[row].parameters.count
    }
    override var showSubrowsInRow: Int? {
        return 0
    }
    override func tableView(_ tableView: UITableView, cellForRow row: Int, indexPath: IndexPath) -> UITableViewCell {
        if row == 0 {
            let cell:BannerCell = tableView.dequeueReusableCell(withIdentifier: "BannerCell") as! BannerCell
            return cell
        } else {
            let cell:Menucell = tableView.dequeueReusableCell(withIdentifier: "Menucell") as! Menucell
            cell.lbl_SecondName?.text = self.data[row].name
            cell.img_logo.image = UIImage(named: Arr_Header_img[row] as! String)
            if "Material Status" == String(data[row].name) || "Marks & Bolts" == String(data[row].name) {
                if row == self.nsk_selectedRow {
                    cell.accessoryView = UIImageView(image: UIImage(named: "up_arrow"))
                }else {
                    cell.accessoryView = UIImageView(image: UIImage(named: "down_arrow"))
                }
            } else {
            }
            cell.selectionStyle = .none
            return cell
        }
    }
    override func tableView(_ tableView: UITableView, didSelectRow row: Int) {
        if "Material Status" == String(data[row].name) || "Marks & Bolts" == String(data[row].name) {
            switch (self.nsk_selectedRow, row) {
            case (let sr?, _) where row == sr:
                tableView.cellForRow(at: row)?.accessoryView =  UIImageView(image: UIImage(named: "down_arrow"))
                tableView.deselect(row: row, animated: true)
                break
            case (let sr?, _) where row != sr:
                tableView.cellForRow(at: row)?.accessoryView = UIImageView(image: UIImage(named: "up_arrow"))
                tableView.cellForRow(at: sr)?.accessoryView = UIImageView(image: UIImage(named: "down_arrow"))
                break
            case (nil, _):
                tableView.cellForRow(at: row)?.accessoryView = UIImageView(image: UIImage(named: "up_arrow"))
                break
            default:
                break
            }
            super.tableView(tableView, didSelectRow: row)
        }else {
            //        "Document","Report"]
            if String(describing:Arr_Header[row]) == "Dashboard" {
                self.performSegue(withIdentifier: "HomeVC", sender: nil)
            } else if String(describing:Arr_Header[row]) == "Purchase Order"  {
                self.performSegue(withIdentifier: "Purchase", sender: nil)
            } else if String(describing:Arr_Header[row]) == "View Profile" {
                self.performSegue(withIdentifier: "UpdateProfile", sender: nil)
            } else if String(describing:Arr_Header[row]) == "Packages" {
                self.performSegue(withIdentifier: "PLInputs", sender: nil)
            } else if String(describing:Arr_Header[row]) == "Packing List" {
                self.performSegue(withIdentifier: "Packing_List", sender: nil)
            }  else if String(describing:Arr_Header[row]) == "Logout" {
                self.btn_Logout_Click()
            } else if String(describing:Arr_Header[row]) == "Project" {
                self.performSegue(withIdentifier: "Project", sender: nil)
            }else if String(describing:Arr_Header[row]) == "Document"{
                self.performSegue(withIdentifier: "Document", sender: nil)//SReports
            }else if String(describing:Arr_Header[row]) == "Report"{
                self.performSegue(withIdentifier: "SReports", sender: nil)
            }
        }
    }
    override func tableView(_ tableView: UITableView, heightForRow row: Int) -> CGFloat {
        if row == 0 {
            return 120
        } else {
            return 56
        }
    }
    @objc func btn_Logout_Click(){
        ServiceCall.shareInstance.GET_Logout()
    }
    override func tableView(_ tableView: UITableView, cellForSubrow subrow: Int, inRow row: Int, indexPath: IndexPath) -> UITableViewCell {
        let pair = self.data[row].parameters.object(at: subrow) as! Pair
        let cell : SubMenuCell = tableView.dequeueReusableCell(withIdentifier: "SubMenuCell") as! SubMenuCell
        cell.img_Sublogo.image = pair.key
        cell.lbl_SubSecondName.text = pair.value
        cell.selectionStyle = .none
        return cell
    }
    override func tableView(_ tableView: UITableView, indentationLevelForRow row: Int) -> Int {
        return 0
    }
    override func tableView(_ tableView: UITableView, indentationLevelForSubrow subrow: Int, inRow row: Int) -> Int {
        return 3
    }
    override func tableView(_ tableView: UITableView, canEditRow row: Int) -> Bool {
        return true
    }
    override func tableView(_ tableView: UITableView, canEditSubrow subrow: Int, inRow row: Int) -> Bool {
        return true
    }
    override func tableView(_ tableView: UITableView, didEndDisplayingCell cell: UITableViewCell, forRow row: Int) {
    }
    override func tableView(_ tableView: UITableView, didEndDisplayingCell cell: UITableViewCell, forSubrow subrow: Int, inRow row: Int) {
        //print(cell.detailTextLabel?.text ?? "", row, subrow)
    }
    override func tableView(_ tableView: UITableView, canMoveRow row: Int) -> Bool {
        return true
    }
    override func tableView(_ tableView: UITableView, canMoveSubrow subrow: Int, inRow row: Int) -> Bool {
        return true
    }
    override func tableView(_ tableView: UITableView, targetRowForMoveFromRow sourceRow: Int, to proposedDestinationRow: Int) -> Int {
        return proposedDestinationRow
    }
    override func tableView(_ tableView: UITableView, targetSubrowForMoveFromSubrow sourceSubrow: Int, to proposedDestinationSubrow: Int, inRow row: Int) -> Int {
        return proposedDestinationSubrow
    }
    override func tableView(_ tableView: UITableView, moveRow sourceRow: Int, to destinationRow: Int) {
        swap(&self.data[sourceRow], &self.data[destinationRow])
    }
    override func tableView(_ tableView: UITableView, moveSubrow sourceSubrow: Int, to destinationSubrow: Int, inRow row: Int) {
        let state = self.data[row]
        state.parameters.exchangeObject(at: sourceSubrow, withObjectAt: destinationSubrow)
    }
    override func tableView(_ tableView: UITableView, animationForInsertionIn row: Int) -> UITableView.RowAnimation {
        return .bottom
    }
    override func tableView(_ tableView: UITableView, animationForDeletionIn row: Int) -> UITableView.RowAnimation {
        return .fade
    }
    override func tableView(_ tableView: UITableView, heightForSubrow subrow: Int, inRow row: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    override func tableView(_ tableView: UITableView, didSelectSubrow subrow: Int, inRow row: Int) {
        if row == 5 {
            if subrow == 0 {
                self.performSegue(withIdentifier: "ShopDrawing", sender: nil)
            }
        } else if row == 8 {
            if subrow == 1 {
                self.performSegue(withIdentifier: "Onsite_Status", sender: nil)
            } else if subrow == 0 {
                self.performSegue(withIdentifier: "Shipped_Status", sender: nil)
            }
        }
        super.tableView(tableView, didSelectRow: row)
    }
}
