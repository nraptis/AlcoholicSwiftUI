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
            VStack(spacing: 0.0) {
                
                if isSearching {
                    DrinkSearchActiveView(cancelAction: {
                        
                        withAnimation {
                            isSearching = false
                        } completion: {
                            searchBarFocusState = false
                        }
                        
                        
                        
                        
                        
                    }, searchBarFocusState: $searchBarFocusState,
                                          searchAnimationNamespace: searchAnimationNamespace,
                                          zoomAnimationNamespace: zoomAnimationNamespace)
                    /*
                     HomeActiveView(cancelAction: {
                     searchBarFocusState = true
                     withAnimation {
                     isSearching = false
                     }
                     }, searchBarFocusState: $searchBarFocusState,
                     searchAnimationNamespace: searchAnimationNamespace,
                     zoomAnimationNamespace: zoomAnimationNamespace)
                     */
                } else {
                    DrinkSearchInactiveView(searchAnimationNamespace: searchAnimationNamespace) {
                        searchBarFocusState = true
                        withAnimation {
                            isSearching = true
                        }
                    }
                    /*
                     HomeRestingView(searchAnimationNamespace: searchAnimationNamespace, action: {
                     searchBarFocusState = true
                     withAnimation {
                     isSearching = true
                     }
                     })
                     */
                }
            }
            .background(Theme.Colors.onyx)
            .task {
                await controller.fetchDrinks()
            }
        }
        .frame(width: width, height: height)
        .sheet(item: $controller.selectedFullScreenGalleryDrink) { drink in
            //.sheet(isPresented: $homeController.SHOWSHEET) {
            //print("Refrashing Sheet, with zoom zoom bing: \(controller.zoomAnimationDrink?.name ?? "nune")")
            //print("Refrashing Sheet, with \"drink\": \(drink)")
            
            FullScreenGalleryView(zoomAnimationNamespace: zoomAnimationNamespace,
                                         drink: drink)
            .navigationTransition(.zoom(sourceID: controller.zoomAnimationDrink?.id ?? "", in: zoomAnimationNamespace))
        }
        /*
         .sheet(item: $homeController.selectedFullScreenGalleryDrink) { drink in
         return FullScreenGalleryView(zoomAnimationNamespace: zoomAnimationNamespace,
         drink: drink)
         .navigationTransition(.zoom(sourceID: homeController.zoomAnimationDrink?.id ?? "", in: zoomAnimationNamespace))
         }
         */
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
