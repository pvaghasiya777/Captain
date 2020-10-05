// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let singleMasterPurchaseModel = try? newJSONDecoder().decode(SingleMasterPurchaseModel.self, from: jsonData)

import Foundation

// MARK: - SingleMasterPurchaseModel

import Foundation
struct SingleMasterPurchaseModel : Codable {
    let number : String?
    let vendor_id : Int?
    let project_id : Int?
    let po_type_id : Int?
    let date : String?
    let shipper_details : String?
    let delivery_date : String?
    let address_id : Int?
    let weight_uom : String?
    let dimension_uom : String?
    let volume_uom : String?
    let min_temp : String?
    let max_temp : String?
    let package_count : Int?
    let packing_count : Int?
    let structure_count : Int?
    let is_active : Bool?
    let created_by : Int?
    let currency_id : Int?
    let purchase_lines : [Purchase_lines]?

    enum CodingKeys: String, CodingKey {

        case number = "number"
        case vendor_id = "vendor_id"
        case project_id = "project_id"
        case po_type_id = "po_type_id"
        case date = "date"
        case delivery_date = "delivery_date"
        case address_id = "address_id"
        case weight_uom = "weight_uom"
        case dimension_uom = "dimension_uom"
        case volume_uom = "volume_uom"
        case min_temp = "min_temp"
        case max_temp = "max_temp"
        case package_count = "package_count"
        case packing_count = "packing_count"
        case structure_count = "structure_count"
        case is_active = "is_active"
        case shipper_details = "shipper_details"
        case created_by = "created_by"
        case currency_id = "currency_id"
        case purchase_lines = "purchase_lines"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        number = try values.decodeIfPresent(String.self, forKey: .number)
        vendor_id = try values.decodeIfPresent(Int.self, forKey: .vendor_id)
        project_id = try values.decodeIfPresent(Int.self, forKey: .project_id)
        po_type_id = try values.decodeIfPresent(Int.self, forKey: .po_type_id)
        date = try values.decodeIfPresent(String.self, forKey: .date)
        delivery_date = try values.decodeIfPresent(String.self, forKey: .delivery_date)
        address_id = try values.decodeIfPresent(Int.self, forKey: .address_id)
        weight_uom = try values.decodeIfPresent(String.self, forKey: .weight_uom)
        dimension_uom = try values.decodeIfPresent(String.self, forKey: .dimension_uom)
        volume_uom = try values.decodeIfPresent(String.self, forKey: .volume_uom)
        min_temp = try values.decodeIfPresent(String.self, forKey: .min_temp)
        max_temp = try values.decodeIfPresent(String.self, forKey: .max_temp)
        package_count = try values.decodeIfPresent(Int.self, forKey: .package_count)
        packing_count = try values.decodeIfPresent(Int.self, forKey: .packing_count)
        structure_count = try values.decodeIfPresent(Int.self, forKey: .structure_count)
        is_active = try values.decodeIfPresent(Bool.self, forKey: .is_active)
        shipper_details =  try values.decodeIfPresent(String.self, forKey: .shipper_details)
        created_by = try values.decodeIfPresent(Int.self, forKey: .created_by)
        currency_id = try values.decodeIfPresent(Int.self, forKey: .currency_id)
        purchase_lines = try values.decodeIfPresent([Purchase_lines].self, forKey: .purchase_lines)
    }

}
struct Purchase_lines : Codable {
    let po_position : Int?
    let item : String?
    let description : String?
    let ident_code : String?
    let commodity_code : String?
    let quantity : String?
    let units_of_measure : String?
    let unit_price : String?
    let amendment : String?
    let type : String?

    enum CodingKeys: String, CodingKey {

        case po_position = "po_position"
        case item = "item"
        case description = "description"
        case ident_code = "ident_code"
        case commodity_code = "commodity_code"
        case quantity = "quantity"
        case units_of_measure = "units_of_measure"
        case unit_price = "unit_price"
        case amendment = "amendment"
        case type = "type"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        po_position = try values.decodeIfPresent(Int.self, forKey: .po_position)
        item = try values.decodeIfPresent(String.self, forKey: .item)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        ident_code = try values.decodeIfPresent(String.self, forKey: .ident_code)
        commodity_code = try values.decodeIfPresent(String.self, forKey: .commodity_code)
        quantity = try values.decodeIfPresent(String.self, forKey: .quantity)
        units_of_measure = try values.decodeIfPresent(String.self, forKey: .units_of_measure)
        unit_price = try values.decodeIfPresent(String.self, forKey: .unit_price)
        amendment = try values.decodeIfPresent(String.self, forKey: .amendment)
        type = try values.decodeIfPresent(String.self, forKey: .type)
    }

}

