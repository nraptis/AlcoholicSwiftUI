//
//  DrinkSearchActiveView.swift
//  AnonymousAlcoholics
//
//  Created by Nicky Taylor on 9/12/24.
//

import SwiftUI

struct DrinkSearchActiveView: View {
    
    @Environment(DrinkSearchController.self) var controller: DrinkSearchController
    
    @State private var scrollPosition = ScrollPosition(edge: .top)
    
    let cancelAction: () -> Void
    var searchBarFocusState: FocusState<Bool>.Binding
    let searchAnimationNamespace: Namespace.ID
    let zoomAnimationNamespace: Namespace.ID
    
    var body: some View {
        VStack(spacing: 0.0) {
            VStack(spacing: 0.0) {
                
                Spacer()
                    .frame(height: Theme.SearchHeader.paddingTop)
                
                SearchBarView(searchAction: searchAction,
                              searchTextUpdateAction: searchTextUpdateAction,
                              clearAction: searchClearAction,
                              cancelAction: searchCancelAction,
                              searchBarFocusState: searchBarFocusState)
                .matchedGeometryEffect(id: DrinkSearchController.searchAnimationID,
                                       in: searchAnimationNamespace)
                
                
                Spacer()
                    .frame(height: Theme.SearchHeader.paddingBottom)
            }
            .background(Theme.Colors.onyx)
            .zIndex(1000.0)
            
            HStack {
                Spacer()
            }
            .frame(height: 1.0)
            .background(Theme.Colors.mauve)
            
            
            
            
            ScrollView(.vertical) {
                

                //ContentUnavailableView.search
                VStack(spacing: 0.0) {
                    
                    Spacer()
                        .frame(height: Theme.DrinkList.paddingTop)
                    
                    ForEach(controller.drinks) { drink in
                        let isThumbDownloadErrorPresent = controller.getImageDownloadDidFail(drink: drink)
                        let image = controller.getImage(drink: drink)
                        return DrinkCellView(drink: drink,
                                      isThumbDownloadErrorPresent: isThumbDownloadErrorPresent,
                                      image: image,
                                      zoomAnimationNamespace: zoomAnimationNamespace)
                        .id(drink)
                    }
                    
                    Spacer()
                        .frame(height: Theme.DrinkList.paddingTop)
                }
            }
            .scrollPosition($scrollPosition)
            .background(Theme.Colors.charcoal)
            .refreshable {
                try? await Task.sleep(nanoseconds: 3_000_000_000)
            }
            .onChange(of: controller.fuckinPage) {
                print("the fuckin page changed: \(controller.fuckinPage)")
                if let drink = controller.getDrink(index: controller.fuckinPage) {
                    scrollPosition.scrollTo(id: drink)
                }
            }
        }
        .background(Theme.Colors.charcoal)
        
    }
    
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
        cancelAction()
    }
    
}

#Preview {
    DrinkSearchActiveView(cancelAction: { },
                   searchBarFocusState: FocusState<Bool>().projectedValue,
                   searchAnimationNamespace: Namespace().wrappedValue,
                   zoomAnimationNamespace: Namespace().wrappedValue)
    .environment(DrinkSearchController.mock())
}
