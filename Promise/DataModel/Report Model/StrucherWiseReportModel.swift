//
//  RootClass.swift
//  Model Generated using http://www.jsoncafe.com/
//  Created on September 17, 2020

import Foundation


class StrucherWiseReportModel : NSObject, NSCoding{

    var balancePieces : Int!
    var balanceWeight : Float!
    var boltPieceProgress : Int!
    var boltPieces : Int!
    var boltPiecesReleased : Int!
    var boltWeight : Float!
    var boltWeightReleased : Int!
    var extraPiecesReleased : Int!
    var extraWeightReleased : Int!
    var groupStructureName : String!
    var lot : String!
    var mainProgressWeight : Int!
    var mainReleasedWeight : Int!
    var mainSteelWeight : Int!
    var onsitePieces : Int!
    var onsiteProgressPiece : Int!
    var onsiteProgressWeight : Int!
    var onsiteWeight : Int!
    var othersProgressWeight : Int!
    var othersReleasedWeight : Int!
    var othersSteelWeight : Float!
    var overallPiecesReleased : Int!
    var overallProgressPiece : Int!
    var overallProgressWeight : Int!
    var purchaseId : String!
    var releasedDate : String!
    var releasedStatus : String!
    var revNo : String!
    var serialNo : Int!
    var shippedPieces : Int!
    var shippedProgressPiece : Int!
    var shippedProgressWeight : Int!
    var shippedWeight : Int!
    var steelWeight : Float!
    var structureId : String!
    var totalPieces : Int!
    var vendorName : String!

    override init() {
    }
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        balancePieces = dictionary["balance_pieces"] as? Int
        balanceWeight = dictionary["balance_weight"] as? Float
        boltPieceProgress = dictionary["bolt_piece_progress"] as? Int
        boltPieces = dictionary["bolt_pieces"] as? Int
        boltPiecesReleased = dictionary["bolt_pieces_released"] as? Int
        boltWeight = dictionary["bolt_weight"] as? Float
        boltWeightReleased = dictionary["bolt_weight_released"] as? Int
        extraPiecesReleased = dictionary["extra_pieces_released"] as? Int
        extraWeightReleased = dictionary["extra_weight_released"] as? Int
        groupStructureName = dictionary["group_structure_name"] as? String
        lot = dictionary["lot"] as? String
        mainProgressWeight = dictionary["main_progress_weight"] as? Int
        mainReleasedWeight = dictionary["main_released_weight"] as? Int
        mainSteelWeight = dictionary["main_steel_weight"] as? Int
        onsitePieces = dictionary["onsite_pieces"] as? Int
        onsiteProgressPiece = dictionary["onsite_progress_piece"] as? Int
        onsiteProgressWeight = dictionary["onsite_progress_weight"] as? Int
        onsiteWeight = dictionary["onsite_weight"] as? Int
        othersProgressWeight = dictionary["others_progress_weight"] as? Int
        othersReleasedWeight = dictionary["others_released_weight"] as? Int
        othersSteelWeight = dictionary["others_steel_weight"] as? Float
        overallPiecesReleased = dictionary["overall_pieces_released"] as? Int
        overallProgressPiece = dictionary["overall_progress_piece"] as? Int
        overallProgressWeight = dictionary["overall_progress_weight"] as? Int
        purchaseId = dictionary["purchase_id"] as? String
        releasedDate = dictionary["released_date"] as? String
        releasedStatus = dictionary["released_status"] as? String
        revNo = dictionary["rev_no"] as? String
        serialNo = dictionary["serial_no"] as? Int
        shippedPieces = dictionary["shipped_pieces"] as? Int
        shippedProgressPiece = dictionary["shipped_progress_piece"] as? Int
        shippedProgressWeight = dictionary["shipped_progress_weight"] as? Int
        shippedWeight = dictionary["shipped_weight"] as? Int
        steelWeight = dictionary["steel_weight"] as? Float
        structureId = dictionary["structure_id"] as? String
        totalPieces = dictionary["total_pieces"] as? Int
        vendorName = dictionary["vendor_name"] as? String
    }
    func Load_Data_To_Array(arr_Data:NSMutableArray) -> NSMutableArray {
        let Arr_Final_Data : NSMutableArray = NSMutableArray()
        for obj_Data in arr_Data {
            Arr_Final_Data.add(StrucherWiseReportModel(fromDictionary: obj_Data as! [String : Any]))
        }
        return Arr_Final_Data
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if balancePieces != nil{
            dictionary["balance_pieces"] = balancePieces
        }
        if balanceWeight != nil{
            dictionary["balance_weight"] = balanceWeight
        }
        if boltPieceProgress != nil{
            dictionary["bolt_piece_progress"] = boltPieceProgress
        }
        if boltPieces != nil{
            dictionary["bolt_pieces"] = boltPieces
        }
        if boltPiecesReleased != nil{
            dictionary["bolt_pieces_released"] = boltPiecesReleased
        }
        if boltWeight != nil{
            dictionary["bolt_weight"] = boltWeight
        }
        if boltWeightReleased != nil{
            dictionary["bolt_weight_released"] = boltWeightReleased
        }
        if extraPiecesReleased != nil{
            dictionary["extra_pieces_released"] = extraPiecesReleased
        }
        if extraWeightReleased != nil{
            dictionary["extra_weight_released"] = extraWeightReleased
        }
        if groupStructureName != nil{
            dictionary["group_structure_name"] = groupStructureName
        }
        if lot != nil{
            dictionary["lot"] = lot
        }
        if mainProgressWeight != nil{
            dictionary["main_progress_weight"] = mainProgressWeight
        }
        if mainReleasedWeight != nil{
            dictionary["main_released_weight"] = mainReleasedWeight
        }
        if mainSteelWeight != nil{
            dictionary["main_steel_weight"] = mainSteelWeight
        }
        if onsitePieces != nil{
            dictionary["onsite_pieces"] = onsitePieces
        }
        if onsiteProgressPiece != nil{
            dictionary["onsite_progress_piece"] = onsiteProgressPiece
        }
        if onsiteProgressWeight != nil{
            dictionary["onsite_progress_weight"] = onsiteProgressWeight
        }
        if onsiteWeight != nil{
            dictionary["onsite_weight"] = onsiteWeight
        }
        if othersProgressWeight != nil{
            dictionary["others_progress_weight"] = othersProgressWeight
        }
        if othersReleasedWeight != nil{
            dictionary["others_released_weight"] = othersReleasedWeight
        }
        if othersSteelWeight != nil{
            dictionary["others_steel_weight"] = othersSteelWeight
        }
        if overallPiecesReleased != nil{
            dictionary["overall_pieces_released"] = overallPiecesReleased
        }
        if overallProgressPiece != nil{
            dictionary["overall_progress_piece"] = overallProgressPiece
        }
        if overallProgressWeight != nil{
            dictionary["overall_progress_weight"] = overallProgressWeight
        }
        if purchaseId != nil{
            dictionary["purchase_id"] = purchaseId
        }
        if releasedDate != nil{
            dictionary["released_date"] = releasedDate
        }
        if releasedStatus != nil{
            dictionary["released_status"] = releasedStatus
        }
        if revNo != nil{
            dictionary["rev_no"] = revNo
        }
        if serialNo != nil{
            dictionary["serial_no"] = serialNo
        }
        if shippedPieces != nil{
            dictionary["shipped_pieces"] = shippedPieces
        }
        if shippedProgressPiece != nil{
            dictionary["shipped_progress_piece"] = shippedProgressPiece
        }
        if shippedProgressWeight != nil{
            dictionary["shipped_progress_weight"] = shippedProgressWeight
        }
        if shippedWeight != nil{
            dictionary["shipped_weight"] = shippedWeight
        }
        if steelWeight != nil{
            dictionary["steel_weight"] = steelWeight
        }
        if structureId != nil{
            dictionary["structure_id"] = structureId
        }
        if totalPieces != nil{
            dictionary["total_pieces"] = totalPieces
        }
        if vendorName != nil{
            dictionary["vendor_name"] = vendorName
        }
        return dictionary
    }

    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        balancePieces = aDecoder.decodeObject(forKey: "balance_pieces") as? Int
        balanceWeight = aDecoder.decodeObject(forKey: "balance_weight") as? Float
        boltPieceProgress = aDecoder.decodeObject(forKey: "bolt_piece_progress") as? Int
        boltPieces = aDecoder.decodeObject(forKey: "bolt_pieces") as? Int
        boltPiecesReleased = aDecoder.decodeObject(forKey: "bolt_pieces_released") as? Int
        boltWeight = aDecoder.decodeObject(forKey: "bolt_weight") as? Float
        boltWeightReleased = aDecoder.decodeObject(forKey: "bolt_weight_released") as? Int
        extraPiecesReleased = aDecoder.decodeObject(forKey: "extra_pieces_released") as? Int
        extraWeightReleased = aDecoder.decodeObject(forKey: "extra_weight_released") as? Int
        groupStructureName = aDecoder.decodeObject(forKey: "group_structure_name") as? String
        lot = aDecoder.decodeObject(forKey: "lot") as? String
        mainProgressWeight = aDecoder.decodeObject(forKey: "main_progress_weight") as? Int
        mainReleasedWeight = aDecoder.decodeObject(forKey: "main_released_weight") as? Int
        mainSteelWeight = aDecoder.decodeObject(forKey: "main_steel_weight") as? Int
        onsitePieces = aDecoder.decodeObject(forKey: "onsite_pieces") as? Int
        onsiteProgressPiece = aDecoder.decodeObject(forKey: "onsite_progress_piece") as? Int
        onsiteProgressWeight = aDecoder.decodeObject(forKey: "onsite_progress_weight") as? Int
        onsiteWeight = aDecoder.decodeObject(forKey: "onsite_weight") as? Int
        othersProgressWeight = aDecoder.decodeObject(forKey: "others_progress_weight") as? Int
        othersReleasedWeight = aDecoder.decodeObject(forKey: "others_released_weight") as? Int
        othersSteelWeight = aDecoder.decodeObject(forKey: "others_steel_weight") as? Float
        overallPiecesReleased = aDecoder.decodeObject(forKey: "overall_pieces_released") as? Int
        overallProgressPiece = aDecoder.decodeObject(forKey: "overall_progress_piece") as? Int
        overallProgressWeight = aDecoder.decodeObject(forKey: "overall_progress_weight") as? Int
        purchaseId = aDecoder.decodeObject(forKey: "purchase_id") as? String
        releasedDate = aDecoder.decodeObject(forKey: "released_date") as? String
        releasedStatus = aDecoder.decodeObject(forKey: "released_status") as? String
        revNo = aDecoder.decodeObject(forKey: "rev_no") as? String
        serialNo = aDecoder.decodeObject(forKey: "serial_no") as? Int
        shippedPieces = aDecoder.decodeObject(forKey: "shipped_pieces") as? Int
        shippedProgressPiece = aDecoder.decodeObject(forKey: "shipped_progress_piece") as? Int
        shippedProgressWeight = aDecoder.decodeObject(forKey: "shipped_progress_weight") as? Int
        shippedWeight = aDecoder.decodeObject(forKey: "shipped_weight") as? Int
        steelWeight = aDecoder.decodeObject(forKey: "steel_weight") as? Float
        structureId = aDecoder.decodeObject(forKey: "structure_id") as? String
        totalPieces = aDecoder.decodeObject(forKey: "total_pieces") as? Int
        vendorName = aDecoder.decodeObject(forKey: "vendor_name") as? String
    }

    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if balancePieces != nil{
            aCoder.encode(balancePieces, forKey: "balance_pieces")
        }
        if balanceWeight != nil{
            aCoder.encode(balanceWeight, forKey: "balance_weight")
        }
        if boltPieceProgress != nil{
            aCoder.encode(boltPieceProgress, forKey: "bolt_piece_progress")
        }
        if boltPieces != nil{
            aCoder.encode(boltPieces, forKey: "bolt_pieces")
        }
        if boltPiecesReleased != nil{
            aCoder.encode(boltPiecesReleased, forKey: "bolt_pieces_released")
        }
        if boltWeight != nil{
            aCoder.encode(boltWeight, forKey: "bolt_weight")
        }
        if boltWeightReleased != nil{
            aCoder.encode(boltWeightReleased, forKey: "bolt_weight_released")
        }
        if extraPiecesReleased != nil{
            aCoder.encode(extraPiecesReleased, forKey: "extra_pieces_released")
        }
        if extraWeightReleased != nil{
            aCoder.encode(extraWeightReleased, forKey: "extra_weight_released")
        }
        if groupStructureName != nil{
            aCoder.encode(groupStructureName, forKey: "group_structure_name")
        }
        if lot != nil{
            aCoder.encode(lot, forKey: "lot")
        }
        if mainProgressWeight != nil{
            aCoder.encode(mainProgressWeight, forKey: "main_progress_weight")
        }
        if mainReleasedWeight != nil{
            aCoder.encode(mainReleasedWeight, forKey: "main_released_weight")
        }
        if mainSteelWeight != nil{
            aCoder.encode(mainSteelWeight, forKey: "main_steel_weight")
        }
        if onsitePieces != nil{
            aCoder.encode(onsitePieces, forKey: "onsite_pieces")
        }
        if onsiteProgressPiece != nil{
            aCoder.encode(onsiteProgressPiece, forKey: "onsite_progress_piece")
        }
        if onsiteProgressWeight != nil{
            aCoder.encode(onsiteProgressWeight, forKey: "onsite_progress_weight")
        }
        if onsiteWeight != nil{
            aCoder.encode(onsiteWeight, forKey: "onsite_weight")
        }
        if othersProgressWeight != nil{
            aCoder.encode(othersProgressWeight, forKey: "others_progress_weight")
        }
        if othersReleasedWeight != nil{
            aCoder.encode(othersReleasedWeight, forKey: "others_released_weight")
        }
        if othersSteelWeight != nil{
            aCoder.encode(othersSteelWeight, forKey: "others_steel_weight")
        }
        if overallPiecesReleased != nil{
            aCoder.encode(overallPiecesReleased, forKey: "overall_pieces_released")
        }
        if overallProgressPiece != nil{
            aCoder.encode(overallProgressPiece, forKey: "overall_progress_piece")
        }
        if overallProgressWeight != nil{
            aCoder.encode(overallProgressWeight, forKey: "overall_progress_weight")
        }
        if purchaseId != nil{
            aCoder.encode(purchaseId, forKey: "purchase_id")
        }
        if releasedDate != nil{
            aCoder.encode(releasedDate, forKey: "released_date")
        }
        if releasedStatus != nil{
            aCoder.encode(releasedStatus, forKey: "released_status")
        }
        if revNo != nil{
            aCoder.encode(revNo, forKey: "rev_no")
        }
        if serialNo != nil{
            aCoder.encode(serialNo, forKey: "serial_no")
        }
        if shippedPieces != nil{
            aCoder.encode(shippedPieces, forKey: "shipped_pieces")
        }
        if shippedProgressPiece != nil{
            aCoder.encode(shippedProgressPiece, forKey: "shipped_progress_piece")
        }
        if shippedProgressWeight != nil{
            aCoder.encode(shippedProgressWeight, forKey: "shipped_progress_weight")
        }
        if shippedWeight != nil{
            aCoder.encode(shippedWeight, forKey: "shipped_weight")
        }
        if steelWeight != nil{
            aCoder.encode(steelWeight, forKey: "steel_weight")
        }
        if structureId != nil{
            aCoder.encode(structureId, forKey: "structure_id")
        }
        if totalPieces != nil{
            aCoder.encode(totalPieces, forKey: "total_pieces")
        }
        if vendorName != nil{
            aCoder.encode(vendorName, forKey: "vendor_name")
        }
    }
}
