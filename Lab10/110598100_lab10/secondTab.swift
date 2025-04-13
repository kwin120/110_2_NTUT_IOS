//
//  secondTab.swift
//  110598100_lab10
//
//  Created by iMedia on 2022/6/8.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct secondTab: View {
    @ObservedObject var LoginManager: loginManager
    
    var body: some View {
        if let user = LoginManager.isLoggedIn{
            VStack {
                Text(user.uid)
                if user.displayName != nil{
                    Text(user.displayName!)
                }
                Text(user.email!)
                Button("Log out"){
                    do{
                        try Auth.auth().signOut()
                    }catch{
                        print(error)
                    }
                }
            }
        }
    }
}

struct secondTab_Previews: PreviewProvider {
    static var previews: some View {
        secondTab(LoginManager: loginManager())
    }
}
