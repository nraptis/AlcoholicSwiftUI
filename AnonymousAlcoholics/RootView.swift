//
//  RootView.swift
//  AnonymousAlcoholics
//
//  Created by Nicky Taylor on 9/12/24.
//

import SwiftUI

struct RootView: View {
    
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    @Environment(ApplicationRouter.self) var applicationRouter: ApplicationRouter
    //@State var chapter = ApplicationRouter.ApplicationChapter.searchDrink
    
    @State var searchText = ""
    @FocusState private var searchBarFocusState: Bool
    
    var body: some View {
        
        @Bindable var applicationRouter = applicationRouter
        @Bindable var drinkSearchController = ApplicationController.shared.drinkSearchController
        @Bindable var randomDrinkController = ApplicationController.shared.randomDrinkController
        return TabView(selection: $applicationRouter.chapter) {
            
            Tab("Drink Search", systemImage: "magnifyingglass", value: ApplicationRouter.ApplicationChapter.searchDrink) {
                DrinkSearchRootView()
                    .environment(drinkSearchController)
                    .environment(drinkSearchController.drinkSearchRouter)
                    .toolbarBackground(.visible, for: .tabBar)
                    .toolbarBackground(Theme.Colors.concord, for: .tabBar)
            }
            
            Tab("Random Drink", systemImage: "dice", value: ApplicationRouter.ApplicationChapter.randomDrink) {
                RandomDrinkRootView()
                    .environment(randomDrinkController)
                    .environment(randomDrinkController.randomDrinkRouter)
                    .toolbarBackground(.visible, for: .tabBar)
                    .toolbarBackground(Theme.Colors.concord, for: .tabBar)
            }
            
        }
        .tint(Theme.Colors.cobalt)
        .toolbarColorScheme(.light, for: .tabBar)
        .accentColor(Theme.Colors.fuchsia)
    }
    
    /*
    var body: some View {
        return
        
        VStack(spacing: 0.0) {
            GeometryReader { _ in
                //VStack(spacing: 0.0) {
                
                VStack(spacing: 0.0) {
                    
                    //GeometryReader { geometry in
                    VStack {
                        Spacer()
                        TextField("", text: $searchText, prompt:
                                    Text("Drink Name")
                            .font(Theme.SearchBar.fontPlaceholder)
                            .foregroundStyle(Theme.Colors.steel)
                        )
                        Spacer()
                        
                         SearchBarView(searchAction: searchAction,
                         searchTextUpdateAction: searchTextUpdateAction,
                         clearAction: searchClearAction,
                         cancelAction: searchCancelAction,
                         searchBarFocusState: $searchBarFocusState)
                         
                         DrinkSearchRootView()
                         .environment(ApplicationController.shared.getDrinkSearchRouter())
                         .environment(ApplicationController.shared.getDrinkSearchController())
                         
                         .overlay(
                         RoundedRectangle(cornerRadius: 32.0).stroke(lineWidth: 8.0).foregroundStyle(Color.white.opacity(0.5))
                         
                         )
                        
                         switch applicationRouter.chapter {
                         case .searchDrink:
                         DrinkSearchRootView()
                         .environment(ApplicationController.shared.getDrinkSearchRouter())
                         .environment(ApplicationController.shared.getDrinkSearchController())
                         
                         
                         case .randomDrink:
                         RandomDrinkRootView()
                         .environment(ApplicationController.shared.getRandomDrinkRouter())
                         .environment(ApplicationController.shared.getRandomDrinkController())
                         
                         }
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 32.0).stroke(lineWidth: 8.0).foregroundStyle(Color.orange.opacity(0.75))
                            .ignoresSafeArea(.all)
                    )
                    
                    
                    VStack {
                        HStack {
                            Spacer()
                        }
                    }
                    .frame(height: 180.0)
                    .background(Color.orange.opacity(0.25))

                     MainTabBarView()
                     .ignoresSafeArea(.keyboard)
                    
                }
            }
            .ignoresSafeArea(.keyboard)
        }
    }
    */
    
    func searchAction(searchText: String) {
        print("searchAction(\(searchText))")
    }
    
    func searchTextUpdateAction(searchText: String) {
        print("searchTextUpdateAction(\(searchText))")
    }
    
    func searchClearAction() {
        print("searchClearAction")
    }
    
    func searchCancelAction() {
        print("searchCancelAction")
    }
    
}

#Preview {
    RootView()
        .environment(ApplicationRouter.mock())
        .preferredColorScheme(.dark)
}
