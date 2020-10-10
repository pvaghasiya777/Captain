//
//  ServiceCall.swift
//  Copyright © 2019 Meet PC. All rights reserved.
//

import UIKit
import Alamofire
import SKActivityIndicatorView
import SVProgressHUD
class ReportAPI: NSObject
{
    static let shareInstance = ReportAPI()
    func Get_ReportList(ViewController: UIViewController,Api_Str : String,params : Parameters,tag : Int) {
        if AppDelegate.NetworkRechability(){
            Utils.ShowActivityIndicator(message: "Loading...")
            AFWrapper.requestGETURL_WithParameter_ReturnStatuscode(Api_Str, headers: ["Authorization": DEFAULTS.Get_TOKEN()], params: params, success: { (responseObject, statusCode, JSONObject) in
                print(JSONObject)
                if statusCode == 200 {
                    if tag == 1 || tag == 2 || tag == 3 {
                        let Report_VC = ViewController as! ReportVC6
                        if tag == 1 {
                            let results = try? JSONDecoder().decode(DetailFigureReportModel.self, from: responseObject)
                            print(results!)
                            Report_VC.Arr_DetailFigureReport = [results!]
                            Report_VC.lbl_DetailFPageNum.text = "Showing 1 to \(results!.results!.count) of  \(String(describing: results!.count!)) results"
                            Report_VC.tbl_DetailFigureReport.reloadData()
                        }else if tag == 2 {
                            if ((JSONObject.object as! NSDictionary).value(forKey: "count") as! Int) != 0 {
                                let Arr_Data : NSMutableArray = NSMutableArray()
                                for key in 0...((JSONObject.object as! NSDictionary).value(forKey: "results") as! NSArray).count - 1 {
                                    print(key)
                                    let dic = Utils.removeNSNull(from: (((JSONObject.object as! NSDictionary).value(forKey: "results") as! NSArray)[key] as! NSDictionary) as! [String : Any])
                                    print(dic)
                                    Arr_Data.add(dic)
                                }
                                let obj_Report = MarkWiseReportModel()
                                Report_VC.Arr_MarkWiseReport = obj_Report.Load_Data_To_Array(arr_Data: Arr_Data)
                                Report_VC.Str_markWiseReportNext = ((JSONObject.object as! NSDictionary).value(forKey: "next")! is NSNull) ? "" : (JSONObject.object as! NSDictionary).value(forKey: "next") as! String
                                Report_VC.Str_markWiseReportPrevious = ((JSONObject.object as! NSDictionary).value(forKey: "previous")! is NSNull) ? "" : (JSONObject.object as! NSDictionary).value(forKey: "previous") as! String
                                Report_VC.lbl_PageNum_MarkwiseReport.text = "Showing 1 to \(Arr_Data.count) of \(((JSONObject.object as! NSDictionary).value(forKey: "count") as! Int)) results"
                                Report_VC.tbl_MarkwiseReport.reloadData()
                            }
                        }else if tag == 3 {
                            let results = try? JSONDecoder().decode(MarkWiseCumulativeReportModel.self, from: responseObject)
                            print(results!)
                            Report_VC.Arr_MarkWiseCumulativeReport = [results!]
                            Report_VC.lbl_PageNum_MarkwiseCumulativeReport.text = "Showing 1 to \(results!.results!.count) of\(String(describing: results!.count!)) results"
                            Report_VC.tbl_MarkwiseCumulativeReport.reloadData()
                        }
                    }else if tag == 4 || tag == 5 {
                        let Report_VC = ViewController as! ReportVC1
                        if tag == 4 {
                            let results = try? JSONDecoder().decode(packageWiseReportModel.self, from: responseObject)
                            print(results!)
                            Report_VC.Arr_PackagWiseReport = [results!]
                            Report_VC.lbl_PackWiseNumber.text = "Showing 1 to \(results!.results!.count) of  \(String(describing: results!.count!)) results"
                            Report_VC.tbl_PackagewiseReport.reloadData()
                        }else if tag == 5 {
                            let results = try? JSONDecoder().decode(PackingListReportModel.self, from: responseObject)
                            print(results!)
                            Report_VC.Arr_PackingListReport = [results!]
                            Report_VC.lbl_PackingListNum.text = "Showing 1 to \(results!.results!.count) of  \(String(describing: results!.count!)) results"
                            Report_VC.tbl_PackingListReport.reloadData()
                        }
                    }else if tag == 6 || tag == 7 || tag == 8 {
                        let Report_VC = ViewController as! Report2
                        if tag == 6 {
                            let results = try? JSONDecoder().decode(POPositionWiseReportModel.self, from: responseObject)
                            print(results!)
                            Report_VC.Arr_PoPositionReport = [results!]
                            Report_VC.lbl_POPositionPageNumber.text = "Showing 1 to \(results!.results!.count) of  \(String(describing: results!.count!)) results"
                            Report_VC.tbl_POPositionwiseReport.reloadData()
                        }else if tag == 7 {
                            let results = try? JSONDecoder().decode(IdentCodewiseReportModel.self, from: responseObject)
                            print(results!)
                            Report_VC.Arr_IdentCodeReport = [results!]
                            Report_VC.lbl_IdentCodewiseNumber.text = "Showing 1 to \(results!.results!.count) of  \(String(describing: results!.count!)) results"
                            Report_VC.tbl_IdentCodewiseReport.reloadData()
                        }else if tag == 8 {
                            if ((JSONObject.object as! NSDictionary).value(forKey: "count") as! Int) != 0 {
                                let Arr_Data : NSMutableArray = NSMutableArray(array: ((JSONObject.object as! NSDictionary).value(forKey: "results") as! NSArray))
                                let obj_Report = StrucherWiseReportModel()
                                Report_VC.Arr_StrucherWiseReport = obj_Report.Load_Data_To_Array(arr_Data: Arr_Data)
                                Report_VC.Str_markWiseReportNext = ((JSONObject.object as! NSDictionary).value(forKey: "next")! is NSNull) ? "" : (JSONObject.object as! NSDictionary).value(forKey: "next") as! String
                                Report_VC.Str_markWiseReportPrevious = ((JSONObject.object as! NSDictionary).value(forKey: "previous")! is NSNull) ? "" : (JSONObject.object as! NSDictionary).value(forKey: "previous") as! String
                                Report_VC.lbl_PageNum_StructurewiseReport.text = "Showing 1 to \(String(describing: Arr_Data.count)) of  \((JSONObject.object as! NSDictionary).value(forKey: "count") as! Int) results"
                                Report_VC.tbl_StructurewiseReport.reloadData()
                            }
                        }
                    }else if tag == 9 {
                        let Report_VC = ViewController as! ReportVC3
                        let results = try? JSONDecoder().decode(GroupStrucherWiseReportModel.self, from: responseObject)
                        print(results!)
                        Report_VC.Arr_GroupSReport = [results!]
                        Report_VC.lbl_GroupStrucherPageNumber.text = "Showing 1 to \(results!.groupresults!.count) of  \(String(describing: results!.count!)) results"
                        Report_VC.tbl_GroupStructurewiseReport.reloadData()
                    }else {
                        let Report_VC = ViewController as! ReportVC4
                        let results = try? JSONDecoder().decode(SummaryReportModel.self, from: responseObject)
                        print(results!)
                        Report_VC.Arr_Summary = [results!]
                        Report_VC.lbl_SummaryReportPageNumber.text = "Showing 1 to \(results!.results!.count) of  \(String(describing: results!.count!)) results"
                        Report_VC.tbl_SummaryReport.reloadData()
                    }
                    
                }else {
                    print("Json Failed")
                    //                    Utils.showToastWithMessageAtCenter(message: "")
                }
                SKActivityIndicator.dismiss()
            })
            { (error, statusCode) in
                SKActivityIndicator.dismiss()
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
            Utils.ShowActivityIndicator(message: "Loading")
            AFWrapper.request_ResponseDat(Api_Str, headers: ["Authorization": DEFAULTS.Get_TOKEN()], params: params, success: { (responseObject, statusCode, JSONObject) in
                print(responseObject)
                if statusCode == 200{
                    if tag == 1 || tag == 2 || tag == 3 {
                        let Report_VC = ViewController as! ReportVC6
                        let FileDownload = try! responseObject.write(to: URL(fileURLWithPath: NSTemporaryDirectory() + "\((Date().string(with: "dd/mm/yyyy hh:mm:ss").replacingOccurrences(of: "/", with: "_").replacingOccurrences(of: " ", with: "_"))).\(report_Type)"), options: .atomicWrite)
                        let tmpURL = FileManager.default.temporaryDirectory.appendingPathComponent("\((Date().string(with: "dd/mm/yyyy hh:mm:ss").replacingOccurrences(of: "/", with: "_").replacingOccurrences(of: " ", with: "_"))).\(report_Type)")
                        print(tmpURL)
                        Report_VC.arrDocuments = [tmpURL as! NSURL]
                        Report_VC.docViewController.reloadData()
                        Report_VC.present(Report_VC.docViewController, animated: true, completion: nil)
                    }else if tag == 4 || tag == 5 {
                        let Report_VC = ViewController as! ReportVC1
                        if tag == 4 {
                            let FileDownload = try! responseObject.write(to: URL(fileURLWithPath: NSTemporaryDirectory() + "\((Date().string(with: "dd/mm/yyyy hh:mm:ss").replacingOccurrences(of: "/", with: "_").replacingOccurrences(of: " ", with: "_"))).\(report_Type)"), options: .atomicWrite)
                            let tmpURL = FileManager.default.temporaryDirectory.appendingPathComponent("\((Date().string(with: "dd/mm/yyyy hh:mm:ss").replacingOccurrences(of: "/", with: "_").replacingOccurrences(of: " ", with: "_"))).\(report_Type)")
                            print(tmpURL)
                            Report_VC.arrDocuments = [tmpURL as! NSURL]
                            Report_VC.docViewController.reloadData()
                            Report_VC.present(Report_VC.docViewController, animated: true, completion: nil)
                        }else if tag == 5 {
                            let FileDownload = try! responseObject.write(to: URL(fileURLWithPath: NSTemporaryDirectory() + "\((Date().string(with: "dd/mm/yyyy hh:mm:ss").replacingOccurrences(of: "/", with: "_").replacingOccurrences(of: " ", with: "_"))).\(report_Type)"), options: .atomicWrite)
                            let tmpURL = FileManager.default.temporaryDirectory.appendingPathComponent("\((Date().string(with: "dd/mm/yyyy hh:mm:ss").replacingOccurrences(of: "/", with: "_").replacingOccurrences(of: " ", with: "_"))).\(report_Type)")
                            print(tmpURL)
                            Report_VC.arrDocuments = [tmpURL as! NSURL]
                            Report_VC.docViewController.reloadData()
                            Report_VC.present(Report_VC.docViewController, animated: true, completion: nil)
                        }
                    }else if tag == 6 || tag == 7 || tag == 8 {
                        let Report_VC = ViewController as! Report2
                        let FileDownload = try! responseObject.write(to: URL(fileURLWithPath: NSTemporaryDirectory() + "\((Date().string(with: "dd/mm/yyyy hh:mm:ss").replacingOccurrences(of: "/", with: "_").replacingOccurrences(of: " ", with: "_"))).\(report_Type)"), options: .atomicWrite)
                        let tmpURL = FileManager.default.temporaryDirectory.appendingPathComponent("\((Date().string(with: "dd/mm/yyyy hh:mm:ss").replacingOccurrences(of: "/", with: "_").replacingOccurrences(of: " ", with: "_"))).\(report_Type)")
                        print(tmpURL)
                        Report_VC.arrDocuments = [tmpURL as! NSURL]
                        Report_VC.docViewController.reloadData()
                        Report_VC.present(Report_VC.docViewController, animated: true, completion: nil)
                    }else if tag == 9 {
                        let Report_VC = ViewController as! ReportVC3
                        let FileDownload = try! responseObject.write(to: URL(fileURLWithPath: NSTemporaryDirectory() + "\((Date().string(with: "dd/mm/yyyy hh:mm:ss").replacingOccurrences(of: "/", with: "_").replacingOccurrences(of: " ", with: "_"))).\(report_Type)"), options: .atomicWrite)
                        let tmpURL = FileManager.default.temporaryDirectory.appendingPathComponent("\((Date().string(with: "dd/mm/yyyy hh:mm:ss").replacingOccurrences(of: "/", with: "_").replacingOccurrences(of: " ", with: "_"))).\(report_Type)")
                        print(tmpURL)
                        Report_VC.arrDocuments = [tmpURL as! NSURL]
                        Report_VC.docViewController.reloadData()
                    }else {
                        let Report_VC = ViewController as! ReportVC4
                        let FileDownload = try! responseObject.write(to: URL(fileURLWithPath: NSTemporaryDirectory() + "\((Date().string(with: "dd/mm/yyyy hh:mm:ss").replacingOccurrences(of: "/", with: "_").replacingOccurrences(of: " ", with: "_"))).\(report_Type)"), options: .atomicWrite)
                        let tmpURL = FileManager.default.temporaryDirectory.appendingPathComponent("\((Date().string(with: "dd/mm/yyyy hh:mm:ss").replacingOccurrences(of: "/", with: "_").replacingOccurrences(of: " ", with: "_"))).\(report_Type)")
                        print(tmpURL)
                        Report_VC.arrDocuments = [tmpURL as! NSURL]
                        Report_VC.docViewController.reloadData()
                    }
                }
                SKActivityIndicator.dismiss()
            }){ (error, statusCode) in
            SKActivityIndicator.dismiss()
            
            print(error.localizedDescription)
        }
    }else {
    Utils.showToastWithMessageAtCenter(message: Strings.kNoInternetMessage)
    }
}
func Get_DashBoardHome(Api_str : String,ViewController: UIViewController,Tag : Int) {
    if AppDelegate.NetworkRechability(){
        SVProgressHUD.show(withStatus: "Loading...")
        let DashBoard_VC = ViewController as! HomeVC
        AFWrapper.requestGETURL_JSON(Api_str, headers:["Authorization": DEFAULTS.Get_TOKEN()], params : [:], success: { (responseObject,statusCode) in
            do {
                print(responseObject)
                if statusCode == 200 {
                    if Tag == 5 {
                        let results = try JSONDecoder().decode(DashBoardMarkWiseModel.self, from: responseObject)
                        print(results)
                        DashBoard_VC.Arr_DashBoardMarkwise = [results]
                        DashBoard_VC.Is_Mark = true
                        DashBoard_VC.SetMarkData()
                    }else {
                        let results = try JSONDecoder().decode(DashBoardModel.self, from: responseObject)
                        print(results)
                        DashBoard_VC.Arr_DashBoardResult = results.results!
                        DashBoard_VC.SetData()
                    }
                    SVProgressHUD.dismiss()
                }else {
                    print("Invalid Token")
                    SVProgressHUD.dismiss()
                }
            }catch let jsonErr{
                print("json error : \(jsonErr.localizedDescription)")
                SVProgressHUD.dismiss()
            }
        })
        { (error) in
            //                SKActivityIndicator.dismiss()
            SVProgressHUD.dismiss()
            print(error.localizedDescription)
        }
    }else {
        Utils.showToastWithMessageAtCenter(message: Strings.kNoInternetMessage)
    }
}

}
