//
//  DrwaingViewModel.swift
//  report
//
//  Created by macbook on 02/06/1942 Saka.
//  Copyright © 1942 com.mac. All rights reserved.
//

struct DrwaingViewModel : Codable {
    let id : Double?
    let mark : String?
    let shop_drawing_id : Double?
    let rev_no : String?
    let document_no : String?
    let wbs : String?
    let construction_area : String?
    let quantity : Double?
    let mark_length : String?
    let profile_unit_weight : Double?
    let mark_unit_weight : Double?
    let mr_no : String?
    let mark_surface_paint : Double?
    let profile : String?
    let material_grade : String?
    let structure_role : String?
    let painting_unit_weight : Double?
    let mark_surface_fireproofing : Double?
    let fireproofing_unit_weight : Double?
    let shop_drawing_no : String?
    let mark_commodity_code : String?
    let paint_commodity_code : String?
    let fire_commodity_code : String?
    let mark_ident_code : String?
    let paint_ident_code : String?
    let fire_ident_code : String?
    let is_current_detail : Bool?
    let po_ref_mark : String?
    let po_ref_paint : String?
    let po_ref_fireproofing : String?
    let hs_code : String?
    let pl_number : String?
    let structure : String?
    let priority : String?
    let mark_total_weight : Double?
    let painting_total_weight : Double?
    let fireproofing_total_weight : Double?
    let is_active : Bool?
    let is_bolt : Bool?
    let available_quantity : Double?
    let pl_quantity : Double?
    let lot : String?
    let sub_lot : String?
    let excess_quantity : Double?
    let mark_sequence : Double?
    let sub_area : String?
    let po_uom : String?
    let single_mark_qty_po_uom : Double?
    let total_mark_qty_po_uom : Double?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case mark = "mark"
        case shop_drawing_id = "shop_drawing_id"
        case rev_no = "rev_no"
        case document_no = "document_no"
        case wbs = "wbs"
        case construction_area = "construction_area"
        case quantity = "quantity"
        case mark_length = "mark_length"
        case profile_unit_weight = "profile_unit_weight"
        case mark_unit_weight = "mark_unit_weight"
        case mr_no = "mr_no"
        case mark_surface_paint = "mark_surface_paint"
        case profile = "profile"
        case material_grade = "material_grade"
        case structure_role = "structure_role"
        case painting_unit_weight = "painting_unit_weight"
        case mark_surface_fireproofing = "mark_surface_fireproofing"
        case fireproofing_unit_weight = "fireproofing_unit_weight"
        case shop_drawing_no = "shop_drawing_no"
        case mark_commodity_code = "mark_commodity_code"
        case paint_commodity_code = "paint_commodity_code"
        case fire_commodity_code = "fire_commodity_code"
        case mark_ident_code = "mark_ident_code"
        case paint_ident_code = "paint_ident_code"
        case fire_ident_code = "fire_ident_code"
        case is_current_detail = "is_current_detail"
        case po_ref_mark = "po_ref_mark"
        case po_ref_paint = "po_ref_paint"
        case po_ref_fireproofing = "po_ref_fireproofing"
        case hs_code = "hs_code"
        case pl_number = "pl_number"
        case structure = "structure"
        case priority = "priority"
        case mark_total_weight = "mark_total_weight"
        case painting_total_weight = "painting_total_weight"
        case fireproofing_total_weight = "fireproofing_total_weight"
        case is_active = "is_active"
        case is_bolt = "is_bolt"
        case available_quantity = "available_quantity"
        case pl_quantity = "pl_quantity"
        case lot = "lot"
        case sub_lot = "sub_lot"
        case excess_quantity = "excess_quantity"
        case mark_sequence = "mark_sequence"
        case sub_area = "sub_area"
        case po_uom = "po_uom"
        case single_mark_qty_po_uom = "single_mark_qty_po_uom"
        case total_mark_qty_po_uom = "total_mark_qty_po_uom"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Double.self, forKey: .id)
        mark = try values.decodeIfPresent(String.self, forKey: .mark)
        shop_drawing_id = try values.decodeIfPresent(Double.self, forKey: .shop_drawing_id)
        rev_no = try values.decodeIfPresent(String.self, forKey: .rev_no)
        document_no = try values.decodeIfPresent(String.self, forKey: .document_no)
        wbs = try values.decodeIfPresent(String.self, forKey: .wbs)
        construction_area = try values.decodeIfPresent(String.self, forKey: .construction_area)
        quantity = try values.decodeIfPresent(Double.self, forKey: .quantity)
        mark_length = try values.decodeIfPresent(String.self, forKey: .mark_length)
        profile_unit_weight = try values.decodeIfPresent(Double.self, forKey: .profile_unit_weight)
        mark_unit_weight = try values.decodeIfPresent(Double.self, forKey: .mark_unit_weight)
        mr_no = try values.decodeIfPresent(String.self, forKey: .mr_no)
        mark_surface_paint = try values.decodeIfPresent(Double.self, forKey: .mark_surface_paint)
        profile = try values.decodeIfPresent(String.self, forKey: .profile)
        material_grade = try values.decodeIfPresent(String.self, forKey: .material_grade)
        structure_role = try values.decodeIfPresent(String.self, forKey: .structure_role)
        painting_unit_weight = try values.decodeIfPresent(Double.self, forKey: .painting_unit_weight)
        mark_surface_fireproofing = try values.decodeIfPresent(Double.self, forKey: .mark_surface_fireproofing)
        fireproofing_unit_weight = try values.decodeIfPresent(Double.self, forKey: .fireproofing_unit_weight)
        shop_drawing_no = try values.decodeIfPresent(String.self, forKey: .shop_drawing_no)
        mark_commodity_code = try values.decodeIfPresent(String.self, forKey: .mark_commodity_code)
        paint_commodity_code = try values.decodeIfPresent(String.self, forKey: .paint_commodity_code)
        fire_commodity_code = try values.decodeIfPresent(String.self, forKey: .fire_commodity_code)
        mark_ident_code = try values.decodeIfPresent(String.self, forKey: .mark_ident_code)
        paint_ident_code = try values.decodeIfPresent(String.self, forKey: .paint_ident_code)
        fire_ident_code = try values.decodeIfPresent(String.self, forKey: .fire_ident_code)
        is_current_detail = try values.decodeIfPresent(Bool.self, forKey: .is_current_detail)
        po_ref_mark = try values.decodeIfPresent(String.self, forKey: .po_ref_mark)
        po_ref_paint = try values.decodeIfPresent(String.self, forKey: .po_ref_paint)
        po_ref_fireproofing = try values.decodeIfPresent(String.self, forKey: .po_ref_fireproofing)
        hs_code = try values.decodeIfPresent(String.self, forKey: .hs_code)
        pl_number = try values.decodeIfPresent(String.self, forKey: .pl_number)
        structure = try values.decodeIfPresent(String.self, forKey: .structure)
        priority = try values.decodeIfPresent(String.self, forKey: .priority)
        mark_total_weight = try values.decodeIfPresent(Double.self, forKey: .mark_total_weight)
        painting_total_weight = try values.decodeIfPresent(Double.self, forKey: .painting_total_weight)
        fireproofing_total_weight = try values.decodeIfPresent(Double.self, forKey: .fireproofing_total_weight)
        is_active = try values.decodeIfPresent(Bool.self, forKey: .is_active)
        is_bolt = try values.decodeIfPresent(Bool.self, forKey: .is_bolt)
        available_quantity = try values.decodeIfPresent(Double.self, forKey: .available_quantity)
        pl_quantity = try values.decodeIfPresent(Double.self, forKey: .pl_quantity)
        lot = try values.decodeIfPresent(String.self, forKey: .lot)
        sub_lot = try values.decodeIfPresent(String.self, forKey: .sub_lot)
        excess_quantity = try values.decodeIfPresent(Double.self, forKey: .excess_quantity)
        mark_sequence = try values.decodeIfPresent(Double.self, forKey: .mark_sequence)
        sub_area = try values.decodeIfPresent(String.self, forKey: .sub_area)
        po_uom = try values.decodeIfPresent(String.self, forKey: .po_uom)
        single_mark_qty_po_uom = try values.decodeIfPresent(Double.self, forKey: .single_mark_qty_po_uom)
        total_mark_qty_po_uom = try values.decodeIfPresent(Double.self, forKey: .total_mark_qty_po_uom)
    }

}
