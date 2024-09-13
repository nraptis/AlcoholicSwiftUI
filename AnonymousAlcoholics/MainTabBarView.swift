//
//  MainTabBar.swift
//  AnonymousAlcoholics
//
//  Created by Nicky Taylor on 9/12/24.
//

import SwiftUI

struct MainTabBarView: View {
    
    @Environment(ApplicationRouter.self) var applicationRouter: ApplicationRouter
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    @ViewBuilder var body: some View {
        switch verticalSizeClass {
        case .regular:
            getContentRegular()
                
        default:
            getContentCompact()
                
        }
    }
    
    private func actionSearchDrink() {
        applicationRouter.userIntentActionSwitchChapter(.searchDrink)
    }
    
    private func actionRandomDrink() {
        applicationRouter.userIntentActionSwitchChapter(.randomDrink)
    }
    
    
    func getColor(chapter: ApplicationRouter.ApplicationChapter) -> Color {
        if applicationRouter.chapter == chapter {
            return .cobalt
        } else {
            return .steel
        }
    }
    
    func getContentRegular() -> some View {
        VStack(spacing: 0.0) {
            Spacer()
                .frame(height: 1.0)
            HStack {
                Spacer()
                Button {
                    actionSearchDrink()
                } label: {
                    ZStack {
                        VStack {
                            Spacer()
                            Image(systemName: "magnifyingglass")
                                .font(.system(size: 19.0))
                            Text("Search")
                                .font(.system(size: 12.0))
                            Spacer()
                        }
                        .foregroundStyle(getColor(chapter: .searchDrink))
                    }
                    .frame(width: 120.0)
                }
                Spacer()
                Button {
                    actionRandomDrink()
                } label: {
                    ZStack {
                        VStack {
                            Spacer()
                            Image(systemName: "dice")
                                .font(.system(size: 19.0))
                            Text("Random")
                                .font(.system(size: 12.0))
                            Spacer()
                        }
                        .foregroundStyle(getColor(chapter: .randomDrink))
                    }
                    .frame(width: 120.0)
                }
                Spacer()
            }
            .frame(height: 53.0)
            .background(Theme.Colors.charcoal)
        }
        .frame(height: 54.0)
        .background(Theme.Colors.mauve)
    }
    
    func getContentCompact() -> some View {
        
        VStack(spacing: 0.0) {
            Spacer()
                .frame(height: 1.0)
            HStack {
                Spacer()
                Button {
                    actionSearchDrink()
                } label: {
                    ZStack {
                        VStack {
                            Spacer()
                            Image(systemName: "magnifyingglass")
                                .font(.system(size: 17.0))
                            Text("Search")
                                .font(.system(size: 10.0))
                            Spacer()
                        }
                        .foregroundStyle(getColor(chapter: .searchDrink))
                    }
                    .frame(width: 120.0)
                }
                Spacer()
                Button {
                    actionRandomDrink()
                } label: {
                    ZStack {
                        VStack {
                            Spacer()
                            Image(systemName: "dice")
                                .font(.system(size: 17.0))
                            Text("Random")
                                .font(.system(size: 10.0))
                            Spacer()
                        }
                        .foregroundStyle(getColor(chapter: .randomDrink))
                    }
                    .frame(width: 120.0)
                }
                Spacer()
            }
            .frame(height: 43.0)
            .background(Theme.Colors.charcoal)
            
        }
        .frame(height: 44.0)
        .background(Theme.Colors.mauve)
    }
}

struct MainTabBarDummyView: View {
    
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    @ViewBuilder var body: some View {
        switch verticalSizeClass {
        case .regular:
            getContentRegular()
                
        default:
            getContentCompact()
                
        }
    }
    
    func getContentRegular() -> some View {
        VStack(spacing: 0.0) {
            
        }
        .frame(height: 54.0)
    }
    
    func getContentCompact() -> some View {
        VStack(spacing: 0.0) {
            
        }
        .frame(height: 44.0)
    }
}

#Preview {
    VStack {
        MainTabBarView()
        Spacer()
        MainTabBarView()
        Spacer()
        MainTabBarView()
        Spacer()
        MainTabBarView()
    }
    .environment(ApplicationRouter.mock())
    .preferredColorScheme(.dark)
}
