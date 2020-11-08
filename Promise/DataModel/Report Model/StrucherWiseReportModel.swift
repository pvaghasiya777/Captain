//
//  RootClass.swift
//  Model Generated using http://www.jsoncafe.com/
//  Created on September 17, 2020

import Foundation


class StrucherWiseReportModel : NSObject, NSCoding{

    var balancePieces : Double!
    var balanceWeight : Double!
    var boltPieceProgress : Double!
    var boltPieces : Double!
    var boltPiecesReleased : Double!
    var boltWeight : Double!
    var boltWeightReleased : Double!
    var extraPiecesReleased : Double!
    var extraWeightReleased : Double!
    var groupStructureName : String!
    var lot : String!
    var mainProgressWeight : Double!
    var mainReleasedWeight : Double!
    var mainSteelWeight : Double!
    var onsitePieces : Double!
    var onsiteProgressPiece : Double!
    var onsiteProgressWeight : Double!
    var onsiteWeight : Double!
    var othersProgressWeight : Double!
    var othersReleasedWeight : Double!
    var othersSteelWeight : Double!
    var overallPiecesReleased : Double!
    var overallProgressPiece : Double!
    var overallProgressWeight : Double!
    var purchaseId : String!
    var releasedDate : String!
    var releasedStatus : String!
    var revNo : String!
    var serialNo : Double!
    var shippedPieces : Double!
    var shippedProgressPiece : Double!
    var shippedProgressWeight : Double!
    var shippedWeight : Double!
    var steelWeight : Double!
    var structureId : String!
    var totalPieces : Double!
    var vendorName : String!

    override init() {
    }
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        balancePieces = dictionary["balance_pieces"] as? Double
        balanceWeight = dictionary["balance_weight"] as? Double
        boltPieceProgress = dictionary["bolt_piece_progress"] as? Double
        boltPieces = dictionary["bolt_pieces"] as? Double
        boltPiecesReleased = dictionary["bolt_pieces_released"] as? Double
        boltWeight = dictionary["bolt_weight"] as? Double
        boltWeightReleased = dictionary["bolt_weight_released"] as? Double
        extraPiecesReleased = dictionary["extra_pieces_released"] as? Double
        extraWeightReleased = dictionary["extra_weight_released"] as? Double
        groupStructureName = dictionary["group_structure_name"] as? String
        lot = dictionary["lot"] as? String
        mainProgressWeight = dictionary["main_progress_weight"] as? Double
        mainReleasedWeight = dictionary["main_released_weight"] as? Double
        mainSteelWeight = dictionary["main_steel_weight"] as? Double
        onsitePieces = dictionary["onsite_pieces"] as? Double
        onsiteProgressPiece = dictionary["onsite_progress_piece"] as? Double
        onsiteProgressWeight = dictionary["onsite_progress_weight"] as? Double
        onsiteWeight = dictionary["onsite_weight"] as? Double
        othersProgressWeight = dictionary["others_progress_weight"] as? Double
        othersReleasedWeight = dictionary["others_released_weight"] as? Double
        othersSteelWeight = dictionary["others_steel_weight"] as? Double
        overallPiecesReleased = dictionary["overall_pieces_released"] as? Double
        overallProgressPiece = dictionary["overall_progress_piece"] as? Double
        overallProgressWeight = dictionary["overall_progress_weight"] as? Double
        purchaseId = dictionary["purchase_id"] as? String
        releasedDate = dictionary["released_date"] as? String
        releasedStatus = dictionary["released_status"] as? String
        revNo = dictionary["rev_no"] as? String
        serialNo = dictionary["serial_no"] as? Double
        shippedPieces = dictionary["shipped_pieces"] as? Double
        shippedProgressPiece = dictionary["shipped_progress_piece"] as? Double
        shippedProgressWeight = dictionary["shipped_progress_weight"] as? Double
        shippedWeight = dictionary["shipped_weight"] as? Double
        steelWeight = dictionary["steel_weight"] as? Double
        structureId = dictionary["structure_id"] as? String
        totalPieces = dictionary["total_pieces"] as? Double
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
        balancePieces = aDecoder.decodeObject(forKey: "balance_pieces") as? Double
        balanceWeight = aDecoder.decodeObject(forKey: "balance_weight") as? Double
        boltPieceProgress = aDecoder.decodeObject(forKey: "bolt_piece_progress") as? Double
        boltPieces = aDecoder.decodeObject(forKey: "bolt_pieces") as? Double
        boltPiecesReleased = aDecoder.decodeObject(forKey: "bolt_pieces_released") as? Double
        boltWeight = aDecoder.decodeObject(forKey: "bolt_weight") as? Double
        boltWeightReleased = aDecoder.decodeObject(forKey: "bolt_weight_released") as? Double
        extraPiecesReleased = aDecoder.decodeObject(forKey: "extra_pieces_released") as? Double
        extraWeightReleased = aDecoder.decodeObject(forKey: "extra_weight_released") as? Double
        groupStructureName = aDecoder.decodeObject(forKey: "group_structure_name") as? String
        lot = aDecoder.decodeObject(forKey: "lot") as? String
        mainProgressWeight = aDecoder.decodeObject(forKey: "main_progress_weight") as? Double
        mainReleasedWeight = aDecoder.decodeObject(forKey: "main_released_weight") as? Double
        mainSteelWeight = aDecoder.decodeObject(forKey: "main_steel_weight") as? Double
        onsitePieces = aDecoder.decodeObject(forKey: "onsite_pieces") as? Double
        onsiteProgressPiece = aDecoder.decodeObject(forKey: "onsite_progress_piece") as? Double
        onsiteProgressWeight = aDecoder.decodeObject(forKey: "onsite_progress_weight") as? Double
        onsiteWeight = aDecoder.decodeObject(forKey: "onsite_weight") as? Double
        othersProgressWeight = aDecoder.decodeObject(forKey: "others_progress_weight") as? Double
        othersReleasedWeight = aDecoder.decodeObject(forKey: "others_released_weight") as? Double
        othersSteelWeight = aDecoder.decodeObject(forKey: "others_steel_weight") as? Double
        overallPiecesReleased = aDecoder.decodeObject(forKey: "overall_pieces_released") as? Double
        overallProgressPiece = aDecoder.decodeObject(forKey: "overall_progress_piece") as? Double
        overallProgressWeight = aDecoder.decodeObject(forKey: "overall_progress_weight") as? Double
        purchaseId = aDecoder.decodeObject(forKey: "purchase_id") as? String
        releasedDate = aDecoder.decodeObject(forKey: "released_date") as? String
        releasedStatus = aDecoder.decodeObject(forKey: "released_status") as? String
        revNo = aDecoder.decodeObject(forKey: "rev_no") as? String
        serialNo = aDecoder.decodeObject(forKey: "serial_no") as? Double
        shippedPieces = aDecoder.decodeObject(forKey: "shipped_pieces") as? Double
        shippedProgressPiece = aDecoder.decodeObject(forKey: "shipped_progress_piece") as? Double
        shippedProgressWeight = aDecoder.decodeObject(forKey: "shipped_progress_weight") as? Double
        shippedWeight = aDecoder.decodeObject(forKey: "shipped_weight") as? Double
        steelWeight = aDecoder.decodeObject(forKey: "steel_weight") as? Double
        structureId = aDecoder.decodeObject(forKey: "structure_id") as? String
        totalPieces = aDecoder.decodeObject(forKey: "total_pieces") as? Double
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
