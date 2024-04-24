//
//  SwiftUIMapApplicationApp.swift
//  SwiftUIMapApplication
//
//  Created by Jagadish Paul on 19/04/24.
//

import SwiftUI

@main
struct SwiftUIMapApplicationApp: App {
    @StateObject private var vm = LocationsViewModel()
    var body: some Scene {
        WindowGroup {
//            LocationsView()
//                .environmentObject(vm)
            SignInView()
        }
    }
}
