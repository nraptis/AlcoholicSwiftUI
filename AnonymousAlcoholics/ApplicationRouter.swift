//
//  ApplicationRouter.swift
//  AnonymousAlcoholics
//
//  Created by Nicky Taylor on 9/12/24.
//

import SwiftUI

@Observable class ApplicationRouter {
    
    static func mock() -> ApplicationRouter {
        ApplicationRouter()
    }
    
    enum ApplicationChapter: Identifiable {
        case searchDrink
        case randomDrink
        
        var id: UInt8 {
            switch self {
            case .searchDrink:
                return 0
            case .randomDrink:
                return 1
            }
        }
        
    }
    
    var chapter = ApplicationChapter.searchDrink
    
    init() {
        print("ApplicationRouter Spawned")
    }
    
    func userIntentActionSwitchChapter(_ chapter: ApplicationChapter) {
        
    }
    
}
