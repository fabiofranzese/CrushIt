//
//  prova.swift
//  avengers
//
//  Created by Fabio on 15/10/24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var viewmodel : ViewModel
    @State private var modalTitle: String = "Today"
    let minHeight: CGFloat = UIScreen.main.bounds.height * 0.2
    let midHeight: CGFloat = UIScreen.main.bounds.height * 0.5
    let maxHeight: CGFloat = UIScreen.main.bounds.height * 0.8
    var body: some View {
        NavigationStack{
            VStack{
                Text("Today's Goal: \(viewmodel.cigs(day: Calendar.current.dateComponents([.day], from: viewmodel.StartDate, to: Date()).day!, cigsperday: viewmodel.cigsperday)) cigarettes")
                    .padding()
                    .font(.title2)
                    .foregroundColor(.accentColor)
                    .bold()
                Spacer()
                .sheet(isPresented: $viewmodel.showModal){
                    DayInsertView()
                        .padding(.top)
                    .presentationDetents([.height(maxHeight), .height(midHeight), .height(minHeight)])
                    .presentationContentInteraction(.scrolls)
                    .presentationBackgroundInteraction(.enabled(upThrough: .height(midHeight)))
                    .defaultScrollAnchor(.topLeading)
                }
            }
            .navigationTitle("\(viewmodel.titlecalculator(stages: viewmodel.stages))")
            .toolbar{
                NavigationLink{
                    PlansView()
                } label:{
                    Image(systemName: "info.circle")
                }
            }
            .onAppear{
                viewmodel.showModal = true
            }
            .onDisappear{
                viewmodel.showModal = false
            }
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(ViewModel())
}