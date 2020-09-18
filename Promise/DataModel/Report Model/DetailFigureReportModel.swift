// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let detailFigureReportModel = try? newJSONDecoder().decode(DetailFigureReportModel.self, from: jsonData)

import Foundation

// MARK: - DetailFigureReportModel
struct DetailFigureReportModel: Codable {
    let count: Int?
    let next, previous: String?
    let results: [DetailResult]?
}

// MARK: - Result
struct DetailResult: Codable {
    let serialNo: Int?
    let groupStructureName, structureID, lot, revNo: String?
    let totalWeight: Double?
    let totalPieces: Int?
    let totalWeightReleased: Double?
    let totalPiecesReleased, extraWeight, extraPieces, totalPiecesMbl: Int?
    let balancePieces: Int?
    let balanceWeight, progressWeight, progressPiece: Double?

    enum CodingKeys: String, CodingKey {
        case serialNo = "serial_no"
        case groupStructureName = "group_structure_name"
        case structureID = "structure_id"
        case lot
        case revNo = "rev_no"
        case totalWeight = "total_weight"
        case totalPieces = "total_pieces"
        case totalWeightReleased = "total_weight_released"
        case totalPiecesReleased = "total_pieces_released"
        case extraWeight = "extra_weight"
        case extraPieces = "extra_pieces"
        case totalPiecesMbl = "total_pieces_mbl"
        case balancePieces = "balance_pieces"
        case balanceWeight = "balance_weight"
        case progressWeight = "progress_weight"
        case progressPiece = "progress_piece"
    }
}
