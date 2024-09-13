//
//  DrinkDetailWrapper.swift
//  BrickDaniels
//
//  Created by Nicky Taylor on 9/8/24.
//

import Foundation

struct DrinkDetailWrapper {
    var id: String
    var name: String
    var category: String
    var alcoholic: String
    var glass: String
    let instructions: String?
    let iba: String?
    let thumbnailUrlString: String?
    let ingredients: [Ingredient]
    init(drinkDetail: DrinkDetail) {
        id = drinkDetail.id
        name = drinkDetail.name
        category = drinkDetail.category
        alcoholic = drinkDetail.alcoholic
        glass = drinkDetail.glass
        instructions = drinkDetail.instructions
        iba = drinkDetail.iba
        thumbnailUrlString = drinkDetail.thumbnailUrlString
        var _ingredientId = 0
        var _ingredients = [Ingredient]()
        if let ingredient1 = drinkDetail.ingredient1 {
            _ingredients.append(Ingredient(id: _ingredientId,
                                           name: ingredient1,
                                           measure: drinkDetail.measure1))
            _ingredientId += 1
        }
        if let ingredient2 = drinkDetail.ingredient2 {
            _ingredients.append(Ingredient(id: _ingredientId,
                                           name: ingredient2,
                                           measure: drinkDetail.measure2))
            _ingredientId += 1
        }
        if let ingredient3 = drinkDetail.ingredient3 {
            _ingredients.append(Ingredient(id: _ingredientId,
                                           name: ingredient3,
                                           measure: drinkDetail.measure3))
            _ingredientId += 1
        }
        if let ingredient4 = drinkDetail.ingredient4 {
            _ingredients.append(Ingredient(id: _ingredientId,
                                           name: ingredient4,
                                           measure: drinkDetail.measure4))
            _ingredientId += 1
        }
        if let ingredient5 = drinkDetail.ingredient5 {
            _ingredients.append(Ingredient(id: _ingredientId,
                                           name: ingredient5,
                                           measure: drinkDetail.measure5))
            _ingredientId += 1
        }
        if let ingredient6 = drinkDetail.ingredient6 {
            _ingredients.append(Ingredient(id: _ingredientId,
                                           name: ingredient6,
                                           measure: drinkDetail.measure6))
            _ingredientId += 1
        }
        if let ingredient7 = drinkDetail.ingredient7 {
            _ingredients.append(Ingredient(id: _ingredientId,
                                           name: ingredient7,
                                           measure: drinkDetail.measure7))
            _ingredientId += 1
        }
        if let ingredient8 = drinkDetail.ingredient8 {
            _ingredients.append(Ingredient(id: _ingredientId,
                                           name: ingredient8,
                                           measure: drinkDetail.measure8))
            _ingredientId += 1
        }
        if let ingredient9 = drinkDetail.ingredient9 {
            _ingredients.append(Ingredient(id: _ingredientId,
                                           name: ingredient9,
                                           measure: drinkDetail.measure9))
            _ingredientId += 1
        }
        if let ingredient10 = drinkDetail.ingredient10 {
            _ingredients.append(Ingredient(id: _ingredientId,
                                           name: ingredient10,
                                           measure: drinkDetail.measure10))
            _ingredientId += 1
        }
        if let ingredient11 = drinkDetail.ingredient11 {
            _ingredients.append(Ingredient(id: _ingredientId,
                                           name: ingredient11,
                                           measure: drinkDetail.measure11))
            _ingredientId += 1
        }
        if let ingredient12 = drinkDetail.ingredient12 {
            _ingredients.append(Ingredient(id: _ingredientId,
                                           name: ingredient12,
                                           measure: drinkDetail.measure12))
            _ingredientId += 1
        }
        if let ingredient13 = drinkDetail.ingredient13 {
            _ingredients.append(Ingredient(id: _ingredientId,
                                           name: ingredient13,
                                           measure: drinkDetail.measure13))
            _ingredientId += 1
        }
        if let ingredient14 = drinkDetail.ingredient14 {
            _ingredients.append(Ingredient(id: _ingredientId,
                                           name: ingredient14,
                                           measure: drinkDetail.measure14))
            _ingredientId += 1
        }
        if let ingredient15 = drinkDetail.ingredient15 {
            _ingredients.append(Ingredient(id: _ingredientId,
                                           name: ingredient15,
                                           measure: drinkDetail.measure15))
            _ingredientId += 1
        }
        ingredients = _ingredients
    }
}

struct Ingredient {
    let id: Int
    let name: String
    let measure: String?
}

extension Ingredient: Identifiable {
    
}

extension DrinkDetailWrapper {
    static func mock() -> DrinkDetailWrapper {
        let drinkDetail = DrinkDetail.mock()
        return DrinkDetailWrapper(drinkDetail: drinkDetail)
    }
}
