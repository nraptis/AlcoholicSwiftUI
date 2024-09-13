//
//  RandomDrinkRouter.swift
//  AnonymousAlcoholics
//
//  Created by Nicky Taylor on 9/12/24.
//

import SwiftUI

@Observable class RandomDrinkRouter {
    
    static func mock() -> RandomDrinkRouter {
        RandomDrinkRouter()
    }
    
    var navigationPath = NavigationPath()
    
    init() {
        print("RandomDrinkRouter - Created")
    }
    
    deinit {
        print("RandomDrinkRouter - Destroyed")
    }
    
}
