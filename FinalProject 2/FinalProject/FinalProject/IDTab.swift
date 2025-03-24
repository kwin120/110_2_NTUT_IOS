//
//  IDTab.swift
//  FinalProject
//
//  Created by iMedia on 2022/6/22.
//

import SwiftUI
import FirebaseAuth

struct IDTab: View {
    @State private var name = ""
    @State private var showAlert = false
    @State private var email = ""
    @State private var uid = ""
    @EnvironmentObject var curUser : ForUser
    
    var body: some View {
        
        NavigationView{
            VStack{
                Text("帳戶中心")
                    .font(.largeTitle)
                HStack{
                    Button{
                        if let user = Auth.auth().currentUser {
                            showAlert = true
                            name = user.displayName!
                            email = user.email!
                            uid = user.uid
                        }
                    } label:{
                    Image("cat")
                        .resizable()
                        .scaledToFill()
                        .frame(width:250, height:250)
                        .clipShape(Circle())
                    }
                    .alert("已經登入為：\(name)\n\(email)",isPresented: $showAlert, actions: {Button("OK"){}})
                    
                    VStack(alignment: .leading){
                        Button{
                            
                            
                        } label:{
                            if let user = Auth.auth().currentUser {
                                Text("Name:\(user.displayName!)")
                            } else {
                                //Text("Name:未登入")
                                Text("Name:\(curUser.name)")
                                
                            }
                            
                        }
                        .foregroundColor(.black)
                        
                        
                        Button{
                            
                        } label:{
                            if let user = Auth.auth().currentUser {
                                Text("Email:\(user.email!)")
                            } else {
                                //Text("Email:未登入")
                                Text("Email:\(curUser.email)")
                                
                            }
                            
                        }
                        .foregroundColor(.black)
                        
                        Button{
                            
                        } label:{
                            if let user = Auth.auth().currentUser {
                                Text("UID:\(user.uid)")
                            } else {
                                //Text("UID:未登入")
                                Text("UID:\(curUser.uid)")
                                
                            }
                            
                        }
                        .foregroundColor(.black)
                        
                        
                        
                        
                        
                    }

                }
                
                VStack(alignment: .leading){
                    NavigationLink{
                        UpdateInfo()
                    } label:{
                        Text("修改會員資料")
                    }
                    .padding()
                    .foregroundColor(.white)
                    .frame(width: 230.0, height: 31.0)
                    .background(Color.blue)
                    .cornerRadius(30.0)
                    
                    NavigationLink{
                        RecordTab()
                    } label:{
                        Text("我的最愛")
                    }
                    .padding()
                    .foregroundColor(.white)
                    .frame(width: 230.0, height: 31.0)
                    .background(Color.purple)
                    .cornerRadius(30.0)
                    
                    NavigationLink{
                        ShopTab()
                    } label:{
                        Text("購物車")
                    }
                    .padding()
                    .foregroundColor(.white)
                    .frame(width: 230.0, height: 31.0)
                    .background(Color.pink)
                    .cornerRadius(30.0)
                    
                }
            }
        }
    }
}

struct IDTab_Previews: PreviewProvider {
    static var previews: some View {
        IDTab()
    }
}
