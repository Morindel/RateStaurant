//
//  CategoriesModel.swift
//  RateStaurant
//
//  Created by Jakub Kołodziej on 23/06/2019.
//  Copyright © 2019 Jakub Kołodziej. All rights reserved.
//

import Foundation

struct CategoriesModel: Codable {
    let categories: [CategoriesArrayModel]
}

struct CategoriesArrayModel : Codable {
    let category: CategoryModel
}

struct CategoryModel : Codable {
    let id: Int
    let name: String
}
