//
//  StageView.swift
//  avengers
//
//  Created by Fabio on 11/10/24.
//

import SwiftUI

struct StageDetailView: View {
    @EnvironmentObject var viewmodel : ViewModel
    @State private var date : Date = Date()
    @State private var showingSheet : Bool = false
    @State private var insert : Bool = false
    var stage : Stage
    var body: some View {
        NavigationStack{
            VStack() {
                Form {
                    Section {
                        Text("Your \(stage.name) Stage starts on \(viewmodel.formattedDate(stage.interval.start)) and ends on \(viewmodel.formattedDate(stage.interval.end)).\n\(stage.description)").foregroundColor(Color.accentColor)
                    } header: {Text("STAGE DESCRIPTION")}
                    Section{DatePicker(
                        "Start Date",
                        selection: $date,
                        in: stage.interval.start...stage.interval.end,
                        displayedComponents: [.date]
                    )
                    .datePickerStyle(.graphical)
                    .onChange(of: date) {
                        if viewmodel.days.keys.contains(Calendar.current.dateComponents([.day], from: viewmodel.StartDate, to: date).day!){
                            showingSheet = true
                        }
                        else if Calendar.current.isDateInToday(date){
                            insert = true
                            showingSheet = true
                        }
                    }
                    } header: {
                        Text("YOUR JOURNEY")
                    }
                }
                Spacer()
            }
            .sheet(isPresented: $showingSheet){
                if insert{
                    DayInsertView()
                        .onDisappear{
                            insert = false
                        }
                }else {
                    DayView(day: viewmodel.days[Calendar.current.dateComponents([.day], from: viewmodel.StartDate, to: date).day!] ?? Day(num: 1, cigs: 1, mood: "fd", activities: "df", diary: "Felt Great"))
                }
            }
            .background(Color(.systemGray6))
            .navigationTitle("\(stage.name)")
        }
    }
}

#Preview {
    StageDetailView(stage: Stage(num: 1, name: "Pre-Contemplation", description: "Pre-contemplate", interval: DateInterval(start: Date(timeIntervalSince1970: TimeInterval(1718575200)), duration: TimeInterval(60*60*24*7 - 1))))
       .environmentObject(ViewModel())
}
