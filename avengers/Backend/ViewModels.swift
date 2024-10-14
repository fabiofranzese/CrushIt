//
//  PlanViewModel.swift
//  avengers
//
//  Created by Fabio on 11/10/24.
//

import Foundation

class ViewModel : ObservableObject {
    @Published var stages : [Stage] =
    [
        Stage(num: 1, name: "Pre-Contemplation", description: "Pre-contemplate"),
        Stage(num: 2, name: "Contemplation", description: "Contemplate"),
        Stage(num: 3, name: "Preparation", description: "Prepare"),
        Stage(num: 4, name: "Action", description: "Acting"),
        Stage(num: 5, name: "Maintenance", description: "Maintenancedfsfds")
    ]
    @Published var weeks : [[Week]] = [
        [Week(stage: 1, num: 1, maxcigs: 10)],
        [Week(stage: 2, num: 1, maxcigs: 8)],
        [Week(stage: 3, num: 1, maxcigs: 7)],
        [Week(stage: 4, num: 1, maxcigs: 4)],
        [Week(stage: 5, num: 1, maxcigs: 1)]
    ]
    @Published var days : [Int:Day] = [
        1728259201 : Day(num: 1, cigs: 5, mood: "😁", activities: ["Listened to Music", "Played Basketball"]),
        1728345601 : Day(num: 2, cigs: 5, mood: "😁", activities: ["Listened to Music", "Played Basketball"]),
        1728432001 : Day(num: 3, cigs: 5, mood: "😁", activities: ["Listened to Music", "Played Basketball"]),
        1728518401 : Day(num: 4, cigs: 5, mood: "😁", activities: ["Listened to Music", "Played Basketball"]),
        1728604801 : Day(num: 5, cigs: 5, mood: "😁", activities: ["Listened to Music", "Played Basketball"]),
        1728691201 : Day(num: 6, cigs: 5, mood: "😁", activities: ["Listened to Music", "Played Basketball"]),
        1728777601 : Day(num: 7, cigs: 5, mood: "😁", activities: ["Listened to Music", "Played Basketball"])
    ]
    let StartInterval : Int = 1728259201
    let StartDate : Date = Date(timeIntervalSince1970: 1728259201)
    @Published var CurrDayCount : Int = 7
}
