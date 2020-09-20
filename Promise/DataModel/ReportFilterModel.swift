//
//  ReportFilterModel.swift
//  Promise
//
//  Created by Captain on 19/09/20.
//  Copyright © 2020 Captain. All rights reserved.
//

import Foundation

// MARK: - FilterProjectModel
//   let filterProjectModel = try? newJSONDecoder().decode([FilterProjectModel].self, from: jsonData)
struct FilterProjectModel: Codable {
    let id: Int
    let project: String
}

// MARK: - FilterPurchaseOrderModel
//   let filterPurchaseOrderModel = try? newJSONDecoder().decode([FilterPurchaseOrderModel].self, from: jsonData)
struct FilterPurchaseOrderModel: Codable {
    let id: Int
    let poNo: String

    enum CodingKeys: String, CodingKey {
        case id
        case poNo = "po_no"
    }
}

// MARK: - FilterPurchaseOrderModelElement
//   let filterPurchaseOrderModel = try? newJSONDecoder().decode([FilterStructureModel].self, from: jsonData)
struct FilterStructureModel: Codable {
    let id: Int
    let structure: String
}

// MARK: - FilterPackingListModelElement
//   let filterPackingListModel = try? newJSONDecoder().decode(FilterPackingListModel.self, from: jsonData)
struct FilterPackingListModel: Codable {
    let id: Int
    let packingList: String

    enum CodingKeys: String, CodingKey {
        case id
        case packingList = "packing_list"
    }
}
// MARK: - FilterMarkModel
//   let filterMarkModel = try? newJSONDecoder().decode(FilterMarkModel.self, from: jsonData)
struct FilterMarkModel: Codable {
    let count: Int
    let next, previous: String
    let results: [MarkResult]
}

// MARK: - Result
struct MarkResult: Codable {
    let mark: String
}
