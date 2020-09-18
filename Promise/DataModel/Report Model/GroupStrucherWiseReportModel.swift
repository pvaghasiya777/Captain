// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let groupStrucherWiseReportModel = try? newJSONDecoder().decode(GroupStrucherWiseReportModel.self, from: jsonData)

import Foundation

// MARK: - GroupStrucherWiseReportModel
struct GroupStrucherWiseReportModel: Codable {
    let count: Int?
    let next, previous: String?
    let groupresults: [Groupresult]?

    enum CodingKeys: String, CodingKey {
        case count, next, previous
        case groupresults = "results"
    }
}

// MARK: - Groupresult
struct Groupresult: Codable {
    let serialNo: Int?
    let vendorName, purchaseID, groupStructureName, structureID: String?
    let masterPackageCount: Int?
    let steelWeight, boltWeight, mainSteelWeight, mainReleasedWeight: Double?
    let mainProgressWeight, othersSteelWeight: Double?
    let othersReleasedWeight, othersProgressWeight, boltWeightReleased, boltPieces: Int?
    let boltPiecesReleased, boltPieceProgress: Int?
    let overallProgressWeight, overallProgressPiece: Double?
    let totalPieces, overallPiecesReleased, balancePieces, extraPiecesReleased: Int?
    let extraWeightReleased: Int?
    let balanceWeight: Double?
    let releasedDate, releasedStatus: String?
    let shippedWeight: Double?
    let shippedPieces: Int?
    let shippedProgressWeight, shippedProgressPiece: Double?
    let shippedFastnerWeight, shippedFastnerPieces, shippedFastnerProgressWeight, shippedFastnerProgressPiece: Int?
    let shippedStatus: String?
    let onsiteWeight: Double?
    let onsitePieces: Int?
    let onsiteProgressWeight, onsiteProgressPiece: Double?
    let onsiteFastnerWeight, onsiteFastnerPieces, onsiteFastnerProgressWeight, onsiteFastnerProgressPiece: Int?
    let onsiteStatus: String?

    enum CodingKeys: String, CodingKey {
        case serialNo = "serial_no"
        case vendorName = "vendor_name"
        case purchaseID = "purchase_id"
        case groupStructureName = "group_structure_name"
        case structureID = "structure_id"
        case masterPackageCount = "master_package_count"
        case steelWeight = "steel_weight"
        case boltWeight = "bolt_weight"
        case mainSteelWeight = "main_steel_weight"
        case mainReleasedWeight = "main_released_weight"
        case mainProgressWeight = "main_progress_weight"
        case othersSteelWeight = "others_steel_weight"
        case othersReleasedWeight = "others_released_weight"
        case othersProgressWeight = "others_progress_weight"
        case boltWeightReleased = "bolt_weight_released"
        case boltPieces = "bolt_pieces"
        case boltPiecesReleased = "bolt_pieces_released"
        case boltPieceProgress = "bolt_piece_progress"
        case overallProgressWeight = "overall_progress_weight"
        case overallProgressPiece = "overall_progress_piece"
        case totalPieces = "total_pieces"
        case overallPiecesReleased = "overall_pieces_released"
        case balancePieces = "balance_pieces"
        case extraPiecesReleased = "extra_pieces_released"
        case extraWeightReleased = "extra_weight_released"
        case balanceWeight = "balance_weight"
        case releasedDate = "released_date"
        case releasedStatus = "released_status"
        case shippedWeight = "shipped_weight"
        case shippedPieces = "shipped_pieces"
        case shippedProgressWeight = "shipped_progress_weight"
        case shippedProgressPiece = "shipped_progress_piece"
        case shippedFastnerWeight = "shipped_fastner_weight"
        case shippedFastnerPieces = "shipped_fastner_pieces"
        case shippedFastnerProgressWeight = "shipped_fastner_progress_weight"
        case shippedFastnerProgressPiece = "shipped_fastner_progress_piece"
        case shippedStatus = "shipped_status"
        case onsiteWeight = "onsite_weight"
        case onsitePieces = "onsite_pieces"
        case onsiteProgressWeight = "onsite_progress_weight"
        case onsiteProgressPiece = "onsite_progress_piece"
        case onsiteFastnerWeight = "onsite_fastner_weight"
        case onsiteFastnerPieces = "onsite_fastner_pieces"
        case onsiteFastnerProgressWeight = "onsite_fastner_progress_weight"
        case onsiteFastnerProgressPiece = "onsite_fastner_progress_piece"
        case onsiteStatus = "onsite_status"
    }
}
