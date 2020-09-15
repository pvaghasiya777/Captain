// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let singleMasterProjectModel = try? newJSONDecoder().decode(SingleMasterProjectModel.self, from: jsonData)

import Foundation

// MARK: - SingleMasterProjectModel
struct SingleMasterProjectModel: Codable {
    let id: Int?
    let name, logo, code, contractNumber: String?
    let consigneeBuyer: String?
    let isShipper: Bool?
    let reference, siteLocation,Description, startDate: String?
    let endDate, managerID: String?
    let isActive: Bool?
    let createdBy, structureCount, packageCount, packingCount: Int?
    let projectOwner, shipperDetails: String?

    enum CodingKeys: String, CodingKey {
        case id, name, logo, code
        case contractNumber = "contract_number"
        case consigneeBuyer = "consignee_buyer"
        case isShipper = "is_shipper"
        case reference
        case siteLocation = "site_location"
        case Description = "description"
        case startDate = "start_date"
        case endDate = "end_date"
        case managerID = "manager_id"
        case isActive = "is_active"
        case createdBy = "created_by"
        case structureCount = "structure_count"
        case packageCount = "package_count"
        case packingCount = "packing_count"
        case projectOwner = "project_owner"
        case shipperDetails = "shipper_details"
    }
}
