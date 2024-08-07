//
//  Product.swift
//  Chanllengetecnico
//
//  Created by Gerardo Enrique Mendez Raigoso on 4/08/24.
//

import Foundation

struct Product: Identifiable, Codable {
    let id: String
    let title: String
    let price: Double
    let thumbnail: String
}
