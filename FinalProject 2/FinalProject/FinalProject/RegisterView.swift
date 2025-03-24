//
//  RegisterView.swift
//  FinalProject
//
//  Created by iMedia on 2022/6/25.
//

import SwiftUI
import FirebaseAuth

struct RegisterView: View {
    @State private var ID = ""
    @State private var pwd = ""
    @State private var name = ""
    @State private var address = ""
    @State private var phone = ""
    @EnvironmentObject var curUser : ForUser
    
    var body: some View {
        NavigationView{
            VStack{
                Text("用戶註冊")
                    .font(.largeTitle)
                HStack{
                    Text("帳號：")
                    TextField("E-mail Address", text: $ID)
                }
                HStack{
                    Text("密碼：")
                    TextField("Password", text: $pwd)
                }
                HStack{
                    Text("姓名：")
                    TextField("Your Name", text: $name)
                }
                
                
                Button{
                    Auth.auth().createUser(withEmail: ID, password: pwd){
                        result, error in
                        guard let user = result?.user,
                              error == nil else{
                            print(error?.localizedDescription)
                            return
                        }
                        
                        
                        Auth.auth().signIn(withEmail: ID, password: pwd){ result, error in guard error == nil else{
                                print(error?.localizedDescription)
                                return
                            }
                            print("success")
                            
                            let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                            changeRequest?.displayName = name
                            changeRequest?.commitChanges(completion: {
                                error in guard error == nil else{
                                    print(error?.localizedDescription)
                                    return
                                }
                            })
                            
                            /*
                            if let user = Auth.auth().currentUser {
                                curUser.name = user.displayName!
                                curUser.email = user.email!
                                curUser.uid = user.uid
                            }
                             */
                            
                            do{
                                try Auth.auth().signOut()
                            }catch{
                                print(error)
                            }
                            
                        }
                        
                    }
                    
                    
                    
                    
                    
                    
                    
                    
                } label:{
                    Text("註冊")
                }
                .padding()
                .foregroundColor(.white)
                .frame(width: 230.0, height: 31.0)
                .background(Color.blue)
                .cornerRadius(30.0)
                
            }
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}

