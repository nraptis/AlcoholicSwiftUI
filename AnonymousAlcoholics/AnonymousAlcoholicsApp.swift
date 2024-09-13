//
//  AnonymousAlcoholicsApp.swift
//  AnonymousAlcoholics
//
//  Created by Nicky Taylor on 9/12/24.
//

import SwiftUI

@main
struct AnonymousAlcoholicsApp: App {
    var body: some Scene {
        WindowGroup {
            RootView()
                .environment(ApplicationController.shared.applicationRouter)
                .preferredColorScheme(.dark)
        }
    }
}
