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
    let midHeight: CGFloat = UIScreen.main.bounds.height * 0.45
    let maxHeight: CGFloat = UIScreen.main.bounds.height * 0.7
    var body: some View {
        NavigationStack{
            VStack{
                Text("Today's Goal: \(viewmodel.cigs(day: Calendar.current.dateComponents([.day], from: viewmodel.StartDate, to: Date()).day!, cigsperday: viewmodel.cigsperday)) cigarettes")
                // Not Working
                    .padding()
                    .font(.title2)
                    .foregroundColor(.accentColor)
                    .bold()
                Spacer()
                Button(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/){
                    modalTitle = "Fabio"
                }
                .sheet(isPresented: $viewmodel.showModal){
                    VStack{
                        ZStack{
                            HStack{
                                Text("\(modalTitle)")
                                    .font(.title3)
                            }
                            HStack{
                                Spacer()
                                Button{
                                    if viewmodel.dayDone{
                                        // Logic (maybe with function)
                                    }
                                    else{
                                        // Logic (maybe function)
                                    }
                                    viewmodel.dayDone = true
                                } label: {
                                    if viewmodel.dayDone{
                                        Text("Update")
                                            .foregroundStyle(.accent)
                                    } else{
                                        Text("Done")
                                            .foregroundStyle(.accent)
                                    }
                                }
                            }
                        }
                        .padding(20)
                        Text("Insert")
                        Spacer()
                    }
                    .presentationDetents([.height(maxHeight), .height(midHeight), .height(minHeight)])
                    .presentationContentInteraction(.scrolls)
                    .presentationBackgroundInteraction(.enabled(upThrough: .height(midHeight)))
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
