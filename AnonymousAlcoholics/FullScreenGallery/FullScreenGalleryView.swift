//
//  FullScreenGalleryView.swift
//  AnonymousAlcoholics
//
//  Created by Nicky Taylor on 9/12/24.
//

import SwiftUI

struct FullScreenGalleryView: View {
    @Environment(DrinkSearchController.self) var controller: DrinkSearchController
    
    let zoomAnimationNamespace: Namespace.ID
    
    @State private var scrollPosition: ScrollPosition// = ScrollPosition(edge: .trailing) //.init(idType: Drink.ID.self)
    
    //@State var zoomAnimationDrink: Drink
    
    init(zoomAnimationNamespace: Namespace.ID, drink: Drink) {
        self.zoomAnimationNamespace = zoomAnimationNamespace
        _scrollPosition = State(initialValue: ScrollPosition.init(id: drink))
    }
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                ScrollView(.horizontal) {
                    LazyHStack(spacing: 0.0) {
                        ForEach(controller.drinks) { drink in
                            FullScreenGalleryCardView(zoomAnimationNamespace: zoomAnimationNamespace,
                                                      width: geometry.size.width,
                                                      height: geometry.size.height,
                                                      drink: drink,
                                                      image: controller.getImage(drink: drink))
                            .id(drink)
                            .ignoresSafeArea(.all)
                        }
                    }
                    .frame(height: geometry.size.height)
                    .scrollTargetLayout()
                }
                .frame(width: geometry.size.width,
                       height: geometry.size.height)
                .scrollPosition($scrollPosition)
                .scrollTargetBehavior(.paging)
                .scrollIndicators(.hidden)
                
                .onScrollPhaseChange { oldPhase, newPhase, context in
                    switch newPhase {
                    case .idle:
                        let contentOffset = context.geometry.contentOffset
                        if geometry.size.width > 1.0 {
                            let page = Int((contentOffset.x + geometry.size.width / 2.0) / geometry.size.width)
                            controller.fuckinPage = page
                            
                            if let zoomDrink = controller.getDrink(index: page) {
                                controller.zoomAnimationDrink = zoomDrink
                                print("Set zoomAnimationDrink to \(zoomDrink)")
                            }
                        }
                    default:
                        break
                    }
                }
            }
            .background(Theme.Colors.midnight)
            .toolbar {
                ToolbarItem(placement: .destructiveAction) {
                    Button {
                        controller.selectedFullScreenGalleryDrink = nil
                    } label: {
                        Text("Done")
                            .font(Theme.NavigationBar.fontDestructive)
                            .foregroundStyle(Theme.Colors.cloud)
                    }
                }
            }
            .toolbarBackground(Theme.Colors.charcoal, for: .automatic)
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
}

#Preview {
    let controller = DrinkSearchController.mock()
    return FullScreenGalleryView(zoomAnimationNamespace: Namespace().wrappedValue,
                                 drink: Drink.mock())
        .environment(controller)
        .preferredColorScheme(.dark)
}
