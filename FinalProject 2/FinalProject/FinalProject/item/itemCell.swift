//
//  itemCell.swift
//  FinalProject
//
//  Created by iMedia on 2022/6/24.
//

import SwiftUI

struct itemCell: View {
    let item:Item
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: item.url)) { Image in
                Image.resizable().scaledToFit().frame(width: 100, height: 100)
            } placeholder: {
                ProgressView()
            }
            Text(item.name)
                .padding(.horizontal)
            Text("$\(item.price)")
        }
    }
}

struct itemCell_Previews: PreviewProvider {
    static var previews: some View {
        itemCell(item: Item(id: "id", name: "name", description: "description", price: 0, isAvailable: true, url: "image.com"))
            .previewLayout(.sizeThatFits)
    }
}
