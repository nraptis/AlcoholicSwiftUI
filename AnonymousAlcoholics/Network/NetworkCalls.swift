//
//  NetworkCalls.swift
//  BrickDaniels
//
//  Created by Nicky Taylor on 9/5/24.
//

import Foundation

struct NetworkCalls {
    
    static func drinks(search: String) async throws -> DrinkResponse {
        let urlString = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=\(search)"
        guard let url = URL(string: urlString) else {
            throw URLError.init(.badURL)
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        let response = try decoder.decode(DrinkResponse.self, from: data)
        return response
    }
    
    static func drinkDetails(drink: Drink) async throws -> DrinkDetailResponse {
        let urlString = "https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=\(drink.id)"
        guard let url = URL(string: urlString) else {
            throw URLError.init(.badURL)
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        let response = try decoder.decode(DrinkDetailResponse.self, from: data)
        return response
    }
}
