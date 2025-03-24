//
//  UpdateInfo.swift
//  FinalProject
//
//  Created by iMedia on 2022/6/26.
//

import SwiftUI
import FirebaseAuth

struct UpdateInfo: View {
    @State private var ID = ""
    @State private var pwd = ""
    @State private var name = ""
    
    var body: some View {
        NavigationView{
            VStack{
                Text("變更用戶資料")
                    .font(.largeTitle)
                HStack{
                    Text("信箱：")
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
                    Auth.auth().currentUser?.updateEmail(to: ID){
                         error in
                        guard error == nil else{
                            print(error?.localizedDescription)
                            return
                        }
                    }
                    
                    Auth.auth().currentUser?.updatePassword(to: pwd){
                        error in
                       guard error == nil else{
                           print(error?.localizedDescription)
                           return
                       }
                   }
                    
                    let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                    changeRequest?.displayName = name
                    changeRequest?.commitChanges(completion: {
                        error in guard error == nil else{
                            print(error?.localizedDescription)
                            return
                        }
                    })
                    
                } label:{
                    Text("變更")
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

struct UpdateInfo_Previews: PreviewProvider {
    static var previews: some View {
        UpdateInfo()
    }
}
