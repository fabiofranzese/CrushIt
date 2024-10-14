//
//  DayView.swift
//  avengers
//
//  Created by Fabio on 11/10/24.
//

import SwiftUI

struct DayView: View {
    @EnvironmentObject var viewmodel : ViewModel
    var body: some View {
        ForEach(Array(viewmodel.days.keys), id: \.self) {date in
            Text(String(describing: viewmodel.days[date]!.activities[0]) + " " + String(describing: viewmodel.days[date]!.num))
        }
    }
}

#Preview {
    DayView()
}
