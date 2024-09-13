//
//  DetailController.swift
//  BrickDaniels
//
//  Created by Nicky Taylor on 9/8/24.
//

import Foundation

@Observable class DrinkDetailController {
    
    @MainActor static func mock() -> DrinkDetailController {
        let result = DrinkDetailController(drink: Drink.mock(),
                                           drinkSearchController: DrinkSearchController.mock())
        result.drinkDetail = DrinkDetailWrapper.mock()
        return result
    }
    
    let drink: Drink
    let drinkSearchController: DrinkSearchController
    var drinkDetail: DrinkDetailWrapper?
    
    init(drink: Drink,
         drinkSearchController: DrinkSearchController) {
        self.drink = drink
        self.drinkSearchController = drinkSearchController
    
        Task {
            do {
                let drinkDetailsResponse = try await NetworkCalls.drinkDetails(drink: drink)
                if drinkDetailsResponse.drinks.count > 0 {
                    let _drinkDetail = drinkDetailsResponse.drinks[0]
                    await MainActor.run {
                        self.drinkDetail = DrinkDetailWrapper(drinkDetail: _drinkDetail)
                    }
                }
            }
        }
    }
    
    deinit {
        print("~DrinkDetailController")
    }
    
}

extension DrinkDetailController: Equatable {
    static func == (lhs: DrinkDetailController, rhs: DrinkDetailController) -> Bool {
        ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }
}

extension DrinkDetailController: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
}
