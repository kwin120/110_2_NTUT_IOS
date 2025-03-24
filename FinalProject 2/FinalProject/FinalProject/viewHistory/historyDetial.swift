//
//  historyDetial.swift
//  FinalProject
//
//  Created by iMedia on 2022/6/25.
//

import SwiftUI

struct historyDetial: View {
    @EnvironmentObject var history: viewHistory
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
                Button("從我的最愛移除") {
                    self.history.history.Items.remove(at: history.history.Items.firstIndex(of: item)!)
                }
            }
            .padding(.top)
            
        }
    }
}

struct historyDetial_Previews: PreviewProvider {
    static var previews: some View {
        historyDetial(item: Item(id: "id", name: "name", description: "description", price: 0, isAvailable: true, url: "image.com"))
    }
}
