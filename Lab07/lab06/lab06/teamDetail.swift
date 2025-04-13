//
//  teamDetail.swift
//  lab06
//
//  Created by Media Lab on 2022/5/18.
//  Copyright © 2022 Media Lab. All rights reserved.
//

import SwiftUI

struct teamDetail: View {
    
    let team: team
    var body: some View {
        VStack{
            teamImage(team: team)
            Text(team.description)
            .padding()
        }
        .navigationBarTitle(team.name)
    }
}

struct teamDetail_Previews: PreviewProvider {
    static var previews: some View {
        teamDetail(team: .demoTeam)
    }
}

struct teamImage: View {
    let team: team
    var body: some View {
        Image(team.name)
            .resizable()
            .scaledToFit()
    }
}
