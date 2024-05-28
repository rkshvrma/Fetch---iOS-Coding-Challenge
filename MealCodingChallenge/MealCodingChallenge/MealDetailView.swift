//
//  MealDetailView.swift
//  MealCodingChallenge
//
//

import Foundation
import SwiftUI

/* Detail view to display meal name*/

struct MealDetailView: View {
    @State var mealName: String
    
    var body: some View {
        Text(mealName)
    }
}
