
import UIKit
import MessageUI

class SidebarVC: UITableViewController
{
    //MARK:- Outlet
    @IBOutlet var tbl_sidebar: UITableView!
    //MARK:- variable
    var Arr_Menu : NSMutableArray = ["","View Profile","DASHBOARD","PROJECT","PURCHASE ORDER","SHOP DRAWINGS","PACKAGES","PACKING LIST","MATERIAL LIST","DOCUMENT","REPORT","SETTING","LOGOUT"]
    var Arr_Menu_Image : NSMutableArray = ["","ic_Project","ic_dashboard","ic_Project","ic_purchase","ic_shop_drwaing","ic_packages","ic_list","ic_status","ic_Google_Doc","ic_report","ic_settings","ic_logout"]
    var Arr_sideMenu : NSMutableArray = NSMutableArray()
   //MARK:- life cycle
    override func viewDidLoad()
    {
       super.viewDidLoad()
        self.Initialization()
    }
    override func viewWillAppear(_ animated: Bool)
    {
       super.viewWillAppear(animated)
       self.navigationController?.isNavigationBarHidden = true
       self.tbl_sidebar.reloadData()
    }
    func Initialization() {
        self.tbl_sidebar.TableViewRegisterNib(nibName:"Menucell" , Identifier: "Menucell")
        self.tbl_sidebar.TableViewRegisterNib(nibName:"BannerCell" , Identifier: "BannerCell")
        self.tbl_sidebar.rowHeight = UITableView.automaticDimension
        self.tbl_sidebar.tableFooterView = UIView()
        self.tbl_sidebar.separatorStyle = .none
        self.navigationController?.isNavigationBarHidden = true
        self.Arr_sideMenu = NSMutableArray(array: DEFAULTS.Get_UserPermission().data!.menuitems!.sorted() as! NSArray)
        self.Arr_sideMenu.insert("", at: 0)
        self.Arr_sideMenu.insert("View Profile", at: 1)
        self.Arr_sideMenu.insert("Logout", at: self.Arr_sideMenu.count)
        self.tbl_sidebar.reloadData()
    }
    override func numberOfSections(in tableView: UITableView) -> Int
    {
        return self.Arr_sideMenu.count
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
       return 1
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if indexPath.section == 0 {
             let cell : BannerCell = tableView.dequeueReusableCell(withIdentifier: "BannerCell") as! BannerCell
             cell.selectionStyle = .none
             cell.isUserInteractionEnabled = false
            return cell
        }else {
            let cell : Menucell = tableView.dequeueReusableCell(withIdentifier: "Menucell") as! Menucell
//            cell.img_logo?.image = UIImage(named: self.Arr_Menu_Image[indexPath.section] as! String)
//            String(describing: "ic_" + String(describing:Arr_sideMenu[indexPath.section]))
            cell.lbl_SecondName.text = self.Arr_sideMenu[indexPath.section] as! String
            cell.selectionStyle = .none
            return cell
        }
        
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        print("Did Select Called")
        print(indexPath.section)
        if String(describing:Arr_sideMenu[indexPath.section]) == "Dashboard" {
            self.performSegue(withIdentifier: "Dashboard", sender: nil)
        }else if String(describing:Arr_sideMenu[indexPath.section]) == "Document"  {
            self.performSegue(withIdentifier: "Document", sender: nil)
        }else if String(describing:Arr_sideMenu[indexPath.section]) == "Purchase"  {
            self.performSegue(withIdentifier: "Purchase", sender: nil)
        }else if String(describing:Arr_sideMenu[indexPath.section]) == "Onsite_Status" {
            self.performSegue(withIdentifier: "Onsite_Status", sender: nil)
        }else if String(describing:Arr_sideMenu[indexPath.section]) == "Shipped_Status" {
            self.performSegue(withIdentifier: "Shipped_Status", sender: nil)
        }else if String(describing:Arr_sideMenu[indexPath.section]) == "View Profile" {
            self.performSegue(withIdentifier: "UpdateProfile", sender: nil)
        }else if String(describing:Arr_sideMenu[indexPath.section]) == "PLInputs" {
            self.performSegue(withIdentifier: "PLInputs", sender: nil)
        }else if String(describing:Arr_sideMenu[indexPath.section]) == "PackingList" {
            self.performSegue(withIdentifier: "Packing_List", sender: nil)
        }else if String(describing:Arr_sideMenu[indexPath.section]) == "ShopDrawing" {
            self.performSegue(withIdentifier: "ShopDrawing", sender: nil)
        } else if String(describing:Arr_sideMenu[indexPath.section]) == "Logout" {
            self.btn_Logout_Click()
        }else if String(describing:Arr_sideMenu[indexPath.section]) == "Project" {
            self.performSegue(withIdentifier: "Project", sender: nil)
        }
        
        
        
//        else if indexPath.section == 2 {
//            self.performSegue(withIdentifier: "Dashboard", sender: nil)
//        }else if indexPath.section == 3 {
//            self.performSegue(withIdentifier: "Project", sender: nil)
//        }else if indexPath.section == 4 {
//            self.performSegue(withIdentifier: "Purchase", sender: nil)
//        }else if indexPath.section == 6 {
//            self.performSegue(withIdentifier: "Packing_List", sender: nil)
//        }else if indexPath.section == 7 {
//            self.performSegue(withIdentifier: "PackagListReport", sender: nil)
//        }else if indexPath.section == 10 {
//            self.performSegue(withIdentifier: "Report", sender: nil)
//        }else if indexPath.section == 11 {
//            self.performSegue(withIdentifier: "Onsite_Status", sender: nil)
//        }else if indexPath.section == 12 {
//            self.btn_Logout_Click()
//        }
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
             return 100
          } else {
              return 50
          }
    }
    @objc func btn_Logout_Click(){
       
        Utils.Logout_Reset_Data()
//
//        guard let rootVC = Config.StoryBoard.instantiateViewController(identifier: "LoginVC") as? LoginVC else { print("LoginVC not found"); return }
//         let rootNC = UINavigationController(rootViewController: rootVC)
//         SceneDelegate.shared?.window?.rootViewController = rootNC
//         SceneDelegate.shared?.window?.makeKeyAndVisible()
       }
     @objc func btn_Share_Click(){
           let textToShareIOS = NSLocalizedString("Share Contain Text For Promise iOS App", comment: "")
           let textToShareIosFinal = textToShareIOS + "\n"  + Config.IosLink
           let textToShareAndroid = NSLocalizedString("For Android app :", comment: "") + "\n" + Config.AndroidLink
           let activityItems : NSArray = [textToShareIosFinal,textToShareAndroid]
           let activityVC : UIActivityViewController = UIActivityViewController(activityItems: activityItems as! [Any], applicationActivities: nil)
           self.present(activityVC, animated: true, completion: nil)
        self.performSegue(withIdentifier: "Home", sender: nil)
       }
}
