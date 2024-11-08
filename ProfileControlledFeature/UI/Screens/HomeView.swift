//
//  HomeView.swift
//  ProfileControlledFeature
//
//  Created by Stewart Thomson on 8/11/2024.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            Image(systemName: "house.fill")
                .navigationTitle("Home")
        }
    }
}

#Preview {
    HomeView()
}
