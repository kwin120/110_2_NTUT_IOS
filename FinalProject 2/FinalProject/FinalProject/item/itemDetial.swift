//
//  itemDetial.swift
//  FinalProject
//
//  Created by iMedia on 2022/6/24.
//

import SwiftUI

struct itemDetial: View {
    @EnvironmentObject var cart: shoppingCart
    @EnvironmentObject var history: viewHistory
    
    
    let item: Item
    var body: some View {
        VStack{
            Text(item.name)
                .font(.title)
            AsyncImage(url: URL(string: item.url)) { Image in
                Image.resizable().frame(width: 400, height: 400)
            } placeholder: {
                ProgressView()
            }
            Text(item.description)
                .padding(.horizontal)
            HStack {
                Text("$\(item.price)")
                    .font(.system(size: 40))
                Button("加入最愛") {
                    self.history.history.Items.append(item)
                }
                Button("加入購物車") {
                    self.cart.cart.Items.append(item)
                }
            }
            .padding(.top)
            
        }
    }
}

struct itemDetial_Previews: PreviewProvider {
    static var previews: some View {
        itemDetial(item: Item(id: "is", name: "name", description: "description", price: 0, isAvailable: true, url: "image.com"))
            .environmentObject(shoppingCart())
    }
}
