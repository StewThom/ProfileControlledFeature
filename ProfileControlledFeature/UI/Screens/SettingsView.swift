//
//  SettingsView.swift
//  ProfileControlledFeature
//
//  Created by Stewart Thomson on 8/11/2024.
//

import SwiftUI

struct SettingsView: View {

    @State var isProfileInstalled: Bool = false

    private let localProfileManager = LocalProfileManager()

    var body: some View {
        NavigationStack {
            List {
                Section {
                    Label("Notifications", systemImage: "bell.fill")
                }

                Section {
                    Label("Account Settings", systemImage: "person.fill")
                    Label("Security", systemImage: "lock.fill")
                }

                if isProfileInstalled {
                    Section {
                        Label("Diagnostics", systemImage: "chart.bar.doc.horizontal.fill")
                    }
                }

                Section {
                    Label {
                        Text("Log out")
                    } icon: {
                        Image(systemName: "rectangle.portrait.and.arrow.right.fill")
                    }
                    .foregroundStyle(.red)
                }
            }
            .refreshable {
                try? await Task.sleep(for: .milliseconds(300))
            }
            .navigationTitle("Settings")
        }
        .onAppear {
            isProfileInstalled = localProfileManager.isProfileInstalled()
        }
    }
}

#Preview {
    SettingsView()
}
