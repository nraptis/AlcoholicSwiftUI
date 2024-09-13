//
//  DrinkCellView.swift
//  BrickDaniels
//
//  Created by Nicky Taylor on 9/6/24.
//

import SwiftUI

struct DrinkCellView: View {
    
    @Environment(DrinkSearchController.self) var controller: DrinkSearchController
    
    let drink: Drink
    let isThumbDownloadErrorPresent: Bool
    let image: UIImage?
    let zoomAnimationNamespace: Namespace.ID
    init(drink: Drink,
         isThumbDownloadErrorPresent: Bool,
         image: UIImage?,
         zoomAnimationNamespace: Namespace.ID) {
        self.drink = drink
        self.isThumbDownloadErrorPresent = isThumbDownloadErrorPresent
        self.image = image
        self.zoomAnimationNamespace = zoomAnimationNamespace
    }
    
    var body: some View {
        return VStack {
            ZStack {
                Button {
                    controller.userIntentActionDrinkDetails(drink: drink)
                } label: {
                    HStack {
                        HStack(alignment: .top, spacing: Theme.DrinkCell.spacingThumbText) {
                            ZStack {
                                if let image = image {
                                    getThumbSuccessView(image: image)
                                } else if isThumbDownloadErrorPresent {
                                    getThumbErrorView()
                                } else {
                                    getThumbLoadingView()
                                }
                            }
                            .frame(width: Theme.DrinkCell.thumbBoxSize,
                                   height: Theme.DrinkCell.thumbBoxSize)
                            
                            .matchedTransitionSource(id: drink.id, in: zoomAnimationNamespace)
                            
                            .padding(.leading, Theme.DrinkCell.paddingInternalUniversal)
                            .padding(.top, Theme.DrinkCell.paddingInternalUniversal)
                            .padding(.bottom, Theme.DrinkCell.paddingInternalUniversal)
                            
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
                            .padding(.top, Theme.DrinkCell.paddingInternalUniversal)
                            .padding(.bottom, Theme.DrinkCell.paddingInternalUniversal)
                            .padding(.trailing, Theme.DrinkCell.paddingInternalUniversal)
                            Spacer()
                        }
                        .background(RoundedRectangle(cornerRadius: Theme.DrinkCell.cellCornerRadius).foregroundStyle(Theme.Colors.midnight))
                        .overlay(RoundedRectangle(cornerRadius: Theme.DrinkCell.cellCornerRadius).stroke().foregroundStyle(Theme.Colors.mauve))
                    }
                    .padding(.horizontal, Theme.DrinkCell.paddingExternalHorizontal)
                    .padding(.vertical, Theme.DrinkCell.paddingExternalVertical)
                }
                
                HStack {
                    HStack(alignment: .top, spacing: Theme.DrinkCell.spacingThumbText) {
                        
                        ZStack {
                            
                        }
                        .frame(width: Theme.DrinkCell.thumbBoxSize,
                               height: Theme.DrinkCell.thumbBoxSize)
                        .padding(.leading, Theme.DrinkCell.paddingInternalUniversal)
                        .padding(.top, Theme.DrinkCell.paddingInternalUniversal)
                        .padding(.bottom, Theme.DrinkCell.paddingInternalUniversal)
                        
                        
                        Spacer()
                    }
                }
                .padding(.horizontal, Theme.DrinkCell.paddingExternalHorizontal)
                .padding(.vertical, Theme.DrinkCell.paddingExternalVertical)
            }
        }
    }
    
    func getThumbErrorView() -> some View {
        Button {
            
        } label: {
            ZStack {
                ZStack {
                    Image(systemName: "exclamationmark.triangle")
                        .font(.system(size: 28.0, weight: .light))
                        .foregroundStyle(Theme.Colors.limestone)
                }
                .frame(width: Theme.DrinkCell.thumbSize,
                       height: Theme.DrinkCell.thumbSize)
                .background(RoundedRectangle(cornerRadius: Theme.DrinkCell.thumbCornerRadius)
                    .foregroundStyle(Theme.Colors.midnight.mix(with: Theme.Colors.onyx, by: 0.5)))
            }
            .frame(width: Theme.DrinkCell.thumbBoxSize,
                   height: Theme.DrinkCell.thumbBoxSize)
            .background(RoundedRectangle(cornerRadius: Theme.DrinkCell.thumbBoxCornerRadius).foregroundStyle(.ultraThinMaterial))
        }
    }
    
    func getThumbLoadingView() -> some View {
        Button {
            
        } label: {
            ZStack {
                ZStack {
                    ProgressView()
                        .progressViewStyle(.circular)
                        .tint(Theme.Colors.limestone)
                }
                .frame(width: Theme.DrinkCell.thumbSize,
                       height: Theme.DrinkCell.thumbSize)
                .background(RoundedRectangle(cornerRadius: Theme.DrinkCell.thumbCornerRadius)
                    .foregroundStyle(Theme.Colors.midnight.mix(with: Theme.Colors.onyx, by: 0.5)))
            }
            .frame(width: Theme.DrinkCell.thumbBoxSize,
                   height: Theme.DrinkCell.thumbBoxSize)
            .background(RoundedRectangle(cornerRadius: Theme.DrinkCell.thumbBoxCornerRadius).foregroundStyle(.ultraThinMaterial))
        }
    }
    
    func getThumbSuccessView(image: UIImage) -> some View {
        Button {
            controller.userIntentActionFullScreenGallery(drink: drink)
        } label: {
            ZStack {
                ImageTileView(width: Theme.DrinkCell.thumbSize,
                              height: Theme.DrinkCell.thumbSize,
                              image: image,
                              cornerRadius: Theme.DrinkCell.thumbCornerRadius)
            }
            .frame(width: Theme.DrinkCell.thumbBoxSize,
                   height: Theme.DrinkCell.thumbBoxSize)
            .background(RoundedRectangle(cornerRadius: Theme.DrinkCell.thumbBoxCornerRadius).foregroundStyle(.thinMaterial))
        }
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
    
    func searchAction(searchText: String) { }
    func searchTextUpdateAction(searchText: String) { }
    func clearAction() { }
    func cancelAction() { }
    
    let drinkSearchController = DrinkSearchController.mock()
    return VStack(spacing: 0.0) {
        
        VStack(spacing: 0.0) {
            
            Spacer()
                .frame(height: Theme.SearchHeader.paddingTop)
            
            SearchBarView(searchAction: searchAction,
                          searchTextUpdateAction: searchTextUpdateAction,
                          clearAction: clearAction,
                          cancelAction: cancelAction,
                          searchBarFocusState: FocusState<Bool>().projectedValue)
            
            Spacer()
                .frame(height: Theme.SearchHeader.paddingBottom)
        }
        .background(Theme.Colors.onyx)
        
        HStack {
            Spacer()
        }
        .frame(height: 1.0)
        .background(Theme.Colors.mauve)
        
        
        ScrollView(.vertical) {
            
            VStack(spacing: 0.0) {
                
                Spacer()
                    .frame(height: Theme.DrinkList.paddingTop)
                
                ForEach(drinkSearchController.drinks) { drink in
                    
                    DrinkCellView(drink: drink,
                                  isThumbDownloadErrorPresent: false,
                                  image: drinkSearchController.getImage(drink: drink),
                                  zoomAnimationNamespace: Namespace().wrappedValue)
                }
                
                Spacer()
                    .frame(height: Theme.DrinkList.paddingTop)
            }
        }
        .background(Theme.Colors.charcoal)
        .refreshable {
            try? await Task.sleep(nanoseconds: 3_000_000_000)
        }
    }
    .background(Theme.Colors.charcoal)
    .preferredColorScheme(.dark)
    .environment(drinkSearchController)
}
