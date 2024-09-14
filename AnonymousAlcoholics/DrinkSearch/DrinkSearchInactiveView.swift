//
//  DrinkSearchInactiveView.swift
//  AnonymousAlcoholics
//
//  Created by Nicky Taylor on 9/12/24.
//

import SwiftUI

struct DrinkSearchInactiveView: View {
    @FocusState private var searchBarFocusState: Bool
    @Environment(\.verticalSizeClass) var verticalSizeClass
    let searchAnimationNamespace: Namespace.ID
    let action: () -> Void
    
    var body: some View {
        VStack {
            VStack {
                GeometryReader { geometry in
                    getTopStinger(geometry: geometry)
                }
            }
            .transaction { transaction in
                transaction.animation = nil
            }
            .ignoresSafeArea(.keyboard)
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
                .zIndex(1000.0)
                .ignoresSafeArea(.keyboard)
            })
            .ignoresSafeArea(.keyboard)
            VStack {
                GeometryReader { geometry in
                    getBottomStinger(geometry: geometry)
                }
                .ignoresSafeArea(.keyboard)
            }
            .transaction { transaction in
                transaction.animation = nil
            }
            .ignoresSafeArea(.all)
        }
        .background(Theme.Colors.onyx)
        .ignoresSafeArea(.keyboard)
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
    
    func getTopStinger(geometry: GeometryProxy) -> some View {
        
        let _logoWidth = CGFloat(1400.0)
        let _logoHeight = CGFloat(190.0)
        
        let imageWidth: CGFloat
        let imageHeight: CGFloat
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            imageWidth = _logoWidth * 0.3
            imageHeight = _logoHeight * 0.3
        } else {
            imageWidth = _logoWidth * 0.225
            imageHeight = _logoHeight * 0.225
        }
        
        return VStack(spacing: 0.0) {
            Spacer()
            HStack {
                Image("logo")
                    .resizable()
                    .frame(width: imageWidth, height: imageHeight)
                    .padding(.leading, 16.0)
                    .padding(.bottom, 8.0)
                Spacer()
            }
        }
    }
    
    private func getBottomStingerMagicRectangle(fadeHeight: CGFloat, 
                                                geometryWidth: CGFloat,
                                                geometryHeight: CGFloat) -> CGRect {
        if geometryWidth < 32.0 || geometryHeight < 32.0 {
            return CGRect(x: 0.0, y: 0.0, width: 32.0, height: 32.0)
        }
        
        let maxInsetLeft = CGFloat(1238.0)
        let maxInsetRight = CGFloat(1238.0)
        
        let maxInsetBottom = CGFloat(270.0)
        var scale = CGFloat(1.0)
        
        let originalImageWidth = CGFloat(4000.0)
        let originalImageHeight = CGFloat(1188.0)
        
        var imageWidth = originalImageWidth
        var imageHeight = originalImageHeight
        
        // We'll find the minimum size for "aspect fill..."
        if (originalImageWidth / originalImageHeight) > (geometryWidth / geometryHeight) {
            scale = geometryHeight / originalImageHeight
            imageWidth = scale * originalImageWidth
            imageHeight = geometryHeight
        } else {
            scale = geometryWidth / originalImageWidth
            imageWidth = geometryWidth
            imageHeight = scale * originalImageHeight
        }
        
        // Can we grow more bigger?
        let mustFitHorizontal = (originalImageWidth - (maxInsetLeft + maxInsetRight)) * scale
        let mustFitVertical = (originalImageHeight - (maxInsetBottom)) * scale
        let proposedScaleHorizontal = geometryWidth / mustFitHorizontal
        let proposedScaleVertical = geometryHeight / mustFitVertical
        let proposedScale = min(proposedScaleHorizontal, proposedScaleVertical)
        if proposedScale > 1.0 {
            scale *= proposedScale
            imageWidth *= proposedScale
            imageHeight *= proposedScale
        }
        
        let centerX = geometryWidth * 0.5
        let resultX = centerX - imageWidth * 0.5
        var resultY = geometryHeight - imageHeight
        if resultY < 0.0 {
            let maxShift = maxInsetBottom * scale
            let shift = min(-resultY, maxShift)
            resultY += shift
        }
        
        return CGRect(x: resultX,
                      y: resultY,
                      width: imageWidth,
                      height: imageHeight)
    }
    
    static let shots = Image("shots")
    func getBottomStinger(geometry: GeometryProxy) -> some View {
        var fadeHeight: CGFloat = geometry.size.height * 0.25
        switch verticalSizeClass {
        case .none:
            break
        case .some(let verticalSizeClass):
            switch verticalSizeClass {
                
            case .compact:
                if fadeHeight < 42.0 { fadeHeight = 42.0 }
                if fadeHeight > 84.0 { fadeHeight = 84.0 }
            default:
                if fadeHeight < 64.0 { fadeHeight = 64.0 }
                if fadeHeight > 140.0 { fadeHeight = 140.0 }
            }
        }
        
        let magicRectangle = getBottomStingerMagicRectangle(fadeHeight: fadeHeight,
                                                            geometryWidth: geometry.size.width,
                                                            geometryHeight: geometry.size.height)
        
        return ZStack {
            Canvas { context, size in
                context.draw(Self.shots, in: magicRectangle)
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .opacity(0.325)
            
            VStack {
                HStack {
                    Spacer()
                }
                .frame(height: fadeHeight)
                .background(LinearGradient(colors: [Theme.Colors.onyx,
                                                    Theme.Colors.onyx.opacity(0.9),
                                                    Theme.Colors.onyx.opacity(0.7),
                                                    Theme.Colors.onyx.opacity(0.4),
                                                    Theme.Colors.onyx.opacity(0.0)], startPoint: .top, endPoint: .bottom))
                Spacer()
            }
            
        }
    }
}

#Preview {
    DrinkSearchInactiveView(searchAnimationNamespace: Namespace().wrappedValue) { }
}
