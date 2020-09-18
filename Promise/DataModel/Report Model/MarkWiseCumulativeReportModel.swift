import Foundation
struct MarkWiseCumulativeReportModel : Codable {
    let count : Int?
    let next : String?
    let previous : String?
    let results : [MarkWiseCumulativeResults]?

    enum CodingKeys: String, CodingKey {

        case count = "count"
        case next = "next"
        case previous = "previous"
        case results = "results"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        count = try values.decodeIfPresent(Int.self, forKey: .count)
        next = try values.decodeIfPresent(String.self, forKey: .next)
        previous = try values.decodeIfPresent(String.self, forKey: .previous)
        results = try values.decodeIfPresent([MarkWiseCumulativeResults].self, forKey: .results)
    }

}
struct MarkWiseCumulativeResults : Codable {
    let group_structure_name : String?
    let mark : String?
    let quantity : Int?
    let purchase_id : String?
    let structure_id : String?
    let pl_desc : String?
    let rev_no : String?
    let mark_ident_code : String?
    let net_weight : String?
    let paint_ident_code : String?
    let painting_weight : Double?
    let fire_ident_code : String?
    let fire_weight : Double?
    let heat_no : String?
    let mtc_no : String?
    let pl_name : String?
    let progressive : String?
    let master_gross_weight : String?
    let master_total_volume : String?
    let released_date : String?
    let shipped_date : String?
    let onsite_date : String?
    let steel_weight : Double?

    enum CodingKeys: String, CodingKey {

        case group_structure_name = "group_structure_name"
        case mark = "mark"
        case quantity = "quantity"
        case purchase_id = "purchase_id"
        case structure_id = "structure_id"
        case pl_desc = "pl_desc"
        case rev_no = "rev_no"
        case mark_ident_code = "mark_ident_code"
        case net_weight = "net_weight"
        case paint_ident_code = "paint_ident_code"
        case painting_weight = "painting_weight"
        case fire_ident_code = "fire_ident_code"
        case fire_weight = "fire_weight"
        case heat_no = "heat_no"
        case mtc_no = "mtc_no"
        case pl_name = "pl_name"
        case progressive = "progressive"
        case master_gross_weight = "master_gross_weight"
        case master_total_volume = "master_total_volume"
        case released_date = "released_date"
        case shipped_date = "shipped_date"
        case onsite_date = "onsite_date"
        case steel_weight = "steel_weight"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        group_structure_name = try values.decodeIfPresent(String.self, forKey: .group_structure_name)
        mark = try values.decodeIfPresent(String.self, forKey: .mark)
        quantity = try values.decodeIfPresent(Int.self, forKey: .quantity)
        purchase_id = try values.decodeIfPresent(String.self, forKey: .purchase_id)
        structure_id = try values.decodeIfPresent(String.self, forKey: .structure_id)
        pl_desc = try values.decodeIfPresent(String.self, forKey: .pl_desc)
        rev_no = try values.decodeIfPresent(String.self, forKey: .rev_no)
        mark_ident_code = try values.decodeIfPresent(String.self, forKey: .mark_ident_code)
        net_weight = try values.decodeIfPresent(String.self, forKey: .net_weight)
        paint_ident_code = try values.decodeIfPresent(String.self, forKey: .paint_ident_code)
        painting_weight = try values.decodeIfPresent(Double.self, forKey: .painting_weight)
        fire_ident_code = try values.decodeIfPresent(String.self, forKey: .fire_ident_code)
        fire_weight = try values.decodeIfPresent(Double.self, forKey: .fire_weight)
        heat_no = try values.decodeIfPresent(String.self, forKey: .heat_no)
        mtc_no = try values.decodeIfPresent(String.self, forKey: .mtc_no)
        pl_name = try values.decodeIfPresent(String.self, forKey: .pl_name)
        progressive = try values.decodeIfPresent(String.self, forKey: .progressive)
        master_gross_weight = try values.decodeIfPresent(String.self, forKey: .master_gross_weight)
        master_total_volume = try values.decodeIfPresent(String.self, forKey: .master_total_volume)
        released_date = try values.decodeIfPresent(String.self, forKey: .released_date)
        shipped_date = try values.decodeIfPresent(String.self, forKey: .shipped_date)
        onsite_date = try values.decodeIfPresent(String.self, forKey: .onsite_date)
        steel_weight = try values.decodeIfPresent(Double.self, forKey: .steel_weight)
    }

}
