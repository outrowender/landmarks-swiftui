//
//  landmarksApp.swift
//  landmarks
//
//  Created by Wender Patrick on 05/11/21.
//

import SwiftUI

@main
struct landmarksApp: App {
    @StateObject private var modelData = ModelData()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
