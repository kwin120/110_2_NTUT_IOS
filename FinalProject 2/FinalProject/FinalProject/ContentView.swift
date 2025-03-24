//
//  ContentView.swift
//  FinalProject
//
//  Created by iMedia on 2022/6/22.
//

import SwiftUI
import Foundation
import FirebaseAuth

class categoryModel: ObservableObject{
    @Published var categoryName = ""
}

class ForUser:ObservableObject {
    @Published var name = "未登入"
    @Published var email = "未登入"
    @Published var uid = "未登入"
}

struct ContentView: View {
    @StateObject private var cat = categoryModel()
    @StateObject private var cart = shoppingCart()
    @StateObject private var history = viewHistory()
    @State private var selection = 2
    @StateObject var curUser = ForUser()
    
    var body: some View {
        TabView(selection: $selection){
            CategoryTab()
                .tabItem{
                    Image(systemName: "square.grid.2x2")
                    Text("商品種類")
                }.tag(0)
            IDTab()
                .tabItem{
                    Image(systemName: "person")
                    Text("帳戶中心")
                }.tag(1)
            HomeTab()
                .tabItem{
                    Image(systemName: "house")
                    Text("首頁")
                }.tag(2)
            ShopTab()
                .tabItem{
                    Image(systemName: "cart")
                    Text("購物車")
                }.tag(3)
            RecordTab()
                .tabItem{
                    Image(systemName: "clock.arrow.2.circlepath")
                    Text("我的最愛")
                }.tag(4)
        }
        .environmentObject(cat)
        .environmentObject(cart)
        .environmentObject(history)
        .environmentObject(curUser)
        
        
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
