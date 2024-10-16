//
//  DayView.swift
//  avengers
//
//  Created by Fabio on 11/10/24.
//

import SwiftUI

struct DayView: View {
    @EnvironmentObject var viewmodel : ViewModel
    var day : Day
    var body: some View {
        NavigationStack{Form {
            Section {
                HStack{
                    Text("\(day.cigs)")
                    Spacer()
                    if day.cigs <= viewmodel.cigs(day: day.num, cigsperday: viewmodel.cigsperday){
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundStyle(.accent)
                            .font(.system(size: 24))
                    } else{
                        Image(systemName: "xmark.circle.fill")
                            .foregroundStyle(.red)
                            .font(.system(size: 24))
                    }
                }
            } header: {Text("CIGARETTES SMOKED")}
            Section{
                Text("\(day.mood)")
            } header: {
                Text("MOOD")
            }
            Section{
                Text("\(day.activities[0]) and \(day.activities[1])")
            } header: {
                Text("ACTIVITIES")
            }
            Section{
                Text("\(day.diary)")
            } header: {
                Text("DIARY")
            }
        }
        .navigationTitle("\(viewmodel.formattedDate(Date(timeInterval: TimeInterval((day.num - 1)*86400), since: viewmodel.StartDate)))")
        }
    }
}

#Preview {
    DayView(day : Day(num: 1, cigs: 5, mood: "😁", activities: ["Listened to Music", "Played Basketball"], diary: "Felt Great"))
        .environmentObject(ViewModel())
}
