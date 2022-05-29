//
//  FarmModel.swift
//  Arbuz
//
//  Created by Алмаз Кусаинов on 29.05.2022.
//

import SwiftUI

struct Farm: Identifiable {
    let id = UUID()
    let title: String
    let image: String
    let fruitImage: String
    let rating: Int
    let location: String
    let date: String
    let price: Int
    let sort: String
    let description: String
    let advantages: String
    let watermelons: [Watermelon]
}

