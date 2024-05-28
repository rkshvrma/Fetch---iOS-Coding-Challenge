//
//  Meal.swift
//  MealCodingChallenge
//
//

import Foundation


/* 
 Model object to parse JSON response.
 We will get a list of Meal in the response.
 */

struct MealsInfo: Hashable, Codable {
    var meals = [Meal]()
}

struct Meal: Hashable, Codable {
    var strMeal: String
    var strMealThumb: String
    var idMeal: String
}


