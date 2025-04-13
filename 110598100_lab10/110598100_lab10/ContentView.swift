//
//  ContentView.swift
//  110598100_lab10
//
//  Created by iMedia on 2022/6/8.
//

import SwiftUI
import Firebase
import FirebaseAuth

class loginManager: ObservableObject{
    @Published var isLoggedIn = Auth.auth().currentUser
    var email = ""
    var name = ""
    var password = ""
    
    func login(){
        Auth.auth().signIn(withEmail: email, password: password){
            result, error in guard error == nil else{
                print(error?.localizedDescription)
                return
            }
            print("success")
        }
    }
    
    func register(){
        Auth.auth().createUser(withEmail: email, password: password){
            result, error in guard error == nil else{
                print(error?.localizedDescription)
                return
            }
            print("success")
        }
        
        let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
        changeRequest?.displayName = name
        changeRequest?.commitChanges(completion: {
            error in guard error == nil else{
                print(error?.localizedDescription)
                return
            }
        })
    }
}

struct ContentView: View {
    @StateObject var LoginManager = loginManager()
    
    var body: some View {
        if (LoginManager.isLoggedIn != nil){
            secondTab(LoginManager: LoginManager)
        }else{
            firstTab(LoginManager: LoginManager)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
