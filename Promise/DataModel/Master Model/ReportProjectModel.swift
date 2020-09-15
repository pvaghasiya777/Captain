//
//  ProjectModel.swift
//  Promise
//
//  Created by macbook on 28/05/1942 Saka.
//  Copyright © 1942 Captain. All rights reserved.
//

import Foundation
struct ReportProjectModel : Codable {
    let id : Int?
    let project : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case project = "project"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        project = try values.decodeIfPresent(String.self, forKey: .project)
    }

}
