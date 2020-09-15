// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let masterProjectModel = try? newJSONDecoder().decode(MasterProjectModel.self, from: jsonData)

import Foundation

// MARK: - MasterProjectModelElement
struct MasterProjectModel: Codable {
    let id: Int?
    let name, code: String?
    let isShipper: Bool?
    let startDate, endDate, managerID: String?
    let isActive: Bool?
    let createdBy: Int?
    let uomWeight, uomVolume, uomDimension: String?
    let logo: String?
    let projectSetting, drawingCount, packageCount, packingCount: Int?
    let structureWeight: Double?

    enum CodingKeys: String, CodingKey {
        case id, name, code
        case isShipper = "is_shipper"
        case startDate = "start_date"
        case endDate = "end_date"
        case managerID = "manager_id"
        case isActive = "is_active"
        case createdBy = "created_by"
        case uomWeight = "uom_weight"
        case uomVolume = "uom_volume"
        case uomDimension = "uom_dimension"
        case logo
        case projectSetting = "project_setting"
        case drawingCount = "drawing_count"
        case packageCount = "package_count"
        case packingCount = "packing_count"
        case structureWeight = "structure_weight"
    }
}
