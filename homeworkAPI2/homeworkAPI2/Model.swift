//
//  Model.swift
//  homeworkAPI2
//
//  Created by Aida Moldaly on 29.05.2022.
//

import Foundation

struct Model: Codable {
    let gender: String?
    let name: [Name]?
}

struct Name: Codable {
    let title: String?
    let first: String?
    let last: String?
}
