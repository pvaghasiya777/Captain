
//   let masterKindOfPackageModel = try? newJSONDecoder().decode(MasterKindOfPackageModel.self, from: jsonData)

import Foundation

// MARK: - MasterKindOfPackageModel
struct MasterKindOfPackageModel: Codable {
    let id: Int?
    let code, name, Description: String?
    let isActive: Bool
    let createdBy: Int?

    enum CodingKeys: String, CodingKey {
        case id, code, name
        case Description = "description"
        case isActive = "is_active"
        case createdBy = "created_by"
    }
}


// MARK: - Master PurchaseList
struct MasterPurchseListModel: Codable {
    let number, vendorName, projectName, poTypeName: String?
    let date, deliveryDate: String?
    let isActive: Bool

    enum CodingKeys: String, CodingKey {
        case number
        case vendorName = "vendor_name"
        case projectName = "project_name"
        case poTypeName = "po_type_name"
        case date
        case deliveryDate = "delivery_date"
        case isActive = "is_active"
    }
}
// 2. Master Purchase Strucher
//   let welcome = try? newJSONDecoder().decode([MasterPurchaseModel].self, from: jsonData)

// MARK: - MasterPurchaseModel
struct MasterPurchaseModel: Codable {
    let number, vendorName, projectName, poTypeName: String?
    let date, deliveryDate: String?
    let isActive: Bool
    let addressID: AddressID?
    let shopDrawingIDS: [ShopDrawingID]?
    let uomWeight, uomVolume, uomDimension: String?
    let weightDecimalSize, dimensionDecimalSize: Int?
    let currencyName: String?
    let projectID: Int?
    let uomTemp: String?

    enum CodingKeys: String, CodingKey {
        case number
        case vendorName = "vendor_name"
        case projectName = "project_name"
        case poTypeName = "po_type_name"
        case date
        case deliveryDate = "delivery_date"
        case isActive = "is_active"
        case addressID = "address_id"
        case shopDrawingIDS = "shop_drawing_ids"
        case uomWeight = "uom_weight"
        case uomVolume = "uom_volume"
        case uomDimension = "uom_dimension"
        case weightDecimalSize = "weight_decimal_size"
        case dimensionDecimalSize = "dimension_decimal_size"
        case currencyName = "currency_name"
        case projectID = "project_id"
        case uomTemp = "uom_temp"
    }
}

// MARK: - AddressID
struct AddressID: Codable {
    let id: Int?
    let name: String?
    let zip: String?
    let contactName, contactEmail, countryName, contactPhone: String?
    let code: String?

    enum CodingKeys: String, CodingKey {
        case id, name, zip
        case contactName = "contact_name"
        case contactEmail = "contact_email"
        case countryName = "country_name"
        case contactPhone = "contact_phone"
        case code
    }
}

// MARK: - ShopDrawingID
struct ShopDrawingID: Codable {
    let id: Int?
    let revNo, docStatus, approveStatus, structureID: String?
    let isActive: Bool

    enum CodingKeys: String, CodingKey {
        case id
        case revNo = "rev_no"
        case docStatus = "doc_status"
        case approveStatus = "approve_status"
        case structureID = "structure_id"
        case isActive = "is_active"
    }
}
