//
//  DrinkListController.swift
//  AnonymousAlcoholics
//
//  Created by Nicky Taylor on 9/12/24.
//

import UIKit
import SwiftUI

@Observable class DrinkSearchController {
    
    static let searchAnimationID = "search_id"
    
    var drinks = [Drink]()
    
    
    @MainActor var imageDict = [String: UIImage]()
    @MainActor var imageDownloadFailSet = Set<String>()
    
    //var selectedFullScreenGalleryIndex: Int?
    var selectedFullScreenGalleryDrink: Drink?
    var zoomAnimationDrink: Drink?
    
    //var isShowingFullScreenGallery = false
    
    var fuckinPage = 0
    
    var drinkSearchRouter: DrinkSearchRouter
    init(drinkSearchRouter: DrinkSearchRouter) {
        self.drinkSearchRouter = drinkSearchRouter
    }
    
    func fetchDrinks() async {
        do {
            let response = try await NetworkCalls.drinks(search: "gin")
            await MainActor.run {
                DispatchQueue.global(qos: .background).async {
                    for drink in response.drinks {
                        if let thumbnailUrlString = drink.thumbnailUrlString {
                            if let thumbnailUrl = URL(string: thumbnailUrlString) {
                                if let data = try? Data(contentsOf: thumbnailUrl) {
                                    if let image = UIImage(data: data) {
                                        DispatchQueue.main.async {
                                            self.imageDict[thumbnailUrlString] = image
                                        }
                                    }
                                }
                            }
                        }
                    }
                    DispatchQueue.main.async {
                        self.drinks = response.drinks
                    }
                }
            }
        } catch {
            print("Error Was: \(error.localizedDescription)")
        }
    }
    
    func userIntentActionDrinkDetails(drink: Drink) {
        print("userIntentActionDrinkDetails: \(drink.name)")
        let detailController = DrinkDetailController(drink: drink,
                                                     drinkSearchController: self)
        drinkSearchRouter.navigationPath.append(detailController)
    }
    
    func userIntentActionFullScreenGallery(drink: Drink) {
        print("userIntentActionFullScreenGallery: \(drink.name)")
        
        zoomAnimationDrink = drink
        print("(Intent) zoomAnimationDrink => \(zoomAnimationDrink?.name ?? "NULL")")
        withAnimation(.smooth(duration: 3.0)) {
            selectedFullScreenGalleryDrink = drink
            print("(Intent) selectedFullScreenGalleryDrink => \(selectedFullScreenGalleryDrink?.name ?? "NULL")")
        }
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

extension DrinkSearchController {
    @MainActor static func mock() -> DrinkSearchController {
        
        let drinkSearchRouter = DrinkSearchRouter.mock()
        let result = DrinkSearchController(drinkSearchRouter: drinkSearchRouter)
        
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
