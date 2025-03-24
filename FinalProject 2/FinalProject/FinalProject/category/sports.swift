//
//  sports.swift
//  FinalProject
//
//  Created by iMediaLab on 2022/6/25.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

struct sports: View {
    @FirestoreQuery(collectionPath: "運動戶外") var items:[Item]
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
                }.navigationTitle("運動戶外")
            }
        }
    }
}

struct sports_Previews: PreviewProvider {
    static var previews: some View {
        sports()
            .environmentObject(shoppingCart())
            .environmentObject(viewHistory())
    }
}
