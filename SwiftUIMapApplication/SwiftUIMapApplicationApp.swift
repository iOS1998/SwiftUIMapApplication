//
//  SwiftUIMapApplicationApp.swift
//  SwiftUIMapApplication
//
//  Created by MSS on 19/04/24.
//

import SwiftUI

@main
struct SwiftUIMapApplicationApp: App {
    @StateObject private var vm = LocationsViewModel()
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(vm)
        }
    }
}
