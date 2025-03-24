//
//  appliances.swift
//  FinalProject
//
//  Created by iMedia on 2022/6/24.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

struct appliances: View {
    @FirestoreQuery(collectionPath: "家電") var items:[Item]
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
                }.navigationTitle("家電")
            }
        }
    }
}

struct appliances_Previews: PreviewProvider {
    static var previews: some View {
        appliances()
            .environmentObject(shoppingCart())
            .environmentObject(viewHistory())
    }
}
