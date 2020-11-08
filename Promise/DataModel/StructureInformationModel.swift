//
//  StructureInformationModel.swift
//  PromiseApiCall
//
//  Created by macbook on 22/05/1942 Saka.
//  Copyright © 1942 com.mac. All rights reserved.
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)


import Foundation
struct StructureInformationModel : Codable {
    let id : Double?
    let contract_doc_no : String?
    let rev_no : String?
    let purchase_id : String?
    let project_id : Double?
    let vendor_id : Double?
    let sub_contractor_doc_no : String?
    let prepared_by : Int?
    let checked_by : Int?
    let approved_by : Int?
    let doc_status : String?
    let status : String?
    let structure_id : String?
    let group_name : String?
    let lot : String?
    let sub_lot : String?
    let created_by : Double?
    let is_active : Bool?
    let pl_input_created : Bool?
    let shop_drawing_excel : String?
    let total_quantity : Double?
    let total_net_weight : String?
    let total_painting_weight : String?
    let total_fireproofing_weight : String?
    let shop_drawing_pdf : String?
    let is_group_structure : Bool?
    let is_hybrid : Bool?
    let level : Double?
    let upgrade : Bool?
    let submit_by : Double?
    let submitted_for_approval : Bool?
    let approve_status : String?
    let is_revision : Bool?
    let shop_drawing_id : String?
    let package_count : Double?
    let packing_count : Double?
    let history_count : Double?
    let reject_reasons : [Reject_reasons]?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case contract_doc_no = "contract_doc_no"
        case rev_no = "rev_no"
        case purchase_id = "purchase_id"
        case project_id = "project_id"
        case vendor_id = "vendor_id"
        case sub_contractor_doc_no = "sub_contractor_doc_no"
        case prepared_by = "prepared_by"
        case checked_by = "checked_by"
        case approved_by = "approved_by"
        case doc_status = "doc_status"
        case status = "status"
        case structure_id = "structure_id"
        case group_name = "group_name"
        case lot = "lot"
        case sub_lot = "sub_lot"
        case created_by = "created_by"
        case is_active = "is_active"
        case pl_input_created = "pl_input_created"
        case shop_drawing_excel = "shop_drawing_excel"
        case total_quantity = "total_quantity"
        case total_net_weight = "total_net_weight"
        case total_painting_weight = "total_painting_weight"
        case total_fireproofing_weight = "total_fireproofing_weight"
        case shop_drawing_pdf = "shop_drawing_pdf"
        case is_group_structure = "is_group_structure"
        case is_hybrid = "is_hybrid"
        case level = "level"
        case upgrade = "upgrade"
        case submit_by = "submit_by"
        case submitted_for_approval = "submitted_for_approval"
        case approve_status = "approve_status"
        case is_revision = "is_revision"
        case shop_drawing_id = "shop_drawing_id"
        case package_count = "package_count"
        case packing_count = "packing_count"
        case history_count = "history_count"
        case reject_reasons = "reject_reasons"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Double.self, forKey: .id)
        contract_doc_no = try values.decodeIfPresent(String.self, forKey: .contract_doc_no)
        rev_no = try values.decodeIfPresent(String.self, forKey: .rev_no)
        purchase_id = try values.decodeIfPresent(String.self, forKey: .purchase_id)
        project_id = try values.decodeIfPresent(Double.self, forKey: .project_id)
        vendor_id = try values.decodeIfPresent(Double.self, forKey: .vendor_id)
        sub_contractor_doc_no = try values.decodeIfPresent(String.self, forKey: .sub_contractor_doc_no)
        prepared_by = try values.decodeIfPresent(Int.self, forKey: .prepared_by)
        checked_by = try values.decodeIfPresent(Int.self, forKey: .checked_by)
        approved_by = try values.decodeIfPresent(Int.self, forKey: .approved_by)
        doc_status = try values.decodeIfPresent(String.self, forKey: .doc_status)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        structure_id = try values.decodeIfPresent(String.self, forKey: .structure_id)
        group_name = try values.decodeIfPresent(String.self, forKey: .group_name)
        lot = try values.decodeIfPresent(String.self, forKey: .lot)
        sub_lot = try values.decodeIfPresent(String.self, forKey: .sub_lot)
        created_by = try values.decodeIfPresent(Double.self, forKey: .created_by)
        is_active = try values.decodeIfPresent(Bool.self, forKey: .is_active)
        pl_input_created = try values.decodeIfPresent(Bool.self, forKey: .pl_input_created)
        shop_drawing_excel = try values.decodeIfPresent(String.self, forKey: .shop_drawing_excel)
        total_quantity = try values.decodeIfPresent(Double.self, forKey: .total_quantity)
        total_net_weight = try values.decodeIfPresent(String.self, forKey: .total_net_weight)
        total_painting_weight = try values.decodeIfPresent(String.self, forKey: .total_painting_weight)
        total_fireproofing_weight = try values.decodeIfPresent(String.self, forKey: .total_fireproofing_weight)
        shop_drawing_pdf = try values.decodeIfPresent(String.self, forKey: .shop_drawing_pdf)
        is_group_structure = try values.decodeIfPresent(Bool.self, forKey: .is_group_structure)
        is_hybrid = try values.decodeIfPresent(Bool.self, forKey: .is_hybrid)
        level = try values.decodeIfPresent(Double.self, forKey: .level)
        upgrade = try values.decodeIfPresent(Bool.self, forKey: .upgrade)
        submit_by = try values.decodeIfPresent(Double.self, forKey: .submit_by)
        submitted_for_approval = try values.decodeIfPresent(Bool.self, forKey: .submitted_for_approval)
        approve_status = try values.decodeIfPresent(String.self, forKey: .approve_status)
        is_revision = try values.decodeIfPresent(Bool.self, forKey: .is_revision)
        shop_drawing_id = try values.decodeIfPresent(String.self, forKey: .shop_drawing_id)
        package_count = try values.decodeIfPresent(Double.self, forKey: .package_count)
        packing_count = try values.decodeIfPresent(Double.self, forKey: .packing_count)
        history_count = try values.decodeIfPresent(Double.self, forKey: .history_count)
        reject_reasons = try values.decodeIfPresent([Reject_reasons].self, forKey: .reject_reasons)
    }
}
struct Reject_reasons : Codable {
    let id : Double?
    let reason : String?
    let rejected_by : String?
    let reject_level : String?
    let description : String?
    let is_active : Bool?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case reason = "reason"
        case rejected_by = "rejected_by"
        case reject_level = "reject_level"
        case description = "description"
        case is_active = "is_active"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Double.self, forKey: .id)
        reason = try values.decodeIfPresent(String.self, forKey: .reason)
        rejected_by = try values.decodeIfPresent(String.self, forKey: .rejected_by)
        reject_level = try values.decodeIfPresent(String.self, forKey: .reject_level)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        is_active = try values.decodeIfPresent(Bool.self, forKey: .is_active)
    }

}
