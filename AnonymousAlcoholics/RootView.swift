//
//  RootView.swift
//  AnonymousAlcoholics
//
//  Created by Nicky Taylor on 9/12/24.
//

import SwiftUI

struct RootView: View {
    
    @Environment(ApplicationRouter.self) var applicationRouter: ApplicationRouter
    @State var chapter = ApplicationRouter.ApplicationChapter.searchDrink
    
    var body: some View {
        return VStack(spacing: 0.0) {
            VStack(spacing: 0.0) {
                GeometryReader { geometry in
                    switch applicationRouter.chapter {
                    case .searchDrink:
                        DrinkSearchRootView(width: geometry.size.width,
                                            height: geometry.size.height)
                            .environment(ApplicationController.shared.getDrinkSearchRouter())
                            .environment(ApplicationController.shared.getDrinkSearchController())
                        
                    case .randomDrink:
                        RandomDrinkRootView()
                            .environment(ApplicationController.shared.getRandomDrinkRouter())
                            .environment(ApplicationController.shared.getRandomDrinkController())
                    }
                }
                MainTabBarView()
            }
        }
    }
}

#Preview {
    RootView()
        .environment(ApplicationRouter.mock())
        .preferredColorScheme(.dark)
}
