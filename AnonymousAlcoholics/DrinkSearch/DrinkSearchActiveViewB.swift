//
//  DrinkSearchActiveViewB.swift
//  AnonymousAlcoholics
//
//  Created by Nicky Taylor on 9/17/24.
//

import SwiftUI

struct DrinkSearchActiveViewB: View {
    @Environment(DrinkSearchController.self) var controller: DrinkSearchController
    let cancelAction: () -> Void
    var searchBarFocusState: FocusState<Bool>.Binding
    let searchAnimationNamespace: Namespace.ID
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
        cancelAction()
    }
    
}

#Preview {
    DrinkSearchActiveViewB(cancelAction: { },
                   searchBarFocusState: FocusState<Bool>().projectedValue,
                   searchAnimationNamespace: Namespace().wrappedValue)
    .environment(DrinkSearchController.mock())
}
