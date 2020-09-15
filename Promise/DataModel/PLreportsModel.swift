//
//  RootClass.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on August 13, 2020

import Foundation


class PLreportsModel : NSObject, NSCoding{
    
    var approveStatus : String!
    var createdBy : Int!
    var id : Int!
    var inputNo : String!
    var inspectionDate : AnyObject!
    var isActive : Bool!
    var name : String!
    var plEndNo : Int!
    var plGenerated : Bool!
    var plStartNo : Int!
    var projectName : String!
    var purchaseId : String!
    var revNo : Int!
    var shopDrawingName : String!
    var status : String!
    var totalGrossWeight : String!
    var totalNetWeight : String!
    var totalQuantity : Int!
    var totalVolume : String!
    var vendorName : String!
    var weightDecimalSize : Int!

    override init() {}
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        approveStatus = dictionary["approve_status"] as? String
        createdBy = dictionary["created_by"] as? Int
        id = dictionary["id"] as? Int
        inputNo = dictionary["input_no"] as? String
        inspectionDate = dictionary["inspection_date"] as? AnyObject
        isActive = dictionary["is_active"] as? Bool
        name = dictionary["name"] as? String
        plEndNo = dictionary["pl_end_no"] as? Int
        plGenerated = dictionary["pl_generated"] as? Bool
        plStartNo = dictionary["pl_start_no"] as? Int
        projectName = dictionary["project_name"] as? String
        purchaseId = dictionary["purchase_id"] as? String
        revNo = dictionary["rev_no"] as? Int
        shopDrawingName = dictionary["shop_drawing_name"] as? String
        status = dictionary["status"] as? String
        totalGrossWeight = dictionary["total_gross_weight"] as? String
        totalNetWeight = dictionary["total_net_weight"] as? String
        totalQuantity = dictionary["total_quantity"] as? Int
        totalVolume = dictionary["total_volume"] as? String
        vendorName = dictionary["vendor_name"] as? String
        weightDecimalSize = dictionary["weight_decimal_size"] as? Int
    }

    func Load_Data_To_Array(arr_Data:NSMutableArray) -> NSMutableArray {
        let Arr_Final_Data : NSMutableArray = NSMutableArray()
        for obj_Data in arr_Data {
            Arr_Final_Data.add(PLreportsModel(fromDictionary: obj_Data as! [String : Any]))
        }
        return Arr_Final_Data
    }
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if approveStatus != nil{
            dictionary["approve_status"] = approveStatus
        }
        if createdBy != nil{
            dictionary["created_by"] = createdBy
        }
        if id != nil{
            dictionary["id"] = id
        }
        if inputNo != nil{
            dictionary["input_no"] = inputNo
        }
        if inspectionDate != nil{
            dictionary["inspection_date"] = inspectionDate
        }
        if isActive != nil{
            dictionary["is_active"] = isActive
        }
        if name != nil{
            dictionary["name"] = name
        }
        if plEndNo != nil{
            dictionary["pl_end_no"] = plEndNo
        }
        if plGenerated != nil{
            dictionary["pl_generated"] = plGenerated
        }
        if plStartNo != nil{
            dictionary["pl_start_no"] = plStartNo
        }
        if projectName != nil{
            dictionary["project_name"] = projectName
        }
        if purchaseId != nil{
            dictionary["purchase_id"] = purchaseId
        }
        if revNo != nil{
            dictionary["rev_no"] = revNo
        }
        if shopDrawingName != nil{
            dictionary["shop_drawing_name"] = shopDrawingName
        }
        if status != nil{
            dictionary["status"] = status
        }
        if totalGrossWeight != nil{
            dictionary["total_gross_weight"] = totalGrossWeight
        }
        if totalNetWeight != nil{
            dictionary["total_net_weight"] = totalNetWeight
        }
        if totalQuantity != nil{
            dictionary["total_quantity"] = totalQuantity
        }
        if totalVolume != nil{
            dictionary["total_volume"] = totalVolume
        }
        if vendorName != nil{
            dictionary["vendor_name"] = vendorName
        }
        if weightDecimalSize != nil{
            dictionary["weight_decimal_size"] = weightDecimalSize
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        approveStatus = aDecoder.decodeObject(forKey: "approve_status") as? String
        createdBy = aDecoder.decodeObject(forKey: "created_by") as? Int
        id = aDecoder.decodeObject(forKey: "id") as? Int
        inputNo = aDecoder.decodeObject(forKey: "input_no") as? String
        inspectionDate = aDecoder.decodeObject(forKey: "inspection_date") as? AnyObject
        isActive = aDecoder.decodeObject(forKey: "is_active") as? Bool
        name = aDecoder.decodeObject(forKey: "name") as? String
        plEndNo = aDecoder.decodeObject(forKey: "pl_end_no") as? Int
        plGenerated = aDecoder.decodeObject(forKey: "pl_generated") as? Bool
        plStartNo = aDecoder.decodeObject(forKey: "pl_start_no") as? Int
        projectName = aDecoder.decodeObject(forKey: "project_name") as? String
        purchaseId = aDecoder.decodeObject(forKey: "purchase_id") as? String
        revNo = aDecoder.decodeObject(forKey: "rev_no") as? Int
        shopDrawingName = aDecoder.decodeObject(forKey: "shop_drawing_name") as? String
        status = aDecoder.decodeObject(forKey: "status") as? String
        totalGrossWeight = aDecoder.decodeObject(forKey: "total_gross_weight") as? String
        totalNetWeight = aDecoder.decodeObject(forKey: "total_net_weight") as? String
        totalQuantity = aDecoder.decodeObject(forKey: "total_quantity") as? Int
        totalVolume = aDecoder.decodeObject(forKey: "total_volume") as? String
        vendorName = aDecoder.decodeObject(forKey: "vendor_name") as? String
        weightDecimalSize = aDecoder.decodeObject(forKey: "weight_decimal_size") as? Int
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if approveStatus != nil{
            aCoder.encode(approveStatus, forKey: "approve_status")
        }
        if createdBy != nil{
            aCoder.encode(createdBy, forKey: "created_by")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if inputNo != nil{
            aCoder.encode(inputNo, forKey: "input_no")
        }
        if inspectionDate != nil{
            aCoder.encode(inspectionDate, forKey: "inspection_date")
        }
        if isActive != nil{
            aCoder.encode(isActive, forKey: "is_active")
        }
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }
        if plEndNo != nil{
            aCoder.encode(plEndNo, forKey: "pl_end_no")
        }
        if plGenerated != nil{
            aCoder.encode(plGenerated, forKey: "pl_generated")
        }
        if plStartNo != nil{
            aCoder.encode(plStartNo, forKey: "pl_start_no")
        }
        if projectName != nil{
            aCoder.encode(projectName, forKey: "project_name")
        }
        if purchaseId != nil{
            aCoder.encode(purchaseId, forKey: "purchase_id")
        }
        if revNo != nil{
            aCoder.encode(revNo, forKey: "rev_no")
        }
        if shopDrawingName != nil{
            aCoder.encode(shopDrawingName, forKey: "shop_drawing_name")
        }
        if status != nil{
            aCoder.encode(status, forKey: "status")
        }
        if totalGrossWeight != nil{
            aCoder.encode(totalGrossWeight, forKey: "total_gross_weight")
        }
        if totalNetWeight != nil{
            aCoder.encode(totalNetWeight, forKey: "total_net_weight")
        }
        if totalQuantity != nil{
            aCoder.encode(totalQuantity, forKey: "total_quantity")
        }
        if totalVolume != nil{
            aCoder.encode(totalVolume, forKey: "total_volume")
        }
        if vendorName != nil{
            aCoder.encode(vendorName, forKey: "vendor_name")
        }
        if weightDecimalSize != nil{
            aCoder.encode(weightDecimalSize, forKey: "weight_decimal_size")
        }
    }
}
