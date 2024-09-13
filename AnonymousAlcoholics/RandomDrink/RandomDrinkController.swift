//
//  RandomDrinkController.swift
//  AnonymousAlcoholics
//
//  Created by Nicky Taylor on 9/12/24.
//

import Foundation
import UIKit
import SwiftUI

@Observable class RandomDrinkController {
    
    static let searchAnimationID = "search_id"
    
    var drinks = [Drink]()
    
    @MainActor var imageDict = [String: UIImage]()
    @MainActor var imageDownloadFailSet = Set<String>()
    
    //var selectedFullScreenGalleryIndex: Int?
    var selectedFullScreenGalleryDrink: Drink?
    var zoomAnimationDrink: Drink?

    let randomDrinkRouter: RandomDrinkRouter
    init(randomDrinkRouter: RandomDrinkRouter) {
        self.randomDrinkRouter = randomDrinkRouter
    }
    
    func getIndex(drink: Drink) -> Int? {
        for drinkIndex in drinks.indices {
            if drinks[drinkIndex] == drink {
                return drinkIndex
            }
        }
        return nil
    }
    
    @MainActor func getImage(drink: Drink) -> UIImage? {
        if let thumbnailUrlString = drink.thumbnailUrlString {
            return imageDict[thumbnailUrlString]
        } else {
            return nil
        }
    }
    
    @MainActor func getImageDownloadDidFail(drink: Drink) -> Bool {
        imageDownloadFailSet.contains(drink.id)
    }
    
    
    func getDrink(index: Int) -> Drink? {
        if index >= 0 && index < drinks.count {
            return drinks[index]
        }
        return nil
    }
}

extension RandomDrinkController {
    @MainActor static func mock() -> RandomDrinkController {
        
        let randomDrinkRouter = RandomDrinkRouter.mock()
        let result = RandomDrinkController(randomDrinkRouter: randomDrinkRouter)
        
        let mockDrinks = Drink.mockList()
        let mockThumbs = Drink.mockListThumbs()
        
        for drinkIndex in mockDrinks.indices {
            let drink = mockDrinks[drinkIndex]
            result.drinks.append(drink)
            if drinkIndex == 3 || drinkIndex == 11 {
                result.imageDownloadFailSet.insert(drink.id)
            } else if drinkIndex == 4 || drinkIndex == 8 || drinkIndex == 9 {
                // Do nothing...
            } else {
                if let thumbnailUrlString = drink.thumbnailUrlString {
                    let thumb = mockThumbs[drinkIndex]
                    result.imageDict[thumbnailUrlString] = thumb
                }
            }
        }
        return result
    }
}
