//
//  Theme.swift
//  BrickDaniels
//
//  Created by Nicky Taylor on 9/5/24.
//

import SwiftUI

struct Theme {
    
    struct Colors {
        static let cloud = Color("cloud")
        static let cobalt = Color("cobalt")
        static let concord = Color("concord")
        static let fuchsia = Color("fuchsia")
        static let mauve = Color("mauve")
        static let midnight = Color("midnight")
        static let charcoal = Color("charcoal")
        static let steel = Color("steel")
        static let onyx = Color("onyx")
        static let limestone = Color("limestone")
    }
    
    struct NavigationBar {
        static let fontDestructive = Font.system(size: 16.0, weight: .semibold)
    }
    
    struct SearchHeader {
        static let paddingTop = CGFloat(4.0)
        static let paddingBottom = CGFloat(8.0)
    }
    
    struct SearchBar {
        static let fontMain = Font.system(size: 18.0, weight: .medium)
        static let fontCancel = Font.system(size: 16.0, weight: .semibold)
        static let fontPlaceholder = Font.system(size: 18.0, weight: .medium)
        static let fontIconMagnifyingGlass = Font.system(size: 26.0, weight: .regular)
        static let fontIconClear = Font.system(size: 19.0, weight: .regular)
        static let underlayCornerRadius = CGFloat(6.0)
        static let paddingLeading1 = CGFloat(12.0)
        static let paddingTrailing1 = CGFloat(8.0)
        static let paddingInnerV1 = CGFloat(6.0)
        static let paddingInnerV2 = CGFloat(8.0)
        static let paddingCancelTrailing = CGFloat(10.0)
        static let paddingCancelLeading = CGFloat(6.0)
        static let paddingMagnifyingGlassTrailing = CGFloat(6.0)
        static let paddingMagnifyingGlassLeading = CGFloat(6.0)
        static let paddingOuterH = CGFloat(12.0)
    }
    
    struct DrinkList {
        static let paddingTop = CGFloat(6.0)
        static let paddingBottom = CGFloat(96.0)
    }
    
    struct DrinkCell {
        static let fontName = Font.system(size: 19.0, weight: .semibold)
        static let fontAlcoholic = Font.system(size: 19.0, weight: .medium).italic()
        static let fontPropertiesText = Font.system(size: 16.0, weight: .regular)
        static let fontPropertiesIcons = Font.system(size: 16.0, weight: .semibold)
        static let thumbBoxCornerRadius = CGFloat(6.0)
        static let thumbCornerRadius = CGFloat(5.0)
        static let thumbBoxSize = CGFloat(58.0)
        static let thumbSize = CGFloat(56.0)
        static let paddingInternalUniversal = CGFloat(8.0)
        static let paddingExternalHorizontal = CGFloat(12.0)
        static let paddingExternalVertical = CGFloat(4.0)
        static let cellCornerRadius = CGFloat(6.0)
        static let spacingThumbText = CGFloat(8.0)
    }
    
    struct DrinkDetailPage {
        static let fontName = Font.system(size: 19.0, weight: .semibold)
        static let fontAlcoholic = Font.system(size: 19.0, weight: .medium).italic()
        
    }
}
