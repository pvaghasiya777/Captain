// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let getPermissionModel = try? newJSONDecoder().decode(GetPermissionModel.self, from: jsonData)

import Foundation

// MARK: - GetPermissionModel
struct GetPermissionModel: Codable {
    let data: DataClass?
}

// MARK: - DataClass
struct DataClass: Codable {
    let menuitems, pipingMenus: [String]?
    let permissions: [String: Permission]?
    let general: General?
    let purchaseOrders: [PurchaseOrder]?
    let projects: [Project]?
    let userDetails: UserDetails?
    let timezone, reportPermissions, disciplinePermissions: [String]?

    enum CodingKeys: String, CodingKey {
        case menuitems
        case pipingMenus = "piping_menus"
        case permissions, general
        case purchaseOrders = "purchase_orders"
        case projects
        case userDetails = "user_details"
        case timezone
        case reportPermissions = "report_permissions"
        case disciplinePermissions = "discipline_permissions"
    }
}

// MARK: - General
struct General: Codable {
    let exportExcel, exportPDF, unlockReleased, unlockShipped: Bool?
    let unlockOnsite, exportMtc, updateReleased, updateShipped: Bool?
    let updateOnsite: Bool?
    let defaultProject: Int?
    let defaultDiscipline: String?

    enum CodingKeys: String, CodingKey {
        case exportExcel = "export_excel"
        case exportPDF = "export_pdf"
        case unlockReleased = "unlock_released"
        case unlockShipped = "unlock_shipped"
        case unlockOnsite = "unlock_onsite"
        case exportMtc = "export_mtc"
        case updateReleased = "update_released"
        case updateShipped = "update_shipped"
        case updateOnsite = "update_onsite"
        case defaultProject = "default_project"
        case defaultDiscipline = "default_discipline"
    }
}

// MARK: - Permission
struct Permission: Codable {
    let create, write, read, delete: Int?
}

// MARK: - Project
struct Project: Codable {
    let id: Int?
    let name: String?
}

// MARK: - PurchaseOrder
struct PurchaseOrder: Codable {
    let number: String?
}

// MARK: - UserDetails
struct UserDetails: Codable {
    let id: Int?
    let username: String?
}
