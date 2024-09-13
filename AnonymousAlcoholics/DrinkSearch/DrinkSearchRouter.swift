//
//  DrinkListRouter.swift
//  AnonymousAlcoholics
//
//  Created by Nicky Taylor on 9/12/24.
//

import SwiftUI

@Observable class DrinkSearchRouter {
    
    static func mock() -> DrinkSearchRouter {
        DrinkSearchRouter()
    }
    
    var navigationPath = NavigationPath()
    
    init() {
        print("DrinkSearchRouter - Created")
    }
    
    deinit {
        print("DrinkSearchRouter - Destroyed")
    }
    
}
