import UIKit

class DEFAULTS: NSObject {
    
    class func Set_UserID(userID : Int) {
        UserDefaults.standard.set(userID, forKey: "userID")
        UserDefaults.standard.synchronize()
    }
    class func Get_UerID() -> String {
        return (UserDefaults.standard.value(forKey: "userID") != nil) ? String(describing: (UserDefaults.standard.value(forKey: "userID")!)) : ""
    }
    class func Set_ProjectID(userID : String) {
        UserDefaults.standard.set(userID, forKey: "ProjectID")
        UserDefaults.standard.synchronize()
    }
    class func Get_ProjectID() -> String {
        return (UserDefaults.standard.value(forKey: "ProjectID") != nil) ? String(describing: (UserDefaults.standard.value(forKey: "ProjectID")!)) : "1"
    }
    class func Set_Revision_Count(Count : Int) {
        UserDefaults.standard.set(Count, forKey: "Revision_Count")
        UserDefaults.standard.synchronize()
    }
    class func Get_Revision_Count() -> Int {
        return (UserDefaults.standard.value(forKey: "Revision_Count") != nil) ? (UserDefaults.standard.value(forKey: "Revision_Count")! as! Int) : 0
    }
    class func Is_User_LoggedIn() -> Bool {
        return UserDefaults.standard.value(forKey: "is_login") == nil ? false : UserDefaults.standard.value(forKey: "is_login") as! Bool
    }
    class func Set_Login(login_status: Bool) {
        UserDefaults.standard.setValue(login_status, forKey: "is_login")
        UserDefaults.standard.synchronize()
    }
    class func Get_TOKEN() -> String
    {
        return (UserDefaults.standard.value(forKey: "token") != nil) ? (UserDefaults.standard.value(forKey: "token") as! String) : ""
    }
    class func set_TOKEN(token : String) {
        UserDefaults.standard.set(token, forKey: "token")
        UserDefaults.standard.synchronize()
    }
    class func Get_View_Filter() -> NSDictionary {
        if UserDefaults.standard.value(forKey: "View_Filter") != nil {
            return UserDefaults.standard.value(forKey: "View_Filter") as! NSDictionary
        } else {
            return NSDictionary()
        }
    }
    class func Set_View_Filter(arr_Places : NSDictionary) {
        UserDefaults.standard.set(arr_Places, forKey: "View_Filter")
        UserDefaults.standard.synchronize()
    }
    
    
    
  //***********************SET Master Data*********************
    class func Set_UserPermission(UserData : GetPermissionModel) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(UserData) {
            UserDefaults.standard.set(encoded, forKey: "UserPermission")
            UserDefaults.standard.synchronize()
        }
    }
    class func Get_UserPermission() -> GetPermissionModel {
        var PermissionData : GetPermissionModel?
        if let savedPerson = UserDefaults.standard.object(forKey: "UserPermission") as? Data {
            let decoder = JSONDecoder()
            if let loadedPerson = try? decoder.decode(GetPermissionModel.self, from: savedPerson) {
                PermissionData = loadedPerson
            }
        }
        return PermissionData!
    }
    class func Set_AddressStruct(UserData : [MasterAddressModel]) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(UserData) {
            UserDefaults.standard.set(encoded, forKey: "Set_AddressStruct")
            UserDefaults.standard.synchronize()
        }
    }
    class func Get_AddressStruct() -> [MasterAddressModel] {
        var PermissionData : [MasterAddressModel]?
        if let savedPerson = UserDefaults.standard.object(forKey: "Set_AddressStruct") as? Data {
            let decoder = JSONDecoder()
            if let loadedPerson = try? decoder.decode([MasterAddressModel].self, from: savedPerson) {
                PermissionData = loadedPerson
            }
        }
        return PermissionData!
    }
    class func Set_MasterCoutry(CountryData : [MasterCountryModel]) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(CountryData) {
            UserDefaults.standard.set(encoded, forKey: "MasterCountryData")
            UserDefaults.standard.synchronize()
        }
    }
    class func Get_MasterCoutry() -> [MasterCountryModel] {
        var CountryData : [MasterCountryModel]?
        if let savedPerson = UserDefaults.standard.object(forKey: "MasterCountryData") as? Data {
            let decoder = JSONDecoder()
            if let loadedPerson = try? decoder.decode([MasterCountryModel].self, from: savedPerson) {
                CountryData = loadedPerson
            }
        }
        return CountryData!
    }
    class func Set_MasterPurchase(PurchaseData : [MasterPurchaseModel]) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(PurchaseData) {
            UserDefaults.standard.set(encoded, forKey: "PurchaseData")
            UserDefaults.standard.synchronize()
        }
    }
    class func Get_MasterPurchase() -> [MasterPurchaseModel] {
        var PermissionData : [MasterPurchaseModel]?
        if let savedPerson = UserDefaults.standard.object(forKey: "PurchaseData") as? Data {
            let decoder = JSONDecoder()
            if let loadedPerson = try? decoder.decode([MasterPurchaseModel].self, from: savedPerson) {
                PermissionData = loadedPerson
            }
        }
        return PermissionData!
    }
    class func Set_MasterKindOfPackage(KOPData : [MasterKindOfPackageModel]) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(KOPData) {
            UserDefaults.standard.set(encoded, forKey: "KindOfPackage")
            UserDefaults.standard.synchronize()
        }
    }
    class func Get_MasterKindOfPackage() -> [MasterKindOfPackageModel] {
        var PermissionData : [MasterKindOfPackageModel]?
        if let savedPerson = UserDefaults.standard.object(forKey: "KindOfPackage") as? Data {
            let decoder = JSONDecoder()
            if let loadedPerson = try? decoder.decode([MasterKindOfPackageModel].self, from: savedPerson) {
                PermissionData = loadedPerson
            }
        }
        return PermissionData!
    }
    class func Set_MasterProject(ProjectData : [MasterProjectModel]) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(ProjectData) {
            UserDefaults.standard.set(encoded, forKey: "Master_Project")
            UserDefaults.standard.synchronize()
        }
    }
    class func Get_MasterProject() -> [MasterProjectModel] {
        var MasterProjectData : [MasterProjectModel]?
        if let savedPerson = UserDefaults.standard.object(forKey: "Master_Project") as? Data {
            let decoder = JSONDecoder()
            if let loadedPerson = try? decoder.decode([MasterProjectModel].self, from: savedPerson) {
                MasterProjectData = loadedPerson
            }
        }
        return MasterProjectData!
    }
    class func Set_MasterEmployee(ProjectData : [EmployeeModel]) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(ProjectData) {
            UserDefaults.standard.set(encoded, forKey: "Master_Employee")
            UserDefaults.standard.synchronize()
        }
    }
    class func Get_MasterEmployee() -> [EmployeeModel] {
        var MasterProjectData : [EmployeeModel]?
        if let savedPerson = UserDefaults.standard.object(forKey: "Master_Employee") as? Data {
            let decoder = JSONDecoder()
            if let loadedPerson = try? decoder.decode([EmployeeModel].self, from: savedPerson) {
                MasterProjectData = loadedPerson
            }
        }
        return MasterProjectData!
    }
    class func Set_MasterVendor(ProjectData : [VendorModel]) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(ProjectData) {
            UserDefaults.standard.set(encoded, forKey: "Master_Vendor")
            UserDefaults.standard.synchronize()
        }
    }
    class func Get_MasterVendor() -> [VendorModel] {
        var MasterProjectData : [VendorModel]?
        if let savedPerson = UserDefaults.standard.object(forKey: "Master_Vendor") as? Data {
            let decoder = JSONDecoder()
            if let loadedPerson = try? decoder.decode([VendorModel].self, from: savedPerson) {
                MasterProjectData = loadedPerson
            }
        }
        return MasterProjectData!
    }
    class func Set_MasterPOType(ProjectData : [POTypeModel]) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(ProjectData) {
            UserDefaults.standard.set(encoded, forKey: "Master_POType")
            UserDefaults.standard.synchronize()
        }
    }
    class func Get_MasterPOType() -> [POTypeModel] {
        var MasterProjectData : [POTypeModel]?
        if let savedPerson = UserDefaults.standard.object(forKey: "Master_POType") as? Data {
            let decoder = JSONDecoder()
            if let loadedPerson = try? decoder.decode([POTypeModel].self, from: savedPerson) {
                MasterProjectData = loadedPerson
            }
        }
        return MasterProjectData!
    }
    class func Set_MasterCurrency(ProjectData : [CurrencyModel]) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(ProjectData) {
            UserDefaults.standard.set(encoded, forKey: "Master_Currency")
            UserDefaults.standard.synchronize()
        }
    }
    class func Get_MasterCurrency() -> [CurrencyModel] {
        var MasterProjectData : [CurrencyModel]?
        if let savedPerson = UserDefaults.standard.object(forKey: "Master_Currency") as? Data {
            let decoder = JSONDecoder()
            if let loadedPerson = try? decoder.decode([CurrencyModel].self, from: savedPerson) {
                MasterProjectData = loadedPerson
            }
        }
        return MasterProjectData!
    }
    class func Set_MasterUOM(ProjectData : [UOMModel]) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(ProjectData) {
            UserDefaults.standard.set(encoded, forKey: "MasterUOM")
            UserDefaults.standard.synchronize()
        }
    }
    class func Get_MasterUOM() -> [UOMModel] {
        var MasterProjectData : [UOMModel]?
        if let savedPerson = UserDefaults.standard.object(forKey: "MasterUOM") as? Data {
            let decoder = JSONDecoder()
            if let loadedPerson = try? decoder.decode([UOMModel].self, from: savedPerson) {
                MasterProjectData = loadedPerson
            }
        }
        return MasterProjectData!
    }
//    ******Set Filter Data**********
    class func Set_FilterProject(FilterData : [FilterProjectModel]) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(FilterData) {
            UserDefaults.standard.set(encoded, forKey: "Filter_Project")
            UserDefaults.standard.synchronize()
        }
    }
    class func Get_FilterProject() -> [FilterProjectModel] {
        var FilterData : [FilterProjectModel]?
        if let savedPerson = UserDefaults.standard.object(forKey: "Filter_Project") as? Data {
            let decoder = JSONDecoder()
            if let loadedPerson = try? decoder.decode([FilterProjectModel].self, from: savedPerson) {
                FilterData = loadedPerson
            }
        }
        return FilterData! 
    }
    class func Set_FilterPurchaseOrder(FilterData : [FilterPurchaseOrderModel]) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(FilterData) {
            UserDefaults.standard.set(encoded, forKey: "Filter_PurchaseOrder")
            UserDefaults.standard.synchronize()
        }
    }
    class func Get_FilterPurchaseOrder() -> [FilterPurchaseOrderModel] {
        var FilterData : [FilterPurchaseOrderModel]?
        if let savedPerson = UserDefaults.standard.object(forKey: "Filter_PurchaseOrder") as? Data {
            let decoder = JSONDecoder()
            if let loadedPerson = try? decoder.decode([FilterPurchaseOrderModel].self, from: savedPerson) {
                FilterData = loadedPerson
            }
        }
        return FilterData!
    }
    class func Set_FilterStrucher(FilterData : [FilterStructureModel]) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(FilterData) {
            UserDefaults.standard.set(encoded, forKey: "Filter_Strucher")
            UserDefaults.standard.synchronize()
        }
    }
    class func Get_FilterStrucher() -> [FilterStructureModel] {
        var FilterData : [FilterStructureModel]?
        if let savedPerson = UserDefaults.standard.object(forKey: "Filter_Strucher") as? Data {
            let decoder = JSONDecoder()
            if let loadedPerson = try? decoder.decode([FilterStructureModel].self, from: savedPerson) {
                FilterData = loadedPerson
            }
        }
        return FilterData!
    }
    class func Set_FilterPackingList(FilterData : [FilterPackingListModel]) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(FilterData) {
            UserDefaults.standard.set(encoded, forKey: "Filter_PackingList")
            UserDefaults.standard.synchronize()
        }
    }
    class func Get_FilterPackingList() -> [FilterPackingListModel] {
        var FilterData : [FilterPackingListModel]?
        if let savedPerson = UserDefaults.standard.object(forKey: "Filter_PackingList") as? Data {
            let decoder = JSONDecoder()
            if let loadedPerson = try? decoder.decode([FilterPackingListModel].self, from: savedPerson) {
                FilterData = loadedPerson
            }
        }
        return FilterData!
    }
    class func Set_FilterMark(FilterData : [MarkResult]) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(FilterData) {
            UserDefaults.standard.set(encoded, forKey: "Filter_Mark")
            UserDefaults.standard.synchronize()
        }
    }
    class func Get_FilterMark() -> [MarkResult] {
        var FilterData : [MarkResult]?
        if let savedPerson = UserDefaults.standard.object(forKey: "Filter_Mark") as? Data {
            let decoder = JSONDecoder()
            if let loadedPerson = try? decoder.decode([MarkResult].self, from: savedPerson) {
                FilterData = loadedPerson
            }
        }
        return FilterData!
    }
    class func Set_Discipline(Data : [DefaultDisciplineModel]) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(Data) {
            UserDefaults.standard.set(encoded, forKey: "Discipline")
            UserDefaults.standard.synchronize()
        }
    }
    class func Get_Discipline() -> [DefaultDisciplineModel] {
        var Data : [DefaultDisciplineModel]?
        if let savedPerson = UserDefaults.standard.object(forKey: "Discipline") as? Data {
            let decoder = JSONDecoder()
            if let loadedPerson = try? decoder.decode([DefaultDisciplineModel].self, from: savedPerson) {
                Data = loadedPerson
            }
        }
        return Data!
    }
}

