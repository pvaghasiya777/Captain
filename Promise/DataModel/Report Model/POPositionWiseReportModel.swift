

import Foundation
struct POPositionWiseReportModel : Codable {
    let count : Int?
    let next : String?
    let previous : String?
    let results : [POPositionResults]?
    enum CodingKeys: String, CodingKey {

        case count = "count"
        case next = "next"
        case previous = "previous"
        case results = "results"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        count = try values.decodeIfPresent(Int.self, forKey: .count)
        next = try values.decodeIfPresent(String.self, forKey: .next)
        previous = try values.decodeIfPresent(String.self, forKey: .previous)
        results = try values.decodeIfPresent([POPositionResults].self, forKey: .results)
    }

}
struct POPositionResults : Codable {
    let vendor : String?
    let po : String?
    let po_position : Int?
    let short_des : String?
    let ident_code : String?
    let uom : String?
    let po_qty : Double?
    let po_value : Double?
    let mbl_qty : Double?
    let pl_qty : Double?
    let released_qty : Double?
    let released_pieces : Double?
    let released_value : Double?
    let progress_qty : Double?
    let progress_value : Double?

    enum CodingKeys: String, CodingKey {

        case vendor = "vendor"
        case po = "po"
        case po_position = "po_position"
        case short_des = "short_des"
        case ident_code = "ident_code"
        case uom = "uom"
        case po_qty = "po_qty"
        case po_value = "po_value"
        case mbl_qty = "mbl_qty"
        case pl_qty = "pl_qty"
        case released_qty = "released_qty"
        case released_pieces = "released_pieces"
        case released_value = "released_value"
        case progress_qty = "progress_qty"
        case progress_value = "progress_value"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        vendor = try values.decodeIfPresent(String.self, forKey: .vendor)
        po = try values.decodeIfPresent(String.self, forKey: .po)
        po_position = try values.decodeIfPresent(Int.self, forKey: .po_position)
        short_des = try values.decodeIfPresent(String.self, forKey: .short_des)
        ident_code = try values.decodeIfPresent(String.self, forKey: .ident_code)
        uom = try values.decodeIfPresent(String.self, forKey: .uom)
        po_qty = try values.decodeIfPresent(Double.self, forKey: .po_qty)
        po_value = try values.decodeIfPresent(Double.self, forKey: .po_value)
        mbl_qty = try values.decodeIfPresent(Double.self, forKey: .mbl_qty)
        pl_qty = try values.decodeIfPresent(Double.self, forKey: .pl_qty)
        released_qty = try values.decodeIfPresent(Double.self, forKey: .released_qty)
        released_pieces = try values.decodeIfPresent(Double.self, forKey: .released_pieces)
        released_value = try values.decodeIfPresent(Double.self, forKey: .released_value)
        progress_qty = try values.decodeIfPresent(Double.self, forKey: .progress_qty)
        progress_value = try values.decodeIfPresent(Double.self, forKey: .progress_value)
    }

}
