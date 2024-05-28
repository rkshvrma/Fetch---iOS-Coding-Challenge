//
//  MealViewModel.swift
//  MealCodingChallenge
//
//

import Foundation
import SwiftUI
import Combine

/*
  View model class to fetch data from API
 
 1) Map the data
 2) Decode data to match model object.
 3) assign converted data to published object.
 4) Pass a cancellable object to unsubscribe once you don't need response.
 */

class MealViewModel: ObservableObject {
    
    @Published var mealsInfo = MealsInfo()
    
    var cancellables = Set<AnyCancellable>()
    
    init() {
        
    }
    
    func fetchMealsList() {
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert") else {
            return
        }
        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: MealsInfo.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { status in
                switch status {
                case .finished:
                    print("Completed")
                case .failure(let error):
                    print("Error while fetching: \(error)")
                }
            } , receiveValue: { mealDic in
                self.mealsInfo = mealDic
            })
            .store(in: &cancellables)
    }
}
