//
//  DrinkSearchInactiveViewB.swift
//  AnonymousAlcoholics
//
//  Created by Nicky Taylor on 9/17/24.
//

import SwiftUI

struct DrinkSearchInactiveViewB: View {
    @FocusState private var searchBarFocusState: Bool
    @Environment(\.verticalSizeClass) var verticalSizeClass
    let searchAnimationNamespace: Namespace.ID
    let action: () -> Void
    
    var body: some View {
        VStack(spacing: 0.0) {
            GeometryReader { _ in
            }
            
            Button(action: {
                action()
            }, label: {
                SearchBarView(searchAction: searchAction,
                              searchTextUpdateAction: searchTextUpdateAction,
                              clearAction: searchClearAction,
                              cancelAction: searchCancelAction,
                              searchBarFocusState: $searchBarFocusState)
                .disabled(true)
                .matchedGeometryEffect(id: DrinkSearchController.searchAnimationID,
                                       in: searchAnimationNamespace)
                .transition(.scale(scale: 1.0))
                .zIndex(1000.0)
                
            })
            
            GeometryReader { _ in
                
            }
        }
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
    }
}

#Preview {
    DrinkSearchInactiveViewB(searchAnimationNamespace: Namespace().wrappedValue) { }
}
