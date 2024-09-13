//
//  DetailView.swift
//  BrickDaniels
//
//  Created by Nicky Taylor on 9/8/24.
//

import SwiftUI

struct DrinkDetailView: View {
    
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @Environment(DrinkDetailController.self) var controller: DrinkDetailController
    
    var body: some View {
        VStack {
            if let drinkDetail = controller.drinkDetail {
                
                Text(drinkDetail.name)
                //Text(drinkDetail.name)
                
                ForEach(drinkDetail.ingredients) { ingredient in
                    HStack {
                        Text("\(ingredient.id)")
                        Text(ingredient.name)
                        Text(ingredient.measure ?? "mt")
                        
                        
                    }
                }
            }
            
            
        }
        .navigationTitle(controller.drink.name)
        
    }
}

#Preview {
    
    let controller = DrinkDetailController.mock()
    
    return NavigationStack {
        
        DrinkDetailView()
    }
    .preferredColorScheme(.dark)
    .environment(controller)
    .navigationBarBackButtonHidden(true)
    .navigationBarItems(leading: Button(action : {
        
    }){
        HStack {
            Image(systemName: "chevron.left")
            Text("Back")
        }
        .foregroundStyle(Theme.Colors.cloud)
    })
    
}
