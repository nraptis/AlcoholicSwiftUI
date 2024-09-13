//
//  DrinkDetail.swift
//  BrickDaniels
//
//  Created by Nicky Taylor on 9/8/24.
//

import UIKit

struct DrinkDetail: Decodable {
    var id: String
    var name: String
    var category: String
    var alcoholic: String
    var glass: String
    let instructions: String?
    let iba: String?
    let ingredient1: String?
    let measure1: String?
    let ingredient2: String?
    let measure2: String?
    let ingredient3: String?
    let measure3: String?
    let ingredient4: String?
    let measure4: String?
    let ingredient5: String?
    let measure5: String?
    let ingredient6: String?
    let measure6: String?
    let ingredient7: String?
    let measure7: String?
    let ingredient8: String?
    let measure8: String?
    let ingredient9: String?
    let measure9: String?
    let ingredient10: String?
    let measure10: String?
    let ingredient11: String?
    let measure11: String?
    let ingredient12: String?
    let measure12: String?
    let ingredient13: String?
    let measure13: String?
    let ingredient14: String?
    let measure14: String?
    let ingredient15: String?
    let measure15: String?
    let thumbnailUrlString: String?
    enum CodingKeys: String, CodingKey {
        case id = "idDrink"
        case name = "strDrink"
        case category = "strCategory"
        case alcoholic = "strAlcoholic"
        case glass = "strGlass"
        case instructions = "strInstructions"
        case iba = "strIBA"
        case ingredient1 = "strIngredient1"
        case ingredient2 = "strIngredient2"
        case ingredient3 = "strIngredient3"
        case ingredient4 = "strIngredient4"
        case ingredient5 = "strIngredient5"
        case ingredient6 = "strIngredient6"
        case ingredient7 = "strIngredient7"
        case ingredient8 = "strIngredient8"
        case ingredient9 = "strIngredient9"
        case ingredient10 = "strIngredient10"
        case ingredient11 = "strIngredient11"
        case ingredient12 = "strIngredient12"
        case ingredient13 = "strIngredient13"
        case ingredient14 = "strIngredient14"
        case ingredient15 = "strIngredient15"
        case measure1 = "strMeasure1"
        case measure2 = "strMeasure2"
        case measure3 = "strMeasure3"
        case measure4 = "strMeasure4"
        case measure5 = "strMeasure5"
        case measure6 = "strMeasure6"
        case measure7 = "strMeasure7"
        case measure8 = "strMeasure8"
        case measure9 = "strMeasure9"
        case measure10 = "strMeasure10"
        case measure11 = "strMeasure11"
        case measure12 = "strMeasure12"
        case measure13 = "strMeasure13"
        case measure14 = "strMeasure14"
        case measure15 = "strMeasure15"
        case thumbnailUrlString = "strDrinkThumb"
    }
}

extension DrinkDetail {
    static func mock() -> DrinkDetail {
        DrinkDetail(id: "12754",
                    name: "Sex on the Beach",
                    category: "Ordinary Drink",
                    alcoholic: "Alcoholic",
                    glass: "Highball glass",
                    instructions: "Build all ingredients in a highball glass filled with ice. Garnish with orange slice.",
                    iba: "Contemporary Classics",
                    ingredient1: "Vodka",
                    measure1: "1 oz ",
                    ingredient2: "Peach schnapps",
                    measure2: "3/4 oz ",
                    ingredient3: "Cranberry juice",
                    measure3: nil,
                    ingredient4: "Orange juice",
                    measure4: nil,
                    ingredient5: nil,
                    measure5: nil,
                    ingredient6: "Sample Ingredient 6",
                    measure6: "Sample Measure 6",
                    ingredient7: nil,
                    measure7: nil,
                    ingredient8: "Sample Measure 8",
                    measure8: nil,
                    ingredient9: "Sample Measure 9",
                    measure9: nil,
                    ingredient10: nil,
                    measure10: "Sample Ingredient 10",
                    ingredient11: "Sample Measure 10",
                    measure11: "Sample Ingredient 11",
                    ingredient12: nil,
                    measure12: nil,
                    ingredient13: nil,
                    measure13: nil,
                    ingredient14: "Sample Ingredient 14",
                    measure14: "30 mg",
                    ingredient15: nil,
                    measure15: nil,
                    thumbnailUrlString: "https://www.thecocktaildb.com/images/media/drink/fi67641668420787.jpg")
    }
    
    static func mockThumb() -> UIImage {
        UIImage(named: "drink_preview") ?? UIImage()
    }
    
}
