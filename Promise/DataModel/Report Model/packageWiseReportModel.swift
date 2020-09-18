import Foundation
struct packageWiseReportModel : Codable {
    let count : Int?
    let next : String?
    let previous : String?
    let results : [packageWiseReportResults]?
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
        results = try values.decodeIfPresent([packageWiseReportResults].self, forKey: .results)
    }
}
struct packageWiseReportResults : Codable {
    let vendor_name : String?
    let purchase_id : String?
    let group_structure_name : String?
    let pl_name : String?
    let pl_package : Int?
    let master_package_count : Int?
    let vendor_package : String?
    let master_net_weight : String?
    let master_gross_weight : String?
    let released_date : String?
    let shipped_date : String?
    let onsite_date : String?
    let released_status : String?
    let shipped_status : String?
    let onsite_status : String?

    enum CodingKeys: String, CodingKey {

        case vendor_name = "vendor_name"
        case purchase_id = "purchase_id"
        case group_structure_name = "group_structure_name"
        case pl_name = "pl_name"
        case pl_package = "pl_package"
        case master_package_count = "master_package_count"
        case vendor_package = "vendor_package"
        case master_net_weight = "master_net_weight"
        case master_gross_weight = "master_gross_weight"
        case released_date = "released_date"
        case shipped_date = "shipped_date"
        case onsite_date = "onsite_date"
        case released_status = "released_status"
        case shipped_status = "shipped_status"
        case onsite_status = "onsite_status"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        vendor_name = try values.decodeIfPresent(String.self, forKey: .vendor_name)
        purchase_id = try values.decodeIfPresent(String.self, forKey: .purchase_id)
        group_structure_name = try values.decodeIfPresent(String.self, forKey: .group_structure_name)
        pl_name = try values.decodeIfPresent(String.self, forKey: .pl_name)
        pl_package = try values.decodeIfPresent(Int.self, forKey: .pl_package)
        master_package_count = try values.decodeIfPresent(Int.self, forKey: .master_package_count)
        vendor_package = try values.decodeIfPresent(String.self, forKey: .vendor_package)
        master_net_weight = try values.decodeIfPresent(String.self, forKey: .master_net_weight)
        master_gross_weight = try values.decodeIfPresent(String.self, forKey: .master_gross_weight)
        released_date = try values.decodeIfPresent(String.self, forKey: .released_date)
        shipped_date = try values.decodeIfPresent(String.self, forKey: .shipped_date)
        onsite_date = try values.decodeIfPresent(String.self, forKey: .onsite_date)
        released_status = try values.decodeIfPresent(String.self, forKey: .released_status)
        shipped_status = try values.decodeIfPresent(String.self, forKey: .shipped_status)
        onsite_status = try values.decodeIfPresent(String.self, forKey: .onsite_status)
    }

}
