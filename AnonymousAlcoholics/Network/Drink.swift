//
//  Drink.swift
//  BrickDaniels
//
//  Created by Nicky Taylor on 9/5/24.
//

import UIKit

struct Drink: Decodable {
    var id: String
    var name: String
    var category: String
    var alcoholic: String
    var glass: String
    let thumbnailUrlString: String?
    enum CodingKeys: String, CodingKey {
        case id = "idDrink"
        case name = "strDrink"
        case category = "strCategory"
        case alcoholic = "strAlcoholic"
        case glass = "strGlass"
        case thumbnailUrlString = "strDrinkThumb"
    }
}

extension Drink {
    static func mock() -> Drink {
        Drink(id: "12754",
              name: "Sex on the Beach",
              category: "Ordinary Drink",
              alcoholic: "Alcoholic",
              glass: "Highball glass",
              thumbnailUrlString: "https://www.thecocktaildb.com/images/media/drink/fi67641668420787.jpg")
    }
    
    static func mockThumb() -> UIImage {
        UIImage(named: "drink_preview") ?? UIImage()
    }
    
    static func mockList() -> [Drink] {
        [Drink(id: "13196",
               name: "Long vodka",
               category: "Ordinary Drink",
               alcoholic: "Alcoholic",
               glass: "Highball glass",
               thumbnailUrlString: "https://www.thecocktaildb.com/images/media/drink/9179i01503565212.jpg"),
         Drink(id: "16967", 
               name: "Vodka Fizz",
               category: "Other / Unknown",
               alcoholic: "Alcoholic",
               glass: "White wine glass",
               thumbnailUrlString: "https://www.thecocktaildb.com/images/media/drink/xwxyux1441254243.jpg"),
         Drink(id: "178362",
               name: "Vodka Slime",
               category: "Cocktail",
               alcoholic: "Alcoholic",
               glass: "Highball glass",
               thumbnailUrlString: "https://www.thecocktaildb.com/images/media/drink/apex461643588115.jpg"),
         Drink(id: "178363", 
               name: "Vodka Lemon",
               category: "Cocktail",
               alcoholic: "Alcoholic",
               glass: "Highball glass",
               thumbnailUrlString: "https://www.thecocktaildb.com/images/media/drink/mql55h1643820632.jpg"),
         Drink(id: "178364", 
               name: "Vodka Tonic",
               category: "Cocktail",
               alcoholic: "Alcoholic",
               glass: "Highball glass",
               thumbnailUrlString: "https://www.thecocktaildb.com/images/media/drink/9koz3f1643821062.jpg"),
         Drink(id: "12800",
               name: "Coffee-Vodka",
               category: "Homemade Liqueur",
               alcoholic: "Alcoholic",
               glass: "Collins Glass",
               thumbnailUrlString: "https://www.thecocktaildb.com/images/media/drink/qvrrvu1472667494.jpg"),
         Drink(id: "14167",
               name: "Vodka Martini",
               category: "Ordinary Drink",
               alcoholic: "Alcoholic",
               glass: "Cocktail glass",
               thumbnailUrlString: "https://www.thecocktaildb.com/images/media/drink/qyxrqw1439906528.jpg"), 
         Drink(id: "15403",
               name: "Vodka Russian",
               category: "Ordinary Drink",
               alcoholic: "Alcoholic",
               glass: "Collins Glass",
               thumbnailUrlString: "https://www.thecocktaildb.com/images/media/drink/rpttur1454515129.jpg"),
         Drink(id: "12460",
               name: "Vodka And Tonic",
               category: "Ordinary Drink",
               alcoholic: "Alcoholic",
               glass: "Highball glass",
               thumbnailUrlString: "https://www.thecocktaildb.com/images/media/drink/lmj2yt1504820500.jpg"),
         Drink(id: "11410",
               name: "Gin Fizz",
               category: "Ordinary Drink",
               alcoholic: "Alcoholic",
               glass: "Highball glass",
               thumbnailUrlString: "https://www.thecocktaildb.com/images/media/drink/drtihp1606768397.jpg"),
         Drink(id: "11417",
               name: "Gin Sour",
               category: "Ordinary Drink",
               alcoholic: "Alcoholic",
               glass: "Whiskey sour glass",
               thumbnailUrlString: "https://www.thecocktaildb.com/images/media/drink/noxp7e1606769224.jpg"),
         Drink(id: "11936", 
               name: "Pink Gin",
               category: "Ordinary Drink",
               alcoholic: "Alcoholic",
               glass: "White wine glass",
               thumbnailUrlString: "https://www.thecocktaildb.com/images/media/drink/qyr51e1504888618.jpg"),
         Drink(id: "11408",
               name: "Gin Daisy",
               category: "Ordinary Drink",
               alcoholic: "Alcoholic",
               glass: "Old-fashioned glass",
               thumbnailUrlString: "https://www.thecocktaildb.com/images/media/drink/z6e22f1582581155.jpg"),
         Drink(id: "11415",
               name: "Gin Sling",
               category: "Ordinary Drink",
               alcoholic: "Alcoholic",
               glass: "Old-fashioned glass",
               thumbnailUrlString: "https://www.thecocktaildb.com/images/media/drink/8cl9sm1582581761.jpg"),
         Drink(id: "11416", 
               name: "Gin Smash",
               category: "Ordinary Drink",
               alcoholic: "Alcoholic",
               glass: "Old-fashioned glass",
               thumbnailUrlString: "https://www.thecocktaildb.com/images/media/drink/iprva61606768774.jpg"),
         Drink(id: "11420",
               name: "Gin Toddy",
               category: "Ordinary Drink",
               alcoholic: "Alcoholic",
               glass: "Old-fashioned glass",
               thumbnailUrlString: "https://www.thecocktaildb.com/images/media/drink/jxstwf1582582101.jpg"),
         Drink(id: "178365",
               name: "Gin Tonic",
               category: "Cocktail",
               alcoholic: "Alcoholic",
               glass: "Highball glass",
               thumbnailUrlString: "https://www.thecocktaildb.com/images/media/drink/qcgz0t1643821443.jpg"),
         Drink(id: "178366",
               name: "Gin Lemon",
               category: "Cocktail",
               alcoholic: "Alcoholic",
               glass: "Highball glass",
               thumbnailUrlString: "https://www.thecocktaildb.com/images/media/drink/6gdohq1681212476.jpg"),
         Drink(id: "11407",
               name: "Gin Cooler",
               category: "Ordinary Drink",
               alcoholic: "Alcoholic",
               glass: "Collins glass",
               thumbnailUrlString: "https://www.thecocktaildb.com/images/media/drink/678xt11582481163.jpg"),
         Drink(id: "11418",
               name: "Gin Squirt",
               category: "Ordinary Drink",
               alcoholic: "Alcoholic",
               glass: "Highball glass",
               thumbnailUrlString: "https://www.thecocktaildb.com/images/media/drink/xrbhz61504883702.jpg"),
         Drink(id: "17230", 
               name: "Gin Rickey",
               category: "Cocktail",
               alcoholic: "Alcoholic",
               glass: "Highball glass",
               thumbnailUrlString: "https://www.thecocktaildb.com/images/media/drink/s00d6f1504883945.jpg"),
         Drink(id: "11419",
               name: "Gin Swizzle",
               category: "Ordinary Drink",
               alcoholic: "Alcoholic",
               glass: "Highball glass",
               thumbnailUrlString: "https://www.thecocktaildb.com/images/media/drink/sybce31504884026.jpg"),
         Drink(id: "178342", 
               name: "Gin and Soda",
               category: "Cocktail",
               alcoholic: "Alcoholic",
               glass: "Highball glass",
               thumbnailUrlString: "https://www.thecocktaildb.com/images/media/drink/nzlyc81605905755.jpg"),
         Drink(id: "11403", 
               name: "Gin And Tonic",
               category: "Ordinary Drink",
               alcoholic: "Alcoholic",
               glass: "Highball glass",
               thumbnailUrlString: "https://www.thecocktaildb.com/images/media/drink/k0508k1668422436.jpg"), 
         Drink(id: "12057",
               name: "Royal Gin Fizz",
               category: "Ordinary Drink",
               alcoholic: "Alcoholic",
               glass: "Highball glass",
               thumbnailUrlString: "https://www.thecocktaildb.com/images/media/drink/pe1x1c1504735672.jpg"),
         Drink(id: "178367",
               name: "Ramos Gin Fizz",
               category: "Cocktail",
               alcoholic: "Alcoholic",
               glass: "Highball glass",
               thumbnailUrlString: "https://www.thecocktaildb.com/images/media/drink/967t911643844053.jpg")
        ]
    }
    
    static func mockListThumbs() -> [UIImage] {
        var result = [UIImage]()
        for index in 1...26 {
            let name = "list_mock_drink_\(index)"
            if let image = UIImage(named: name) {
                result.append(image)
            }
        }
        return result
    }
}

extension Drink: Identifiable {
    
}

extension Drink: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
