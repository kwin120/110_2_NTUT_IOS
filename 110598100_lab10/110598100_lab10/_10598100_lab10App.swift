//
//  _10598100_lab10App.swift
//  110598100_lab10
//
//  Created by iMedia on 2022/6/8.
//

import SwiftUI
import Firebase
import FirebaseAuth

@main
struct _10598100_lab10App: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
