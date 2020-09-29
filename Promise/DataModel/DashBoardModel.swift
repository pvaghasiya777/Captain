// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let dashBoardModel = try? newJSONDecoder().decode(DashBoardModel.self, from: jsonData)

import Foundation

// MARK: - DashBoardModel
struct DashBoardModel: Codable {
    let count: Int?
    let next, previous: String?
    let results: [DashBoardResult]?
}

// MARK: - Result
struct DashBoardResult: Codable {
    let project, strWeight: String?
    let strPieces: Int?
    let strSteelWeight: String?
    let strSteelPieces: Int?
    let strBoltWeight: String?
    let strBoltPieces: Int?
    let strRelWeight: String?
    let strRelPieces: Int?
    let strSteelrelWeight: String?
    let strSteelrelPieces: Int?
    let strBoltrelWeight: String?
    let strBoltrelPieces: Int?
    let strShipWeight: String?
    let strShipPieces: Int?
    let strSteelshipWeight: String?
    let strSteelshipPieces: Int?
    let strBoltshipWeight: String?
    let strBoltshipPieces: Int?
    let strOnsiteWeight: String?
    let strOnsitePieces: Int?
    let strSteelonsiteWeight: String?
    let strSteelonsitePieces: Int?
    let strBoltonsiteWeight: String?
    let strBoltonsitePieces: Int?
    let weightUom, volumeUom, dimensionUom: String?
    let weightDecimalSize, dimensionDecimalSize: Int?
    let strWeightExcess: String?
    let strPiecesExcess: Int?
    let strSteelWeightExcess: String?
    let strSteelPiecesExcess: Int?
    let strBoltWeightExcess: String?
    let strBoltPiecesExcess: Int?
    let strRelWeightExcess: String?
    let strRelPiecesExcess: Int?
    let strSteelrelWeightExcess: String?
    let strSteelrelPiecesExcess: Int?
    let strBoltrelWeightExcess: String?
    let strBoltrelPiecesExcess: Int?
    let strShipWeightExcess: String?
    let strShipPiecesExcess: Int?
    let strSteelshipWeightExcess: String?
    let strSteelshipPiecesExcess: Int?
    let strBoltshipWeightExcess: String?
    let strBoltshipPiecesExcess: Int?
    let strOnsiteWeightExcess: String?
    let strOnsitePiecesExcess: Int?
    let strSteelonsiteWeightExcess: String?
    let strSteelonsitePiecesExcess: Int?
    let strBoltonsiteWeightExcess: String?
    let strBoltonsitePiecesExcess: Int?

    enum CodingKeys: String, CodingKey {
        case project
        case strWeight = "str_weight"
        case strPieces = "str_pieces"
        case strSteelWeight = "str_steel_weight"
        case strSteelPieces = "str_steel_pieces"
        case strBoltWeight = "str_bolt_weight"
        case strBoltPieces = "str_bolt_pieces"
        case strRelWeight = "str_rel_weight"
        case strRelPieces = "str_rel_pieces"
        case strSteelrelWeight = "str_steelrel_weight"
        case strSteelrelPieces = "str_steelrel_pieces"
        case strBoltrelWeight = "str_boltrel_weight"
        case strBoltrelPieces = "str_boltrel_pieces"
        case strShipWeight = "str_ship_weight"
        case strShipPieces = "str_ship_pieces"
        case strSteelshipWeight = "str_steelship_weight"
        case strSteelshipPieces = "str_steelship_pieces"
        case strBoltshipWeight = "str_boltship_weight"
        case strBoltshipPieces = "str_boltship_pieces"
        case strOnsiteWeight = "str_onsite_weight"
        case strOnsitePieces = "str_onsite_pieces"
        case strSteelonsiteWeight = "str_steelonsite_weight"
        case strSteelonsitePieces = "str_steelonsite_pieces"
        case strBoltonsiteWeight = "str_boltonsite_weight"
        case strBoltonsitePieces = "str_boltonsite_pieces"
        case weightUom = "weight_uom"
        case volumeUom = "volume_uom"
        case dimensionUom = "dimension_uom"
        case weightDecimalSize = "weight_decimal_size"
        case dimensionDecimalSize = "dimension_decimal_size"
        case strWeightExcess = "str_weight_excess"
        case strPiecesExcess = "str_pieces_excess"
        case strSteelWeightExcess = "str_steel_weight_excess"
        case strSteelPiecesExcess = "str_steel_pieces_excess"
        case strBoltWeightExcess = "str_bolt_weight_excess"
        case strBoltPiecesExcess = "str_bolt_pieces_excess"
        case strRelWeightExcess = "str_rel_weight_excess"
        case strRelPiecesExcess = "str_rel_pieces_excess"
        case strSteelrelWeightExcess = "str_steelrel_weight_excess"
        case strSteelrelPiecesExcess = "str_steelrel_pieces_excess"
        case strBoltrelWeightExcess = "str_boltrel_weight_excess"
        case strBoltrelPiecesExcess = "str_boltrel_pieces_excess"
        case strShipWeightExcess = "str_ship_weight_excess"
        case strShipPiecesExcess = "str_ship_pieces_excess"
        case strSteelshipWeightExcess = "str_steelship_weight_excess"
        case strSteelshipPiecesExcess = "str_steelship_pieces_excess"
        case strBoltshipWeightExcess = "str_boltship_weight_excess"
        case strBoltshipPiecesExcess = "str_boltship_pieces_excess"
        case strOnsiteWeightExcess = "str_onsite_weight_excess"
        case strOnsitePiecesExcess = "str_onsite_pieces_excess"
        case strSteelonsiteWeightExcess = "str_steelonsite_weight_excess"
        case strSteelonsitePiecesExcess = "str_steelonsite_pieces_excess"
        case strBoltonsiteWeightExcess = "str_boltonsite_weight_excess"
        case strBoltonsitePiecesExcess = "str_boltonsite_pieces_excess"
    }
}
