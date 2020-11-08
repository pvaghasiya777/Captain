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
public class Json4Swift_Base {
    public var id : Int?
    public var mark : String?
    public var shop_drawing_id : Int?
    public var rev_no : String?
    public var document_no : String?
    public var wbs : String?
    public var construction_area : String?
    public var quantity : Int?
    public var mark_length : String?
    public var profile_unit_weight : Double?
    public var mark_unit_weight : Double?
    public var mr_no : String?
    public var mark_surface_paint : Double?
    public var profile : String?
    public var material_grade : String?
    public var structure_role : String?
    public var painting_unit_weight : Double?
    public var mark_surface_fireproofing : Int?
    public var unit : String?
    public var fireproofing_unit_weight : Int?
    public var shop_drawing_no : String?
    public var mark_commodity_code : String?
    public var paint_commodity_code : String?
    public var fire_commodity_code : String?
    public var mark_ident_code : String?
    public var paint_ident_code : String?
    public var fire_ident_code : String?
    public var is_current_detail : Bool?
    public var po_ref_mark : String?
    public var po_ref_paint : String?
    public var po_ref_fireproofing : String?
    public var hs_code : String?
    public var pl_number : String?
    public var structure : String?
    public var priority : String?
    public var mark_total_weight : Double?
    public var painting_total_weight : Double?
    public var fireproofing_total_weight : Int?
    public var is_active : Bool?
    public var is_bolt : Bool?
    public var available_quantity : Int?
    public var pl_quantity : Int?
    public var lot : String?
    public var sub_lot : String?
    public var excess_quantity : Int?
    public var mark_sequence : Int?
    public var sub_area : String?
    public var po_uom : String?
    public var single_mark_qty_po_uom : Int?
    public var total_mark_qty_po_uom : Int?
    public var mark_unit_price : String?
    public var painting_unit_price : String?
    public var fireproofing_unit_price : String?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let json4Swift_Base_list = Json4Swift_Base.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of Json4Swift_Base Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [Json4Swift_Base]
    {
        var models:[Json4Swift_Base] = []
        for item in array
        {
            models.append(Json4Swift_Base(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let json4Swift_Base = Json4Swift_Base(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: Json4Swift_Base Instance.
*/
    required public init?(dictionary: NSDictionary) {

        id = dictionary["id"] as? Int
        mark = dictionary["mark"] as? String
        shop_drawing_id = dictionary["shop_drawing_id"] as? Int
        rev_no = dictionary["rev_no"] as? String
        document_no = dictionary["document_no"] as? String
        wbs = dictionary["wbs"] as? String
        construction_area = dictionary["construction_area"] as? String
        quantity = dictionary["quantity"] as? Int
        mark_length = dictionary["mark_length"] as? String
        profile_unit_weight = dictionary["profile_unit_weight"] as? Double
        mark_unit_weight = dictionary["mark_unit_weight"] as? Double
        mr_no = dictionary["mr_no"] as? String
        mark_surface_paint = dictionary["mark_surface_paint"] as? Double
        profile = dictionary["profile"] as? String
        material_grade = dictionary["material_grade"] as? String
        structure_role = dictionary["structure_role"] as? String
        painting_unit_weight = dictionary["painting_unit_weight"] as? Double
        mark_surface_fireproofing = dictionary["mark_surface_fireproofing"] as? Int
        unit = dictionary["unit"] as? String
        fireproofing_unit_weight = dictionary["fireproofing_unit_weight"] as? Int
        shop_drawing_no = dictionary["shop_drawing_no"] as? String
        mark_commodity_code = dictionary["mark_commodity_code"] as? String
        paint_commodity_code = dictionary["paint_commodity_code"] as? String
        fire_commodity_code = dictionary["fire_commodity_code"] as? String
        mark_ident_code = dictionary["mark_ident_code"] as? String
        paint_ident_code = dictionary["paint_ident_code"] as? String
        fire_ident_code = dictionary["fire_ident_code"] as? String
        is_current_detail = dictionary["is_current_detail"] as? Bool
        po_ref_mark = dictionary["po_ref_mark"] as? String
        po_ref_paint = dictionary["po_ref_paint"] as? String
        po_ref_fireproofing = dictionary["po_ref_fireproofing"] as? String
        hs_code = dictionary["hs_code"] as? String
        pl_number = dictionary["pl_number"] as? String
        structure = dictionary["structure"] as? String
        priority = dictionary["priority"] as? String
        mark_total_weight = dictionary["mark_total_weight"] as? Double
        painting_total_weight = dictionary["painting_total_weight"] as? Double
        fireproofing_total_weight = dictionary["fireproofing_total_weight"] as? Int
        is_active = dictionary["is_active"] as? Bool
        is_bolt = dictionary["is_bolt"] as? Bool
        available_quantity = dictionary["available_quantity"] as? Int
        pl_quantity = dictionary["pl_quantity"] as? Int
        lot = dictionary["lot"] as? String
        sub_lot = dictionary["sub_lot"] as? String
        excess_quantity = dictionary["excess_quantity"] as? Int
        mark_sequence = dictionary["mark_sequence"] as? Int
        sub_area = dictionary["sub_area"] as? String
        po_uom = dictionary["po_uom"] as? String
        single_mark_qty_po_uom = dictionary["single_mark_qty_po_uom"] as? Int
        total_mark_qty_po_uom = dictionary["total_mark_qty_po_uom"] as? Int
        mark_unit_price = dictionary["mark_unit_price"] as? String
        painting_unit_price = dictionary["painting_unit_price"] as? String
        fireproofing_unit_price = dictionary["fireproofing_unit_price"] as? String
    }

        
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
    public func dictionaryRepresentation() -> NSDictionary {

        let dictionary = NSMutableDictionary()

        dictionary.setValue(self.id, forKey: "id")
        dictionary.setValue(self.mark, forKey: "mark")
        dictionary.setValue(self.shop_drawing_id, forKey: "shop_drawing_id")
        dictionary.setValue(self.rev_no, forKey: "rev_no")
        dictionary.setValue(self.document_no, forKey: "document_no")
        dictionary.setValue(self.wbs, forKey: "wbs")
        dictionary.setValue(self.construction_area, forKey: "construction_area")
        dictionary.setValue(self.quantity, forKey: "quantity")
        dictionary.setValue(self.mark_length, forKey: "mark_length")
        dictionary.setValue(self.profile_unit_weight, forKey: "profile_unit_weight")
        dictionary.setValue(self.mark_unit_weight, forKey: "mark_unit_weight")
        dictionary.setValue(self.mr_no, forKey: "mr_no")
        dictionary.setValue(self.mark_surface_paint, forKey: "mark_surface_paint")
        dictionary.setValue(self.profile, forKey: "profile")
        dictionary.setValue(self.material_grade, forKey: "material_grade")
        dictionary.setValue(self.structure_role, forKey: "structure_role")
        dictionary.setValue(self.painting_unit_weight, forKey: "painting_unit_weight")
        dictionary.setValue(self.mark_surface_fireproofing, forKey: "mark_surface_fireproofing")
        dictionary.setValue(self.unit, forKey: "unit")
        dictionary.setValue(self.fireproofing_unit_weight, forKey: "fireproofing_unit_weight")
        dictionary.setValue(self.shop_drawing_no, forKey: "shop_drawing_no")
        dictionary.setValue(self.mark_commodity_code, forKey: "mark_commodity_code")
        dictionary.setValue(self.paint_commodity_code, forKey: "paint_commodity_code")
        dictionary.setValue(self.fire_commodity_code, forKey: "fire_commodity_code")
        dictionary.setValue(self.mark_ident_code, forKey: "mark_ident_code")
        dictionary.setValue(self.paint_ident_code, forKey: "paint_ident_code")
        dictionary.setValue(self.fire_ident_code, forKey: "fire_ident_code")
        dictionary.setValue(self.is_current_detail, forKey: "is_current_detail")
        dictionary.setValue(self.po_ref_mark, forKey: "po_ref_mark")
        dictionary.setValue(self.po_ref_paint, forKey: "po_ref_paint")
        dictionary.setValue(self.po_ref_fireproofing, forKey: "po_ref_fireproofing")
        dictionary.setValue(self.hs_code, forKey: "hs_code")
        dictionary.setValue(self.pl_number, forKey: "pl_number")
        dictionary.setValue(self.structure, forKey: "structure")
        dictionary.setValue(self.priority, forKey: "priority")
        dictionary.setValue(self.mark_total_weight, forKey: "mark_total_weight")
        dictionary.setValue(self.painting_total_weight, forKey: "painting_total_weight")
        dictionary.setValue(self.fireproofing_total_weight, forKey: "fireproofing_total_weight")
        dictionary.setValue(self.is_active, forKey: "is_active")
        dictionary.setValue(self.is_bolt, forKey: "is_bolt")
        dictionary.setValue(self.available_quantity, forKey: "available_quantity")
        dictionary.setValue(self.pl_quantity, forKey: "pl_quantity")
        dictionary.setValue(self.lot, forKey: "lot")
        dictionary.setValue(self.sub_lot, forKey: "sub_lot")
        dictionary.setValue(self.excess_quantity, forKey: "excess_quantity")
        dictionary.setValue(self.mark_sequence, forKey: "mark_sequence")
        dictionary.setValue(self.sub_area, forKey: "sub_area")
        dictionary.setValue(self.po_uom, forKey: "po_uom")
        dictionary.setValue(self.single_mark_qty_po_uom, forKey: "single_mark_qty_po_uom")
        dictionary.setValue(self.total_mark_qty_po_uom, forKey: "total_mark_qty_po_uom")
        dictionary.setValue(self.mark_unit_price, forKey: "mark_unit_price")
        dictionary.setValue(self.painting_unit_price, forKey: "painting_unit_price")
        dictionary.setValue(self.fireproofing_unit_price, forKey: "fireproofing_unit_price")

        return dictionary
    }

}
