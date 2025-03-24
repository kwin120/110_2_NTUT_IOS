//
//  ShopTab.swift
//  FinalProject
//
//  Created by iMedia on 2022/6/22.
//

import SwiftUI

struct ShopTab: View {
    @EnvironmentObject var cart:shoppingCart
    var itemIndex: Int = 0
    var total:Int {
        var totalAmount = 0
        
        for item in self.cart.cart.Items{
            totalAmount += item.price
        }
        
        return totalAmount
    }
    @State private var showAlert = false
    @State private var alertTitle = "已結帳"
    
    var body: some View {
        NavigationView {
            VStack {
                List{
                    ForEach(self.cart.cart.Items.filter({$0.name != "name"})){
                        item in NavigationLink{
                            cartDetial(item: item)
                                .environmentObject(self.cart)
                        } label: {
                            itemCell(item: item)
                        }
                    }
                }
                Text("總共： \(total)")
                    .padding(.bottom)
                Button("結帳") {
                    self.cart.cart.Items.removeAll()
                    showAlert = true
                }
                .alert(alertTitle, isPresented: $showAlert) {
                    Button("OK"){}
                }
            }
        }
    }
}

struct ShopTab_Previews: PreviewProvider {
    static var previews: some View {
        ShopTab()
            .environmentObject(shoppingCart())
    }
}
