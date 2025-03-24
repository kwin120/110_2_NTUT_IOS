//
//  threeC.swift
//  FinalProject
//
//  Created by iMedia on 2022/6/24.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

struct threeC: View {
    @FirestoreQuery(collectionPath: "3C") var items:[Item]
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
                }.navigationTitle("3C")
            }
        }
    }
}

struct threeC_Previews: PreviewProvider {
    static var previews: some View {
        threeC()
            .environmentObject(shoppingCart())
            .environmentObject(viewHistory())
    }
}
