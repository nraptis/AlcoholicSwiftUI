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
    
    var body: some View {
        @Bindable var router = router
        return NavigationStack(path: $router.navigationPath) {
            
            GeometryReader { geometry in
                
                /*
                return VStack {
                    
                    SearchBarView(searchAction: searchAction,
                                  searchTextUpdateAction: searchTextUpdateAction,
                                  clearAction: searchClearAction,
                                  cancelAction: searchCancelAction,
                                  searchBarFocusState: FocusState<Bool>().projectedValue)
                    
                    
                    Spacer()
                    
                }
                .background(RoundedRectangle(cornerRadius: 16.0).foregroundStyle(Color.red.opacity(0.5)))
                */
                
                 DrinkSearchContainerView(width: geometry.size.width,
                                          height: geometry.size.height)
                 
                
                
                /*
                 }
                 
                 .navigationDestination(for: DrinkDetailController.self) { drinkDetailController in
                 return DrinkDetailView()
                 .environment(drinkDetailController)
                 }
                 .ignoresSafeArea(.keyboard)
                 */
            }
            .ignoresSafeArea(.keyboard, edges: .bottom)
            //.ignoresSafeArea(edges: .bottom)
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
    
    //TODO: Remove stubs
    func searchAction(searchText: String) { }
    func searchTextUpdateAction(searchText: String) { }
    func searchClearAction() { }
    func searchCancelAction() { }
    
}

#Preview {
    GeometryReader { geometry in
        DrinkSearchRootView()
            .environment(DrinkSearchRouter.mock())
            .environment(DrinkSearchController.mock())
    }
}
