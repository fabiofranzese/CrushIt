//
//  PlanView.swift
//  avengers
//
//  Created by Fabio on 11/10/24.
//
import SwiftUI

struct PlanView: View {
    var stages = ViewModel().stages
    @EnvironmentObject var viewmodel : ViewModel
    var body: some View {
        NavigationStack{
            ForEach(Array(viewmodel.stages)) {stage in
                NavigationLink {
                    StageView(stage: stage)
                } label: {
                    HStack {
                        Image(systemName: "person.fill")
                            .imageScale(.large)
                            .foregroundStyle(.black)
                        Text("Stage \(stage.num)")
                    }
                }
            }.navigationTitle("Your Plan")
        }}
}

#Preview {
    PlanView()
}
