//   let employeeModel = try? newJSONDecoder().decode(EmployeeModel.self, from: jsonData)

import Foundation

// MARK: - EmployeeModel
struct EmployeeModel: Codable {
    let count: Int?
    let next, previous: String?
    let results: [EmployeeResult]?
}

// MARK: - Result
struct EmployeeResult: Codable {
    let id: Int?
    let username, firstName, lastName, email: String?
    let isActive, isStaff, timeBased: Bool?
    enum CodingKeys: String, CodingKey {
        case id, username
        case firstName = "first_name"
        case lastName = "last_name"
        case email
        case isActive = "is_active"
        case isStaff = "is_staff"
        case timeBased = "time_based"
    }
}

//MARK:- VendorModel
//   let vendorModel = try? newJSONDecoder().decode(VendorModel.self, from: jsonData)
struct VendorModel: Codable {
    let id: Int?
    let name, email, phone, code: String?
    let isActive: Bool?
    let createdBy: Int?
    let shortName: String?

    enum CodingKeys: String, CodingKey {
        case id, name, email, phone, code
        case isActive = "is_active"
        case createdBy = "created_by"
        case shortName = "short_name"
    }
}
//MARK:- vendorModel
//   let vendorModel = try? newJSONDecoder().decode(VendorModel.self, from: jsonData)
struct POTypeModel: Codable {
    let id: Int?
    let name, vendorModelDescription: String?
    let isActive: Bool?
    let createdBy: Int?
    let code: String?

    enum CodingKeys: String, CodingKey {
        case id, name
        case vendorModelDescription = "description"
        case isActive = "is_active"
        case createdBy = "created_by"
        case code
    }
}
//MARK:- CurrencyModel
//   let currencyModel = try? newJSONDecoder().decode(CurrencyModel.self, from: jsonData)
struct CurrencyModel: Codable {
    let id: Int?
    let name, code, symbol: String?
    let isActive: Bool?

    enum CodingKeys: String, CodingKey {
        case id, name, code, symbol
        case isActive = "is_active"
    }
}

//MARK:- UOM Model
//   let uOMModel = try? newJSONDecoder().decode(UOMModel.self, from: jsonData)
import Foundation

// MARK: - UOMModelElement
struct UOMModel: Codable {
    let id: Int?
    let name, category: String?
    let isActive: Bool?
    let createdBy: Int?
    let code, symbol: String?

    enum CodingKeys: String, CodingKey {
        case id, name, category
        case isActive = "is_active"
        case createdBy = "created_by"
        case code, symbol
    }
}
// MARK: - DefaultDisciplineModel
struct DefaultDisciplineModel: Codable {
    let count: Int?
    let next, previous: String?
    let results: [DDResult]?
}

// MARK: - Result
struct DDResult: Codable {
    let id: Int?
    let name: String?
}
