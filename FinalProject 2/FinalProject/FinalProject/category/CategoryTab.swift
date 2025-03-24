//
//  CategoryTab.swift
//  FinalProject
//
//  Created by iMedia on 2022/6/22.
//

import SwiftUI

struct CategoryTab: View {
    let categories = [
        "3C","家電","美妝","運動戶外","食品","通訊"
    ]
    let categorySymbols = [
    "desktopcomputer","fanblades","mouth","tshirt","fork.knife","iphone.homebutton"
    ]
    
    var body: some View {
        
        NavigationView {
            VStack{
                //1st row
                HStack{
                    //3c
                    NavigationLink{
                        threeC()
                    }label: {
                        VStack {
                            Image(systemName: "desktopcomputer")
                                .font(.system(size: 100))
                                .frame(width: 100, height: 100)
                            Text("3C")
                                .font(.title)
                        }
                        .frame(width: 200, height: 200)
                    }
                    //家電
                    NavigationLink{
                        appliances()
                    }label: {
                        VStack {
                            Image(systemName: "fanblades")
                                .font(.system(size: 100))
                                .frame(width: 100, height: 100)
                            Text("家電")
                                .font(.title)
                        }.frame(width: 200, height: 200)
                    }
                }
                //2nd row
                HStack{
                    //美妝
                    NavigationLink{
                        cosmetic()
                    }label: {
                        VStack {
                            Image(systemName: "mouth")
                                .font(.system(size: 100))
                                .frame(width: 100, height: 100)
                            Text("美妝")
                                .font(.title)
                        }
                        .frame(width: 200, height: 200)
                    }
                    //運動戶外
                    NavigationLink{
                        sports()
                    }label: {
                        VStack {
                            Image(systemName: "tshirt")
                                .font(.system(size: 100))
                                .frame(width: 100, height: 100)
                            Text("運動戶外")
                                .font(.title)
                        }.frame(width: 200, height: 200)
                    }
                }
                //3rd row
                HStack{
                    //食品
                    NavigationLink{
                        food()
                    }label: {
                        VStack {
                            Image(systemName: "fork.knife")
                                .font(.system(size: 100))
                                .frame(width: 100, height: 100)
                            Text("食品")
                                .font(.title)
                        }.frame(width: 200, height: 200)
                    }
                    //通訊
                    NavigationLink{
                        phone()
                    }label: {
                        VStack {
                            Image(systemName: "iphone.homebutton")
                                .font(.system(size: 100))
                                .frame(width: 100, height: 100)
                            Text("通訊")
                                .font(.title)
                        }.frame(width: 200, height: 200)
                    }
                }
        }
    }
    }
}

struct CategoryTab_Previews: PreviewProvider {
    static var previews: some View {
        CategoryTab()
    }
}
