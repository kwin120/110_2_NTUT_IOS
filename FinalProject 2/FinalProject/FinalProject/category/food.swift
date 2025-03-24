//
//  food.swift
//  FinalProject
//
//  Created by iMediaLab on 2022/6/25.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

struct food: View {
    @FirestoreQuery(collectionPath: "食品") var items:[Item]
    @EnvironmentObject var cart: shoppingCart
    @EnvironmentObject var history: viewHistory
    
    var body: some View {
        List{
            ForEach(items){
                item in NavigationLink{
                    itemDetial(item: item)
                        .environmentObject(self.cart)
                        .environmentObject(self.history)
                } label: {
                    itemCell(item: item)
                }.navigationTitle("食品")
            }
        }
    }
}

struct food_Previews: PreviewProvider {
    static var previews: some View {
        food()
            .environmentObject(shoppingCart())
            .environmentObject(viewHistory())
    }
}
