//
//  ServiceCall.swift
//  Copyright © 2019 Meet PC. All rights reserved.
//

import UIKit
import Alamofire
import KRProgressHUD
class ReportAPI: NSObject
{
    static let shareInstance = ReportAPI()
    func Get_ReportList(ViewController: UIViewController,Api_Str : String,params : Parameters,tag : Int) {
        if AppDelegate.NetworkRechability(){
            Utils.ShowActivityIndicator(message: Strings.kLoading)
            AFWrapper.requestGETURL_WithParameter_ReturnStatuscode(Api_Str, headers: ["Authorization": DEFAULTS.Get_TOKEN()], params: params, success: { (responseObject, statusCode, JSONObject) in
                if statusCode == 200 {
                    if tag == 2 {
                        let Report_VC = ViewController as! R_MarkwiseReportVC
                        if ((JSONObject.object as! NSDictionary).value(forKey: "count") as! Int) != 0 {
                            let Arr_Data : NSMutableArray = NSMutableArray()
                            for key in 0...((JSONObject.object as! NSDictionary).value(forKey: "results") as! NSArray).count - 1 {
                                let dic = Utils.removeNSNull(from: (((JSONObject.object as! NSDictionary).value(forKey: "results") as! NSArray)[key] as! NSDictionary) as! [String : Any])
                                Arr_Data.add(dic)
                            }
                            let obj_Report = MarkWiseReportModel()
                            Report_VC.Arr_MarkWiseReport = obj_Report.Load_Data_To_Array(arr_Data: Arr_Data)
                            Report_VC.Str_markWiseReportNext = ((JSONObject.object as! NSDictionary).value(forKey: "next")! is NSNull) ? "" : (JSONObject.object as! NSDictionary).value(forKey: "next") as! String
                            Report_VC.Str_markWiseReportPrevious = ((JSONObject.object as! NSDictionary).value(forKey: "previous")! is NSNull) ? "" : (JSONObject.object as! NSDictionary).value(forKey: "previous") as! String
                            let TotalCount = String(describing: (JSONObject.object as! NSDictionary).value(forKey: "count")!)
                            Report_VC.lbl_PageNum_MarkwiseReport.text = "Showing \(Report_VC.startIndex) to \(((Report_VC.startIndex + 50) > Report_VC.Arr_MarkWiseReport.count) ? (Report_VC.startIndex + Report_VC.Arr_MarkWiseReport.count) : (Report_VC.startIndex + 50)) of \(TotalCount) results"
                            Report_VC.tbl_MarkwiseReport.reloadData()
                        }
                    }else if tag == 3 { //MarkWise Cumulative
                        let MarkCumulative = ViewController as! MarkwiseCumulativeReportVC
                        let results = try? JSONDecoder().decode(MarkWiseCumulativeReportModel.self, from: responseObject)
                        MarkCumulative.Arr_MarkWiseCumulativeReport = [results!]
                        MarkCumulative.lblShowPagination.text = "Showing \(MarkCumulative.startIndex) to \(((MarkCumulative.startIndex + 50) > MarkCumulative.Arr_MarkWiseCumulativeReport[0].results!.count) ? (MarkCumulative.startIndex + MarkCumulative.Arr_MarkWiseCumulativeReport[0].results!.count) : (MarkCumulative.startIndex + 50)) of \(MarkCumulative.Arr_MarkWiseCumulativeReport[0].count!) results"
                        MarkCumulative.tbl_MarkwiseCumulativeReport.reloadData()
                    }else if tag == 5 { //PackingList Report
                        let PackingListReportVC = ViewController as! PackingListReport_VC
                        let results = try? JSONDecoder().decode(PackingListReportModel.self, from: responseObject)
                        PackingListReportVC.arrPackingListReport = [results!]
                        PackingListReportVC.lblShowPagination.text = "Showing \(PackingListReportVC.startIndex) to \(((PackingListReportVC.startIndex + 50) > PackingListReportVC.arrPackingListReport[0].results!.count) ? (PackingListReportVC.startIndex + PackingListReportVC.arrPackingListReport[0].results!.count) : (PackingListReportVC.startIndex + 50)) of \(PackingListReportVC.arrPackingListReport[0].count!) results"
                        PackingListReportVC.tbl_PackingListReport.reloadData()
                    }else if tag == 8 { //StructurewiseReport
                        let StructurewiseVC = ViewController as! StructurewiseReportVC
                        if ((JSONObject.object as! NSDictionary).value(forKey: "count") as! Int) != 0 {
                            let Arr_Data : NSMutableArray = NSMutableArray(array: ((JSONObject.object as! NSDictionary).value(forKey: "results") as! NSArray))
                            let obj_Report = StrucherWiseReportModel()
                            StructurewiseVC.arrStrucherWise = obj_Report.Load_Data_To_Array(arr_Data: Arr_Data)
                            StructurewiseVC.Str_markWiseReportNext = ((JSONObject.object as! NSDictionary).value(forKey: "next")! is NSNull) ? "" : (JSONObject.object as! NSDictionary).value(forKey: "next") as! String
                            StructurewiseVC.Str_markWiseReportPrevious = ((JSONObject.object as! NSDictionary).value(forKey: "previous")! is NSNull) ? "" : (JSONObject.object as! NSDictionary).value(forKey: "previous") as! String
                            let TotalCount = String(describing: (JSONObject.object as! NSDictionary).value(forKey: "count")!)
                            StructurewiseVC.lblShowPagination.text = "Showing \(StructurewiseVC.startIndex) to \(((StructurewiseVC.startIndex + 50) > StructurewiseVC.arrStrucherWise.count) ? (StructurewiseVC.startIndex + StructurewiseVC.arrStrucherWise.count) : (StructurewiseVC.startIndex + 50)) of \(TotalCount) results"
                            StructurewiseVC.tbl_StructurewiseReport.reloadData()
                        }
                    }else if tag == 9 {
                        let Report_VC = ViewController as! GroupStructurewiseReportVC
                        let results = try? JSONDecoder().decode(GroupStrucherWiseReportModel.self, from: responseObject)
                        Report_VC.Arr_GroupSReport = [results!]
                        Report_VC.lblShowPagination.text = "Showing \(Report_VC.startIndex) to \(((Report_VC.startIndex + 50) > Report_VC.Arr_GroupSReport[0].groupresults!.count) ? (Report_VC.startIndex + Report_VC.Arr_GroupSReport[0].groupresults!.count) : (Report_VC.startIndex + 50)) of \(Report_VC.Arr_GroupSReport[0].groupresults!.count) results"
                        Report_VC.tbl_GroupStructurewiseReport.reloadData()
                    }else {
                       print("Report Section Not Availabel")
                    }
                }else {
                    Utils.showToastWithMessageAtCenter(message: Strings.kJSONFormattProblem)
                }
                KRProgressHUD.dismiss()
            })
            { (error, statusCode) in
                KRProgressHUD.dismiss()
                if statusCode == 200 {
                    Utils.showToastWithMessageAtCenter(message: "Email sent successfully")
                }
                print(error.localizedDescription)
            }
        }else {
            Utils.showToastWithMessageAtCenter(message: Strings.kNoInternetMessage)
        }
    }
    func Get_DownloadDocument(ViewController: UIViewController,Api_Str : String,params : Parameters,tag : Int,report_Type : String) {
        if AppDelegate.NetworkRechability(){
            Utils.ShowActivityIndicator(message: Strings.kLoading)
            AFWrapper.request_ResponseDat(Api_Str, headers: ["Authorization": DEFAULTS.Get_TOKEN()], params: params, success: { (responseObject, statusCode, JSONObject) in
                if statusCode == 200 {
                    if tag == 2 {
                        let ReportVC = ViewController as! R_MarkwiseReportVC
                        let File = try! responseObject.write(to: URL(fileURLWithPath: NSTemporaryDirectory() + "\((Date().string(with: "dd/mm/yyyy hh:mm:ss").replacingOccurrences(of: "/", with: "_").replacingOccurrences(of: " ", with: "_"))).\(report_Type)"), options: .atomicWrite)
                        let tmpURL = FileManager.default.temporaryDirectory.appendingPathComponent("\((Date().string(with: "dd/mm/yyyy hh:mm:ss").replacingOccurrences(of: "/", with: "_").replacingOccurrences(of: " ", with: "_"))).\(report_Type)")
                        ReportVC.arrDocuments = [tmpURL as NSURL]
                        ReportVC.docViewController.reloadData()
                        ReportVC.present(ReportVC.docViewController, animated: true, completion: nil)
                    }else if tag == 3 { //MarkWise Cumulative
                        let MarkCumulative = ViewController as! MarkwiseCumulativeReportVC
                        let FileDownload = try! responseObject.write(to: URL(fileURLWithPath: NSTemporaryDirectory() + "\((Date().string(with: "dd/mm/yyyy hh:mm:ss").replacingOccurrences(of: "/", with: "_").replacingOccurrences(of: " ", with: "_"))).\(report_Type)"), options: .atomicWrite)
                        let tmpURL = FileManager.default.temporaryDirectory.appendingPathComponent("\((Date().string(with: "dd/mm/yyyy hh:mm:ss").replacingOccurrences(of: "/", with: "_").replacingOccurrences(of: " ", with: "_"))).\(report_Type)")
                        MarkCumulative.arrDocuments = [tmpURL as NSURL]
                        MarkCumulative.docViewController.reloadData()
                        MarkCumulative.present(MarkCumulative.docViewController, animated: true, completion: nil)
                    }else if tag == 5 { //PackingList Report
                        let PackingListReportVC = ViewController as! PackingListReport_VC
                       let FileDownload = try! responseObject.write(to: URL(fileURLWithPath: NSTemporaryDirectory() + "\((Date().string(with: "dd/mm/yyyy hh:mm:ss").replacingOccurrences(of: "/", with: "_").replacingOccurrences(of: " ", with: "_"))).\(report_Type)"), options: .atomicWrite)
                        let tmpURL = FileManager.default.temporaryDirectory.appendingPathComponent("\((Date().string(with: "dd/mm/yyyy hh:mm:ss").replacingOccurrences(of: "/", with: "_").replacingOccurrences(of: " ", with: "_"))).\(report_Type)")
                        PackingListReportVC.arrDocuments = [tmpURL as NSURL]
                        PackingListReportVC.docViewController.reloadData()
                        PackingListReportVC.present(PackingListReportVC.docViewController, animated: true, completion: nil)
                    }else if tag == 8 { //StructurewiseReport
                        let StructurewiseVC = ViewController as! StructurewiseReportVC
                        let FileDownload = try! responseObject.write(to: URL(fileURLWithPath: NSTemporaryDirectory() + "\((Date().string(with: "dd/mm/yyyy hh:mm:ss").replacingOccurrences(of: "/", with: "_").replacingOccurrences(of: " ", with: "_"))).\(report_Type)"), options: .atomicWrite)
                        let tmpURL = FileManager.default.temporaryDirectory.appendingPathComponent("\((Date().string(with: "dd/mm/yyyy hh:mm:ss").replacingOccurrences(of: "/", with: "_").replacingOccurrences(of: " ", with: "_"))).\(report_Type)")
                        StructurewiseVC.arrDocuments = [tmpURL as NSURL]
                        StructurewiseVC.docViewController.reloadData()
                        StructurewiseVC.present(StructurewiseVC.docViewController, animated: true, completion: nil)
                    }else if tag == 9 {
                        let ReportVC = ViewController as! GroupStructurewiseReportVC
                        let FileDownload = try! responseObject.write(to: URL(fileURLWithPath: NSTemporaryDirectory() + "\((Date().string(with: "dd/mm/yyyy hh:mm:ss").replacingOccurrences(of: "/", with: "_").replacingOccurrences(of: " ", with: "_"))).\(report_Type)"), options: .atomicWrite)
                        let tmpURL = FileManager.default.temporaryDirectory.appendingPathComponent("\((Date().string(with: "dd/mm/yyyy hh:mm:ss").replacingOccurrences(of: "/", with: "_").replacingOccurrences(of: " ", with: "_"))).\(report_Type)")
                        ReportVC.arrDocuments = [tmpURL as NSURL]
                        ReportVC.docViewController.reloadData()
                        ReportVC.present(ReportVC.docViewController, animated: true, completion: nil)
                    }else {
                       print("Report Section Data File Not Availabel")
                    }
                }
                KRProgressHUD.dismiss()
            }){ (error, statusCode) in
                KRProgressHUD.dismiss()
                print(error.localizedDescription)
            }
        }else {
            Utils.showToastWithMessageAtCenter(message: Strings.kNoInternetMessage)
        }
    }
    func GetDownloadDocument(ViewController: UIViewController,Api_Str : String,params : Parameters,tag : Int,report_Type : String) {
        if AppDelegate.NetworkRechability(){
            Utils.ShowActivityIndicator(message: Strings.kLoading)
            AFWrapper.request_ResponseDat(Api_Str, headers: ["Authorization": DEFAULTS.Get_TOKEN()], params: params, success: { (responseObject, statusCode, JSONObject) in
                if statusCode == 200 {
                    if tag == 1 || tag == 4 || tag == 6 || tag == 7 || tag == 10 {
                        let Report_VC = ViewController as! DReportVC
                        let FileDownload = try! responseObject.write(to: URL(fileURLWithPath: NSTemporaryDirectory() + "\((Date().string(with: "dd/mm/yyyy hh:mm:ss").replacingOccurrences(of: "/", with: "_").replacingOccurrences(of: " ", with: "_"))).\(report_Type)"), options: .atomicWrite)
                        let tmpURL = FileManager.default.temporaryDirectory.appendingPathComponent("\((Date().string(with: "dd/mm/yyyy hh:mm:ss").replacingOccurrences(of: "/", with: "_").replacingOccurrences(of: " ", with: "_"))).\(report_Type)")
                        Report_VC.arrDocuments = [tmpURL as NSURL]
                        Report_VC.docViewController.reloadData()
                        Report_VC.present(Report_VC.docViewController, animated: true, completion: nil)
                    }else {
                       print("Not Single Header Report Section")
                    }
                }
                KRProgressHUD.dismiss()
            }){ (error, statusCode) in
                KRProgressHUD.dismiss()
                print(error.localizedDescription)
            }
        }else {
            Utils.showToastWithMessageAtCenter(message: Strings.kNoInternetMessage)
        }
    }
    func SentMail(ViewController: UIViewController,Api_Str : String,params : Parameters,tag : Int) {
        if AppDelegate.NetworkRechability(){
            Utils.ShowActivityIndicator(message: Strings.kLoading)
            AFWrapper.requestGETURL_WithParameter_ReturnStatuscode(Api_Str, headers: ["Authorization": DEFAULTS.Get_TOKEN()], params: params, success: { (responseObject, statusCode, JSONObject) in
                if statusCode == 200 {
                    print(Strings.KEmailSent)
                }else {
                    Utils.showToastWithMessageAtCenter(message: Strings.kJSONFormattProblem)
                }
                KRProgressHUD.dismiss()
            })
            { (error, statusCode) in
                KRProgressHUD.dismiss()
                if statusCode == 200 {
                    Utils.showToastWithMessageAtCenter(message: Strings.KEmailSent)
                }
                print(error.localizedDescription)
            }
        }else {
            Utils.showToastWithMessageAtCenter(message: Strings.kNoInternetMessage)
        }
    }
    func Get_DashBoardHome(Api_str : String,ViewController: UIViewController,Tag : Int) {
        if AppDelegate.NetworkRechability(){
            Utils.ShowActivityIndicator(message: Strings.kLoading)
            let DashBoard_VC = ViewController as! HomeVC
            AFWrapper.requestGETURL_JSON(Api_str, headers:["Authorization": DEFAULTS.Get_TOKEN()], params : [:], success: { (responseObject,statusCode) in
                do {
                    if statusCode == 200 {
                        if Tag == 5 {
                            let results = try JSONDecoder().decode(DashBoardMarkWiseModel.self, from: responseObject)
                            DashBoard_VC.Arr_DashBoardMarkwise = [results]
                            DashBoard_VC.Is_Mark = true
                            DashBoard_VC.SetMarkData()
                        }else {
                            let results = try JSONDecoder().decode(DashBoardModel.self, from: responseObject)
                            DashBoard_VC.Arr_DashBoardResult = results.results!
                            DashBoard_VC.SetData()
                        }
                        KRProgressHUD.dismiss()
                    }else {
                        KRProgressHUD.dismiss()
                    }
                }catch let jsonErr{
                    print("json error : \(jsonErr.localizedDescription)")
                    KRProgressHUD.dismiss()
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
