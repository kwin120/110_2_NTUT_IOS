//
//  HomeTab.swift
//  FinalProject
//
//  Created by iMedia on 2022/6/22.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

struct HomeTab: View {
    @FirestoreQuery(collectionPath: "熱門商品") var items:[Item]
    @EnvironmentObject var cart: shoppingCart
    @EnvironmentObject var history: viewHistory
    @State private var productName = ""
    let user = Auth.auth().currentUser
    @State private var name = ""
    @EnvironmentObject var curUser : ForUser
    
    var body: some View {
        NavigationView{
            VStack(){
                HStack(){
                    Button {
                        if let user = Auth.auth().currentUser {
                            curUser.name = user.displayName!
                        }
                    } label:{
                        if let user = Auth.auth().currentUser{          Text("購物愉快,\(user.displayName!)")
                        }
                        else{
                            Text("購物愉快,\(curUser.name)")
                            
                        }
                    }
                    .foregroundColor(.black)
        
                    
                    NavigationLink{
                        LoginView()
                    } label:{
                        if let user = Auth.auth().currentUser {
                            //Text("Hi,\(user.displayName!)")
                            Text("登入")
                        } else {
                            Text("登入")
                        }
                    }
                    
                    Text("|")
                    Button{
                        do{
                            try Auth.auth().signOut()
                        }catch{
                            print(error)
                        }
                        curUser.name = "未登入"
                        curUser.email = "未登入"
                        curUser.uid = "未登入"
                    } label:{
                        Text("登出")
                    }
                    
                   
                    Text("|")
                    NavigationLink{
                        RegisterView()
                    } label:{
                        Text("註冊")
                    }
                }
            
                HStack(){
                TextField("輸入商品名稱", text: $productName)
                        .frame(width: 300, height: 50)
                        .autocapitalization(.none)
                    NavigationLink{
                        searchView(keyword: productName)
                    }label: {
                        Text("搜尋")
                    }
                }
            
                VStack(){
                    Text("熱門推薦商品")
                    List{
                        ForEach(items){
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
        }
    }
}

struct HomeTab_Previews: PreviewProvider {
    static var previews: some View {
        HomeTab()
            .environmentObject(shoppingCart())
            .environmentObject(viewHistory())
            .environmentObject(ForUser())
    }
}
