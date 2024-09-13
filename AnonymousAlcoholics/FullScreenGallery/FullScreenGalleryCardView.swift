//
//  FullScreenGalleryCardView.swift
//  AnonymousAlcoholics
//
//  Created by Nicky Taylor on 9/12/24.
//

import SwiftUI

struct FullScreenGalleryCardView: View {
    @Environment(DrinkSearchController.self) var controller: DrinkSearchController
    
    let zoomAnimationNamespace: Namespace.ID
    
    let width: CGFloat
    let height: CGFloat
    let drink: Drink
    let image: UIImage?
    
    var body: some View {
        VStack(spacing: 0.0) {
            
            VStack {
                Spacer()
                if let image = image {
                    
                    ImageTileView(width: 320.0,
                              height: 320.0,
                              image: image,
                              cornerRadius: 36.0)
                }
                Spacer()
            }
            
            VStack(alignment: .leading, spacing: 0.0) {
                
                getNameLine()
                    .padding(.bottom, 4.0)
                    .matchedTransitionSource(id: "\(drink.id)_n", in: zoomAnimationNamespace)
                getCategoryLine()
                    .padding(.bottom, 2.0)
                    .matchedTransitionSource(id: "\(drink.id)_c", in: zoomAnimationNamespace)
                getGlassLine()
                    .matchedTransitionSource(id: "\(drink.id)_g", in: zoomAnimationNamespace)
                
                
            }
        }
        .frame(width: width, height: height)
        .background(Theme.Colors.midnight)
    }
    
    func getNameLine() -> some View {
        
        var piece1 = AttributedString("\(drink.name) (")
        piece1.font = Theme.DrinkCell.fontName
        piece1.foregroundColor = Theme.Colors.cloud
        
        var piece2 = AttributedString("\(drink.alcoholic)")
        piece2.font = Theme.DrinkCell.fontAlcoholic
        piece2.foregroundColor = Theme.Colors.steel
        
        var piece3 = AttributedString(")")
        piece3.font = Theme.DrinkCell.fontName
        piece3.foregroundColor = Theme.Colors.cloud
        
        return Text(piece1 + piece2 + piece3)
            .multilineTextAlignment(.leading)
            .lineLimit(2)
    }
    
    func getCategoryLine() -> some View {
        
        let iconNote = Image(systemName: "note.text")
        
        var category = AttributedString("\(drink.category)")
        category.font = Theme.DrinkCell.fontPropertiesText
        category.foregroundColor = Theme.Colors.steel
        
        return Text("\(iconNote) \(category)")
            .font(Theme.DrinkCell.fontPropertiesIcons)
            .multilineTextAlignment(.leading)
            .foregroundStyle(Theme.Colors.cobalt)
            .lineLimit(2)
    }
    
    func getGlassLine() -> some View {
        let iconWineglass = Image(systemName: "wineglass")
        var glass = AttributedString("\(drink.glass)")
        glass.font = Theme.DrinkCell.fontPropertiesText
        glass.foregroundColor = Theme.Colors.steel
        return Text("\(iconWineglass) \(glass)")
                .font(Theme.DrinkCell.fontPropertiesIcons)
                .foregroundStyle(Theme.Colors.fuchsia)
                .lineLimit(2)
                .layoutPriority(.infinity)
                .padding(.leading, 4.0)
    }
}

#Preview {
    GeometryReader { geometry in
        FullScreenGalleryCardView(zoomAnimationNamespace: Namespace().wrappedValue,
                                  width: geometry.size.width,
                                  height: geometry.size.height,
                                  drink: Drink.mock(),
                                  image: Drink.mockThumb())
    }
    .environment(DrinkSearchController.mock())
}
