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
            } header: {Text("Cigarettes Smoked").font(.headline)
                .foregroundStyle(.black)}
            Section{
                Text("\(day.mood)")
            } header: {
                Text("Mood")
                    .font(.headline)
                    .foregroundStyle(.black)
            }
            Section{
                Text("\(day.activities)")
            } header: {
                Text("Activities").font(.headline)
                    .foregroundStyle(.black)
            }
            Section{
                Text("\(day.diary)")
            } header: {
                Text("Diary").font(.headline)
                    .foregroundStyle(.black)
            }
        }
        .navigationTitle("\(viewmodel.formattedDate(Date(timeInterval: TimeInterval((day.num - 1)*86400), since: viewmodel.StartDate)))")
        }
    }
}

#Preview {
    DayView(day : Day(num: 1, cigs: 5, mood: "😁", activities: "Listened to Music, Played Basketball", diary: "Felt Great"))
        .environmentObject(ViewModel())
}
