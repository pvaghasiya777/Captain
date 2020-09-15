// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(MasterAddressModel.self, from: jsonData)

import Foundation

// MARK: - WelcomeElement
struct MasterAddressModel: Codable {
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
// MARK: - MasterCountry
struct MasterCountryModel: Codable {
    let id: Int?
    let name, code2, phone: String?
}
