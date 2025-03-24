//
//  LoginView.swift
//  FinalProject
//
//  Created by iMedia on 2022/6/25.
//

import SwiftUI
import FirebaseAuth


struct LoginView: View {
    @State private var ID = ""
    @State private var pwd = ""
    
    @EnvironmentObject var curUser : ForUser
    
    var body: some View {
        NavigationView{
        VStack{
            Text("用戶登入")
                .font(.largeTitle)
            HStack{
                Text("帳號：")
                TextField("Email Address", text: $ID)
            }
            HStack{
                Text("密碼：")
                TextField("Password", text: $pwd)

            }
            HStack{
                Button{
                    Auth.auth().signIn(withEmail: ID, password: pwd){ result, error in guard error == nil else{
                            print(error?.localizedDescription)
                            return
                        }
                        print("success")
                        
                        if let user = Auth.auth().currentUser {
                            curUser.name = user.displayName!
                            curUser.email = user.email!
                            curUser.uid = user.uid
                        }
                    }
                } label:{
                    Text("登入")
                }
                .padding()
                .foregroundColor(.white)
                .frame(width: 100.0, height: 31.0)
                .background(Color.blue)
                .cornerRadius(30.0)
                
                NavigationLink{
                    //HomeTab()
                    RegisterView()
                } label:{
                    Text("註冊")
                }
                .padding()
                .foregroundColor(.white)
                .frame(width: 100.0, height: 31.0)
                .background(Color.pink)
                .cornerRadius(30.0)
                
            }
        }
        }
        .environmentObject(curUser)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
