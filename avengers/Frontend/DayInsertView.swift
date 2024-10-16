//
//  DayInsertView.swift
//  avengers
//
//  Created by Fabio on 11/10/24.
//

import SwiftUI

struct DayInsertView: View {
    @EnvironmentObject var viewmodel : ViewModel
    var body: some View {
        NavigationStack{
            Button("Add_day") {
                viewmodel.CurrDayCount += 1
                viewmodel.days[viewmodel.StartInterval + viewmodel.CurrDayCount*86400] = Day(num: viewmodel.CurrDayCount, cigs: 5, mood: "Great", activities: ["Basketball"], diary: "Felt Great")
            }
            Text("\(viewmodel.StartInterval + viewmodel.CurrDayCount*86400)")
            NavigationLink{
                DayView(day: Day(num: 5, cigs: 3, mood: "dfjkf", activities: ["fdjfk"], diary: "Felt Great"))
            } label: {
                Text("aa")
            }
        }
    }
}

#Preview {
    DayInsertView()
        .environmentObject(ViewModel())
}
