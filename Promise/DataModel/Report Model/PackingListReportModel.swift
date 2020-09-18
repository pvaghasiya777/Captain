import Foundation
struct PackingListReportModel : Codable {
    let count : Int?
    let next : String?
    let previous : String?
    let results : [Results]?

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
        results = try values.decodeIfPresent([Results].self, forKey: .results)
    }

}
struct Results : Codable {
    let i11329215 : Double?
    let i11329217 : Double?
    let i11329218 : Double?
    let i11329219 : Double?
    let i11329220 : Double?
    let i11329222 : Double?
    let i11330946 : Double?
    let i11330947 : Double?
    let i11364508 : Double?
    let fasteners : Double?
    let gross_weight : Double?
    let is_bolt : Bool?
    let kind_of_package : String?
    let loading_map : String?
    let lot : String?
    let mbl_rev : String?
    let net_weight : Double?
    let on_site_date : String?
    let on_site_status : String?
    let pl_input : String?
    let pl_name : String?
    let pl_number : String?
    let release_note : String?
    let rn_date : String?
    let shipped_date : String?
    let shipped_status : String?
    let struct_mwp : String?
    let structure : String?
    let volume : Double?

    enum CodingKeys: String, CodingKey {

        case i11329215 = "I11329215"
        case i11329217 = "I11329217"
        case i11329218 = "I11329218"
        case i11329219 = "I11329219"
        case i11329220 = "I11329220"
        case i11329222 = "I11329222"
        case i11330946 = "I11330946"
        case i11330947 = "I11330947"
        case i11364508 = "I11364508"
        case fasteners = "fasteners"
        case gross_weight = "gross_weight"
        case is_bolt = "is_bolt"
        case kind_of_package = "kind_of_package"
        case loading_map = "loading_map"
        case lot = "lot"
        case mbl_rev = "mbl_rev"
        case net_weight = "net_weight"
        case on_site_date = "on_site_date"
        case on_site_status = "on_site_status"
        case pl_input = "pl_input"
        case pl_name = "pl_name"
        case pl_number = "pl_number"
        case release_note = "release_note"
        case rn_date = "rn_date"
        case shipped_date = "shipped_date"
        case shipped_status = "shipped_status"
        case struct_mwp = "struct_mwp"
        case structure = "structure"
        case volume = "volume"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        i11329215 = try values.decodeIfPresent(Double.self, forKey: .i11329215)
        i11329217 = try values.decodeIfPresent(Double.self, forKey: .i11329217)
        i11329218 = try values.decodeIfPresent(Double.self, forKey: .i11329218)
        i11329219 = try values.decodeIfPresent(Double.self, forKey: .i11329219)
        i11329220 = try values.decodeIfPresent(Double.self, forKey: .i11329220)
        i11329222 = try values.decodeIfPresent(Double.self, forKey: .i11329222)
        i11330946 = try values.decodeIfPresent(Double.self, forKey: .i11330946)
        i11330947 = try values.decodeIfPresent(Double.self, forKey: .i11330947)
        i11364508 = try values.decodeIfPresent(Double.self, forKey: .i11364508)
        fasteners = try values.decodeIfPresent(Double.self, forKey: .fasteners)
        gross_weight = try values.decodeIfPresent(Double.self, forKey: .gross_weight)
        is_bolt = try values.decodeIfPresent(Bool.self, forKey: .is_bolt)
        kind_of_package = try values.decodeIfPresent(String.self, forKey: .kind_of_package)
        loading_map = try values.decodeIfPresent(String.self, forKey: .loading_map)
        lot = try values.decodeIfPresent(String.self, forKey: .lot)
        mbl_rev = try values.decodeIfPresent(String.self, forKey: .mbl_rev)
        net_weight = try values.decodeIfPresent(Double.self, forKey: .net_weight)
        on_site_date = try values.decodeIfPresent(String.self, forKey: .on_site_date)
        on_site_status = try values.decodeIfPresent(String.self, forKey: .on_site_status)
        pl_input = try values.decodeIfPresent(String.self, forKey: .pl_input)
        pl_name = try values.decodeIfPresent(String.self, forKey: .pl_name)
        pl_number = try values.decodeIfPresent(String.self, forKey: .pl_number)
        release_note = try values.decodeIfPresent(String.self, forKey: .release_note)
        rn_date = try values.decodeIfPresent(String.self, forKey: .rn_date)
        shipped_date = try values.decodeIfPresent(String.self, forKey: .shipped_date)
        shipped_status = try values.decodeIfPresent(String.self, forKey: .shipped_status)
        struct_mwp = try values.decodeIfPresent(String.self, forKey: .struct_mwp)
        structure = try values.decodeIfPresent(String.self, forKey: .structure)
        volume = try values.decodeIfPresent(Double.self, forKey: .volume)
    }

}
