//
//  NewRecipeViewModel.swift
//  Reminder
//
//  Created by Alan Pitanga on 04/07/26.
//

import Foundation

class NewRecipeViewModel {
    func addRecipe(remedy: String, time: String, recurrence: String, takeNow: Bool) {
        DBHelper.shared.insertRecept(remedy: remedy, time: time, recurrence: recurrence, takeNow: takeNow)
    }
}
