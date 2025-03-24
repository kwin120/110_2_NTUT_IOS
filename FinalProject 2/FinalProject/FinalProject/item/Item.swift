//
//  Item.swift
//  FinalProject
//
//  Created by iMedia on 2022/6/24.
//

import Foundation
import FirebaseFirestoreSwift

struct Item: Codable, Identifiable, Equatable{
    @DocumentID var id: String?="id"
    var name: String="name"
    var description: String="description"
    var price: Int=0
    var isAvailable: Bool=true
    var url: String="image.com"
}

struct ItemList:Identifiable{
    var id = UUID()
    var Items: [Item] = [Item()]
}

//extension Item{
//    static let demoItem = Item(id: "id", name: "name", description: "description", price: 100, isAvailable: true, url: "http://image")
//}

struct Items: Codable{
    let items: [Item]
}

class shoppingCart:ObservableObject{
    @Published var cart = ItemList()
}

class viewHistory: ObservableObject{
    @Published var history = ItemList()
}
