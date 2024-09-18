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
    
    
    let randomDrinkController = RandomDrinkController(randomDrinkRouter: RandomDrinkRouter())
    let drinkSearchController = DrinkSearchController(drinkSearchRouter: DrinkSearchRouter())
    
}
