//
//  ApplicationController.swift
//  AnonymousAlcoholics
//
//  Created by Nicky Taylor on 9/12/24.
//

import Foundation

final class ApplicationController {
    
    static let shared = ApplicationController()
    
    static func mock() -> ApplicationController {
        return ApplicationController()
    }
    
    private init() {
        
    }
    
    let applicationRouter = ApplicationRouter()
    
    private var drinkSearchRouter: DrinkSearchRouter?
    func getDrinkSearchRouter() -> DrinkSearchRouter {
        if let drinkSearchRouter = drinkSearchRouter {
            return drinkSearchRouter
        }
        let _drinkSearchRouter = DrinkSearchRouter()
        drinkSearchRouter = _drinkSearchRouter
        return _drinkSearchRouter
    }
    
    private var drinkSearchController: DrinkSearchController?
    func getDrinkSearchController() -> DrinkSearchController {
        if let drinkSearchController = drinkSearchController {
            return drinkSearchController
        }
        let _drinkSearchController = DrinkSearchController(drinkSearchRouter: getDrinkSearchRouter())
        drinkSearchController = _drinkSearchController
        return _drinkSearchController
    }
    
    func disposeDrinkSearch() {
        drinkSearchRouter = nil
        drinkSearchController = nil
    }
    
    private var randomDrinkRouter: RandomDrinkRouter?
    func getRandomDrinkRouter() -> RandomDrinkRouter {
        if let randomDrinkRouter = randomDrinkRouter {
            return randomDrinkRouter
        }
        let _randomDrinkRouter = RandomDrinkRouter()
        randomDrinkRouter = _randomDrinkRouter
        return _randomDrinkRouter
    }
    
    private var randomDrinkController: RandomDrinkController?
    func getRandomDrinkController() -> RandomDrinkController {
        if let randomDrinkController = randomDrinkController {
            return randomDrinkController
        }
        let _randomDrinkController = RandomDrinkController(randomDrinkRouter: getRandomDrinkRouter())
        randomDrinkController = _randomDrinkController
        return _randomDrinkController
    }
    
    func disposeRandomDrink() {
        randomDrinkRouter = nil
        randomDrinkController = nil
    }
}
