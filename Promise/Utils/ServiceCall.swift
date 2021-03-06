//
//  ServiceCall.swift
//  Copyright © 2019 Meet PC. All rights reserved.
//

import UIKit
import Alamofire
import KRProgressHUD
class ServiceCall: NSObject
{
    static let shareInstance = ServiceCall()
    static var id_Strc = String()
    func Get_getProject(ViewController: UIViewController,Api_Str : String,Param : Parameters) {
        if AppDelegate.NetworkRechability(){
            Utils.ShowActivityIndicator(message: Strings.kLoading)
            let Project_VC = ViewController as! ProjectVC
            AFWrapper.requestGETURL_WithParameter_ReturnStatuscode(Api_Str, headers: ["Authorization": DEFAULTS.Get_TOKEN()], params: Param, success: { (responseObject, statusCode, JSONObject) in
                KRProgressHUD.dismiss()
                if statusCode == 200 {
                    let result = try? JSONDecoder().decode([MasterProjectModel].self, from: responseObject)
                    Project_VC.arrProject = result!
                    Project_VC.lbl_ShowPageNum.text = "Showing \((result!.count == 0) ? 0 : 1) to \(result!.count) of \(result!.count) results"
                    Project_VC.CollectionView_Project.reloadData()
                    Project_VC.tbl_Project.reloadData()
                }else {
                    KRProgressHUD.dismiss()
                    Utils.showToastWithMessageAtCenter(message: Strings.kSomethingWentWrong)
                }
            })
            { (error,statuscode) in
                KRProgressHUD.dismiss()
                print(error.localizedDescription)
            }
        }else {
            Utils.showToastWithMessageAtCenter(message: Strings.kNoInternetMessage)
        }
    }
    func Get_getDrawing(ViewController: UIViewController,param : Parameters) {
        if AppDelegate.NetworkRechability(){
            Utils.ShowActivityIndicator(message: Strings.kLoading)
            let Drawing_VC = ViewController as! DrawingVC
            AFWrapper.requestGETURL_JSON(Api_Urls.GET_API_drawing, headers:["Authorization": DEFAULTS.Get_TOKEN()], params: param, success: { (responseObject,statusCode) in
                do {
                    KRProgressHUD.dismiss()
                    if statusCode == 200 {
                        let results = try JSONDecoder().decode(DrawingModel.self, from: responseObject)
                        Drawing_VC.arrDrawing = results.results
                        Drawing_VC.lbl_ShowPageNum_Count.text = "Showing \((results.count == 0) ? 0 : 1) to \(results.results.count) of \(results.count) results"
                        Drawing_VC.tbl_Drawing.reloadData()
                    }else {
                        Utils.showToastWithMessage(message: Strings.kSomethingWentWrongTryAgain)
                    }
                }catch let jsonErr{
                    KRProgressHUD.dismiss()
                    print("json error : \(jsonErr.localizedDescription)")
                }
            })
            { (error) in
                KRProgressHUD.dismiss()
                print(error.localizedDescription)
            }
        }else {
            Utils.showToastWithMessageAtCenter(message: Strings.kNoInternetMessage)
        }
    }
    func Get_getDrawingEdit(ViewController: UIViewController) {
        if AppDelegate.NetworkRechability(){
            Utils.ShowActivityIndicator(message: Strings.kLoading)
            let DrawEdit_VC = ViewController as! DrawineditVC
            AFWrapper.requestGETURL_JSON(Api_Urls.GET_API_drawing + ServiceCall.id_Strc + "/", headers:["Authorization": DEFAULTS.Get_TOKEN()], params: [:], success: { (responseObject,statusCode) in
                do {
                    KRProgressHUD.dismiss()
                    if statusCode == 200 {
                        let results = try JSONDecoder().decode(StructureInformationModel.self, from: responseObject)
                        DrawEdit_VC.arrStructureInfo = [StructureInformationModel](arrayLiteral: results)
                        DrawEdit_VC.arrrejectreasons = [Reject_reasons](results.reject_reasons!)
                        DrawEdit_VC.tbl_RejectionHistory.reloadData()
                        DrawEdit_VC.dataset()
                    }else {
                        Utils.showToastWithMessage(message: Strings.kSomethingWentWrong)
                    }
                }catch let jsonErr{
                    KRProgressHUD.dismiss()
                    print("json error : \(jsonErr.localizedDescription)")
                }
            })
            { (error) in
                KRProgressHUD.dismiss()
                print(error.localizedDescription)
            }
        }else {
            Utils.showToastWithMessageAtCenter(message: Strings.kNoInternetMessage)
        }
    }
    func Get_getPermission() {
        if AppDelegate.NetworkRechability(){
            AFWrapper.requestGETURL_JSON(Api_Urls.GET_API_getPermission, headers:["Authorization": DEFAULTS.Get_TOKEN()], params: [:], success: { (responseObject,statusCode) in
                do {
                    KRProgressHUD.dismiss()
                    if statusCode == 200 {
                        let results = try JSONDecoder().decode(GetPermissionModel.self, from: responseObject)
                        DEFAULTS.Set_UserPermission(UserData: results)
                        DEFAULTS.Set_UserID(userID: DEFAULTS.Get_UserPermission().data!.userDetails!.id!)
                        DEFAULTS.Set_ProjectID(userID: (DEFAULTS.Get_UserPermission().data!.general!.defaultProject != nil) ? String(describing: DEFAULTS.Get_UserPermission().data!.general!.defaultProject!) : "1")
                    }else {
                        Utils.showToastWithMessage(message: Strings.kSomethingWentWrong)
                    }
                }catch let jsonErr{
                    KRProgressHUD.dismiss()
                    print("json error : \(jsonErr.localizedDescription)")
                }
            })
            { (error) in
                KRProgressHUD.dismiss()
                print(error.localizedDescription)
            }
        }else {
            Utils.showToastWithMessageAtCenter(message: Strings.kNoInternetMessage)
        }
    }
    func Get_userDetail(APi_Str:String,ViewController:UIViewController,tag:Int) {
        if AppDelegate.NetworkRechability(){
            Utils.ShowActivityIndicator(message: Strings.kLoading)
            let Update_VC = ViewController as! UpdateProfileVC
            AFWrapper.requestGETURL_WithParameter_ReturnStatuscode(APi_Str, headers: ["Authorization": DEFAULTS.Get_TOKEN()], params: [:], success: { (responseObject, statusCode, JSONObject) in
                KRProgressHUD.dismiss()
                if statusCode == 200 {
                    if tag == 1 {
                        Update_VC.Dic_userDetail = JSONObject.object as! NSDictionary
                        Update_VC.Set_userData()
                    }else {
                        let results = try? JSONDecoder().decode(DefaultDisciplineModel.self, from: responseObject)
                        DEFAULTS.Set_Discipline(Data: [results!])
                    }
                }else {
                    Utils.showToastWithMessageAtCenter(message: (JSONObject.object as! NSDictionary).value(forKey: "detail") as! String)
                }
            })
            { (error,statuscode) in
                KRProgressHUD.dismiss()
                print(error.localizedDescription)
            }
        }else {
            Utils.showToastWithMessageAtCenter(message: Strings.kNoInternetMessage)
        }
    }
    func Get_onSiteStatus(ViewController: UIViewController,API_Str : String,Param : Parameters,tag : Int) {
        if AppDelegate.NetworkRechability(){
            Utils.ShowActivityIndicator(message: Strings.kLoading)
            AFWrapper.requestGETURL_WithParameter_ReturnStatuscode(API_Str, headers: ["Authorization": DEFAULTS.Get_TOKEN()], params: Param, success: { (responseObject, statusCode, JSONObject) in
                KRProgressHUD.dismiss()
                if statusCode == 200 {
                    let Arr_Data : NSMutableArray = NSMutableArray(array: (JSONObject.object as! NSDictionary).value(forKey: "results") as! NSArray)
                    if tag == 0 {
                        let  OnsiteStatus_VC = ViewController as! OnsiteStatusVC
                        let obj_onSiteStatus = onSiteStatusModel()
                        OnsiteStatus_VC.Arr_onSiteStatusData = obj_onSiteStatus.Load_Data_To_Array(arr_Data: Arr_Data)
                        OnsiteStatus_VC.Str_NextLink = ((JSONObject.object as! NSDictionary).value(forKey: "next")! is NSNull) ? "" : (JSONObject.object as! NSDictionary).value(forKey: "next") as! String
                        OnsiteStatus_VC.Str_PreviousLink = ((JSONObject.object as! NSDictionary).value(forKey: "previous")! is NSNull) ? "" : (JSONObject.object as! NSDictionary).value(forKey: "previous") as! String
                        OnsiteStatus_VC.lbl_ShowPageNum.text = "Showing \((Arr_Data.count == 0) ? 0 : 1) to \(Arr_Data.count) of \(((JSONObject.object as! NSDictionary).value(forKey: "count") as! Int)) results"
                        OnsiteStatus_VC.tbl_data.reloadData()
                    } else {
                        let  ShippedStatus_VC =  ViewController as! ShippedStatusVC
                        let obj_onSiteStatus = onSiteStatusModel()
                        ShippedStatus_VC.Arr_onSiteStatusData = obj_onSiteStatus.Load_Data_To_Array(arr_Data: Arr_Data)
                        ShippedStatus_VC.Str_NextLink = ((JSONObject.object as! NSDictionary).value(forKey: "next")! is NSNull) ? "" : (JSONObject.object as! NSDictionary).value(forKey: "next") as! String
                        ShippedStatus_VC.Str_PreviousLink = ((JSONObject.object as! NSDictionary).value(forKey: "previous")! is NSNull) ? "" : (JSONObject.object as! NSDictionary).value(forKey: "previous") as! String
                        ShippedStatus_VC.lbl_ShowPageNum.text = "Showing \((Arr_Data.count == 0) ? 0 : 1) to \(Arr_Data.count) of \(((JSONObject.object as! NSDictionary).value(forKey: "count") as! Int)) results"
                        ShippedStatus_VC.tbl_data.reloadData()
                    }
                }else {
                    Utils.showToastWithMessageAtCenter(message: Strings.kSomethingWentWrong)
                }
                
            })
            { (error,statuscode) in
                KRProgressHUD.dismiss()
                print(error.localizedDescription)
            }
        }else {
            Utils.showToastWithMessageAtCenter(message: Strings.kNoInternetMessage)
        }
    }
    func Get_onSiteStatusDetail(ViewController: UIViewController,Str_ID : String) {
        if AppDelegate.NetworkRechability(){
            Utils.ShowActivityIndicator(message: Strings.kLoading)
            let OnsiteDetail_VC = ViewController as! OnsiteDetailVC
            AFWrapper.requestGETURL_WithParameter_ReturnStatuscode(Api_Urls.GET_API_onSiteStatus + Str_ID + "/" , headers: ["Authorization": DEFAULTS.Get_TOKEN()], params: [:], success: { (responseObject, statusCode, JSONObject) in
                KRProgressHUD.dismiss()
                if statusCode == 200 {
                    let Arr_Data : NSMutableArray = NSMutableArray()
                    Arr_Data.add(JSONObject.object as! NSDictionary)
                    let obj_onSiteStatusDetail = onSiteStatusDetailModel()
                    OnsiteDetail_VC.Arr_onSiteDetail = obj_onSiteStatusDetail.Load_Data_To_Array(arr_Data: Arr_Data)
                    OnsiteDetail_VC.tbl_siteDetail.reloadData()
                }else {
                    Utils.showToastWithMessageAtCenter(message: Strings.kSomethingWentWrong)
                }
                
            })
            { (error,statuscode) in
                KRProgressHUD.dismiss()
                print(error.localizedDescription)
            }
        }else {
            Utils.showToastWithMessageAtCenter(message: Strings.kNoInternetMessage)
        }
    }
    func Get_PLreports(ViewController: UIViewController,Api_Str : String,param : Parameters) {
        if AppDelegate.NetworkRechability(){
            Utils.ShowActivityIndicator(message: Strings.kLoading)
            let Plinputs_VC = ViewController as! PlinputsVc
            AFWrapper.requestGETURL_WithParameter_ReturnStatuscode(Api_Str, headers: ["Authorization": DEFAULTS.Get_TOKEN()], params: param, success: { (responseObject, statusCode, JSONObject) in
                KRProgressHUD.dismiss()
                if statusCode == 200 {
                    if ((JSONObject.object as! NSDictionary).value(forKey: "count") as! Int) != 0 {
                        let Arr_Data : NSMutableArray = NSMutableArray()
                        for key in 0...((JSONObject.object as! NSDictionary).value(forKey: "results") as! NSArray).count - 1 {
                            let dic = Utils.removeNSNull(from: (((JSONObject.object as! NSDictionary).value(forKey: "results") as! NSArray)[key] as! NSDictionary) as! [String : Any])
                            Arr_Data.add(dic)
                        }
                        let obj_Package = PLreportsModel()
                        Plinputs_VC.Arr_PLInputs_Data = obj_Package.Load_Data_To_Array(arr_Data: Arr_Data)
                        Plinputs_VC.Str_NextLink = ((JSONObject.object as! NSDictionary).value(forKey: "next")! is NSNull) ? "" : (JSONObject.object as! NSDictionary).value(forKey: "next") as! String
                        Plinputs_VC.Str_PreviousLink = ((JSONObject.object as! NSDictionary).value(forKey: "previous")! is NSNull) ? "" : (JSONObject.object as! NSDictionary).value(forKey: "previous") as! String
                        Plinputs_VC.lbl_ShowPage.text = "Showing \((Arr_Data.count == 0) ? 0 : 1) to \(Arr_Data.count) of \(((JSONObject.object as! NSDictionary).value(forKey: "count") as! Int)) results"
                        Plinputs_VC.tbl_data.reloadData()
                    } else {
                        TableViewHelper.EmptyMessage(message: "No records found", tableview: Plinputs_VC.tbl_data, textColor: .black)
                    }
                }else {
                    Utils.showToastWithMessageAtCenter(message: Strings.kSomethingWentWrong)
                }
                
            })
            { (error,statuscode) in
                KRProgressHUD.dismiss()
                print(error.localizedDescription)
            }
        }else {
            Utils.showToastWithMessageAtCenter(message: Strings.kNoInternetMessage)
        }
    }
    func Get_PLreportsDetail(ViewController: UIViewController,Api_Str : String,tag : Int) {
        if AppDelegate.NetworkRechability(){
            Utils.ShowActivityIndicator(message: Strings.kLoading)
            AFWrapper.requestGETURL_JSON(Api_Str, headers:["Authorization": DEFAULTS.Get_TOKEN()], params: [:], success: { (responseObject,statusCode) in
                do {
                    if statusCode == 200 {
                        if tag == 0 {
                            let PlinputsDetail_VC = ViewController as! PLinputDetails
                            let results = try JSONDecoder().decode(PlreportDetailModel.self, from: responseObject)
                            PlinputsDetail_VC.Arr_PLDetail = [results]
                            PlinputsDetail_VC.arr_rejectH = [RejectReason](results.rejectReasons!)
                            PlinputsDetail_VC.tbl_Package_Detail.reloadData()
                            PlinputsDetail_VC.Set_PackageDetail()
                            KRProgressHUD.dismiss()
                        }else {
                            let Packages_VC = ViewController as! PlinputViewVC
                            let results = try JSONDecoder().decode(PlreportDetailModel.self, from: responseObject)
                            Packages_VC.Arr_PLDetail = [results]
                            Packages_VC.SetData()
                            KRProgressHUD.dismiss()
                        }
                    }else {
                        Utils.showToastWithMessage(message: Strings.kSomethingWentWrong)
                        KRProgressHUD.dismiss()
                    }
                }catch let jsonErr{
                    KRProgressHUD.dismiss()
                    print("json error : \(jsonErr.localizedDescription)")
                }
            })
            { (error) in
                KRProgressHUD.dismiss()
                print(error.localizedDescription)
            }
        }else {
            Utils.showToastWithMessageAtCenter(message: Strings.kNoInternetMessage)
        }
    }
    func Get_packingList(ViewController: UIViewController,Api_Str : String,params : Parameters) {
        if AppDelegate.NetworkRechability(){
            Utils.ShowActivityIndicator(message: Strings.kLoading)
            let PackingList_VC = ViewController as! PackingListVC
            AFWrapper.requestGETURL_WithParameter_ReturnStatuscode(Api_Str, headers: ["Authorization": DEFAULTS.Get_TOKEN()], params: params, success: { (responseObject, statusCode, JSONObject) in
                KRProgressHUD.dismiss()
                if statusCode == 200 {
                    if ((JSONObject.object as! NSDictionary).value(forKey: "count") as! Int) != 0 {
                        let Arr_Data : NSMutableArray = NSMutableArray()
                        for key in 0...((JSONObject.object as! NSDictionary).value(forKey: "results") as! NSArray).count - 1 {
                            let dic = Utils.removeNSNull(from: (((JSONObject.object as! NSDictionary).value(forKey: "results") as! NSArray)[key] as! NSDictionary) as! [String : Any])
                            Arr_Data.add(dic)
                        }
                        let obj_Packing = PackingListModel()
                        PackingList_VC.Arr_Packing_Data = obj_Packing.Load_Data_To_Array(arr_Data: Arr_Data)
                        PackingList_VC.Str_NextLink = ((JSONObject.object as! NSDictionary).value(forKey: "next")! is NSNull) ? "" : (JSONObject.object as! NSDictionary).value(forKey: "next") as! String
                        PackingList_VC.Str_PreviousLink = ((JSONObject.object as! NSDictionary).value(forKey: "previous")! is NSNull) ? "" : (JSONObject.object as! NSDictionary).value(forKey: "previous") as! String
                        PackingList_VC.Arr_Packing_Data.reversed()
                        PackingList_VC.lbl_ShowPageNum.text = "Showing \((Arr_Data.count == 0) ? 0 : 1) ?to \(Arr_Data.count) of \(((JSONObject.object as! NSDictionary).value(forKey: "count") as! Int)) results"
                        PackingList_VC.tbl_data.reloadData()
                    } else {
                        TableViewHelper.EmptyMessage(message: "No records found", tableview: PackingList_VC.tbl_data, textColor: .black)
                    }
                }else {
                    Utils.showToastWithMessageAtCenter(message: Strings.kSomethingWentWrong)
                }
            })
            { (error,statuscode) in
                KRProgressHUD.dismiss()
                print(error.localizedDescription)
            }
        }else {
            Utils.showToastWithMessageAtCenter(message: Strings.kNoInternetMessage)
        }
    }
    func Get_packingList_Edit(ViewController: UIViewController,Api_Str : String,tag : Int) {
        if AppDelegate.NetworkRechability(){
            Utils.ShowActivityIndicator(message: Strings.kLoading)
            AFWrapper.requestGETURL_WithParameter_ReturnStatuscode(Api_Str, headers: ["Authorization": DEFAULTS.Get_TOKEN()], params: [:], success: { (responseObject, statusCode, JSONObject) in
                KRProgressHUD.dismiss()
                if statusCode == 200 {
                    if tag == 0 {
                        let result = try? JSONDecoder().decode(PackinglistIDModel.self, from: responseObject)
                        let packingList_Edit = ViewController as! PackingListsEdit
                        packingList_Edit.arrPackingListsID_Model =  [PackinglistIDModel](arrayLiteral: result!)
                        packingList_Edit.dataset()
                    } else {
                        let result = try? JSONDecoder().decode(PackinglistIDModel.self, from: responseObject)
                        let PackingLists_View = ViewController as! PackingListsViewVC
                        PackingLists_View.Arr_PackingListDetail = [result!]
                        PackingLists_View.SetSingleDetail()
                        PackingLists_View.tbl_MasterDetails_1.reloadData()
                    }
                    
                }else {
                    Utils.showToastWithMessageAtCenter(message: Strings.kSomethingWentWrong)
                }
            })
            { (error,statuscode) in
                KRProgressHUD.dismiss()
                print(error.localizedDescription)
            }
        }else {
            Utils.showToastWithMessageAtCenter(message: Strings.kNoInternetMessage)
        }
    }
    func post_Login(viewConroller : UIViewController,parameters:Parameters){
        print(parameters)
        if AppDelegate.NetworkRechability() {
                        Utils.ShowActivityIndicator(message: Strings.kLoading)

            let Login_VC = viewConroller as! LoginVC
            AFWrapper.requestPOSTURL_WithStatusCode(Api_Urls.GET_API_LOGIN, params: parameters, headers: [:], success:
                {   (responseObject,StatusCode,JSONObject) in
                    if StatusCode == 200 {
                        let Key = (JSONObject.object as! NSDictionary).value(forKey: "key")!
                        DEFAULTS.set_TOKEN(token: "Token " + String(describing: Key))
                        Login_VC.Right_Login()
                        self.Get_getPermission()
                        MasterServiceCall.shareInstance.Get_masterAddress(Api_Str: Api_Urls.GET_API_masterAddress)
                        MasterServiceCall.shareInstance.Get_masterCountry(Api_Str: Api_Urls.GET_API_masterCountry)
                        MasterServiceCall.shareInstance.Get_masterPurchase(Api_Str: Api_Urls.GET_API_masterPurchase)
                        MasterServiceCall.shareInstance.Get_masterKindOfPackage(Api_Str: Api_Urls.GET_API_masterKOP)
                        MasterServiceCall.shareInstance.Get_masterProject(Api_Str: Api_Urls.GET_API_masterProject)
                        MasterServiceCall.shareInstance.Get_masterEmployee(Api_Str: Api_Urls.GET_API_masterEmployee)
                        MasterServiceCall.shareInstance.Get_masterVendor(Api_Str: Api_Urls.GET_API_masterVendor)
                        MasterServiceCall.shareInstance.Get_masterPotype(Api_Str: Api_Urls.GET_API_masterPOType)
                        MasterServiceCall.shareInstance.Get_masterCurrency(Api_Str: Api_Urls.GET_API_masterCurrency)
                        MasterServiceCall.shareInstance.Get_masterUOM(Api_Str: Api_Urls.GET_API_masterUOM)
                    }else {
                        KRProgressHUD.dismiss()
                        Utils.showToastWithMessageAtCenter(message: NSMutableArray(array: (JSONObject.object as! NSDictionary).value(forKey: "non_field_errors") as! NSArray)[0] as! String)
                    }
            })
            { (error) in
                KRProgressHUD.dismiss()
                print(error.localizedDescription)
            }
        } else {
            Utils.showToastWithMessageAtCenter(message: Strings.kNoInternetMessage)
        }
    }
    func GET_Logout(){
        if AppDelegate.NetworkRechability() {
            Utils.ShowActivityIndicator(message: Strings.KPleasewait)
            AFWrapper.requestPOSTURL_WithStatusCode(Api_Urls.GET_API_LOGOUT,params: [:], headers: [:], success:
                {   (responseObject,StatusCode,JSONObject) in
                    print(responseObject)
                    if StatusCode == 200 {
                        Utils.Logout_Reset_Data()
                        KRProgressHUD.dismiss()
                    }
            })
            { (error) in
                KRProgressHUD.dismiss()
                print(error.localizedDescription)
            }
        } else {
            Utils.showToastWithMessageAtCenter(message: Strings.kNoInternetMessage)
        }
    }
    func Get_getDrwaingView(ViewController: UIViewController,Api_Str : String) {
        if AppDelegate.NetworkRechability(){
            Utils.ShowActivityIndicator(message: Strings.kLoading)
            let DrwaingView_Vc = ViewController as! DrwaingViewVC_1
            AFWrapper.requestGETURL_WithParameter_ReturnStatuscode(Api_Str, headers: ["Authorization": DEFAULTS.Get_TOKEN()], params:
                [:], success: { (responseObject, statusCode, JSONObject) in
                KRProgressHUD.dismiss()
                if statusCode == 200 {
                    let result = try! JSONDecoder().decode([DrwaingViewModel].self, from: responseObject)
                    DrwaingView_Vc.arrviewData = [DrwaingViewModel](result)
                    DrwaingView_Vc.tbl_DrwaingView.reloadData()
                }else {
                    Utils.showToastWithMessageAtCenter(message: Strings.kSomethingWentWrong)
                }
            })
            { (error,statuscode) in
                KRProgressHUD.dismiss()
                print(error.localizedDescription)
            }
        }else {
            Utils.showToastWithMessageAtCenter(message: Strings.kNoInternetMessage)
        }
    }
    
    
    
    func Set_UpdateProfile(ViewController : UIViewController,param : Parameters) {
        if AppDelegate.NetworkRechability(){
            Utils.ShowActivityIndicator(message: Strings.kLoading)
            let Update_VC = ViewController as! UpdateProfileVC
            AFWrapper.requestmethode_WithParameter_ReturnStatuscode(Api_Urls.GET_API_userDetail + DEFAULTS.Get_UerID() + "/", method: .put, headers: ["Authorization": DEFAULTS.Get_TOKEN()], params: param as! [String : String], success: { (responseObject, statusCode, JSONObject) in
                KRProgressHUD.dismiss()
                if statusCode == 200 {
                    Utils.showToastWithMessageAtCenter(message: "Save Successfully")
                    Update_VC.set_DashBoard()
                }else {
                    Utils.showToastWithMessageAtCenter(message: (JSONObject.object as! NSDictionary).value(forKey: "detail") as! String)
                }
            })
            { (error) in
                KRProgressHUD.dismiss()
                print(error.localizedDescription)
            }
        }else {
            Utils.showToastWithMessageAtCenter(message: Strings.kNoInternetMessage)
        }
    }
}
