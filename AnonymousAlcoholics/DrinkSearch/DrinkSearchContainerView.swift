//
//  DrinkSearchContainerView.swift
//  AnonymousAlcoholics
//
//  Created by Nicky Taylor on 9/12/24.
//

import SwiftUI

struct DrinkSearchContainerView: View {

    @Environment(DrinkSearchController.self) var controller: DrinkSearchController
    @Environment(DrinkSearchRouter.self) var router: DrinkSearchRouter
    @Namespace var searchAnimationNamespace
    @State var isSearching = false
    @Namespace var zoomAnimationNamespace
    @FocusState private var searchBarFocusState: Bool
    
    let width: CGFloat
    let height: CGFloat
    var body: some View {
        @Bindable var controller = controller
        return ZStack {
            if isSearching {
                DrinkSearchActiveViewA(zoomAnimationNamespace: zoomAnimationNamespace)
                DrinkSearchActiveViewB(cancelAction: {
                    searchBarFocusState = false
                    withAnimation {
                        isSearching = false
                    } completion: {
                        
                    }
                }, searchBarFocusState: $searchBarFocusState,
                                      searchAnimationNamespace: searchAnimationNamespace)
                .transition(.scale(scale: 1.0))
                
            } else {
                DrinkSearchInactiveViewA()
                DrinkSearchInactiveViewB(searchAnimationNamespace: searchAnimationNamespace) {
                    searchBarFocusState = true
                    withAnimation {
                        isSearching = true
                    }
                }
                .transition(.scale(scale: 1.0))
            }
            
            
        }
        .frame(width: width, height: height)
        .background(Theme.Colors.onyx)
        .task {
            await controller.fetchDrinks()
        }
        .sheet(item: $controller.selectedFullScreenGalleryDrink) { drink in
            //.sheet(isPresented: $homeController.SHOWSHEET) {
            //print("Refrashing Sheet, with zoom zoom bing: \(controller.zoomAnimationDrink?.name ?? "nune")")
            
            print("Refreshing Sheet, with \"drink\": \(drink)")
            
            return FullScreenGalleryView(zoomAnimationNamespace: zoomAnimationNamespace,
                                         drink: drink)
            .navigationTransition(.zoom(sourceID: controller.zoomAnimationDrink?.id ?? "", in: zoomAnimationNamespace))
        }
    }
        
        
        /*ZStack {
         VStack(spacing: 0.0) {
         GeometryReader { _ in
         if isSearching {
         DrinkSearchActiveView(cancelAction: {
         
         searchBarFocusState = false
         withAnimation {
         isSearching = false
         } completion: {
         
         }
         }, searchBarFocusState: $searchBarFocusState,
         searchAnimationNamespace: searchAnimationNamespace,
         zoomAnimationNamespace: zoomAnimationNamespace)
         
         } else {
         DrinkSearchInactiveView(searchAnimationNamespace: searchAnimationNamespace) {
         searchBarFocusState = true
         withAnimation {
         isSearching = true
         }
         }
         }
         }
         }
         .background(Theme.Colors.onyx)
         
         .task {
         await controller.fetchDrinks()
         }
         }
         .frame(width: width, height: height)
         .overlay(
         RoundedRectangle(cornerRadius: 32.0).stroke(lineWidth: 12.0).foregroundStyle(Color.white.opacity(0.5))
         
         )
         
         .sheet(item: $controller.selectedFullScreenGalleryDrink) { drink in
         //.sheet(isPresented: $homeController.SHOWSHEET) {
         //print("Refrashing Sheet, with zoom zoom bing: \(controller.zoomAnimationDrink?.name ?? "nune")")
         
         print("Refreshing Sheet, with \"drink\": \(drink)")
         
         return FullScreenGalleryView(zoomAnimationNamespace: zoomAnimationNamespace,
         drink: drink)
         .navigationTransition(.zoom(sourceID: controller.zoomAnimationDrink?.id ?? "", in: zoomAnimationNamespace))
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
    GeometryReader { geometry in
        DrinkSearchContainerView(width: geometry.size.width,
                                 height: geometry.size.height)
        .environment(DrinkSearchController.mock())
        .environment(DrinkSearchRouter.mock())
    }
}
