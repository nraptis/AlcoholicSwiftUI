//
//  DrinkSearchActiveViewA.swift
//  AnonymousAlcoholics
//
//  Created by Nicky Taylor on 9/17/24.
//

import SwiftUI

struct DrinkSearchActiveViewA: View {
    @Environment(DrinkSearchController.self) var controller: DrinkSearchController
    @State private var scrollPosition = ScrollPosition(edge: .top)
    let zoomAnimationNamespace: Namespace.ID
    var body: some View {
        VStack(spacing: 0.0) {
            VStack(spacing: 0.0) {
                Spacer()
                    .frame(height: Theme.SearchHeader.paddingTop)
                Spacer()
                    .frame(height: Theme.SearchBar.height)
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
        .background(Theme.Colors.onyx)
    }
}

#Preview {
    DrinkSearchActiveViewA(zoomAnimationNamespace: Namespace().wrappedValue)
    .environment(DrinkSearchController.mock())
}
