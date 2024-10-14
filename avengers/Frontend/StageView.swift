//
//  StageView.swift
//  avengers
//
//  Created by Fabio on 11/10/24.
//

import SwiftUI

struct StageView: View {
    @EnvironmentObject var viewmodel : ViewModel
    var stage : Stage
    var body: some View {
        Text("\(stage.num), \(stage.description), \(stage.name)")
        Text("\(viewmodel.weeks[stage.num - 1][0].maxcigs)")
    }
}

#Preview {
    StageView(stage: Stage(num: 1, name: "Pre-Contemplation", description: "Pre-Contemplation"))
}
