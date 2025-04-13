//
//  ContentView.swift
//  lab9
//
//  Created by Media Lab on 2022/6/1.
//  Copyright © 2022 Media Lab. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var dm = DataViewModel()
    @State private var total = totalCount()
    var body: some View {
        TabView{
            firstTab().tabItem {
                Text("明細")
                Image(systemName: "list.dash")
            }
            secondTab().tabItem {
                Text("合計")
                Image(systemName: "dollarsign.circle")
            }
        }
        .environmentObject(dm)
        .environmentObject(total)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        .environmentObject(DataViewModel())
        .environmentObject(totalCount())
    }
}
