//
//  DrinkSearchRootView.swift
//  AnonymousAlcoholics
//
//  Created by Nicky Taylor on 9/12/24.
//

import SwiftUI

struct DrinkSearchRootView: View {
    
    @Environment(DrinkSearchRouter.self) var router: DrinkSearchRouter
    @Environment(DrinkSearchController.self) var controller: DrinkSearchController
    
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        @Bindable var router = router
        return NavigationStack(path: $router.navigationPath) {
            
            DrinkSearchContainerView(width: width, height: height)
                .navigationDestination(for: DrinkDetailController.self) { drinkDetailController in
                    return DrinkDetailView()
                        .environment(drinkDetailController)
                    
                }
            
            /*
            HomeView()
                .environment(router.homeController)
                .navigationDestination(for: DetailController.self) { detailController in
                    return DetailView()
                        .environment(detailController)
                    
                }
            */
        }
        .ignoresSafeArea(.keyboard)
    }
}

#Preview {
    
    GeometryReader { geometry in
        DrinkSearchRootView(width: geometry.size.width,
                            height: geometry.size.height)
        .environment(DrinkSearchRouter.mock())
        .environment(DrinkSearchController.mock())
    }
}
