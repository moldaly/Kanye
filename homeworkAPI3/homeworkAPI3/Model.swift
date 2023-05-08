//
//  Model.swift
//  homeworkAPI3
//
//  Created by tamzimun on 29.05.2022.
//

import Foundation

struct Model: Codable {
    let shapes: [Shapes]?
}

struct Shapes: Codable {
    let type: String?
    let data: [Data]?
}

struct Data: Codable {
    let radious: Double?
    let height: Double?
    let width: Double?
}
    
