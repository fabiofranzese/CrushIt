//
//  Day.swift
//  avengers
//
//  Created by Fabio on 11/10/24.
//
import Foundation
import SwiftUI

struct Day : Identifiable {
    var id = UUID()
    var num : Int
    var cigs : Int
    var mood : String
    var activities : String
    var diary : String
    mutating func add_day(cigarettes: Int, mood_new: String, acts: String){
        cigs = cigarettes
        mood = mood_new
        activities = acts
    }
}

struct Stage : Identifiable {
    var id = UUID()
    var num : Int
    var name : String
    var description : String
    var interval : DateInterval
}
