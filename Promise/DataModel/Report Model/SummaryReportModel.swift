// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let getPermissionModel = try? newJSONDecoder().decode(GetPermissionModel.self, from: jsonData)

import Foundation

// MARK: - GetPermissionModel
struct SummaryReportModel: Codable {
    let count: Int?
    let next, previous: String?
    let results: [SummaryResult]?
}

// MARK: - Result
struct SummaryResult: Codable {
    let number, vendor: String?
    let ordered, mblWeight, ifByVendor, released: Double?
    let shippedWeight, onsiteWeight, toBeShipped, toBeReleased: Double?

    enum CodingKeys: String, CodingKey {
        case number, vendor, ordered
        case mblWeight = "mbl_weight"
        case ifByVendor = "if_by_vendor"
        case released
        case shippedWeight = "shipped_weight"
        case onsiteWeight = "onsite_weight"
        case toBeShipped = "to_be_shipped"
        case toBeReleased = "to_be_released"
    }
}
