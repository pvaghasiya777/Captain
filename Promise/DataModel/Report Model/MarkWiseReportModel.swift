//
//  RootClass.swift
//  Created on September 16, 2020

import Foundation


class MarkWiseReportModel : NSObject, NSCoding{
    var descriptionField : String!
    var fireIdentCode : String!
    var fireproofingWeight : Int!
    var groupStructureName : String!
    var heatNo : String!
    var mark : String!
    var markIdentCode : String!
    var markWeight : Float!
    var masterGrossWeight : Int!
    var masterTotalVolume : Float!
    var mtcNo : String!
    var netWeight : Float!
    var onsiteDate : String!
    var paintIdentCode : String!
    var paintingWeight : Float!
    var plName : String!
    var progressive : String!
    var progressivePieceNr : Int!
    var purchaseId : String!
    var quantity : Int!
    var releasedDate : String!
    var revNo : String!
    var shippedDate : String!
    var structureId : String!
    override init() { }

    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        descriptionField = dictionary["description"] as? String
        fireIdentCode = dictionary["fire_ident_code"] as? String
        fireproofingWeight = dictionary["fireproofing_weight"] as? Int
        groupStructureName = dictionary["group_structure_name"] as? String
        heatNo = dictionary["heat_no"] as? String
        mark = dictionary["mark"] as? String
        markIdentCode = dictionary["mark_ident_code"] as? String
        markWeight = dictionary["mark_weight"] as? Float
        masterGrossWeight = dictionary["master_gross_weight"] as? Int
        masterTotalVolume = dictionary["master_total_volume"] as? Float
        mtcNo = dictionary["mtc_no"] as? String
        netWeight = dictionary["net_weight"] as? Float
        onsiteDate = dictionary["onsite_date"] as? String
        paintIdentCode = dictionary["paint_ident_code"] as? String
        paintingWeight = dictionary["painting_weight"] as? Float
        plName = dictionary["pl_name"] as? String
        progressive = dictionary["progressive"] as? String
        progressivePieceNr = dictionary["progressive_piece_nr"] as? Int
        purchaseId = dictionary["purchase_id"] as? String
        quantity = dictionary["quantity"] as? Int
        releasedDate = dictionary["released_date"] as? String
        revNo = dictionary["rev_no"] as? String
        shippedDate = dictionary["shipped_date"] as? String
        structureId = dictionary["structure_id"] as? String
    }
    func Load_Data_To_Array(arr_Data:NSMutableArray) -> NSMutableArray {
        let Arr_Final_Data : NSMutableArray = NSMutableArray()
        for obj_Data in arr_Data {
            Arr_Final_Data.add(MarkWiseReportModel(fromDictionary: obj_Data as! [String : Any]))
        }
        return Arr_Final_Data
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if descriptionField != nil{
            dictionary["description"] = descriptionField
        }
        if fireIdentCode != nil{
            dictionary["fire_ident_code"] = fireIdentCode
        }
        if fireproofingWeight != nil{
            dictionary["fireproofing_weight"] = fireproofingWeight
        }
        if groupStructureName != nil{
            dictionary["group_structure_name"] = groupStructureName
        }
        if heatNo != nil{
            dictionary["heat_no"] = heatNo
        }
        if mark != nil{
            dictionary["mark"] = mark
        }
        if markIdentCode != nil{
            dictionary["mark_ident_code"] = markIdentCode
        }
        if markWeight != nil{
            dictionary["mark_weight"] = markWeight
        }
        if masterGrossWeight != nil{
            dictionary["master_gross_weight"] = masterGrossWeight
        }
        if masterTotalVolume != nil{
            dictionary["master_total_volume"] = masterTotalVolume
        }
        if mtcNo != nil{
            dictionary["mtc_no"] = mtcNo
        }
        if netWeight != nil{
            dictionary["net_weight"] = netWeight
        }
        if onsiteDate != nil{
            dictionary["onsite_date"] = onsiteDate
        }
        if paintIdentCode != nil{
            dictionary["paint_ident_code"] = paintIdentCode
        }
        if paintingWeight != nil{
            dictionary["painting_weight"] = paintingWeight
        }
        if plName != nil{
            dictionary["pl_name"] = plName
        }
        if progressive != nil{
            dictionary["progressive"] = progressive
        }
        if progressivePieceNr != nil{
            dictionary["progressive_piece_nr"] = progressivePieceNr
        }
        if purchaseId != nil{
            dictionary["purchase_id"] = purchaseId
        }
        if quantity != nil{
            dictionary["quantity"] = quantity
        }
        if releasedDate != nil{
            dictionary["released_date"] = releasedDate
        }
        if revNo != nil{
            dictionary["rev_no"] = revNo
        }
        if shippedDate != nil{
            dictionary["shipped_date"] = shippedDate
        }
        if structureId != nil{
            dictionary["structure_id"] = structureId
        }
        return dictionary
    }

    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        descriptionField = aDecoder.decodeObject(forKey: "description") as? String
        fireIdentCode = aDecoder.decodeObject(forKey: "fire_ident_code") as? String
        fireproofingWeight = aDecoder.decodeObject(forKey: "fireproofing_weight") as? Int
        groupStructureName = aDecoder.decodeObject(forKey: "group_structure_name") as? String
        heatNo = aDecoder.decodeObject(forKey: "heat_no") as? String
        mark = aDecoder.decodeObject(forKey: "mark") as? String
        markIdentCode = aDecoder.decodeObject(forKey: "mark_ident_code") as? String
        markWeight = aDecoder.decodeObject(forKey: "mark_weight") as? Float
        masterGrossWeight = aDecoder.decodeObject(forKey: "master_gross_weight") as? Int
        masterTotalVolume = aDecoder.decodeObject(forKey: "master_total_volume") as? Float
        mtcNo = aDecoder.decodeObject(forKey: "mtc_no") as? String
        netWeight = aDecoder.decodeObject(forKey: "net_weight") as? Float
        onsiteDate = aDecoder.decodeObject(forKey: "onsite_date") as? String
        paintIdentCode = aDecoder.decodeObject(forKey: "paint_ident_code") as? String
        paintingWeight = aDecoder.decodeObject(forKey: "painting_weight") as? Float
        plName = aDecoder.decodeObject(forKey: "pl_name") as? String
        progressive = aDecoder.decodeObject(forKey: "progressive") as? String
        progressivePieceNr = aDecoder.decodeObject(forKey: "progressive_piece_nr") as? Int
        purchaseId = aDecoder.decodeObject(forKey: "purchase_id") as? String
        quantity = aDecoder.decodeObject(forKey: "quantity") as? Int
        releasedDate = aDecoder.decodeObject(forKey: "released_date") as? String
        revNo = aDecoder.decodeObject(forKey: "rev_no") as? String
        shippedDate = aDecoder.decodeObject(forKey: "shipped_date") as? String
        structureId = aDecoder.decodeObject(forKey: "structure_id") as? String
    }

    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if descriptionField != nil{
            aCoder.encode(descriptionField, forKey: "description")
        }
        if fireIdentCode != nil{
            aCoder.encode(fireIdentCode, forKey: "fire_ident_code")
        }
        if fireproofingWeight != nil{
            aCoder.encode(fireproofingWeight, forKey: "fireproofing_weight")
        }
        if groupStructureName != nil{
            aCoder.encode(groupStructureName, forKey: "group_structure_name")
        }
        if heatNo != nil{
            aCoder.encode(heatNo, forKey: "heat_no")
        }
        if mark != nil{
            aCoder.encode(mark, forKey: "mark")
        }
        if markIdentCode != nil{
            aCoder.encode(markIdentCode, forKey: "mark_ident_code")
        }
        if markWeight != nil{
            aCoder.encode(markWeight, forKey: "mark_weight")
        }
        if masterGrossWeight != nil{
            aCoder.encode(masterGrossWeight, forKey: "master_gross_weight")
        }
        if masterTotalVolume != nil{
            aCoder.encode(masterTotalVolume, forKey: "master_total_volume")
        }
        if mtcNo != nil{
            aCoder.encode(mtcNo, forKey: "mtc_no")
        }
        if netWeight != nil{
            aCoder.encode(netWeight, forKey: "net_weight")
        }
        if onsiteDate != nil{
            aCoder.encode(onsiteDate, forKey: "onsite_date")
        }
        if paintIdentCode != nil{
            aCoder.encode(paintIdentCode, forKey: "paint_ident_code")
        }
        if paintingWeight != nil{
            aCoder.encode(paintingWeight, forKey: "painting_weight")
        }
        if plName != nil{
            aCoder.encode(plName, forKey: "pl_name")
        }
        if progressive != nil{
            aCoder.encode(progressive, forKey: "progressive")
        }
        if progressivePieceNr != nil{
            aCoder.encode(progressivePieceNr, forKey: "progressive_piece_nr")
        }
        if purchaseId != nil{
            aCoder.encode(purchaseId, forKey: "purchase_id")
        }
        if quantity != nil{
            aCoder.encode(quantity, forKey: "quantity")
        }
        if releasedDate != nil{
            aCoder.encode(releasedDate, forKey: "released_date")
        }
        if revNo != nil{
            aCoder.encode(revNo, forKey: "rev_no")
        }
        if shippedDate != nil{
            aCoder.encode(shippedDate, forKey: "shipped_date")
        }
        if structureId != nil{
            aCoder.encode(structureId, forKey: "structure_id")
        }
    }
}
