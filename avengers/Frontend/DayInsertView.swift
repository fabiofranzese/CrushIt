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
            ForEach(Array(viewmodel.days.keys), id: \.self) {date in
                Text(String(describing: viewmodel.days[date]!.num) + " " + String(describing: viewmodel.days[date]!.activities[0]))
            }
            Button("Add_day") {
                viewmodel.CurrDayCount += 1
                viewmodel.days[viewmodel.StartInterval + viewmodel.CurrDayCount*86400] = Day(num: viewmodel.CurrDayCount, cigs: 5, mood: "Great", activities: ["Basketball"])
            }
            Text("\(viewmodel.StartInterval + viewmodel.CurrDayCount*86400)")
            NavigationLink{
                DayView()
            } label: {
                Text("aa")
            }
        }
    }
}

#Preview {
    DayInsertView()
}
