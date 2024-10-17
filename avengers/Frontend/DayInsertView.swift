//
//  a.swift
//  avengers
//
//  Created by Fabio on 17/10/24.
//

import SwiftUI
import Foundation

struct DayInsertView: View {
    @EnvironmentObject var viewmodel : ViewModel
    @State private var activities: String = ""
    @State private var diary: String = ""
    @State private var cigs = 0
    @State private var moo: String = ""
    let moods = ["😡", "😞", "😟", "😩", "😊"]

    func daysInWeek(for date: Date) -> [Date] {
        var calendar = Calendar.current
        calendar.firstWeekday = 2 // 2 means Monday as the start of the week (1 is Sunday)

        // Get the start of the week for the given date
        guard let weekInterval = calendar.dateInterval(of: .weekOfYear, for: date) else {
            return []
        }
        
        var days: [Date] = []
        var currentDay = weekInterval.start
        
        // Add each day of the week to the array
        for _ in 0..<7 {
            days.append(currentDay)
            currentDay = calendar.date(byAdding: .day, value: 1, to: currentDay)!
        }
        
        return days
    }
    
    func num(max: Int, n: Int) -> String {
        if n == max + 1{
            return "\(n)+"
        }
        return "\(n)"
    }
    
    var body: some View {
        ScrollView{
            ZStack{
                HStack{
                    Text("Today")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.top)
                }
                HStack{
                    Spacer()
                    Button{
                        let interval = viewmodel.dayInterval(cigsperday: viewmodel.cigsperday, StartDate: viewmodel.StartDate)
                        viewmodel.days[interval] = Day(num: interval, cigs: cigs, mood: moo, activities: activities, diary: diary)
                        viewmodel.dayDone = true
                    } label: {
                        if viewmodel.dayDone{
                            Text("Update")
                                .foregroundStyle(.accent)
                                .bold()
                                .padding(.top)
                        } else{
                            Text("Done")
                                .foregroundStyle(.accent)
                                .bold()
                                .padding(.top)
                        }
                    }
                }.padding()
            }
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(daysInWeek(for: Date()), id: \.self) { day in
                            Text("\(Calendar.current.component(.day, from: day))")
                                .font(.title)
                                .frame(width: 40, height: 40)
                                .foregroundStyle(Calendar.current.isDateInToday(day)
                                                 ? Color.white
                                                 : Color.black)
                                .bold()
                                .background(
                                    Calendar.current.isDateInToday(day)
                                    ? Color.accent
                                    : Color.clear
                                )
                                .clipShape(Circle())
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.top, 20)
                
                VStack(alignment: .leading) {
                    Menu {
                        ForEach(0..<(viewmodel.cigs(day: viewmodel.dayInterval(cigsperday: viewmodel.cigsperday, StartDate: viewmodel.StartDate), cigsperday: viewmodel.cigsperday)+2)) { option in
                            Button(num(max: viewmodel.cigs(day: viewmodel.dayInterval(cigsperday: viewmodel.cigsperday, StartDate: viewmodel.StartDate), cigsperday: viewmodel.cigsperday), n: option)) {
                                cigs = option
                            }
                        }
                    } label: {
                        HStack {
                            Text("Cigarettes Smoked")
                                .font(.headline)
                                .foregroundColor(.black)
                            Spacer()
                            Text((num(max: viewmodel.cigs(day: viewmodel.dayInterval(cigsperday: viewmodel.cigsperday, StartDate: viewmodel.StartDate), cigsperday: viewmodel.cigsperday), n: cigs)))
                                .foregroundColor(.gray)
                            Image(systemName: "arrow.up.and.down.circle")
                                .foregroundColor(.gray)
                        }
                        .padding()
                        .background(Color(UIColor.systemGray6))
                        .cornerRadius(10)
                        .shadow(radius: 1)
                    }
                }
                .padding(.top, 20)
                
                // Mood section
                VStack(alignment: .leading) {
                    Text("Mood")
                        .font(.headline)
                        .padding(.top, 20)
                    
                    HStack {
                        ForEach(moods, id: \.self) { mood in
                            Text(mood)
                                .font(.largeTitle)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(mood == moo ? Color.blue.opacity(0.2) : Color(UIColor.systemGray6))
                                .cornerRadius(10)
                                .onTapGesture {
                                    moo = mood
                                }
                        }
                    }
                }
                .padding(.top, 10)
                
                Form{
                    Section{
                        TextEditor(text: $activities).foregroundColor(Color.accentColor).frame(minHeight: 100)
                        
                    }
                }
                
                VStack(alignment: .leading) {
                    Text("Activities")
                        .font(.headline)
                        .padding(.top, 20)
                    
                    RoundedRectangle(cornerRadius: 25)
                        .fill(.white)
                        .frame(height: 150)
                        .shadow(radius: 1)
                        .overlay(
                            TextEditor(text: $activities)
                                .cornerRadius(3)
                                .padding()
                        )
                        .padding(.horizontal)
                }
                
                // Write Diary
                VStack(alignment: .leading) {
                    Text("Diary")
                        .font(.headline)
                        .padding(.top, 20)
                    
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color.white)
                        .frame(height: 150)
                        .shadow(radius: 1)
                        .overlay(
                            TextEditor(text: $diary)
                                .padding()
                                .cornerRadius(3)
                        )
                        .padding(.horizontal)
                }
                
                Spacer()
            }.padding(.top, -20)
                .padding(.horizontal)
        }
    }
}

#Preview{
    DayInsertView()
        .environmentObject(ViewModel())
}
