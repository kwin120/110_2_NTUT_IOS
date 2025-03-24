//
//  cosmetic.swift
//  FinalProject
//
//  Created by iMediaLab on 2022/6/24.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

struct cosmetic: View {
    @FirestoreQuery(collectionPath: "美妝") var items:[Item]
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
                }.navigationTitle("美妝")
            }
        }
    }
}

struct cosmetic_Previews: PreviewProvider {
    static var previews: some View {
        cosmetic()
            .environmentObject(shoppingCart())
            .environmentObject(viewHistory())
    }
}
