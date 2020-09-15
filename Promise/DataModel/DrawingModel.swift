//
//  DrawingModel.swift
//  Promise
//
//  Created by macbook on 20/05/1942 Saka.
//  Copyright © 1942 Captain. All rights reserved.
//


// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct DrawingModel: Codable {
    let count: Int
    let next, previous: DJSONNull?
    let results: [Result]
    
}

// MARK: - Result
struct Result: Codable {
    let id: Int
    let revNo, purchaseID, projectName, vendorName: String
    let status, docStatus, structureID, groupName: String
    let totalQuantity: Int
    let totalNetWeight, totalPaintingWeight, totalFireproofingWeight, lot: String
    let plInputCreated, isActive, isGroupStructure: Bool
    let weightDecimalSize: Int
    let approveStatus: String

    enum CodingKeys: String, CodingKey {
        case id
        case revNo = "rev_no"
        case purchaseID = "purchase_id"
        case projectName = "project_name"
        case vendorName = "vendor_name"
        case status
        case docStatus = "doc_status"
        case structureID = "structure_id"
        case groupName = "group_name"
        case totalQuantity = "total_quantity"
        case totalNetWeight = "total_net_weight"
        case totalPaintingWeight = "total_painting_weight"
        case totalFireproofingWeight = "total_fireproofing_weight"
        case lot
        case plInputCreated = "pl_input_created"
        case isActive = "is_active"
        case isGroupStructure = "is_group_structure"
        case weightDecimalSize = "weight_decimal_size"
        case approveStatus = "approve_status"
    }
}

// MARK: - Encode/decode helpers

@objcMembers class DJSONNull: NSObject, Codable {

    public static func == (lhs: DJSONNull, rhs: DJSONNull) -> Bool {
        return true
    }

    override public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(DJSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for DJSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
