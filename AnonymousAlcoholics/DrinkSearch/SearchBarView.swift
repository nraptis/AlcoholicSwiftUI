//
//  SearchBarView.swift
//  AnonymousAlcoholics
//
//  Created by Nicky Taylor on 9/12/24.
//

import SwiftUI

struct SearchBarView: View {
    
    @State var searchText = ""
    
    let searchAction: (String) -> Void
    let searchTextUpdateAction: (String) -> Void
    let clearAction: () -> Void
    let cancelAction: () -> Void
    var searchBarFocusState: FocusState<Bool>.Binding
    
    var body: some View {
        HStack {
            HStack {
                HStack(spacing: 0.0) {
                    Button {
                        searchAction(searchText)
                    } label: {
                        Image(systemName: "magnifyingglass")
                            .font(Theme.SearchBar.fontIconMagnifyingGlass)
                            .foregroundStyle(Theme.Colors.cloud)
                    }
                    .padding(.trailing, Theme.SearchBar.paddingMagnifyingGlassTrailing)
                    .padding(.leading, Theme.SearchBar.paddingMagnifyingGlassLeading)
                    
                    HStack {
                        HStack {
                            HStack {
                                
                                GeometryReader { _ in
                                    TextField("", text: $searchText, prompt:
                                                Text("Drink Name")
                                        .font(Theme.SearchBar.fontPlaceholder)
                                        .foregroundStyle(Theme.Colors.steel)
                                              
                                    )
                                    .font(Theme.SearchBar.fontMain)
                                    .foregroundStyle(Theme.Colors.cloud)
                                    .autocorrectionDisabled()
                                    .autocapitalization(.none)
                                    .focused(searchBarFocusState, equals: true)
                                    .multilineTextAlignment(.leading)
                                    .tint(Theme.Colors.limestone)
                                    .onChange(of: searchText, { _, newValue in
                                        searchTextUpdateAction(newValue)
                                    })
                                    .ignoresSafeArea(.keyboard)
                                }
                                .ignoresSafeArea(.keyboard)
                                
                                Spacer()
                                
                                Button {
                                    clearAction()
                                } label: {
                                    Image(systemName: "x.circle.fill")
                                        .font(Theme.SearchBar.fontIconClear)
                                        .foregroundStyle(Theme.Colors.steel)
                                }
                            }
                        }
                        .padding(.leading, Theme.SearchBar.paddingLeading1)
                        .padding(.trailing, Theme.SearchBar.paddingTrailing1)
                        .padding(.vertical, Theme.SearchBar.paddingInnerV1)
                        .ignoresSafeArea(.keyboard)
                    }
                    .background(Capsule().foregroundStyle(
                        LinearGradient(colors: [Theme.Colors.mauve.opacity(0.4), Theme.Colors.mauve.opacity(0.6)], startPoint: .top, endPoint: .bottom)
                    ))
                    .overlay(Capsule().stroke().foregroundStyle(Theme.Colors.mauve))
                    .padding(.vertical, Theme.SearchBar.paddingInnerV2)
                    .ignoresSafeArea(.keyboard)
                    Button {
                        cancelAction()
                    } label: {
                        Text("Cancel")
                            .font(Theme.SearchBar.fontCancel)
                            .foregroundStyle(Theme.Colors.cloud)
                    }
                    .padding(.trailing, Theme.SearchBar.paddingCancelTrailing)
                    .padding(.leading, Theme.SearchBar.paddingCancelLeading)
                    .ignoresSafeArea(.keyboard)
                }
            }
            .frame(height: 60.0)
            .background(RoundedRectangle(cornerRadius: Theme.SearchBar.underlayCornerRadius).foregroundStyle(Theme.Colors.concord))
            .overlay(RoundedRectangle(cornerRadius: Theme.SearchBar.underlayCornerRadius).stroke().foregroundStyle(Theme.Colors.mauve))
            .padding(.horizontal, Theme.SearchBar.paddingOuterH)
            .ignoresSafeArea(.keyboard)
        }
    }
}

#Preview {
    VStack {
        Spacer()
        SearchBarView(searchAction: { _ in },
                      searchTextUpdateAction: {_ in },
                      clearAction: { },
                      cancelAction: { },
                      searchBarFocusState: FocusState<Bool>().projectedValue)
        Spacer()
    }
    .background(Theme.Colors.onyx)
}
