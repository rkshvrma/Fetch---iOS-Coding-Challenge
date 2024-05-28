//
//  ContentView.swift
//  MealCodingChallenge
//
//

import SwiftUI

/*
 1) Make an observable object of view model class
 2) Create a list view and bind its data source to model object.
 3) Make API call once view appears.
 4) Create navigation link with destination as Meal detail view to display the meal name.
 5) Make meal thumbnail image API calls asynchronously to avoid UI blocking as there are a lot of images that need to be downloaded to display in the table.
 */

struct ContentView: View {
    @ObservedObject var mealViewModel = MealViewModel()
    var body: some View {
        NavigationView {
            List(mealViewModel.mealsInfo.meals, id: \.self) { meal in
                NavigationLink(destination: MealDetailView(mealName: meal.strMeal)) {
                    HStack {
                        AsyncImage(
                            url: URL(string: meal.strMealThumb),
                            content: { image in
                                image.resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(maxWidth: 50, maxHeight: 50)
                            },
                            placeholder: {
                                ProgressView()
                            }
                        )
                        Text(meal.strMeal)
                    }
                }
            }
            .onAppear() {
                mealViewModel.fetchMealsList()
            }
            .navigationTitle("Meals")
        }
    }
}

#Preview {
    ContentView()
}
