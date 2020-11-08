//Utils.swift
import UIKit
import SKActivityIndicatorView
import KRProgressHUD
class Utils: NSObject,SWRevealViewControllerDelegate
{
    class func Disable_Front_ViewController(viewController: UIViewController, position : FrontViewPosition) {
        for view: UIView in viewController.view.subviews {
            if position == .left {
                view.isUserInteractionEnabled = true
            } else {
                view.isUserInteractionEnabled = (view.tag != 9999) ? false : true
            }
        }
    }
    class func ShowActivityIndicator(message : String) {
        KRProgressHUD.show(withMessage: message)
        KRProgressHUD.set(activityIndicatorViewColors: [.darkGray])
    }
//    class func ShowActivityIndicator(message : String) {
//        SKActivityIndicator.show(message, userInteractionStatus: false)
//        SKActivityIndicator.spinnerStyle(.spinningFadeCircle)
//        SKActivityIndicator.spinnerColor(.darkGray)
//    }
    class func set_Badge(Count : Int)  -> UILabel {
        let badgeCount = UILabel(frame: CGRect(x: 5, y: 0, width: 20, height: 20)),()
        badgeCount.layer.borderColor = UIColor.clear.cgColor
        badgeCount.layer.borderWidth = 2
        badgeCount.layer.cornerRadius = badgeCount.bounds.size.height / 2
        badgeCount.textAlignment = .center
        badgeCount.layer.masksToBounds = true
        badgeCount.textColor = .white
        badgeCount.font = badgeCount.font.withSize(15)
        badgeCount.backgroundColor = .red
        badgeCount.text = String(describing: Count)
        return badgeCount
    }
    class func Get_Percantage(Uses : Double,Total : Double)  -> String {
        let x = Uses/Total * 100
        let Percantage = Double(round(100*x)/100)
        return String(describing: "\(Percantage)%")
    }
    class func Get_NeedleValue(Value : String)  -> Double {
        let NeedleValue = Value.replacingOccurrences(of: "%", with: "", options: NSString.CompareOptions.literal, range: nil)
        return Double(NeedleValue)!
    }
    class func removeNSNull(from dict: [String: Any]) -> [String: Any] {
        var mutableDict = dict
        let keysWithEmptString = dict.filter { $0.1 is NSNull }.map { $0.0 }
        for key in keysWithEmptString {
            mutableDict[key] = ""
        }
        return mutableDict
    }
    class func checkStringNil(valueString: String,blankString : String) -> String {
        let finalStr = (valueString != nil) ? String(describing: valueString) : blankString
        return finalStr
    }
    class func checkDoubleNil(valueDouble: Double,blankString : String) -> String {
        let finalStr = (valueDouble != nil) ? String(describing: valueDouble) : blankString
        return finalStr
    }
    class func Get_Navigation_Bar_Button(str_Iconname : String, action : Selector, viewController : UIViewController)  -> UIBarButtonItem
    {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: str_Iconname), for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        button.isUserInteractionEnabled = true
        button.tintColor = .black
        button.addTarget(viewController, action: action, for: .touchUpInside)
        let barButton = UIBarButtonItem(customView: button)
        barButton.tintColor = App_Colors.ThemBlue
        return barButton
    }
    class func Logout_Reset_Data() {
        DEFAULTS.set_TOKEN(token: "")
        //        DEFAULTS.Set_UserPermission(UserData: GetPermissionModel)
        DEFAULTS.Set_AddressStruct(UserData: [])
        DEFAULTS.Set_MasterCoutry(CountryData: [])
        DEFAULTS.Set_MasterKindOfPackage(KOPData: [])
        DEFAULTS.Set_MasterPurchase(PurchaseData: [])
        DEFAULTS.Set_MasterCurrency(ProjectData: [])
        DEFAULTS.Set_MasterUOM(ProjectData: [])
        DEFAULTS.Set_MasterPOType(ProjectData: [])
        DEFAULTS.Set_MasterVendor(ProjectData: [])
        DEFAULTS.Set_MasterEmployee(ProjectData: [])
        DEFAULTS.Set_FilterMark(FilterData: [])
        DEFAULTS.Set_FilterProject(FilterData: [])
        DEFAULTS.Set_FilterStrucher(FilterData: [])
        DEFAULTS.Set_FilterPackingList(FilterData: [])
        DEFAULTS.Set_FilterPurchaseOrder(FilterData: [])
        DEFAULTS.Set_Discipline(Data: [])
        DEFAULTS.Set_Login(login_status: false)
        Utils.Set_Root_ViewController()
    }
    class func Set_Root_ViewController()
    {
        if DEFAULTS.Is_User_LoggedIn() == true {
            let revealController = SWRevealViewController()
            let sidebar_vc = Config.StoryBoard.instantiateViewController(withIdentifier:  "SidebarVC")as! SidebarVC
            let Homevc = Config.StoryBoard.instantiateViewController(withIdentifier:  "HomeVC")as! HomeVC
            revealController.frontViewController = UINavigationController(rootViewController: Homevc)
            revealController.rearViewController = UINavigationController(rootViewController: sidebar_vc)
            revealController.delegate = (self as! SWRevealViewControllerDelegate)
            SceneDelegate.shared?.window?.rootViewController = revealController
        } else {
            guard let rootVC = Config.StoryBoard.instantiateViewController(identifier: "LoginVC") as? LoginVC else {
                print("LoginVC not found")
                return
            }
            let rootNC = UINavigationController(rootViewController: rootVC)
            SceneDelegate.shared?.window?.rootViewController = rootNC
        }
        SceneDelegate.shared?.window?.makeKeyAndVisible()
    }
    class func EnableTextField(textFields : [UITextField] ) {
        for textField in textFields {
            textField.isUserInteractionEnabled = false
        }
    }
    //MARK: Date functions
    class func stringFromDate(date : NSDate ,Format :NSString ,isCapitalAMPM : Bool )-> NSString
    {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = Format as String
        if !isCapitalAMPM {
            dateFormat.amSymbol = "am"
            dateFormat.pmSymbol = "pm"
        }
        let theDate = dateFormat.string(from: date as Date)
        return theDate as NSString
    }
    class func dateFromStr(dateStr : NSString ,Format :NSString )-> NSDate
    {
        let formatter = DateFormatter()
        formatter.dateFormat = Format as String
        let date = formatter.date(from: dateStr as String)! as NSDate
        return date
    }
    class func Set_Device_Orientation(type : String) {
        if type == "portrait" {
            AppDelegate.appDelegate?.myOrientation = .portrait
            UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
        } else {
            AppDelegate.appDelegate?.myOrientation = .all
        }
    }
    //MARK:- Show Toast Message
    class func showToastWithMessage(message: String) {
        SceneDelegate.shared?.window?.makeToast(message, duration: 1.5, position: PositionBottom)
    }
    class func showToastWithMessage_withPosition(message: String,position : String) {
        SceneDelegate.shared?.window?.makeToast(message, duration: 1.5, position: position)
    }
    class func showToastWithMessageAtCenter(message: String) {
        SceneDelegate.shared?.window?.makeToast(message, duration: 1.5, position: PositionCenter)
    }
    class func set_Image_on_LeftView_of_Textfield(textfield : UITextField ,imagename : String, width : CGFloat, height : CGFloat)
    {
        textfield.leftViewMode = UITextField.ViewMode.always
        let imageView = UIImageView(frame: CGRect(x: 4, y: 8, width: width, height: height))
        let image = UIImage(named: imagename)?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = App_Colors.ThemTintColor
        imageView.image = image
        imageView.contentMode = .scaleToFill
        textfield.leftViewMode = .always
        textfield.addSubview(imageView)
    }
    
    class func set_Image_on_RightView_of_Textfield(textfield : UITextField ,imagename : String, width : CGFloat, height : CGFloat)
    {
        textfield.rightViewMode = UITextField.ViewMode.always
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        let image = UIImage(named: imagename)
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        textfield.rightView = imageView
    }
    class func set_Image_on_LeftView_of_Textfield_Dropdown(textfield : UITextField ,imagename : String, width : CGFloat, height : CGFloat)
    {
        textfield.leftViewMode = UITextField.ViewMode.always
        let imageView = UIImageView(frame: CGRect(x: 8, y: 6, width: width, height: height))
        let image = UIImage(named: imagename)?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = App_Colors.ThemTintColor
        imageView.image = image
        imageView.contentMode = .scaleToFill
        textfield.leftViewMode = .always
        textfield.addSubview(imageView)
    }
    class func set_Image_on_RightView_of_Textfield_Dropdown(textfield : UITextField ,imagename : String, width : CGFloat, height : CGFloat)
    {
        textfield.rightViewMode = UITextField.ViewMode.always
        let imageView = UIImageView(frame: CGRect(x: 12, y: 10, width: width, height: height))
        let image = UIImage(named: imagename)
        imageView.image = image
        imageView.contentMode = .center
        textfield.rightView = imageView
    }
    class func Get_Search_Button(str_Iconname : String, action : Selector, viewController : UIViewController)  -> UIBarButtonItem
    {
        let button = UIBarButtonItem(image: UIImage(named: str_Iconname), style: .plain, target: viewController, action: action)
        return button
    }
    class func DisableButtons(buttons : [UIButton]) {
        for button in buttons {
            button.isUserInteractionEnabled = false
        }
    }
    class func EnableButtons(buttons : [UIButton]) {
        for button in buttons {
            button.isUserInteractionEnabled = true
        }
    }
    class func SetSameShadowEffectToView(views : [UIView]) {
        for view in views {
            view.addSoftUIEffectForView()
            //view.backgroundColor = UIColor(red: 241/255, green: 243/255, blue: 246/255, alpha: 1.0)
        }
    }
    class func SetSameShadowEffectToButtons(buttons : [UIButton]) {
        for button in buttons {
            button.isHighlighted = false
            button.addSoftUIEffectForButton()
            //view.backgroundColor = UIColor(red: 241/255, green: 243/255, blue: 246/255, alpha: 1.0)
        }
    }
    class func SetSameFontColorToButtons(buttons : [UIButton], fontColor : UIColor) {
        for button in buttons {
            button.setTitleColor(fontColor, for: .normal)
        }
    }
    class func SetSameFontColorToLabel(labels : [UILabel], fontColor : UIColor) {
        for label in labels {
            label.textColor = fontColor
        }
    }
    class func Set_Same_Corner_Radius(views : [UIView], cornerRadius : Float) {
        for view in views {
            view.setcornerRadius(cornerradius: CGFloat(cornerRadius))
        }
    }
    class func Set_Corner_Radius(views : [UIView], radius : Float) {
        for i in 0..<views.count {
            views[i].setcornerRadius(cornerradius: CGFloat(radius))
        }
    }
    class func Set_Same_View_Border(views : [UIView],borderColor : UIColor, border_Width : CGFloat) {
        for view in views {
            view.setborder(bordercolor: borderColor, borderwidth: border_Width)
        }
    }
    
    class func Set_Navigationbar_Shadow(viewController : UIViewController)
    {
        viewController.navigationController?.navigationBar.layer.masksToBounds = false
        viewController.navigationController?.navigationBar.layer.shadowColor = UIColor.lightGray.cgColor
        viewController.navigationController?.navigationBar.layer.shadowOpacity = 0.8
        viewController.navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        viewController.navigationController?.navigationBar.layer.shadowRadius = 2
    }
    
    class func createlabelwithframe(frame: CGRect , withText :String , textcolor : UIColor ,textalignment : NSTextAlignment) -> UILabel
    {
        let label : UILabel = UILabel(frame : frame)
        label.text = withText
        label.numberOfLines = 0
        label.textColor = textcolor
        label.font = UIFont(name:"HelveticaNeue-Bold", size: 16.0)
        label.textAlignment = textalignment
        return label
    }
    class func escapeSpecialCharacctersString(_ string: String) -> String {
        let unescaped: String = string
        let escapedString: String? = unescaped.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlHostAllowed)?.replacingOccurrences(of: "'", with: "%27")
        print("escapedString: \(String(describing: escapedString))")
        return escapedString!
    }
    
    
    class func removequotString(_ string: String) -> NSString
    {
        let path = string.replacingOccurrences(of: "+", with: " ").removingPercentEncoding
        return path! as NSString
    }
    
    class func setBottomBorder(view : UIView, color : UIColor, frame : CGRect)
    {
        let layer = CALayer()
        layer.frame = frame
        layer.backgroundColor = color.cgColor
        view.layer.addSublayer(layer)
    }
    
    class func createGradientLayer(view : UIView , colorarray :[UIColor] , locations: [Float])
    {
        var gradientLayer: CAGradientLayer!
        gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        
        gradientLayer.colors = colorarray
        gradientLayer.locations = locations as [NSNumber]?
        
        view.layer.addSublayer(gradientLayer)
    }
    class func isValidEmailAddress(email: String) -> Bool
    {
        let emailRegex = kEmailAddressRegx
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: email)
    }
    
    class func isValidPhoneNumber(phone: String) -> Bool
    {
        let phoneRegex = kPhoneNumberRegx
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return phoneTest.evaluate(with: phone)
    }
    
    class func isValidString(string: String) -> Bool
    {
        if(string.length == 0)
        {
            return false
        }
        return true
    }
    class func isPasswordSame(password: String , confirmPassword : String) -> Bool
    {
        if password == confirmPassword{
            return true
        }
        else{
            return false
        }
    }
    class func isPwdLenth(password: String ) -> Bool
    {
        if password.length >= kPasswordlength
        {
            return true
        }
        else
        {
            return false
        }
    }
    
    class func isPasswordValid(_ password : String) -> Bool
    {
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[A-Z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{6,15}")
        return passwordTest.evaluate(with: password)
    }
    class func isValidZipCode_canada(postalCode:String) -> Bool
    {
        // let postalcodeRegex = "^[0-9]{5}(-[0-9]{4})?$" //US
        let pinPredicate = NSPredicate(format: "SELF MATCHES %@", kPostalcodeRegxCanada)
        let bool = pinPredicate.evaluate(with: postalCode) as Bool
        return bool
    }
    // MARK: Get Json String for Dictionary
    class func getJsonStringForDictionary(dictionary: NSMutableDictionary) -> String {
        let jsonData = try! JSONSerialization.data(withJSONObject: dictionary, options: [])
        let jsonStr = String(data: jsonData, encoding: String.Encoding.utf8)
        return jsonStr!
    }
    class func getDictionaryfromJsonString(jsonstring: String) -> [NSObject : AnyObject]
    {
        let data = jsonstring.data(using: String.Encoding.utf8)!
        let jsonResponse = try! JSONSerialization.jsonObject(with: data, options: .allowFragments)
        return jsonResponse as! [NSObject : AnyObject]
    }
    class func convertStringToDictionary(text: String) -> [String:AnyObject]? {
        if let data = text.data(using: String.Encoding.utf8) {
            do
            {
                let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String:AnyObject]
                return json
            }
            catch
            {
                print("error")
            }
        }
        return nil
    }
    class func convertStringToArray(text: String) -> NSMutableArray {
        if let data = text.data(using: String.Encoding.utf8) {
            do
            {
                let json : NSArray = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! NSArray
                return NSMutableArray(array: json)
            }
            catch
            {
                print("error")
            }
        }
        return NSMutableArray()
    }
    class func Set_notification_token_ID(t_id: String)
    {
        if Platform.isSimulator
        {
            UserDefaults.standard.setValue("66366F8D72F630F9D1DBB0BC29C2540B46BAAE7990D5B25F08B0600EFF8F0191", forKey: "token_id")
            UserDefaults.standard.synchronize()
        }
        else
        {
            UserDefaults.standard.setValue(t_id, forKey: "token_id")
            UserDefaults.standard.synchronize()
        }
    }
    class func get_notification_token_ID() -> String
    {
        if Platform.isSimulator
        {
            return "66366F8D72F630F9D1DBB0BC29C2540B46BAAE7990D5B25F08B0600EFF8F0191"
        }
        else
        {
            if UserDefaults.standard.object(forKey: "token_id") == nil
            {
                return ""
            }
            else
            {
                return UserDefaults.standard.value(forKey: "token_id") as! String
            }
            
        }
    }
    class func Set_notification_token_ID_New(t_id: String)
    {
        if Platform.isSimulator
        {
            UserDefaults.standard.setValue("66366F8D72F630F9D1DBB0BC29C2540B46BAAE7990D5B25F08B0600EFF8F0191", forKey: "token_id_new")
            UserDefaults.standard.synchronize()
        }
        else
        {
            UserDefaults.standard.setValue(t_id, forKey: "token_id_new")
            UserDefaults.standard.synchronize()
        }
    }
    class func get_notification_token_ID_New() -> String
    {
        if Platform.isSimulator
        {
            return "66366F8D72F630F9D1DBB0BC29C2540B46BAAE7990D5B25F08B0600EFF8F0191"
        }
        else
        {
            if UserDefaults.standard.object(forKey: "token_id_new") == nil
            {
                return ""
            }
            else
            {
                return UserDefaults.standard.value(forKey: "token_id_new") as! String
            }
            
        }
    }
    class func Set_UUID(UUID: String)
    {
        if Platform.isSimulator
        {
            UserDefaults.standard.setValue("66366F8D72F630F9D1DBB0BC29C2540B46BAAE7990D5B25", forKey: "set_uuid")
            UserDefaults.standard.synchronize()
        }
        else
        {
            UserDefaults.standard.setValue(UUID, forKey: "set_uuid")
            UserDefaults.standard.synchronize()
        }
    }
    class func Get_UUID() -> String
    {
        if Platform.isSimulator
        {
            return "66366F8D72F630F9D1DBB0BC29C2540B46BAAE7990D5B25"
        }
        else
        {
            if UserDefaults.standard.object(forKey: "set_uuid") == nil
            {
                return ""
            }
            else
            {
                return UserDefaults.standard.value(forKey: "set_uuid") as! String
            }
            
        }
    }
    class func Set_UUID_New(UUID: String)
    {
        if Platform.isSimulator
        {
            UserDefaults.standard.setValue("66366F8D72F630F9D1DBB0BC29C2540B46BAAE7990D5B25", forKey: "set_uuid_new")
            UserDefaults.standard.synchronize()
        }
        else
        {
            UserDefaults.standard.setValue(UUID, forKey: "set_uuid_new")
            UserDefaults.standard.synchronize()
        }
    }
    
    class func Get_UUID_New() -> String
    {
        if Platform.isSimulator
        {
            return "66366F8D72F630F9D1DBB0BC29C2540B46BAAE7990D5B25"
        }
        else
        {
            if UserDefaults.standard.object(forKey: "set_uuid_new") == nil
            {
                return ""
            }
            else
            {
                return UserDefaults.standard.value(forKey: "set_uuid_new") as! String
            }
        }
    }
    
    // HITI
    
    class func Parse_local_json_file(file_name : String) -> Any
    {
        let path =  Bundle.main.path(forResource: file_name, ofType: "json")
        let jsonData = try? NSData(contentsOfFile: path!, options: NSData.ReadingOptions.mappedIfSafe)
        let jsonResult: Any = try! JSONSerialization.jsonObject(with: jsonData! as Data, options: JSONSerialization.ReadingOptions.mutableContainers)
        return jsonResult
    }
    
    //MARK: Date functions
    
    class func String_from_base64_encoded(str : String) -> String
    {
        guard let data = Data(base64Encoded: str)
            else {
                return "String not encoded"
        }
        
        return String(data: data, encoding: .utf8)!
    }
    class func LocalTimeZoneToServerTimeZone(LocalTimeZone : NSTimeZone, ServerTimeZone : NSTimeZone, date : String , time : String , formatter : String) -> String
    {
        let date = date
        let time = time
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm"
        
        let date_time_string = date + " " + time
        let date_str = dateFormatter.date(from: date_time_string)
        let timeZone1 = ServerTimeZone
        let localTimeZone = LocalTimeZone
        let timeZone1Interval = timeZone1.secondsFromGMT(for: date_str!)
        let deviceTimeZoneInterval = localTimeZone.secondsFromGMT(for: date_str!)
        
        let timeInterval =  Double(timeZone1Interval - deviceTimeZoneInterval)
        
        let originalDate =  Date(timeInterval: timeInterval , since: date_str!)
        let dateFormater : DateFormatter = DateFormatter()
        dateFormater.dateFormat = formatter
        //        dateFormater.amSymbol = "am"
        //        dateFormater.pmSymbol = "pm"
        return dateFormater.string(from: originalDate)
    }
    
    class func add_shadow_around_view(view : UIView, color : UIColor, radius : Float, opacity : Float)
    {
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.shadowColor = color.cgColor
        view.layer.shadowRadius = CGFloat(radius)
        view.layer.shadowOpacity = opacity
        view.layer.masksToBounds = false
        view.clipsToBounds = false
    }
    class func add_shadow_around_view_Multiple(views : [UIView], color : UIColor, radius : Float, opacity : Float)
    {
        for view in views {
            view.layer.shadowOffset = CGSize(width: 0, height: 0)
            view.layer.shadowColor = color.cgColor
            view.layer.shadowRadius = CGFloat(radius)
            view.layer.shadowOpacity = opacity
            view.layer.masksToBounds = false
            view.clipsToBounds = false
        }
        
    }
    
    class func DecodeCharacctersString(_ string: String) -> NSString
    {
        let path = string.replacingOccurrences(of: "+", with: " ").removingPercentEncoding
        return path! as NSString
    }
    
    class func set_bottom_border_view_new(view : UIView, height : Float, color : UIColor ) // call from viewdidlayoutsubviews
    {
        let border = CALayer()
        let width = CGFloat(height)
        border.borderColor = color.cgColor
        border.frame = CGRect(x: 0, y: view.frame.size.height - width, width:  view.frame.size.width, height: view.frame.size.height)
        border.borderWidth = width
        view.layer.addSublayer(border)
        view.layer.masksToBounds = true
    }
    
    
    
    class func ShowNodataView(tableview : UITableView , msg : String)
    {
        let noDataLabel: UILabel     = UILabel(frame: CGRect(x: 0, y: 0, width: tableview.bounds.size.width, height: tableview.bounds.size.height))
        noDataLabel.text          = msg
        noDataLabel.textColor     = UIColor.black
        noDataLabel.textAlignment = .center
        tableview.backgroundView  = noDataLabel
    }
    
    
    class func Convert_date_format(date1: String, format1: String, format2: String) -> String
    {
        
        let formatter = DateFormatter()
        formatter.dateFormat = format1
        let final_date1 : Date = formatter.date(from: date1)!
        
        formatter.dateFormat = format2
        let final_date2 : String = formatter.string(from: final_date1)
        return final_date2
        
    }
    
    
    class func daysBetweenDates(startDate: Date, endDate: Date) -> Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([Calendar.Component.day], from: startDate, to: endDate)
        return components.day!
    }
    
    class func get_today_date() -> NSString
    {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        let final_date : NSString = formatter.string(from: date) as NSString
        return final_date
    }
    class func get_today_date123() -> NSString
    {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        let final_date : NSString = formatter.string(from: date) as NSString
        return final_date
    }
    class func get_today_date_informat_mmm_d_yyyy() -> NSString
    {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM, dd YYYY"
        let final_date : NSString = formatter.string(from: date) as NSString
        return final_date
    }
    class func get_current_time() -> NSString
    {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm:ssa"
        formatter.amSymbol = "am"
        formatter.pmSymbol = "pm"
        let final_time : NSString = formatter.string(from: date) as NSString
        return final_time
    }
    class func get_current_time_HH_mm() -> NSString
    {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        let final_time : NSString = formatter.string(from: date) as NSString
        return final_time
    }
    class func WeekDays_From_Date(date : Date)-> NSString
    {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE"
        return dateFormatter.string(from: date) as NSString
    }
    class func stringFromDate(date : Date ,Format :NSString )-> NSString
    {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = Format as String
        let theDate = dateFormat.string(from: date as Date)
        return theDate as NSString
    }
    class func dateFromStr(dateStr : String ,Format :NSString )-> Date
    {
        let formatter = DateFormatter()
        formatter.dateFormat = Format as String
        // formatter.locale = Locale.current
        formatter.timeZone = TimeZone(secondsFromGMT: 0) //TimeZone(name: "UTC")
        
        let date : Date = formatter.date(from: dateStr as String)! as Date
        return date
    }
    
    class func Remove_single_double_quotes_InString(rawstring: String) -> String
    {
        var resultstr = rawstring.replacingOccurrences(of: "'", with: "")
        resultstr = resultstr.replacingOccurrences(of: "\"", with: "")
        
        return resultstr
    }
    
    class func RemoveSpacesInString(rawstring: NSString) -> NSString
    {
        var resultstr = rawstring.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines) as NSString
        resultstr = resultstr.replacingOccurrences(of: " ", with: "") as NSString
        return resultstr
    }
    
    class func imageWithImage(image:UIImage, scaledToSize newSize:CGSize) -> UIImage{
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        image.draw(in: CGRect.init(x: 0, y: 0, width: newSize.width, height:newSize.height))
        let newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return newImage
    }
    
    class func setborder(view : UIView, bordercolor : UIColor , borderwidth : CGFloat)
    {
        view.layer.borderColor = bordercolor.cgColor
        view.layer.borderWidth = borderwidth
        view.layer.masksToBounds = true
    }
    // MARK: - Set single border
    //    class func Setbottomborderofview(view : UIView ,frame : CGRect , bordercolor : UIColor)
    //    {
    //        let bottomlayer : CALayer = CALayer()
    //        bottomlayer.frame = frame
    //        bottomlayer.backgroundColor = bordercolor.cgColor
    //        view.layer.addSublayer(bottomlayer)
    //    }
    class func setcornerRadius(view : UIView, cornerradius : CGFloat)
    {
        view.layer.cornerRadius = cornerradius
        view.layer.masksToBounds = true
    }
    
    class func nullToNil(value : AnyObject?) -> AnyObject? {
        if value is NSNull {
            return " "  as AnyObject
        } else {
            return value
        }
    }
    
    class func notPrettyString(from object: Any) -> String? {
        if let objectData = try? JSONSerialization.data(withJSONObject: object, options: JSONSerialization.WritingOptions(rawValue: 0)) {
            let objectString = String(data: objectData, encoding: .utf8)
            return objectString
        }
        return nil
    }
    
    
    class func LocalTimeZoneToServerTimeZone_order(LocalTimeZone : NSTimeZone, ServerTimeZone : NSTimeZone, date : String , time : String , formatter : String) -> String
    {
        let date = date
        let time = time
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formatter
        var date_time_string : String = String()
        
        if time == "" && date.length > 0
        {
            dateFormatter.dateFormat = formatter
            date_time_string = date
        }
        else if date == "" && time.length > 0
        {
            dateFormatter.dateFormat = formatter
            date_time_string = time
        }
        else if date.length > 0 && time.length > 0
        {
            dateFormatter.dateFormat = formatter
            date_time_string = date + " " + time
        }
        else
        {
            date_time_string = ""
        }
        
        if date.length == 0 && time.length == 0
        {
            return ""
        }
        else
        {
            let date_str = dateFormatter.date(from: date_time_string)
            let timeZone1 = ServerTimeZone
            let localTimeZone = LocalTimeZone
            let timeZone1Interval = timeZone1.secondsFromGMT(for: date_str!)
            let deviceTimeZoneInterval = localTimeZone.secondsFromGMT(for: date_str!)
            
            let timeInterval =  Double(timeZone1Interval - deviceTimeZoneInterval)
            
            let originalDate =  Date(timeInterval: timeInterval , since: date_str!)
            let dateFormater : DateFormatter = DateFormatter()
            dateFormater.dateFormat = formatter
            return dateFormater.string(from: originalDate)
        }
    }
    class func createGradientLayer(view : UIView , colorarray :[Any] )
    {
        let gradientLayer: CAGradientLayer! = CAGradientLayer()
        gradientLayer.frame = view.bounds
        
        
        gradientLayer.colors = colorarray
        //gradientLayer.locations = locations as [NSNumber]?
        
        view.layer.insertSublayer(gradientLayer, at: 0)
        // view.layer.addSublayer(gradientLayer)
    }
    
    class func createGradientImage(view : UIView , colorarray :[Any] ) -> UIImage
    {
        let gradient = CAGradientLayer()
        
        let squareFrame = CGRect(origin: view.bounds.origin, size: CGSize(width:view.bounds.size.width, height: view.bounds.size.height))
        gradient.frame = squareFrame
        
        gradient.colors = colorarray
        // gradient.startPoint = CGPoint.init(x: 1.0, y: 0.0)
        //  gradient.endPoint = CGPoint.init(x: 1.0, y: 0.5)
        UIGraphicsBeginImageContext(gradient.bounds.size)
        gradient.render(in: UIGraphicsGetCurrentContext()!)
        let gradientImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return gradientImage!
    }
    
    
    
}

