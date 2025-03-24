//
//  searchView.swift
//  FinalProject
//
//  Created by iMedia on 2022/6/26.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

struct searchView: View {
    let keyword: String
    @EnvironmentObject var cart: shoppingCart
    @EnvironmentObject var history: viewHistory
    @FirestoreQuery(collectionPath: "熱門商品") var hotitems:[Item]
    @FirestoreQuery(collectionPath: "3C") var threeCitems:[Item]
    @FirestoreQuery(collectionPath: "運動戶外") var sportsitems:[Item]
    //@FirestoreQuery(collectionPath: "通訊") var phoneitems:[Item]
    @FirestoreQuery(collectionPath: "食品") var fooditems:[Item]
    @FirestoreQuery(collectionPath: "美妝") var cosmeticitems:[Item]
    @FirestoreQuery(collectionPath: "家電") var appliancesitems:[Item]
    
    var body: some View {
        List{
            //熱門商品
            ForEach(hotitems.filter({$0.name.lowercased().contains(keyword.lowercased())})){
                item in NavigationLink{
                    itemDetial(item: item)
                        .environmentObject(self.cart)
                        .environmentObject(self.history)
                } label: {
                    itemCell(item: item)
                }
            }
            //3c
            ForEach(threeCitems.filter({$0.name.contains(keyword)})){
                item in NavigationLink{
                    itemDetial(item: item)
                        .environmentObject(self.cart)
                        .environmentObject(self.history)
                } label: {
                    itemCell(item: item)
                }
            }
            //sports
            ForEach(sportsitems.filter({$0.name.contains(keyword)})){
                item in NavigationLink{
                    itemDetial(item: item)
                        .environmentObject(self.cart)
                        .environmentObject(self.history)
                } label: {
                    itemCell(item: item)
                }
            }
            
            //food
            ForEach(fooditems.filter({$0.name.contains(keyword)})){
                item in NavigationLink{
                    itemDetial(item: item)
                        .environmentObject(self.cart)
                        .environmentObject(self.history)
                } label: {
                    itemCell(item: item)
                }
            }
            //cosmetic
            ForEach(cosmeticitems.filter({$0.name.contains(keyword)})){
                item in NavigationLink{
                    itemDetial(item: item)
                        .environmentObject(self.cart)
                        .environmentObject(self.history)
                } label: {
                    itemCell(item: item)
                }
            }
            //appliances
            ForEach(appliancesitems.filter({$0.name.contains(keyword)})){
                item in NavigationLink{
                    itemDetial(item: item)
                        .environmentObject(self.cart)
                        .environmentObject(self.history)
                } label: {
                    itemCell(item: item)
                }
            }
        }
    }
}

struct searchView_Previews: PreviewProvider {
    static var previews: some View {
        searchView(keyword: "")
            .environmentObject(shoppingCart())
            .environmentObject(viewHistory())
    }
}
