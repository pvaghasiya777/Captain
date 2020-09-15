
//  Created on August 14, 2020

import Foundation


class PackingListModel : NSObject, NSCoding{

    var approveStatus : String!
    var dimensionDecimalSize : Int!
    var id : Int!
    var isActive : Bool!
    var isReleased : Bool!
    var lockReleased : Bool!
    var masterPackageCount : Int!
    var number : String!
    var plExcel : String!
    var plInputId : Int!
    var plPdf : String!
    var plSequence : String!
    var projectName : String!
    var purchaseId : String!
    var releaseNote : String!
    var releasedDate : String!
    var revision : String!
    var status : String!
    var structureId : String!
    var totalGrossWeight : String!
    var totalNetWeight : String!
    var totalQuantity : Int!
    var totalVolume : String!
    var vendorName : String!
    var weightDecimalSize : Int!

    override init() { }
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        approveStatus = dictionary["approve_status"] as? String
        dimensionDecimalSize = dictionary["dimension_decimal_size"] as? Int
        id = dictionary["id"] as? Int
        isActive = dictionary["is_active"] as? Bool
        isReleased = dictionary["is_released"] as? Bool
        lockReleased = dictionary["lock_released"] as? Bool
        masterPackageCount = dictionary["master_package_count"] as? Int
        number = dictionary["number"] as? String
        plExcel = dictionary["pl_excel"] as? String
        plInputId = dictionary["pl_input_id"] as? Int
        plPdf = dictionary["pl_pdf"] as? String
        plSequence = dictionary["pl_sequence"] as? String
        projectName = dictionary["project_name"] as? String
        purchaseId = dictionary["purchase_id"] as? String
        releaseNote = dictionary["release_note"] as? String
        releasedDate = dictionary["released_date"] as? String
        revision = dictionary["revision"] as? String
        status = dictionary["status"] as? String
        structureId = dictionary["structure_id"] as? String
        totalGrossWeight = dictionary["total_gross_weight"] as? String
        totalNetWeight = dictionary["total_net_weight"] as? String
        totalQuantity = dictionary["total_quantity"] as? Int
        totalVolume = dictionary["total_volume"] as? String
        vendorName = dictionary["vendor_name"] as? String
        weightDecimalSize = dictionary["weight_decimal_size"] as? Int
    }
    func Load_Data_To_Array(arr_Data:NSMutableArray) -> NSMutableArray {
        let Arr_Final_Data : NSMutableArray = NSMutableArray()
        print(arr_Data)
        for obj_Data in arr_Data {
            Arr_Final_Data.add(PackingListModel(fromDictionary: obj_Data as! [String : Any]))
        }
        return Arr_Final_Data
    }
    func removeNSNull(from dict: [String: Any]) -> [String: Any] {
        var mutableDict = dict
        let keysWithEmptString = dict.filter { $0.1 is NSNull }.map { $0.0 }
        for key in keysWithEmptString {
            mutableDict[key] = ""
        }
        return mutableDict
    }
    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if approveStatus != nil{
            dictionary["approve_status"] = approveStatus
        }
        if dimensionDecimalSize != nil{
            dictionary["dimension_decimal_size"] = dimensionDecimalSize
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
        if lockReleased != nil{
            dictionary["lock_released"] = lockReleased
        }
        if masterPackageCount != nil{
            dictionary["master_package_count"] = masterPackageCount
        }
        if number != nil{
            dictionary["number"] = number
        }
        if plExcel != nil{
            dictionary["pl_excel"] = plExcel
        }
        if plInputId != nil{
            dictionary["pl_input_id"] = plInputId
        }
        if plPdf != nil{
            dictionary["pl_pdf"] = plPdf
        }
        if plSequence != nil{
            dictionary["pl_sequence"] = plSequence
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
        if status != nil{
            dictionary["status"] = status
        }
        if structureId != nil{
            dictionary["structure_id"] = structureId
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
        dimensionDecimalSize = aDecoder.decodeObject(forKey: "dimension_decimal_size") as? Int
        id = aDecoder.decodeObject(forKey: "id") as? Int
        isActive = aDecoder.decodeObject(forKey: "is_active") as? Bool
        isReleased = aDecoder.decodeObject(forKey: "is_released") as? Bool
        lockReleased = aDecoder.decodeObject(forKey: "lock_released") as? Bool
        masterPackageCount = aDecoder.decodeObject(forKey: "master_package_count") as? Int
        number = aDecoder.decodeObject(forKey: "number") as? String
        plExcel = aDecoder.decodeObject(forKey: "pl_excel") as? String
        plInputId = aDecoder.decodeObject(forKey: "pl_input_id") as? Int
        plPdf = aDecoder.decodeObject(forKey: "pl_pdf") as? String
        plSequence = aDecoder.decodeObject(forKey: "pl_sequence") as? String
        projectName = aDecoder.decodeObject(forKey: "project_name") as? String
        purchaseId = aDecoder.decodeObject(forKey: "purchase_id") as? String
        releaseNote = aDecoder.decodeObject(forKey: "release_note") as? String
        releasedDate = aDecoder.decodeObject(forKey: "released_date") as? String
        revision = aDecoder.decodeObject(forKey: "revision") as? String
        status = aDecoder.decodeObject(forKey: "status") as? String
        structureId = aDecoder.decodeObject(forKey: "structure_id") as? String
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
        if dimensionDecimalSize != nil{
            aCoder.encode(dimensionDecimalSize, forKey: "dimension_decimal_size")
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
        if lockReleased != nil{
            aCoder.encode(lockReleased, forKey: "lock_released")
        }
        if masterPackageCount != nil{
            aCoder.encode(masterPackageCount, forKey: "master_package_count")
        }
        if number != nil{
            aCoder.encode(number, forKey: "number")
        }
        if plExcel != nil{
            aCoder.encode(plExcel, forKey: "pl_excel")
        }
        if plInputId != nil{
            aCoder.encode(plInputId, forKey: "pl_input_id")
        }
        if plPdf != nil{
            aCoder.encode(plPdf, forKey: "pl_pdf")
        }
        if plSequence != nil{
            aCoder.encode(plSequence, forKey: "pl_sequence")
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
        if status != nil{
            aCoder.encode(status, forKey: "status")
        }
        if structureId != nil{
            aCoder.encode(structureId, forKey: "structure_id")
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
