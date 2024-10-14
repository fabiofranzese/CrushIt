//
//  ContainerView.swift
//  avengers
//
//  Created by Fabio on 11/10/24.
//

import SwiftUI

struct ContainerView: View {
    @StateObject private var viewmodel = ViewModel()
    var body: some View {
        TabView {
            Tab("Home", systemImage: "house") {
                HomeView()
                    .environmentObject(viewmodel)
            }
            Tab("Plan", systemImage: "calendar") {
                PlanView()
                    .environmentObject(viewmodel)
            }
        }
    }
}

#Preview {
    ContainerView()
}
