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
        14...27 : 8,
        28...41 : 7,
        42...55 : 6,
        56...69 : 5,
        70...83 : 4,
        84...111 : 3,
        112...139 : 2,
        140...308 : 1,
    ]
    @Published var days : [Int:Day] = [
        0 : Day(num: 1, cigs: 9, mood: "😁", activities: "Listened to Music, Played Basketball", diary: "Felt Great"),
        1: Day(num: 1, cigs: 9, mood: "😁", activities: "Listened to Music, Played Basketball", diary: "Felt great"),
        2: Day(num: 2, cigs: 9, mood: "😡", activities: "Went for a walk, Cooked dinner", diary: "A bit frustrated today"),
        3: Day(num: 3, cigs: 9, mood: "😊", activities: "Read a book, Watched a movie", diary: "Relaxed and enjoyed the day"),
        4: Day(num: 4, cigs: 8, mood: "😞", activities: "Cleaned the house, Went shopping", diary: "Tiring but productive day"),
        5: Day(num: 5, cigs: 10, mood: "😟", activities: "Met with friends, Played video games", diary: "A bit anxious but okay"),
        6: Day(num: 6, cigs: 8, mood: "😊", activities: "Went for a run, Meditated", diary: "Feeling calm and peaceful"),
        7: Day(num: 7, cigs: 10, mood: "😩", activities: "Worked on a project, Took a nap", diary: "Exhausted from work"),
        8: Day(num: 8, cigs: 9, mood: "😊", activities: "Visited family, Went to the park", diary: "Nice to see everyone"),
        9: Day(num: 9, cigs: 9, mood: "😡", activities: "Did some gardening, Cooked a new recipe", diary: "Annoyed by small things"),
        10: Day(num: 10, cigs: 8, mood: "😟", activities: "Went to the gym, Watched a series", diary: "A bit down today"),
        11: Day(num: 11, cigs: 10, mood: "😊", activities: "Went on a bike ride, Read a novel", diary: "Enjoyed the fresh air"),
        12: Day(num: 12, cigs: 9, mood: "😩", activities: "Worked late, Relaxed with music", diary: "Long day but feeling better"),
        13: Day(num: 13, cigs: 8, mood: "😟", activities: "Spent time at the beach, Did some journaling", diary: "Reflective and calm"),
        14: Day(num: 14, cigs: 8, mood: "😊", activities: "Went hiking, Enjoyed nature", diary: "Feeling at peace"),
        15: Day(num: 15, cigs: 7, mood: "😞", activities: "Did some painting, Cooked dinner", diary: "Tried to keep busy"),
        16: Day(num: 16, cigs: 9, mood: "😡", activities: "Worked out, Met a friend for coffee", diary: "Felt irritated by some news"),
        17: Day(num: 17, cigs: 7, mood: "😩", activities: "Tried a new hobby, Watched a documentary", diary: "Exhausted but curious"),
        18: Day(num: 18, cigs: 8, mood: "😊", activities: "Played chess, Had a relaxing evening", diary: "Good balance today"),
        19: Day(num: 19, cigs: 7, mood: "😟", activities: "Did some baking, Went for a long walk", diary: "A bit restless"),
        20: Day(num: 20, cigs: 8, mood: "😡", activities: "Tried yoga, Cleaned the garage", diary: "Frustrated but managed to relax"),
        21: Day(num: 21, cigs: 8, mood: "😊", activities: "Visited a museum, Had dinner out", diary: "Enjoyed the outing"),
        22: Day(num: 22, cigs: 7, mood: "😞", activities: "Read poetry, Went to a friend's house", diary: "A bit lonely"),
        23: Day(num: 23, cigs: 7, mood: "😊", activities: "Cooked for the family, Watched a classic movie", diary: "A simple but joyful day"),
        24: Day(num: 24, cigs: 8, mood: "😟", activities: "Organized my room, Worked on a puzzle", diary: "Feeling a bit off"),
        25: Day(num: 25, cigs: 6, mood: "😊", activities: "Went swimming, Relaxed in the sun", diary: "Felt refreshed"),
        26: Day(num: 26, cigs: 7, mood: "😩", activities: "Wrote in my journal, Called an old friend", diary: "Needed some comfort"),
        27: Day(num: 27, cigs: 8, mood: "😊", activities: "Explored a new part of the city, Had ice cream", diary: "A fun adventure"),
        28: Day(num: 28, cigs: 5, mood: "😡", activities: "Watched sports, Did some DIY projects", diary: "Annoyed at the game result"),
        29: Day(num: 29, cigs: 6, mood: "😊", activities: "Played the guitar, Cooked lunch", diary: "Feeling creative"),
        30: Day(num: 30, cigs: 5, mood: "😟", activities: "Worked extra hours, Went for a night walk", diary: "Stressed about work"),
        31: Day(num: 1, cigs: 6, mood: "😁", activities: "Listened to Music, Played Basketball", diary: "Felt great"),
        32: Day(num: 2, cigs: 7, mood: "😡", activities: "Went for a walk, Cooked dinner", diary: "A bit frustrated today"),
        33: Day(num: 3, cigs: 6, mood: "😊", activities: "Read a book, Watched a movie", diary: "Relaxed and enjoyed the day"),
        34: Day(num: 4, cigs: 6, mood: "😞", activities: "Cleaned the house, Went shopping", diary: "Tiring but productive day"),
        35: Day(num: 5, cigs: 7, mood: "😟", activities: "Met with friends, Played video games", diary: "A bit anxious but okay"),
        36: Day(num: 6, cigs: 6, mood: "😊", activities: "Went for a run, Meditated", diary: "Feeling calm and peaceful"),
        37: Day(num: 7, cigs: 5, mood: "😩", activities: "Worked on a project, Took a nap", diary: "Exhausted from work"),
        38: Day(num: 8, cigs: 6, mood: "😊", activities: "Visited family, Went to the park", diary: "Nice to see everyone"),
        39: Day(num: 9, cigs: 5, mood: "😡", activities: "Did some gardening, Cooked a new recipe", diary: "Annoyed by small things"),
        40: Day(num: 10, cigs: 5, mood: "😟", activities: "Went to the gym, Watched a series", diary: "A bit down today"),
        41: Day(num: 11, cigs: 6, mood: "😊", activities: "Went on a bike ride, Read a novel", diary: "Enjoyed the fresh air"),
        42: Day(num: 12, cigs: 5, mood: "😩", activities: "Worked late, Relaxed with music", diary: "Long day but feeling better"),
        43: Day(num: 13, cigs: 5, mood: "😟", activities: "Spent time at the beach, Did some journaling", diary: "Reflective and calm"),
        44: Day(num: 14, cigs: 5, mood: "😊", activities: "Went hiking, Enjoyed nature", diary: "Feeling at peace"),
        45: Day(num: 15, cigs: 4, mood: "😞", activities: "Did some painting, Cooked dinner", diary: "Tried to keep busy"),
        46: Day(num: 16, cigs: 6, mood: "😡", activities: "Worked out, Met a friend for coffee", diary: "Felt irritated by some news"),
        47: Day(num: 17, cigs: 5, mood: "😩", activities: "Tried a new hobby, Watched a documentary", diary: "Exhausted but curious"),
        48: Day(num: 18, cigs: 4, mood: "😊", activities: "Played chess, Had a relaxing evening", diary: "Good balance today"),
        49: Day(num: 19, cigs: 6, mood: "😟", activities: "Did some baking, Went for a long walk", diary: "A bit restless"),
        50: Day(num: 20, cigs: 5, mood: "😡", activities: "Tried yoga, Cleaned the garage", diary: "Frustrated but managed to relax"),
        51: Day(num: 21, cigs: 6, mood: "😊", activities: "Visited a museum, Had dinner out", diary: "Enjoyed the outing"),
        52: Day(num: 22, cigs: 5, mood: "😞", activities: "Read poetry, Went to a friend's house", diary: "A bit lonely"),
        53: Day(num: 23, cigs: 6, mood: "😊", activities: "Cooked for the family, Watched a classic movie", diary: "A simple but joyful day"),
        54: Day(num: 24, cigs: 5, mood: "😟", activities: "Organized my room, Worked on a puzzle", diary: "Feeling a bit off"),
        55: Day(num: 25, cigs: 6, mood: "😊", activities: "Went swimming, Relaxed in the sun", diary: "Felt refreshed"),
        56: Day(num: 26, cigs: 5, mood: "😩", activities: "Wrote in my journal, Called an old friend", diary: "Needed some comfort"),
        57: Day(num: 27, cigs: 6, mood: "😊", activities: "Explored a new part of the city, Had ice cream", diary: "A fun adventure"),
        58: Day(num: 28, cigs: 5, mood: "😡", activities: "Watched sports, Did some DIY projects", diary: "Annoyed at the game result"),
        59: Day(num: 29, cigs: 4, mood: "😊", activities: "Played the guitar, Cooked lunch", diary: "Feeling creative"),
        60: Day(num: 30, cigs: 4, mood: "😟", activities: "Worked extra hours, Went for a night walk", diary: "Stressed about work"),
        61: Day(num: 1, cigs: 5, mood: "😁", activities: "Listened to Music, Played Basketball", diary: "Felt great"),
        62: Day(num: 2, cigs: 5, mood: "😡", activities: "Went for a walk, Cooked dinner", diary: "A bit frustrated today"),
        63: Day(num: 3, cigs: 4, mood: "😊", activities: "Read a book, Watched a movie", diary: "Relaxed and enjoyed the day"),
        64: Day(num: 4, cigs: 5, mood: "😞", activities: "Cleaned the house, Went shopping", diary: "Tiring but productive day"),
        65: Day(num: 5, cigs: 6, mood: "😟", activities: "Met with friends, Played video games", diary: "A bit anxious but okay"),
        66: Day(num: 6, cigs: 5, mood: "😊", activities: "Went for a run, Meditated", diary: "Feeling calm and peaceful"),
        67: Day(num: 7, cigs: 4, mood: "😩", activities: "Worked on a project, Took a nap", diary: "Exhausted from work"),
        68: Day(num: 8, cigs: 5, mood: "😊", activities: "Visited family, Went to the park", diary: "Nice to see everyone"),
        69: Day(num: 9, cigs: 6, mood: "😡", activities: "Did some gardening, Cooked a new recipe", diary: "Annoyed by small things"),
        70: Day(num: 10, cigs: 4, mood: "😟", activities: "Went to the gym, Watched a series", diary: "A bit down today"),
        71: Day(num: 11, cigs: 3, mood: "😊", activities: "Went on a bike ride, Read a novel", diary: "Enjoyed the fresh air"),
        72: Day(num: 12, cigs: 4, mood: "😩", activities: "Worked late, Relaxed with music", diary: "Long day but feeling better"),
        73: Day(num: 13, cigs: 5, mood: "😟", activities: "Spent time at the beach, Did some journaling", diary: "Reflective and calm"),
        74: Day(num: 14, cigs: 4, mood: "😊", activities: "Went hiking, Enjoyed nature", diary: "Feeling at peace"),
        75: Day(num: 15, cigs: 5, mood: "😞", activities: "Did some painting, Cooked dinner", diary: "Tried to keep busy"),
        76: Day(num: 16, cigs: 4, mood: "😡", activities: "Worked out, Met a friend for coffee", diary: "Felt irritated by some news"),
        77: Day(num: 17, cigs: 3, mood: "😩", activities: "Tried a new hobby, Watched a documentary", diary: "Exhausted but curious"),
        78: Day(num: 18, cigs: 4, mood: "😊", activities: "Played chess, Had a relaxing evening", diary: "Good balance today"),
        79: Day(num: 19, cigs: 3, mood: "😟", activities: "Did some baking, Went for a long walk", diary: "A bit restless"),
        80: Day(num: 20, cigs: 8, mood: "😡", activities: "Tried yoga, Cleaned the garage", diary: "Frustrated but managed to relax"),
        81: Day(num: 21, cigs: 5, mood: "😊", activities: "Visited a museum, Had dinner out", diary: "Enjoyed the outing"),
        82: Day(num: 22, cigs: 4, mood: "😞", activities: "Read poetry, Went to a friend's house", diary: "A bit lonely"),
        83: Day(num: 23, cigs: 3, mood: "😊", activities: "Cooked for the family, Watched a classic movie", diary: "A simple but joyful day"),
        84: Day(num: 24, cigs: 3, mood: "😟", activities: "Organized my room, Worked on a puzzle", diary: "Feeling a bit off"),
        85: Day(num: 25, cigs: 4, mood: "😊", activities: "Went swimming, Relaxed in the sun", diary: "Felt refreshed"),
        86: Day(num: 26, cigs: 4, mood: "😩", activities: "Wrote in my journal, Called an old friend", diary: "Needed some comfort"),
        87: Day(num: 27, cigs: 3, mood: "😊", activities: "Explored a new part of the city, Had ice cream", diary: "A fun adventure"),
        88: Day(num: 28, cigs: 4, mood: "😡", activities: "Watched sports, Did some DIY projects", diary: "Annoyed at the game result"),
        89: Day(num: 29, cigs: 3, mood: "😊", activities: "Played the guitar, Cooked lunch", diary: "Feeling creative"),
        90: Day(num: 30, cigs: 2, mood: "😟", activities: "Worked extra hours, Went for a night walk", diary: "Stressed about work"),
        91: Day(num: 1, cigs: 3, mood: "😁", activities: "Listened to Music, Played Basketball", diary: "Felt great"),
        92: Day(num: 2, cigs: 3, mood: "😡", activities: "Went for a walk, Cooked dinner", diary: "A bit frustrated today"),
        93: Day(num: 3, cigs: 4, mood: "😊", activities: "Read a book, Watched a movie", diary: "Relaxed and enjoyed the day"),
        94: Day(num: 4, cigs: 3, mood: "😞", activities: "Cleaned the house, Went shopping", diary: "Tiring but productive day"),
        95: Day(num: 5, cigs: 2, mood: "😟", activities: "Met with friends, Played video games", diary: "A bit anxious but okay"),
        96: Day(num: 6, cigs: 3, mood: "😊", activities: "Went for a run, Meditated", diary: "Feeling calm and peaceful"),
        97: Day(num: 7, cigs: 4, mood: "😩", activities: "Worked on a project, Took a nap", diary: "Exhausted from work"),
        98: Day(num: 8, cigs: 3, mood: "😊", activities: "Visited family, Went to the park", diary: "Nice to see everyone"),
        99: Day(num: 9, cigs: 2, mood: "😡", activities: "Did some gardening, Cooked a new recipe", diary: "Annoyed by small things"),
        100: Day(num: 10, cigs: 3, mood: "😟", activities: "Went to the gym, Watched a series", diary: "A bit down today"),
        101: Day(num: 11, cigs: 3, mood: "😊", activities: "Went on a bike ride, Read a novel", diary: "Enjoyed the fresh air"),
        102: Day(num: 12, cigs: 4, mood: "😩", activities: "Worked late, Relaxed with music", diary: "Long day but feeling better"),
        103: Day(num: 13, cigs: 3, mood: "😟", activities: "Spent time at the beach, Did some journaling", diary: "Reflective and calm"),
        104: Day(num: 14, cigs: 2, mood: "😊", activities: "Went hiking, Enjoyed nature", diary: "Feeling at peace"),
        105: Day(num: 15, cigs: 3, mood: "😞", activities: "Did some painting, Cooked dinner", diary: "Tried to keep busy"),
        106: Day(num: 16, cigs: 3, mood: "😡", activities: "Worked out, Met a friend for coffee", diary: "Felt irritated by some news"),
        107: Day(num: 17, cigs: 4, mood: "😩", activities: "Tried a new hobby, Watched a documentary", diary: "Exhausted but curious"),
        108: Day(num: 18, cigs: 2, mood: "😊", activities: "Played chess, Had a relaxing evening", diary: "Good balance today"),
        109: Day(num: 19, cigs: 3, mood: "😟", activities: "Did some baking, Went for a long walk", diary: "A bit restless"),
        110: Day(num: 20, cigs: 2, mood: "😡", activities: "Tried yoga, Cleaned the garage", diary: "Frustrated but managed to relax"),
        111: Day(num: 21, cigs: 3, mood: "😊", activities: "Visited a museum, Had dinner out", diary: "Enjoyed the outing"),
        112: Day(num: 22, cigs: 2, mood: "😞", activities: "Read poetry, Went to a friend's house", diary: "A bit lonely"),
        113: Day(num: 23, cigs: 2, mood: "😊", activities: "Cooked for the family, Watched a classic movie", diary: "A simple but joyful day"),
        114: Day(num: 24, cigs: 3, mood: "😟", activities: "Organized my room, Worked on a puzzle", diary: "Feeling a bit off"),
        115: Day(num: 25, cigs: 2, mood: "😊", activities: "Went swimming, Relaxed in the sun", diary: "Felt refreshed"),
        116: Day(num: 26, cigs: 1, mood: "😩", activities: "Wrote in my journal, Called an old friend", diary: "Needed some comfort"),
        117: Day(num: 27, cigs: 2, mood: "😊", activities: "Explored a new part of the city, Had ice cream", diary: "A fun adventure"),
        118: Day(num: 28, cigs: 2, mood: "😡", activities: "Watched sports, Did some DIY projects", diary: "Annoyed at the game result"),
        119: Day(num: 29, cigs: 1, mood: "😊", activities: "Played the guitar, Cooked lunch", diary: "Feeling creative"),
        120: Day(num: 30, cigs: 2, mood: "😟", activities: "Worked extra hours, Went for a night walk", diary: "Stressed about work"),
        121: Day(num: 30, cigs: 1, mood: "😟", activities: "Worked extra hours, Went for a night walk", diary: "Stressed about work")
    ]
    let StartInterval : Int = 1718575200
    let StartDate : Date = Date(timeIntervalSince1970: 1718575200)
    let secondsInAWeek: TimeInterval = 7 * 24 * 60 * 60
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
    
    func dayInterval(cigsperday: [ClosedRange<Int> : Int], StartDate: Date) -> Int{
        return Calendar.current.dateComponents([.day], from: StartDate, to: Date()).day!
    }
}
