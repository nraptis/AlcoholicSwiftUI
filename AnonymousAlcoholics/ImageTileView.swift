//
//  ImageTileView.swift
//  BrickDaniels
//
//  Created by Nicky Taylor on 9/8/24.
//

import SwiftUI

struct ImageTileView: View {
    let width: CGFloat
    let height: CGFloat
    let image: UIImage
    let cornerRadius: CGFloat
    var body: some View {
        Image(uiImage: image)
            .resizable()
            .frame(width: width,
                   height: height)
            .aspectRatio(contentMode: .fill)
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
    }
}

#Preview {
    ImageTileView(width: Theme.DrinkCell.thumbSize * 4.0,
                  height: Theme.DrinkCell.thumbSize * 4.0,
                  image: Drink.mockThumb(),
                  cornerRadius: Theme.DrinkCell.thumbBoxCornerRadius * 4.0)
}
