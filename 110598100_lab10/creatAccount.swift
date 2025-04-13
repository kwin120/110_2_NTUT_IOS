//
//  creatAccount.swift
//  110598100_lab10
//
//  Created by iMedia on 2022/6/9.
//

import SwiftUI

struct creatAccount: View {
    @ObservedObject var LoginManager: loginManager
    
    var body: some View {
        VStack{
            TextField("User name", text: $LoginManager.name)
                .padding(.bottom)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .textInputAutocapitalization(.never)
            TextField("Email", text: $LoginManager.email)
                .padding(.bottom)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .textInputAutocapitalization(.never)
            TextField("password", text: $LoginManager.password)
                .padding(.bottom)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .textInputAutocapitalization(.never)
            Button("Creat account"){
                LoginManager.register()
            }.buttonStyle(.bordered).buttonBorderShape(.capsule)
        }
        .padding(.horizontal)
    }
}

struct creatAccount_Previews: PreviewProvider {
    static var previews: some View {
        creatAccount(LoginManager: loginManager())
    }
}
