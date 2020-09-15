// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let plreportDetailModel = try? newJSONDecoder().decode(PlreportDetailModel.self, from: jsonData)

import Foundation

// MARK: - PlreportDetailModel
struct PlreportDetailModel: Codable {
    let id: Int?
    let name, inputNo: String?
    let projectID, vendorID: Int?
    let purchaseID: String?
    let addressID, countryOfOrigin: Int?
    let nameOfGoods, pickUpLocation, contactDetails, inspectionDate: String?
    let revNo: Int?
    let status: String?
    let isActive: Bool?
    let createdBy: Int?
    let file: String?
    let shopDrawingID, plStartNo, plEndNo: Int?
    let totalNetWeight, totalGrossWeight, totalVolume: String?
    let plGenerated: Bool?
    let level, submitBy: Int?
    let submittedForApproval: Bool?
    let approveStatus: String?
    let packingCount: Int?
    let revisionCreated: Bool?
    let rejectReasons: [RejectReason]?
    let inputMasterIDS: [InputMasterID]?

    enum CodingKeys: String, CodingKey {
        case id, name
        case inputNo = "input_no"
        case projectID = "project_id"
        case vendorID = "vendor_id"
        case purchaseID = "purchase_id"
        case addressID = "address_id"
        case countryOfOrigin = "country_of_origin"
        case nameOfGoods = "name_of_goods"
        case pickUpLocation = "pick_up_location"
        case contactDetails = "contact_details"
        case inspectionDate = "inspection_date"
        case revNo = "rev_no"
        case status
        case isActive = "is_active"
        case createdBy = "created_by"
        case file
        case shopDrawingID = "shop_drawing_id"
        case plStartNo = "pl_start_no"
        case plEndNo = "pl_end_no"
        case totalNetWeight = "total_net_weight"
        case totalGrossWeight = "total_gross_weight"
        case totalVolume = "total_volume"
        case plGenerated = "pl_generated"
        case level
        case submitBy = "submit_by"
        case submittedForApproval = "submitted_for_approval"
        case approveStatus = "approve_status"
        case packingCount = "packing_count"
        case revisionCreated = "revision_created"
        case rejectReasons = "reject_reasons"
        case inputMasterIDS = "input_master_ids"
    }
}

// MARK: - InputMasterID
struct InputMasterID: Codable {
    let id, plInputID, package, packageID: Int?
    let grossWeight, netWeight, length, width: String?
    let height, volume, stackable, onDeckShipment: String?
    let storageSymbol, minTemp, maxTemp, plSequence: String?
    let vendorPackage, truckNumber: String?
    let isActive: Bool?
    let inputSingleIDS: [InputSingleID]?

    enum CodingKeys: String, CodingKey {
        case id
        case plInputID = "pl_input_id"
        case package
        case packageID = "package_id"
        case grossWeight = "gross_weight"
        case netWeight = "net_weight"
        case length, width, height, volume, stackable
        case onDeckShipment = "on_deck_shipment"
        case storageSymbol = "storage_symbol"
        case minTemp = "min_temp"
        case maxTemp = "max_temp"
        case plSequence = "pl_sequence"
        case vendorPackage = "vendor_package"
        case truckNumber = "truck_number"
        case isActive = "is_active"
        case inputSingleIDS = "input_single_ids"
    }
}

// MARK: - InputSingleID
struct InputSingleID: Codable {
    let id, plInputMasterID, package, marksQty: Int?
    let mark, heatNo, mtcNo, netWeight: String?
    let hsCode, markCommodityCode, poPosition: String?
    let shopDrawingLineID, excessQuantity: Int?
    let inputSingleIDDescription: String?

    enum CodingKeys: String, CodingKey {
        case id
        case plInputMasterID = "pl_input_master_id"
        case package
        case marksQty = "marks_qty"
        case mark
        case heatNo = "heat_no"
        case mtcNo = "mtc_no"
        case netWeight = "net_weight"
        case hsCode = "hs_code"
        case markCommodityCode = "mark_commodity_code"
        case poPosition = "po_position"
        case shopDrawingLineID = "shop_drawing_line_id"
        case excessQuantity = "excess_quantity"
        case inputSingleIDDescription = "description"
    }
}

// MARK: - RejectReason
struct RejectReason: Codable {
    let id: Int?
    let reason, rejectedBy, rejectLevel, rejectReasonDescription: String?
    let isActive: Bool?

    enum CodingKeys: String, CodingKey {
        case id, reason
        case rejectedBy = "rejected_by"
        case rejectLevel = "reject_level"
        case rejectReasonDescription = "description"
        case isActive = "is_active"
    }
}
