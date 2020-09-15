//
//  PackinglistIDModel.swift
//  Promise
//
//  Created by macbook on 27/05/1942 Saka.
//  Copyright © 1942 Captain. All rights reserved.
//

import Foundation
struct PackinglistIDModel : Codable {
    let id : Double?
    let number : String?
    let revision : String?
    let project_id : Double?
    let vendor_id : Double?
    let purchase_id : String?
    let pl_input_name : String?
    let country_of_origin : Double?
    let name_of_goods : String?
    let pick_up_location : String?
    let contact_details : String?
    let inspection_date : String?
    let pl_sequence : String?
    let master_package_count : Double?
    let status : String?
    let total_volume : String?
    let total_net_weight : String?
    let lock_released : Bool?
    let total_gross_weight : String?
    let created_by : Double?
    let pl_excel : String?
    let structure_id : String?
    let pl_pdf : String?
    let pl_signed_pdf : String?
    let is_released : Bool?
    let released_date : String?
    let release_note : String?
    let packing_certificate : String?
    let material_certificate : String?
    let level : Double?
    let submit_by : Double?
    let submitted_for_approval : Bool?
    let approve_status : String?
    let history_count : Double?
    let reject_reasons : [String]?
    let pl_master_ids : [Pl_master_ids]?
    let is_active : Bool?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case number = "number"
        case revision = "revision"
        case project_id = "project_id"
        case vendor_id = "vendor_id"
        case purchase_id = "purchase_id"
        case pl_input_name = "pl_input_name"
        case country_of_origin = "country_of_origin"
        case name_of_goods = "name_of_goods"
        case pick_up_location = "pick_up_location"
        case contact_details = "contact_details"
        case inspection_date = "inspection_date"
        case pl_sequence = "pl_sequence"
        case master_package_count = "master_package_count"
        case status = "status"
        case total_volume = "total_volume"
        case total_net_weight = "total_net_weight"
        case lock_released = "lock_released"
        case total_gross_weight = "total_gross_weight"
        case created_by = "created_by"
        case pl_excel = "pl_excel"
        case structure_id = "structure_id"
        case pl_pdf = "pl_pdf"
        case pl_signed_pdf = "pl_signed_pdf"
        case is_released = "is_released"
        case released_date = "released_date"
        case release_note = "release_note"
        case packing_certificate = "packing_certificate"
        case material_certificate = "material_certificate"
        case level = "level"
        case submit_by = "submit_by"
        case submitted_for_approval = "submitted_for_approval"
        case approve_status = "approve_status"
        case history_count = "history_count"
        case reject_reasons = "reject_reasons"
        case pl_master_ids = "pl_master_ids"
        case is_active = "is_active"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Double.self, forKey: .id)
        number = try values.decodeIfPresent(String.self, forKey: .number)
        revision = try values.decodeIfPresent(String.self, forKey: .revision)
        project_id = try values.decodeIfPresent(Double.self, forKey: .project_id)
        vendor_id = try values.decodeIfPresent(Double.self, forKey: .vendor_id)
        purchase_id = try values.decodeIfPresent(String.self, forKey: .purchase_id)
        pl_input_name = try values.decodeIfPresent(String.self, forKey: .pl_input_name)
        country_of_origin = try values.decodeIfPresent(Double.self, forKey: .country_of_origin)
        name_of_goods = try values.decodeIfPresent(String.self, forKey: .name_of_goods)
        pick_up_location = try values.decodeIfPresent(String.self, forKey: .pick_up_location)
        contact_details = try values.decodeIfPresent(String.self, forKey: .contact_details)
        inspection_date = try values.decodeIfPresent(String.self, forKey: .inspection_date)
        pl_sequence = try values.decodeIfPresent(String.self, forKey: .pl_sequence)
        master_package_count = try values.decodeIfPresent(Double.self, forKey: .master_package_count)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        total_volume = try values.decodeIfPresent(String.self, forKey: .total_volume)
        total_net_weight = try values.decodeIfPresent(String.self, forKey: .total_net_weight)
        lock_released = try values.decodeIfPresent(Bool.self, forKey: .lock_released)
        total_gross_weight = try values.decodeIfPresent(String.self, forKey: .total_gross_weight)
        created_by = try values.decodeIfPresent(Double.self, forKey: .created_by)
        pl_excel = try values.decodeIfPresent(String.self, forKey: .pl_excel)
        structure_id = try values.decodeIfPresent(String.self, forKey: .structure_id)
        pl_pdf = try values.decodeIfPresent(String.self, forKey: .pl_pdf)
        pl_signed_pdf = try values.decodeIfPresent(String.self, forKey: .pl_signed_pdf)
        is_released = try values.decodeIfPresent(Bool.self, forKey: .is_released)
        released_date = try values.decodeIfPresent(String.self, forKey: .released_date)
        release_note = try values.decodeIfPresent(String.self, forKey: .release_note)
        packing_certificate = try values.decodeIfPresent(String.self, forKey: .packing_certificate)
        material_certificate = try values.decodeIfPresent(String.self, forKey: .material_certificate)
        level = try values.decodeIfPresent(Double.self, forKey: .level)
        submit_by = try values.decodeIfPresent(Double.self, forKey: .submit_by)
        submitted_for_approval = try values.decodeIfPresent(Bool.self, forKey: .submitted_for_approval)
        approve_status = try values.decodeIfPresent(String.self, forKey: .approve_status)
        history_count = try values.decodeIfPresent(Double.self, forKey: .history_count)
        reject_reasons = try values.decodeIfPresent([String].self, forKey: .reject_reasons)
        pl_master_ids = try values.decodeIfPresent([Pl_master_ids].self, forKey: .pl_master_ids)
        is_active = try values.decodeIfPresent(Bool.self, forKey: .is_active)
    }

}

struct Pl_master_ids : Codable {
    let id : Double?
    let pl_header_id : Double?
    let pl_input_master_id : Double?
    let number : String?
    let revision : String?
    let package : Double?
    let is_active : Bool?
    let length : Double?
    let width : Double?
    let height : Double?
    let gross_weight : Double?
    let net_weight : Double?
    let kind_of_package : String?
    let stackable : String?
    let min_temp : String?
    let max_temp : String?
    let truck_number : String?
    let shipped : Bool?
    let shipped_date : String?
    let on_site : Bool?
    let onsite_date : String?
    let is_released : Bool?
    let released_date : String?
    let weight_decimal_size : Double?
    let pl_single_ids : [Pl_single_ids]?
    let purchase_id : String?
    let project_name : String?
    let vendor_name : String?
    let release_note : String?
    let lock_shipped : Bool?
    let lock_onsite : Bool?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case pl_header_id = "pl_header_id"
        case pl_input_master_id = "pl_input_master_id"
        case number = "number"
        case revision = "revision"
        case package = "package"
        case is_active = "is_active"
        case length = "length"
        case width = "width"
        case height = "height"
        case gross_weight = "gross_weight"
        case net_weight = "net_weight"
        case kind_of_package = "kind_of_package"
        case stackable = "stackable"
        case min_temp = "min_temp"
        case max_temp = "max_temp"
        case truck_number = "truck_number"
        case shipped = "shipped"
        case shipped_date = "shipped_date"
        case on_site = "on_site"
        case onsite_date = "onsite_date"
        case is_released = "is_released"
        case released_date = "released_date"
        case weight_decimal_size = "weight_decimal_size"
        case pl_single_ids = "pl_single_ids"
        case purchase_id = "purchase_id"
        case project_name = "project_name"
        case vendor_name = "vendor_name"
        case release_note = "release_note"
        case lock_shipped = "lock_shipped"
        case lock_onsite = "lock_onsite"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Double.self, forKey: .id)
        pl_header_id = try values.decodeIfPresent(Double.self, forKey: .pl_header_id)
        pl_input_master_id = try values.decodeIfPresent(Double.self, forKey: .pl_input_master_id)
        number = try values.decodeIfPresent(String.self, forKey: .number)
        revision = try values.decodeIfPresent(String.self, forKey: .revision)
        package = try values.decodeIfPresent(Double.self, forKey: .package)
        is_active = try values.decodeIfPresent(Bool.self, forKey: .is_active)
        length = try values.decodeIfPresent(Double.self, forKey: .length)
        width = try values.decodeIfPresent(Double.self, forKey: .width)
        height = try values.decodeIfPresent(Double.self, forKey: .height)
        gross_weight = try values.decodeIfPresent(Double.self, forKey: .gross_weight)
        net_weight = try values.decodeIfPresent(Double.self, forKey: .net_weight)
        kind_of_package = try values.decodeIfPresent(String.self, forKey: .kind_of_package)
        stackable = try values.decodeIfPresent(String.self, forKey: .stackable)
        min_temp = try values.decodeIfPresent(String.self, forKey: .min_temp)
        max_temp = try values.decodeIfPresent(String.self, forKey: .max_temp)
        truck_number = try values.decodeIfPresent(String.self, forKey: .truck_number)
        shipped = try values.decodeIfPresent(Bool.self, forKey: .shipped)
        shipped_date = try values.decodeIfPresent(String.self, forKey: .shipped_date)
        on_site = try values.decodeIfPresent(Bool.self, forKey: .on_site)
        onsite_date = try values.decodeIfPresent(String.self, forKey: .onsite_date)
        is_released = try values.decodeIfPresent(Bool.self, forKey: .is_released)
        released_date = try values.decodeIfPresent(String.self, forKey: .released_date)
        weight_decimal_size = try values.decodeIfPresent(Double.self, forKey: .weight_decimal_size)
        pl_single_ids = try values.decodeIfPresent([Pl_single_ids].self, forKey: .pl_single_ids)
        purchase_id = try values.decodeIfPresent(String.self, forKey: .purchase_id)
        project_name = try values.decodeIfPresent(String.self, forKey: .project_name)
        vendor_name = try values.decodeIfPresent(String.self, forKey: .vendor_name)
        release_note = try values.decodeIfPresent(String.self, forKey: .release_note)
        lock_shipped = try values.decodeIfPresent(Bool.self, forKey: .lock_shipped)
        lock_onsite = try values.decodeIfPresent(Bool.self, forKey: .lock_onsite)
    }

}
struct Pl_single_ids : Codable {
    let id : Double?
    let pl_master_id : Double?
    let pl_input_single_id : Double?
    let number : String?
    let revision : String?
    let is_active : Bool?
    let package : Double?
    let marks_qty : Double?
    let mark : String?
    let hs_code : String?
    let heat_no : String?
    let net_weight : Double?
    let mtc_no : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case pl_master_id = "pl_master_id"
        case pl_input_single_id = "pl_input_single_id"
        case number = "number"
        case revision = "revision"
        case is_active = "is_active"
        case package = "package"
        case marks_qty = "marks_qty"
        case mark = "mark"
        case hs_code = "hs_code"
        case heat_no = "heat_no"
        case net_weight = "net_weight"
        case mtc_no = "mtc_no"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Double.self, forKey: .id)
        pl_master_id = try values.decodeIfPresent(Double.self, forKey: .pl_master_id)
        pl_input_single_id = try values.decodeIfPresent(Double.self, forKey: .pl_input_single_id)
        number = try values.decodeIfPresent(String.self, forKey: .number)
        revision = try values.decodeIfPresent(String.self, forKey: .revision)
        is_active = try values.decodeIfPresent(Bool.self, forKey: .is_active)
        package = try values.decodeIfPresent(Double.self, forKey: .package)
        marks_qty = try values.decodeIfPresent(Double.self, forKey: .marks_qty)
        mark = try values.decodeIfPresent(String.self, forKey: .mark)
        hs_code = try values.decodeIfPresent(String.self, forKey: .hs_code)
        heat_no = try values.decodeIfPresent(String.self, forKey: .heat_no)
        net_weight = try values.decodeIfPresent(Double.self, forKey: .net_weight)
        mtc_no = try values.decodeIfPresent(String.self, forKey: .mtc_no)
    }

}

