//
//  cartDetial.swift
//  FinalProject
//
//  Created by iMedia on 2022/6/25.
//

import SwiftUI

struct cartDetial: View {
    @EnvironmentObject var cart: shoppingCart
    let item:Item
    
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: item.url)) { Image in
                Image.resizable().frame(width: 400, height: 400)
            } placeholder: {
                ProgressView()
            }
            Text(item.description)
                .padding(.horizontal)
            HStack {
                Text("$\(item.price)")
                Button("從購物車移除") {
                    self.cart.cart.Items.remove(at: cart.cart.Items.firstIndex(of: item)!)
                }
            }
            .padding(.top)
            
        }
    }
}

struct cartDetial_Previews: PreviewProvider {
    static var previews: some View {
        cartDetial(item: Item(id: "id", name: "name", description: "description", price: 0, isAvailable: true, url: "image.com"))
    }
}
