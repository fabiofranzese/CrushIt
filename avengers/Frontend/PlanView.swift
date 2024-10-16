//
//  PlanView.swift
//  avengers
//
//  Created by Fabio on 11/10/24.
//
import SwiftUI

struct PlansView: View {
    @EnvironmentObject var viewmodel : ViewModel
    var body: some View {
        NavigationStack {
            ZStack {
                VStack(alignment: .leading) {
                    // Stage rows with system icons at the end
                    ForEach(viewmodel.stages) {stage in
                        NavigationLink (destination: StageDetailView(stage: stage)){
                            PlanStageRow(stage: stage)
                        }
                    }
                    Spacer()
                }
                .padding(.vertical)
            }
            .navigationTitle("Your Plan")
            .onAppear{
                viewmodel.showModal = false
            }.background(Color(.systemGray6))
        }
        
    }
    
}

struct PlanStageRow: View {
    @EnvironmentObject var viewmodel : ViewModel
    var stage : Stage
    
    var body: some View {
        HStack {
            // Stage name on the left
            Text(stage.name)
                .font(.system(size: 18))
                .foregroundColor(.black)
                .bold()
            
            Spacer()
            
            // System image icon on the right
            
            if stage.interval.contains(Date()){
                Image(systemName: "hourglass.circle.fill")
                    .foregroundStyle(.accent)
                    .font(.system(size: 24))
            } else if stage.interval.start > Date(){
                Image(systemName: "lock.circle.fill")
                    .font(.system(size: 24))
                    .foregroundStyle(.gray)
                    .opacity(0.5)
            } else {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundStyle(.accent)
                    .font(.system(size: 24))
            }
        }
        .padding()
        .background(Color(.white))
        .cornerRadius(10)
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}

#Preview {
    PlansView()
        .environmentObject(ViewModel())
}
