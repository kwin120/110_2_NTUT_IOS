//
//  phone.swift
//  FinalProject
//
//  Created by iMediaLab on 2022/6/25.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

struct phone: View {
    @FirestoreQuery(collectionPath: "通訊") var items:[Item]
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
                }.navigationTitle("通訊")
            }
        }
    }
}

struct phone_Previews: PreviewProvider {
    static var previews: some View {
        phone()
            .environmentObject(shoppingCart())
            .environmentObject(viewHistory())
    }
}
