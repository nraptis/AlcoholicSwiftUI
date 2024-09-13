//
//  RandomDrinkRootView.swift
//  AnonymousAlcoholics
//
//  Created by Nicky Taylor on 9/12/24.
//

import SwiftUI

struct RandomDrinkRootView: View {
    
    @Environment(RandomDrinkRouter.self) var router: RandomDrinkRouter
    @Environment(RandomDrinkController.self) var controller: RandomDrinkController
    
    var body: some View {
        ZStack {
            Text("WSGSH")
                .padding(.all, 100)
        }
        .background(Color.orange)
    }
}

#Preview {
    RandomDrinkRootView()
        .environment(RandomDrinkRouter.mock())
        .environment(RandomDrinkController.mock())
}
