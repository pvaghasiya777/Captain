// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let dashBoardMarkWiseModel = try? newJSONDecoder().decode(DashBoardMarkWiseModel.self, from: jsonData)

import Foundation

// MARK: - DashBoardMarkWiseModel
struct DashBoardMarkWiseModel: Codable {
    let project, structure: String?
    let strWeight: Double?
    let strPieces, strSteelPieces: Int?
    let poNo: String?
    let strSteelWeight: Double?
    let packingList: [String]?
    let strBoltWeight, strBoltPieces, strRelWeight, strRelPieces: Int?
    let strSteelrelWeight, strSteelrelPieces, strBoltrelWeight, strBoltrelPieces: Int?
    let strShipWeight, strShipPieces, strSteelshipWeight, strSteelshipPieces: Int?
    let strBoltshipWeight, strBoltshipPieces, strOnsiteWeight, strOnsitePieces: Int?
    let strSteelonsiteWeight, strSteelonsitePieces, strBoltonsiteWeight, strBoltonsitePieces: Int?
    let strWeightExcess: Double?
    let strPiecesExcess: Int?
    let strSteelWeightExcess: Double?
    let strSteelPiecesExcess, strBoltWeightExcess, strBoltPiecesExcess, strRelWeightExcess: Int
    let strRelPiecesExcess, strSteelrelWeightExcess, strSteelrelPiecesExcess, strBoltrelWeightExcess: Int
    let strBoltrelPiecesExcess, strShipWeightExcess, strShipPiecesExcess, strSteelshipWeightExcess: Int
    let strSteelshipPiecesExcess, strBoltshipWeightExcess, strBoltshipPiecesExcess, strOnsiteWeightExcess: Int
    let strOnsitePiecesExcess, strSteelonsiteWeightExcess, strSteelonsitePiecesExcess, strBoltonsiteWeightExcess: Int
    let strBoltonsitePiecesExcess: Int
    let mark: String

    enum CodingKeys: String, CodingKey {
        case project, structure
        case strWeight = "str_weight"
        case strPieces = "str_pieces"
        case strSteelPieces = "str_steel_pieces"
        case poNo = "po_no"
        case strSteelWeight = "str_steel_weight"
        case packingList = "packing_list"
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
        case mark
    }
}
