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
        Stage(num: 1, name: "Pre-Contemplation", description: "Pre-contemplate", interval: DateInterval(start: Date(timeIntervalSince1970: TimeInterval(1718575200)), duration: TimeInterval(60*60*24*7*2 - 1))),
        Stage(num: 2, name: "Contemplation", description: "Contemplate", interval: DateInterval(start: Calendar.current.date(byAdding: .day, value: 14, to: Date(timeIntervalSince1970: TimeInterval(1718575200)))!, duration: TimeInterval(60*60*24*7*2 - 1))),
        Stage(num: 3, name: "Preparation", description: "Prepare", interval: DateInterval(start: Calendar.current.date(byAdding: .day, value: 28, to: Date(timeIntervalSince1970: TimeInterval(1718575200)))!, duration: TimeInterval(60*60*24*7*4 - 1))),
        Stage(num: 4, name: "Action", description: "Acting", interval: DateInterval(start: Calendar.current.date(byAdding: .day, value: 56, to: Date(timeIntervalSince1970: TimeInterval(1718575200)))!, duration: TimeInterval(60*60*24*7*12 - 1))),
        Stage(num: 5, name: "Maintenance", description: "Maintenancedfsfds", interval: DateInterval(start: Calendar.current.date(byAdding: .day, value: 140, to: Date(timeIntervalSince1970: TimeInterval(1718575200)))!, duration: TimeInterval(60*60*24*7*24 - 1)))
    ]
    let cigsperday : [ClosedRange<Int> : Int] = [
        1...13 : 9,
        14...27 : 7,
        28...41 : 7,
        42...55 : 6,
        56...69 : 5,
        70...83 : 4,
        84...111 : 3,
        112...139 : 2,
        140...308 : 1,
    ]
    @Published var days : [Int:Day] = [
        0 : Day(num: 1, cigs: 9, mood: "😁", activities: ["Listened to Music", "Played Basketball"], diary: "Felt Great"),
        1 : Day(num: 2, cigs: 10, mood: "😁", activities: ["Listened to Music", "Played Basketball"], diary: "Felt Good"),
        2 : Day(num: 3, cigs: 8, mood: "😁", activities: ["Listened to Music", "Played Basketball"], diary: "Felt Fantastic"),
        3 : Day(num: 4, cigs: 12, mood: "😁", activities: ["Listened to Music", "Played Basketball"], diary: "Felt Bad"),
        4 : Day(num: 5, cigs: 9, mood: "😁", activities: ["Listened to Music", "Played Basketball"], diary: "Felt Nice"),
        5 : Day(num: 6, cigs: 11, mood: "😁", activities: ["Listened to Music", "Played Basketball"], diary: "Felt Sad"),
        6 : Day(num: 7, cigs: 7, mood: "😁", activities: ["Listened to Music", "Played Basketball"], diary: "Felt Amazing")
    ]
    let StartInterval : Int = 1718575200
    let StartDate : Date = Date(timeIntervalSince1970: 1718575200)
    let secondsInAWeek: TimeInterval = 7 * 24 * 60 * 60
    @Published var CurrDayCount : Int = 7
    @Published var showModal : Bool = false
    @Published var dayDone : Bool = false
    
    func titlecalculator(stages : [Stage]) -> String {
        var s = 0
        var w = 0
        for stage in stages{
            if stage.interval.contains(Date()){
                s = stage.num
                w = Calendar.current.dateComponents([.day],
                                                    from: stage.interval.start,
                                                    to: Date()).day! / 7
            }
        }
        return "Stage \(s), Week \(w)"
    }
    
    func formattedDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM dd, yyyy"
        return dateFormatter.string(from: date)
    }
    
    func cigs(day : Int, cigsperday: [ClosedRange<Int>:Int]) -> Int {
        for (range, value) in cigsperday {
            if range.contains(day){
                return value
            }
        }
        return 10
    }
}
