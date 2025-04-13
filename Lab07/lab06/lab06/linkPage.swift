//
//  linkPage.swift
//  lab06
//
//  Created by Media Lab on 2022/5/18.
//  Copyright © 2022 Media Lab. All rights reserved.
//

import SwiftUI

struct linkPage: View {
    var body: some View {
        VStack {
            HStack{
                Image(systemName: "video.fill")
                Button("YouTube Channel") {
                   UIApplication.shared.open(URL(string: "https://www.youtube.com/gtworld")!)
                }
                
            }
            HStack{
                Image(systemName: "globe")
                Button("Official Website") {
                   UIApplication.shared.open(URL(string: "https://www.gt-world-challenge-europe.com/")!)
                }
                
            }
        }
    }
}

struct linkPage_Previews: PreviewProvider {
    static var previews: some View {
        linkPage()
    }
}
