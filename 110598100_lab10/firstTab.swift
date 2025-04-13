//
//  firstTab.swift
//  110598100_lab10
//
//  Created by iMedia on 2022/6/8.
//

import SwiftUI

struct firstTab: View {
    @ObservedObject var LoginManager: loginManager
    @State private var show = false
    @State private var showAlert = false
    
    var body: some View {
        VStack{
            TextField("Email", text: $LoginManager.email)
                .padding(.bottom)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .textInputAutocapitalization(.never)
            TextField("password", text: $LoginManager.password)
                .padding(.bottom)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .textInputAutocapitalization(.never)
            Button("Login") {
                LoginManager.login()
                showAlert = true
            }.buttonStyle(.bordered).buttonBorderShape(.capsule)
                .alert("Logged in!", isPresented: $showAlert) {
                    Button("OK"){}
                }
            Button("Creat account"){
                show = true
            }
        }
        .padding(.horizontal)
        .sheet(isPresented: $show) {
            creatAccount(LoginManager: LoginManager)
        }
    }
}

struct firstTab_Previews: PreviewProvider {
    static var previews: some View {
        firstTab(LoginManager: loginManager())
    }
}
