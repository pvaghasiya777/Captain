//
//  RootClass.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on August 12, 2020

import Foundation


class onSiteStatusDetailModel : NSObject, NSCoding{

    var grossWeight : Int!
    var height : Int!
    var id : Int!
    var isActive : Bool!
    var isReleased : Bool!
    var kindOfPackage : String!
    var length : Int!
    var lockOnsite : Bool!
    var lockShipped : Bool!
    var maxTemp : String!
    var minTemp : String!
    var netWeight : Int!
    var number : String!
    var onSite : Bool!
    var onsiteDate : AnyObject!
    var packageField : Int!
    var plHeaderId : Int!
    var plInputMasterId : Int!
    var projectName : String!
    var purchaseId : String!
    var releaseNote : AnyObject!
    var releasedDate : String!
    var revision : String!
    var shipped : Bool!
    var shippedDate : AnyObject!
    var stackable : String!
    var truckNumber : String!
    var vendorName : String!
    var weightDecimalSize : Int!
    var width : Int!

    override init() {}
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        grossWeight = dictionary["gross_weight"] as? Int
        height = dictionary["height"] as? Int
        id = dictionary["id"] as? Int
        isActive = dictionary["is_active"] as? Bool
        isReleased = dictionary["is_released"] as? Bool
        kindOfPackage = dictionary["kind_of_package"] as? String
        length = dictionary["length"] as? Int
        lockOnsite = dictionary["lock_onsite"] as? Bool
        lockShipped = dictionary["lock_shipped"] as? Bool
        maxTemp = dictionary["max_temp"] as? String
        minTemp = dictionary["min_temp"] as? String
        netWeight = dictionary["net_weight"] as? Int
        number = dictionary["number"] as? String
        onSite = dictionary["on_site"] as? Bool
        onsiteDate = dictionary["onsite_date"] as? AnyObject
        packageField = dictionary["package"] as? Int
        plHeaderId = dictionary["pl_header_id"] as? Int
        plInputMasterId = dictionary["pl_input_master_id"] as? Int
        projectName = dictionary["project_name"] as? String
        purchaseId = dictionary["purchase_id"] as? String
        releaseNote = dictionary["release_note"] as? AnyObject
        releasedDate = dictionary["released_date"] as? String
        revision = dictionary["revision"] as? String
        shipped = dictionary["shipped"] as? Bool
        shippedDate = dictionary["shipped_date"] as? AnyObject
        stackable = dictionary["stackable"] as? String
        truckNumber = dictionary["truck_number"] as? String
        vendorName = dictionary["vendor_name"] as? String
        weightDecimalSize = dictionary["weight_decimal_size"] as? Int
        width = dictionary["width"] as? Int
    }
    func Load_Data_To_Array(arr_Data:NSMutableArray) -> NSMutableArray {
        let Arr_Final_Data : NSMutableArray = NSMutableArray()
        for obj_Data in arr_Data {
            Arr_Final_Data.add(onSiteStatusDetailModel(fromDictionary: obj_Data as! [String : Any]))
        }
        return Arr_Final_Data
    }
    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if grossWeight != nil{
            dictionary["gross_weight"] = grossWeight
        }
        if height != nil{
            dictionary["height"] = height
        }
        if id != nil{
            dictionary["id"] = id
        }
        if isActive != nil{
            dictionary["is_active"] = isActive
        }
        if isReleased != nil{
            dictionary["is_released"] = isReleased
        }
        if kindOfPackage != nil{
            dictionary["kind_of_package"] = kindOfPackage
        }
        if length != nil{
            dictionary["length"] = length
        }
        if lockOnsite != nil{
            dictionary["lock_onsite"] = lockOnsite
        }
        if lockShipped != nil{
            dictionary["lock_shipped"] = lockShipped
        }
        if maxTemp != nil{
            dictionary["max_temp"] = maxTemp
        }
        if minTemp != nil{
            dictionary["min_temp"] = minTemp
        }
        if netWeight != nil{
            dictionary["net_weight"] = netWeight
        }
        if number != nil{
            dictionary["number"] = number
        }
        if onSite != nil{
            dictionary["on_site"] = onSite
        }
        if onsiteDate != nil{
            dictionary["onsite_date"] = onsiteDate
        }
        if packageField != nil{
            dictionary["package"] = packageField
        }
        if plHeaderId != nil{
            dictionary["pl_header_id"] = plHeaderId
        }
        if plInputMasterId != nil{
            dictionary["pl_input_master_id"] = plInputMasterId
        }
        if projectName != nil{
            dictionary["project_name"] = projectName
        }
        if purchaseId != nil{
            dictionary["purchase_id"] = purchaseId
        }
        if releaseNote != nil{
            dictionary["release_note"] = releaseNote
        }
        if releasedDate != nil{
            dictionary["released_date"] = releasedDate
        }
        if revision != nil{
            dictionary["revision"] = revision
        }
        if shipped != nil{
            dictionary["shipped"] = shipped
        }
        if shippedDate != nil{
            dictionary["shipped_date"] = shippedDate
        }
        if stackable != nil{
            dictionary["stackable"] = stackable
        }
        if truckNumber != nil{
            dictionary["truck_number"] = truckNumber
        }
        if vendorName != nil{
            dictionary["vendor_name"] = vendorName
        }
        if weightDecimalSize != nil{
            dictionary["weight_decimal_size"] = weightDecimalSize
        }
        if width != nil{
            dictionary["width"] = width
        }
        return dictionary
    }

    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        grossWeight = aDecoder.decodeObject(forKey: "gross_weight") as? Int
        height = aDecoder.decodeObject(forKey: "height") as? Int
        id = aDecoder.decodeObject(forKey: "id") as? Int
        isActive = aDecoder.decodeObject(forKey: "is_active") as? Bool
        isReleased = aDecoder.decodeObject(forKey: "is_released") as? Bool
        kindOfPackage = aDecoder.decodeObject(forKey: "kind_of_package") as? String
        length = aDecoder.decodeObject(forKey: "length") as? Int
        lockOnsite = aDecoder.decodeObject(forKey: "lock_onsite") as? Bool
        lockShipped = aDecoder.decodeObject(forKey: "lock_shipped") as? Bool
        maxTemp = aDecoder.decodeObject(forKey: "max_temp") as? String
        minTemp = aDecoder.decodeObject(forKey: "min_temp") as? String
        netWeight = aDecoder.decodeObject(forKey: "net_weight") as? Int
        number = aDecoder.decodeObject(forKey: "number") as? String
        onSite = aDecoder.decodeObject(forKey: "on_site") as? Bool
        onsiteDate = aDecoder.decodeObject(forKey: "onsite_date") as? AnyObject
        packageField = aDecoder.decodeObject(forKey: "package") as? Int
        plHeaderId = aDecoder.decodeObject(forKey: "pl_header_id") as? Int
        plInputMasterId = aDecoder.decodeObject(forKey: "pl_input_master_id") as? Int
        projectName = aDecoder.decodeObject(forKey: "project_name") as? String
        purchaseId = aDecoder.decodeObject(forKey: "purchase_id") as? String
        releaseNote = aDecoder.decodeObject(forKey: "release_note") as? AnyObject
        releasedDate = aDecoder.decodeObject(forKey: "released_date") as? String
        revision = aDecoder.decodeObject(forKey: "revision") as? String
        shipped = aDecoder.decodeObject(forKey: "shipped") as? Bool
        shippedDate = aDecoder.decodeObject(forKey: "shipped_date") as? AnyObject
        stackable = aDecoder.decodeObject(forKey: "stackable") as? String
        truckNumber = aDecoder.decodeObject(forKey: "truck_number") as? String
        vendorName = aDecoder.decodeObject(forKey: "vendor_name") as? String
        weightDecimalSize = aDecoder.decodeObject(forKey: "weight_decimal_size") as? Int
        width = aDecoder.decodeObject(forKey: "width") as? Int
    }

    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if grossWeight != nil{
            aCoder.encode(grossWeight, forKey: "gross_weight")
        }
        if height != nil{
            aCoder.encode(height, forKey: "height")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if isActive != nil{
            aCoder.encode(isActive, forKey: "is_active")
        }
        if isReleased != nil{
            aCoder.encode(isReleased, forKey: "is_released")
        }
        if kindOfPackage != nil{
            aCoder.encode(kindOfPackage, forKey: "kind_of_package")
        }
        if length != nil{
            aCoder.encode(length, forKey: "length")
        }
        if lockOnsite != nil{
            aCoder.encode(lockOnsite, forKey: "lock_onsite")
        }
        if lockShipped != nil{
            aCoder.encode(lockShipped, forKey: "lock_shipped")
        }
        if maxTemp != nil{
            aCoder.encode(maxTemp, forKey: "max_temp")
        }
        if minTemp != nil{
            aCoder.encode(minTemp, forKey: "min_temp")
        }
        if netWeight != nil{
            aCoder.encode(netWeight, forKey: "net_weight")
        }
        if number != nil{
            aCoder.encode(number, forKey: "number")
        }
        if onSite != nil{
            aCoder.encode(onSite, forKey: "on_site")
        }
        if onsiteDate != nil{
            aCoder.encode(onsiteDate, forKey: "onsite_date")
        }
        if packageField != nil{
            aCoder.encode(packageField, forKey: "package")
        }
        if plHeaderId != nil{
            aCoder.encode(plHeaderId, forKey: "pl_header_id")
        }
        if plInputMasterId != nil{
            aCoder.encode(plInputMasterId, forKey: "pl_input_master_id")
        }
        if projectName != nil{
            aCoder.encode(projectName, forKey: "project_name")
        }
        if purchaseId != nil{
            aCoder.encode(purchaseId, forKey: "purchase_id")
        }
        if releaseNote != nil{
            aCoder.encode(releaseNote, forKey: "release_note")
        }
        if releasedDate != nil{
            aCoder.encode(releasedDate, forKey: "released_date")
        }
        if revision != nil{
            aCoder.encode(revision, forKey: "revision")
        }
        if shipped != nil{
            aCoder.encode(shipped, forKey: "shipped")
        }
        if shippedDate != nil{
            aCoder.encode(shippedDate, forKey: "shipped_date")
        }
        if stackable != nil{
            aCoder.encode(stackable, forKey: "stackable")
        }
        if truckNumber != nil{
            aCoder.encode(truckNumber, forKey: "truck_number")
        }
        if vendorName != nil{
            aCoder.encode(vendorName, forKey: "vendor_name")
        }
        if weightDecimalSize != nil{
            aCoder.encode(weightDecimalSize, forKey: "weight_decimal_size")
        }
        if width != nil{
            aCoder.encode(width, forKey: "width")
        }
    }
}
