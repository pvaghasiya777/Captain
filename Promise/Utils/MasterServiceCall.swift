//
//  MasterServiceCall.swift
//  Promise
//
//  Created by Captain on 20/08/20.
//  Copyright © 2020 Captain. All rights reserved.
//

import Foundation
import SVProgressHUD
import Alamofire
class MasterServiceCall: NSObject
{
    static let shareInstance = MasterServiceCall()
    func Get_masterAddress(Api_Str: String) {
        if AppDelegate.NetworkRechability(){
            SVProgressHUD.show(withStatus: "Loading...")
            AFWrapper.requestGETURL_JSON(Api_Str, headers:["Authorization": DEFAULTS.Get_TOKEN()], params: [:], success: { (responseObject,statusCode) in
                do {
                    print(responseObject)
                    SVProgressHUD.dismiss()
                    if statusCode == 200 {
                        let results = try? JSONDecoder().decode([MasterAddressModel].self, from: responseObject)
                        print(results)
                        DEFAULTS.Set_AddressStruct(UserData: try! JSONDecoder().decode([MasterAddressModel].self, from: responseObject))
                        print(DEFAULTS.Get_AddressStruct())
                    }else {
                        Utils.showToastWithMessageAtCenter(message: "Invalid token.")
                    }
                }catch let jsonErr{
                    print("json error : \(jsonErr.localizedDescription)")
                }
            })
            { (error) in
                SVProgressHUD.dismiss()
                print(error.localizedDescription)
            }
        }else {
            Utils.showToastWithMessageAtCenter(message: Strings.kNoInternetMessage)
        }
    }
    func Get_masterCountry(Api_Str: String) {
        if AppDelegate.NetworkRechability(){
            SVProgressHUD.show(withStatus: "Loading...")
            AFWrapper.requestGETURL_JSON(Api_Str, headers:["Authorization": DEFAULTS.Get_TOKEN()], params: [:], success: { (responseObject,statusCode) in
                do {
                    print(responseObject)
                    SVProgressHUD.dismiss()
                    if statusCode == 200 {
                        let results = try? JSONDecoder().decode([MasterCountryModel].self, from: responseObject)
                        print(results)
                        DEFAULTS.Set_MasterCoutry(CountryData : try! JSONDecoder().decode([MasterCountryModel].self, from: responseObject))
                        print(DEFAULTS.Get_MasterCoutry())
                    }else {
                        Utils.showToastWithMessageAtCenter(message: "Invalid token.")
                    }
                }catch let jsonErr{
                    print("json error : \(jsonErr.localizedDescription)")
                }
            })
            { (error) in
                SVProgressHUD.dismiss()
                print(error.localizedDescription)
            }
        }else {
            Utils.showToastWithMessageAtCenter(message: Strings.kNoInternetMessage)
        }
    }
    func Get_masterKindOfPackage(Api_Str: String) {
        if AppDelegate.NetworkRechability(){
            SVProgressHUD.show(withStatus: "Loading...")
            AFWrapper.requestGETURL_JSON(Api_Str, headers:["Authorization": DEFAULTS.Get_TOKEN()], params: [:], success: { (responseObject,statusCode) in
                do {
                    print(responseObject)
                    SVProgressHUD.dismiss()
                    if statusCode == 200 {
                        let results = try? JSONDecoder().decode([MasterKindOfPackageModel].self, from: responseObject)
                        print(results)
                        DEFAULTS.Set_MasterKindOfPackage(KOPData: try! JSONDecoder().decode([MasterKindOfPackageModel].self, from: responseObject))
                        print(DEFAULTS.Get_MasterKindOfPackage())
                    }else {
                        Utils.showToastWithMessageAtCenter(message: "Invalid token.")
                    }
                }catch let jsonErr{
                    print("json error : \(jsonErr.localizedDescription)")
                }
            })
            { (error) in
                SVProgressHUD.dismiss()
                print(error.localizedDescription)
            }
        }else {
            Utils.showToastWithMessageAtCenter(message: Strings.kNoInternetMessage)
        }
    }
    func Get_masterPurchase(Api_Str: String) {
        if AppDelegate.NetworkRechability(){
            SVProgressHUD.show(withStatus: "Loading...")
            AFWrapper.requestGETURL_JSON(Api_Str, headers:["Authorization": DEFAULTS.Get_TOKEN()], params: [:], success: { (responseObject,statusCode) in
                do {
                    print(responseObject)
                    SVProgressHUD.dismiss()
                    if statusCode == 200 {
                        let results = try? JSONDecoder().decode([MasterPurchaseModel].self, from: responseObject)
                        print(results)
                        DEFAULTS.Set_MasterPurchase(PurchaseData : try! JSONDecoder().decode([MasterPurchaseModel].self, from: responseObject))
                        print(DEFAULTS.Get_MasterPurchase())
                    }else {
                        Utils.showToastWithMessageAtCenter(message: "Invalid token.")
                    }
                }catch let jsonErr{
                    print("json error : \(jsonErr.localizedDescription)")
                }
            })
            { (error) in
                SVProgressHUD.dismiss()
                print(error.localizedDescription)
            }
        }else {
            Utils.showToastWithMessageAtCenter(message: Strings.kNoInternetMessage)
        }
    }
    func Get_masterPurchaseList(Api_Str: String,ViewController : UIViewController) {
        if AppDelegate.NetworkRechability(){
            SVProgressHUD.show(withStatus: "Loading...")
            let Purchase_VC = ViewController as! PurchaseVC
            AFWrapper.requestGETURL_JSON(Api_Str, headers:["Authorization": DEFAULTS.Get_TOKEN()], params: [:], success: { (responseObject,statusCode) in
                do {
                    print(responseObject)
                    SVProgressHUD.dismiss()
                    if statusCode == 200 {
                        let results = try? JSONDecoder().decode([MasterPurchseListModel].self, from: responseObject)
                        Purchase_VC.Arr_PurchaseDetail = results!
                        print(Purchase_VC.Arr_PurchaseDetail)
                        Purchase_VC.tbl_Purchase.reloadData()
                    }else {
                        Utils.showToastWithMessageAtCenter(message: "Invalid token.")
                    }
                }catch let jsonErr{
                    print("json error : \(jsonErr.localizedDescription)")
                }
            })
            { (error) in
                SVProgressHUD.dismiss()
                print(error.localizedDescription)
            }
        }else {
            Utils.showToastWithMessageAtCenter(message: Strings.kNoInternetMessage)
        }
    }
    func Get_masterProject(Api_Str: String) {
        if AppDelegate.NetworkRechability(){
            SVProgressHUD.show(withStatus: "Loading...")
            AFWrapper.requestGETURL_JSON(Api_Str, headers:["Authorization": DEFAULTS.Get_TOKEN()], params: [:], success: { (responseObject,statusCode) in
                do {
                    print(responseObject)
                    SVProgressHUD.dismiss()
                    if statusCode == 200 {
                        let results = try? JSONDecoder().decode([MasterProjectModel].self, from: responseObject)
                        DEFAULTS.Set_MasterProject(ProjectData: results ?? [])
                        print(DEFAULTS.Get_MasterProject())
                    }else {
                        Utils.showToastWithMessageAtCenter(message: "Invalid token.")
                    }
                }catch let jsonErr{
                    print("json error : \(jsonErr.localizedDescription)")
                }
            })
            { (error) in
                SVProgressHUD.dismiss()
                print(error.localizedDescription)
            }
        }else {
            Utils.showToastWithMessageAtCenter(message: Strings.kNoInternetMessage)
        }
    }
    func Get_masterEmployee(Api_Str: String) {
        if AppDelegate.NetworkRechability(){
            SVProgressHUD.show(withStatus: "Loading...")
            AFWrapper.requestGETURL_JSON(Api_Str, headers:["Authorization": DEFAULTS.Get_TOKEN()], params: [:], success: { (responseObject,statusCode) in
                do {
                    print(responseObject)
                    SVProgressHUD.dismiss()
                    if statusCode == 200 {
                        let results = try? JSONDecoder().decode([EmployeeModel].self, from: responseObject)
                        DEFAULTS.Set_MasterEmployee(ProjectData: results ?? [])
                        print(DEFAULTS.Get_MasterEmployee())
                    }else {
                        Utils.showToastWithMessageAtCenter(message: "Invalid token.")
                    }
                }catch let jsonErr{
                    print("json error : \(jsonErr.localizedDescription)")
                }
            })
            { (error) in
                SVProgressHUD.dismiss()
                print(error.localizedDescription)
            }
        }else {
            Utils.showToastWithMessageAtCenter(message: Strings.kNoInternetMessage)
        }
    }
    
    func Get_masterVendor(Api_Str: String) {
        if AppDelegate.NetworkRechability(){
            SVProgressHUD.show(withStatus: "Loading...")
            AFWrapper.requestGETURL_JSON(Api_Str, headers:["Authorization": DEFAULTS.Get_TOKEN()], params: [:], success: { (responseObject,statusCode) in
                do {
                    print(responseObject)
                    SVProgressHUD.dismiss()
                    if statusCode == 200 {
                        let results = try? JSONDecoder().decode([VendorModel].self, from: responseObject)
                        DEFAULTS.Set_MasterVendor(ProjectData: results ?? [])
                        print(DEFAULTS.Get_MasterVendor())
                    }else {
                        Utils.showToastWithMessageAtCenter(message: "Invalid token.")
                    }
                }catch let jsonErr{
                    print("json error : \(jsonErr.localizedDescription)")
                }
            })
            { (error) in
                SVProgressHUD.dismiss()
                print(error.localizedDescription)
            }
        }else {
            Utils.showToastWithMessageAtCenter(message: Strings.kNoInternetMessage)
        }
    }
    
    func Get_masterPotype(Api_Str: String) {
        if AppDelegate.NetworkRechability(){
            SVProgressHUD.show(withStatus: "Loading...")
            AFWrapper.requestGETURL_JSON(Api_Str, headers:["Authorization": DEFAULTS.Get_TOKEN()], params: [:], success: { (responseObject,statusCode) in
                do {
                    print(responseObject)
                    SVProgressHUD.dismiss()
                    if statusCode == 200 {
                        let results = try? JSONDecoder().decode([POTypeModel].self, from: responseObject)
                        DEFAULTS.Set_MasterPOType(ProjectData: results ?? [])
                        print(DEFAULTS.Get_MasterPOType())
                    }else {
                        Utils.showToastWithMessageAtCenter(message: "Invalid token.")
                    }
                }catch let jsonErr{
                    print("json error : \(jsonErr.localizedDescription)")
                }
            })
            { (error) in
                SVProgressHUD.dismiss()
                print(error.localizedDescription)
            }
        }else {
            Utils.showToastWithMessageAtCenter(message: Strings.kNoInternetMessage)
        }
    }
    
    func Get_masterCurrency(Api_Str: String) {
        if AppDelegate.NetworkRechability(){
            SVProgressHUD.show(withStatus: "Loading...")
            AFWrapper.requestGETURL_JSON(Api_Str, headers:["Authorization": DEFAULTS.Get_TOKEN()], params: [:], success: { (responseObject,statusCode) in
                do {
                    print(responseObject)
                    SVProgressHUD.dismiss()
                    if statusCode == 200 {
                        let results = try? JSONDecoder().decode([CurrencyModel].self, from: responseObject)
                        DEFAULTS.Set_MasterCurrency(ProjectData: results ?? [])
                        print(DEFAULTS.Get_MasterCurrency())
                    }else {
                        Utils.showToastWithMessageAtCenter(message: "Invalid token.")
                    }
                }catch let jsonErr{
                    print("json error : \(jsonErr.localizedDescription)")
                }
            })
            { (error) in
                SVProgressHUD.dismiss()
                print(error.localizedDescription)
            }
        }else {
            Utils.showToastWithMessageAtCenter(message: Strings.kNoInternetMessage)
        }
    }
    
    
    func Get_masterUOM(Api_Str: String) {
        if AppDelegate.NetworkRechability(){
            SVProgressHUD.show(withStatus: "Loading...")
            AFWrapper.requestGETURL_JSON(Api_Str, headers:["Authorization": DEFAULTS.Get_TOKEN()], params: [:], success: { (responseObject,statusCode) in
                do {
                    print(responseObject)
                    SVProgressHUD.dismiss()
                    if statusCode == 200 {
                        let results = try? JSONDecoder().decode([UOMModel].self, from: responseObject)
                        DEFAULTS.Set_MasterUOM(ProjectData: results ?? [])
                        print(DEFAULTS.Get_MasterUOM())
                    }else {
                        Utils.showToastWithMessageAtCenter(message: "Invalid token.")
                    }
                }catch let jsonErr{
                    print("json error : \(jsonErr.localizedDescription)")
                }
            })
            { (error) in
                SVProgressHUD.dismiss()
                print(error.localizedDescription)
            }
        }else {
            Utils.showToastWithMessageAtCenter(message: Strings.kNoInternetMessage)
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    func Get_masterProjectSingle(Api_Str: String,ViewController : UIViewController) {
        if AppDelegate.NetworkRechability(){
            let ProjectDetails_VC = ViewController as! ProjectDetailsFormViewVC
            SVProgressHUD.show(withStatus: "Loading...")
            AFWrapper.requestGETURL_JSON(Api_Str, headers:["Authorization": DEFAULTS.Get_TOKEN()], params: [:], success: { (responseObject,statusCode) in
                do {
                    print(responseObject)
                    SVProgressHUD.dismiss()
                    if statusCode == 200 {
                        let results = try? JSONDecoder().decode(SingleMasterProjectModel.self, from: responseObject)
                        print(results)
                        ProjectDetails_VC.Arr_Project = [results!]
                        ProjectDetails_VC.SetData()
                    }else {
                        Utils.showToastWithMessageAtCenter(message: "Invalid token.")
                    }
                }catch let jsonErr{
                    print("json error : \(jsonErr.localizedDescription)")
                }
            })
            { (error) in
                SVProgressHUD.dismiss()
                print(error.localizedDescription)
            }
        }else {
            Utils.showToastWithMessageAtCenter(message: Strings.kNoInternetMessage)
        }
    }
    func Get_SingleMasterPurchase(Api_Str: String,Viewcontroller : UIViewController) {
        if AppDelegate.NetworkRechability(){
            let PurchaseOrder_VC = Viewcontroller as! PurchaseOrderVC
            SVProgressHUD.show(withStatus: "Loading...")
            AFWrapper.requestGETURL_JSON(Api_Str, headers:["Authorization": DEFAULTS.Get_TOKEN()], params: [:], success: { (responseObject,statusCode) in
                do {
                    print(responseObject)
                    SVProgressHUD.dismiss()
                    if statusCode == 200 {
                        let results = try? JSONDecoder().decode(SingleMasterPurchaseModel?.self, from: responseObject)
                        print(results!)
                        PurchaseOrder_VC.Arr_PurchaseOrder = [results!]
                        PurchaseOrder_VC.setData()
                        PurchaseOrder_VC.tbl_PurchaseOrder.reloadData()
                    }else {
                        Utils.showToastWithMessageAtCenter(message: "Invalid token.")
                    }
                }catch let jsonErr{
                    SVProgressHUD.dismiss()
                    print("json error : \(jsonErr.localizedDescription)")
                }
            })
            { (error) in
                SVProgressHUD.dismiss()
                print(error.localizedDescription)
            }
        }else {
            Utils.showToastWithMessageAtCenter(message: Strings.kNoInternetMessage)
        }
    }
    func Get_Document(Api_Str: String,Viewcontroller : UIViewController) {
        if AppDelegate.NetworkRechability(){
            let Document_VC = Viewcontroller as! DocumentVC
            SVProgressHUD.show(withStatus: "Loading...")
            AFWrapper.requestGETURL_WithParameter_ReturnStatuscode(Api_Str, headers:["Authorization": DEFAULTS.Get_TOKEN()], params: [:], success: { (responseObject,statusCode,jsonObject) in
                do {
                    if statusCode == 200 {
                        print(responseObject)
                        SVProgressHUD.dismiss()
                        Document_VC.getDefaultCITreeViewData(arr_data: jsonObject.object as! NSDictionary)
                    }else {
                        print("Error")
                    }
                }catch let jsonErr{
                    SVProgressHUD.dismiss()
                    print("json error : \(jsonErr.localizedDescription)")
                }
            })
            { (error) in
                SVProgressHUD.dismiss()
                print(error.localizedDescription)
            }
        }else {
            Utils.showToastWithMessageAtCenter(message: Strings.kNoInternetMessage)
        }
    }
}


