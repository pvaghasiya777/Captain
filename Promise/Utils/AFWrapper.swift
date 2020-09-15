

import UIKit
import Alamofire

class AFWrapper: NSObject
{
    //MARK:- Get Method
    class func requestGETURL_WithParameter_ReturnStatuscode(_ strURL: String, headers : [String : String]?,params : [String : String]?, success:@escaping (Data,Int,JSON) -> Void, failure:@escaping (Error) -> Void)
    {
        let final_strURL : String = strURL
        print(final_strURL)
        Alamofire.request(final_strURL, method: .get, parameters: params, encoding: URLEncoding.default, headers: headers).responseJSON { (responseObject) -> Void in
            print(responseObject)
            if responseObject.result.isSuccess {
                print(responseObject.response!.statusCode)
                var StatusCode : Int = 1;
                StatusCode = responseObject.response!.statusCode
                success(responseObject.data!,StatusCode,JSON(responseObject.result.value!))
            }
            if responseObject.result.isFailure {
                let error : Error = responseObject.result.error!
                failure(error)
            }
        }
    }
    class func requestGETURL_JSON(_ strURL: String,headers : [String : String]!,params : [String : String]?,success:@escaping (Data,Int) -> Void, failure:@escaping (Error) -> Void)
    {
        let final_strURL : String = strURL
        print(final_strURL)
        print(headers!)
        print(params!)
        Alamofire.request(URL(string: strURL)!, method: .get, parameters: params, headers: headers).responseJSON { (responseObject) -> Void in
            if responseObject.result.isSuccess {
                print(responseObject.response!.statusCode)
                var StatusCode : Int = 1;
                StatusCode = responseObject.response!.statusCode
                success(responseObject.data!,StatusCode)
            }
            if responseObject.result.isFailure {
                let error : Error = responseObject.result.error!
                failure(error)
            }
        }
    }
    //MArk:- Post Methode
    class func requestPOSTURL_WithStatusCode(_ strURL : String, params : Parameters, headers : [String : String]?, success:@escaping (Data,Int,JSON) -> Void, failure:@escaping (Error) -> Void){
        let final_strURL : String = strURL
        print(final_strURL)
        Alamofire.request(final_strURL, method: .post, parameters: params, encoding: URLEncoding.default, headers: headers).responseJSON { (responseObject) -> Void in
            print(responseObject)
            if responseObject.result.isSuccess {
                print(responseObject.response?.statusCode)
                var StatusCode : Int = 1;
                StatusCode = responseObject.response!.statusCode
                success(responseObject.data!,StatusCode,JSON(responseObject.result.value!))
            }
            if responseObject.result.isFailure {
                let error : Error = responseObject.result.error!
                failure(error)
            }
        }
    }
    class func requestPOSTURL(url_request : URLRequest, success:@escaping (Data,JSON) -> Void, failure:@escaping (Error) -> Void){
        Alamofire.request(url_request).responseJSON { (responseObject) in
            if responseObject.result.isSuccess {
                success(responseObject.data!,JSON(responseObject.result.value!))
            }
            if responseObject.result.isFailure {
                let error : Error = responseObject.result.error!
                failure(error)
            }
        }
    }
    
    class func RequestWith_Methode_Param(_ strURL : String,method: HTTPMethod, params : Parameters, headers : [String : String],responsedata:@escaping (Data) -> Void) {
        Alamofire.request(strURL, method: method, parameters: params, encoding: URLEncoding.default, headers:headers).responseData { (responsedata) -> Void in
            if responsedata.data != nil {
                responsedata.data
                print(responsedata.data!)
            } else {
                print(responsedata.error.debugDescription)
            }
        }
        
    }
}


