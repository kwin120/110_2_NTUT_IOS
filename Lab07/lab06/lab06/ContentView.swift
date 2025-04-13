//
//  ContentView.swift
//  lab06
//
//  Created by Media Lab on 2022/5/18.
//  Copyright © 2022 Media Lab. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            teamList().tabItem {
                Text("Teams")
                Image(systemName: "person.3.fill")
            }
            pictureLib().tabItem {
                Text("Photo")
                Image(systemName: "photo")
            }
            linkPage().tabItem {
                Text("Links")
                Image(systemName: "link")
            }
        }
        .accentColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
