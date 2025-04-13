//
//  pictureLib.swift
//  lab06
//
//  Created by Media Lab on 2022/5/18.
//  Copyright © 2022 Media Lab. All rights reserved.
//

import SwiftUI

struct pictureLib: View {
    var body: some View {
        VStack {
            Text("HighLight")
                .font(.title)
                .fontWeight(.bold)
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    Image("TEAM WRT1")
                    .resizable()
                    .scaledToFit()
                    .clipped()
                    Image("TEAM WRT2")
                    .resizable()
                    .scaledToFit()
                    .clipped()
                    Image("AF CORSE1")
                    .resizable()
                    .scaledToFit()
                    .clipped()
                    Image("AF CORSE2")
                    .resizable()
                    .scaledToFit()
                    .clipped()
                    Image("BARWELL MOTORSPORT1")
                    .resizable()
                    .scaledToFit()
                    .clipped()
                    Image("BARWELL MOTORSPORT2")
                    .resizable()
                    .scaledToFit()
                    .clipped()
                }
            }
            Text("Photo libary")
            HStack{
                Image("timthumb")
                .resizable()
                .scaledToFit()
                Image("timthumb (1)")
                .resizable()
                .scaledToFit()
            }
            HStack{
                Image("timthumb (2)")
                .resizable()
                .scaledToFit()
                Image("timthumb (3)")
                .resizable()
                .scaledToFit()

            }
            HStack{
                Image("timthumb (4)")
                .resizable()
                .scaledToFit()
                Image("timthumb (5)")
                .resizable()
                .scaledToFit()
            }
        }
        
        
    }
}

struct pictureLib_Previews: PreviewProvider {
    static var previews: some View {
        pictureLib()
    }
}
