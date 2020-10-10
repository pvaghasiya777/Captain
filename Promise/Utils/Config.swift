
import Foundation
import UIKit
struct Config
{
    static let Appname = "Promise"
    static let App_Alert_Logo = UIImage(named: "ic_splashscreen")
    static let StoryBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    static let AndroidLink : String = "https://web.whatsapp.com/"
    static let IosLink : String =  "https://web.whatsapp.com/"
    static let IosSharingText : String =  "https://web.whatsapp.com/"
    static let App_Date_Format : String = "dd/MM/yyyy"
    static let Server_Date_Format : String = "dd/MM/yyyy"
    
    
   static let boderColor1 = UIColor(red: 0.80, green: 0.80, blue: 0.80, alpha: 1.00)
   static let boderColor = UIColor(red: 0.97, green: 0.23, blue: 0.26, alpha: 1.00)
   static let bgColor = UIColor(red: 0.90, green: 0.95, blue: 1.00, alpha: 1.00)
   static let cellSelection = UIColor(red: 1.00, green: 0.95, blue: 0.95, alpha: 1.00)
}
struct App_Colors {
    static let ThemeColor = UIColor(hexString:"2B3990")
    static let ThemeBackgroundColor = UIColor(hexString:"F6FAFF")
    static let ThemeFontColor = UIColor(hexString: "6d8ab0")
    static let DarkGray = UIColor(hexString: "616161")
    static let ThemTintColor = UIColor(hexString: "45B4A1")
    static let ThemBlue = UIColor(hexString: "353283")
    static let White = UIColor.white
    static let Black = UIColor.black
    static let boderColor = UIColor(red: 0.97, green: 0.23, blue: 0.26, alpha: 1.00)
}
extension Notification.Name
{
    static let selected_Filter = Notification.Name(rawValue: "selected_Filter")
}
struct DeviceInfo
{
    static let screenwidth = UIScreen.main.bounds.size.width
    static let screenheight = UIScreen.main.bounds.size.height
    static let UUID = UIDevice.current.identifierForVendor!.uuidString
    static let iphone4 = UIScreen.main.bounds.size.height == 480
    static let iphone5 = UIScreen.main.bounds.size.height == 568
    static let iphone6plus = UIScreen.main.bounds.size.height == 736
    static let iphone7 = UIScreen.main.bounds.size.height == 667
    static let iphone7Plus = UIScreen.main.bounds.size.height == 736
    static let iphoneSE = UIScreen.main.bounds.size.height == 568
    static let iphoneX = UIScreen.main.bounds.size.height == 812
    static let iphone6 = UIScreen.main.bounds.size.height == 667
    static let iphoneXsMax = UIScreen.main.bounds.size.height == 896

    static let iPadPro = UIScreen.main.bounds.size.height == 1366.0
    static let iPadPro_10_5 = UIScreen.main.bounds.size.height == 1112.0
    static let iPadPro_9_7 = UIScreen.main.bounds.size.height == 1024.0
    static let iPad_Air_2 = UIScreen.main.bounds.size.height == 1024.0
    static let iPad_Air = UIScreen.main.bounds.size.height == 1024.0
    static let iPad_5_Gen = UIScreen.main.bounds.size.height == 1024.0
    static let systemVersion =  UIDevice.current.systemVersion
    static let model =  UIDevice.current.model
    
}
struct Api_Urls
{
    static let BASE_URL = "http://demo.prime4promise.com:8000/"
    static let DocumentBASE_URL = "http://demo.prime4promise.com"
    static let GET_API_LOGIN = BASE_URL + "accounts/login/"
    static let GET_API_LOGOUT = BASE_URL + "accounts/logout/"
    //GET Home Page API
    static let GET_API_getPermission = BASE_URL + "get_permissions/"
    static let GET_API_onSiteStatus = BASE_URL + "packing/packages/"
    static let GET_API_userDetail = BASE_URL + "accounts/user_preferences/"
    static let GET_API_DDisciplines = BASE_URL + "accounts/disciplines/"
    static let GET_API_plReports = BASE_URL + "packing/input/"
    static let GET_API_packingList = BASE_URL + "packing/packing_list/"
    static let GET_API_drawing = BASE_URL + "drawing/"
    static let GET_API_Document = BASE_URL + "masters/folders/"
    //Master API
    static let GET_API_masterCountry = BASE_URL + "masters/country/"
    static let GET_API_masterAddress = BASE_URL + "masters/address/"
    static let GET_API_masterPurchaselist = BASE_URL + "masters/purchase_list/"
    static let GET_API_masterPurchase = BASE_URL + "masters/purchase/"
    static let GET_API_masterKOP = BASE_URL + "masters/package/"
    static let GET_API_masterProject = BASE_URL + "masters/project/"
    static let GET_API_masterEmployee = BASE_URL + "masters/employee/"
    static let GET_API_masterVendor = BASE_URL + "masters/vendor/"
    static let GET_API_masterPOType = BASE_URL + "masters/potype/"
    static let GET_API_masterCurrency = BASE_URL + "masters/currency/"
    static let GET_API_masterUOM = BASE_URL + "masters/uom/"
    //Report Filter API
    static let GET_API_filterProject = BASE_URL + "reporting/projects/"
    static let GET_API_filterPurchaseOrder = BASE_URL + "reporting/purchase_orders/"
    static let GET_API_filterStrucher = BASE_URL + "reporting/structures/"
    static let GET_API_filterPackingList = BASE_URL + "reporting/packing_lists/"
    static let GET_API_filterMark = BASE_URL + "reporting/marks/"
    //Report Section
    static let GET_API_DetailFigureReport = BASE_URL + "reporting/detail_figure_report/"
    static let GET_API_MarkWiseReport = BASE_URL + "reporting/markwise_report/"
    static let GET_API_MarkCummReport = BASE_URL + "reporting/mark_cumm_report/"
    static let GET_API_PackagWiseReport = BASE_URL + "reporting/package_report/"
    static let GET_API_PackingListReport = BASE_URL + "reporting/pl_report/"
    static let GET_API_POPositionReport = BASE_URL + "reporting/po_report/"
    static let GET_API_IdentCodeWiseReport = BASE_URL + "reporting/ident_report/"
    static let GET_API_StrucherWiseReport = BASE_URL + "reporting/structure_report/"
    static let GET_API_GroupStrucherWiseReport = BASE_URL + "reporting/group_report/"
    static let GET_API_SummaryReport = BASE_URL + "reporting/summary_report/"
    //Filter API
    static let GET_API_onsiteFilter = BASE_URL + "packing/packages_filters/"
    //Account Update
    static let GET_API_Disciplines = BASE_URL + "accounts/disciplines/"
    //DashBoard Gauge API
    static let GET_API_DashBoardProjectWise = BASE_URL + "reporting/project_wise/"
    static let GET_API_DashBoardPurchaseWise = BASE_URL + "reporting/purchase_order_wise/"
    static let GET_API_DashBoardStrucherWise = BASE_URL + "reporting/structure_wise/"
    static let GET_API_DashBoardPackinglistWise = BASE_URL + "reporting/packing_list_wise/"
    static let GET_API_DashBoardMarkWise = BASE_URL + "reporting/mark_wise/"
}
//-------------------------Filter Param Section--------------//
struct Filter_packingList {
    static let GET_Filter_Project_Name = "project_id__name"
    static let GET_Filter_Vendor_Name = "vendor_id__name"
    static let GET_Filter_Purchase_Order = "purchase_id"
    static let GET_Filter_Group_name = "shop_drawing_id__group_name"
    static let GET_Filter_Strucher_Id = "shop_drawing_id__structure_id"
    static let GET_Filter_PL_Number = "pl_input_id__name"
    static let GET_Filter_Package_Name = "number"
    static let GET_Filter_Approval_Status = "approve_status"
    static let GET_Filter_Status = "status"
    static let GET_Filter_Is_Released = "is_released"
    static let GET_Filter_Is_Group_Strucher = "shop_drawing_id__is_group_structure"
    static let GET_Filter_Is_Active = "is_active"
}
struct Filter_shopDrawing {
    static let GET_Filter_Project_Name = "project_id__name"
    static let GET_Filter_Purchase_Order = "purchase_id"
    static let GET_Filter_Group_Name = "group_name"
    static let GET_Filter_Doc_Status = "doc_status"
    static let GET_Filter_Strucher_Id = "structure_id"
    static let GET_Filter_Approval_Status = "approve_status"
    static let GET_Filter_Is_PL_Input_Created = "pl_input_created"
    static let GET_Filter_Is_Group_Strucher = "is_group_structure"
    static let GET_Filter_Is_Active = "is_active"
}
struct Filter_onSite_Shipped{
    static let GET_Filter_ProjectName = "pl_header_id__project_id__name"
    static let GET_Filter_VendorName = "pl_header_id__vendor_id__name"
    static let GET_Filter_PurchaseOrderNumber = "pl_header_id__purchase_id__number"
    static let GET_Filter_PLNumber = "number"
    static let GET_Filter_IsReleased = "is_released"
    static let GET_Filter_IsShipped = "shipped"
    static let GET_Filter_Isonsite = "on_site"
    static let GET_Filter_IsActive = "is_active"
}
struct Filter_packages {
    static let GET_Filter_Project_Name = "project_id__name"
    static let GET_Filter_VendorName = "vendor_id__name"
    static let GET_Filter_PurchaseOrder = "purchase_id"
    static let GET_Filter_Group_name = "shop_drawing_id__group_name"
    static let GET_Filter_Strucher_Id = "shop_drawing_id__structure_id"
    static let GET_Filter_Approval_Status = "approve_status"
    static let GET_Filter_status = "status"
    static let GET_Filter_Is_PLInput_Genrated = "pl_generated"
    static let GET_Filter_Is_Group_Strucher = "shop_drawing_id__is_group_structure"
    static let GET_Filter_Is_Active = "is_active"
}
struct Filter_project {
    static let GET_Filter_Project_Code = "code"
    static let GET_Filter_Project_Name = "name"
    static let GET_Filter_Site_Location = "site_location"
    static let GET_Filter_Manager_Name = "manager_id__name"
    static let GET_Filter_Refrences = "reference"
    static let GET_Filter_Is_Shipper = "is_shipper"
    static let GET_Filter_Is_Active = "is_active"
}
struct Second_Filter_Value {
    static let GET_Filter_icontains = "__icontains"
    static let GET_Filter_istartswith = "__istartswith"
    static let GET_Filter_Equal = "__iexact"
}
struct Multiple_Filter_Value {
    static let GET_PurchaseOrder = "po_no__in"
    static let GET_Strucher = "structure__in"
    static let GET_PackingList = "pl_number__in"
    static let GET_Mark = ""
}
