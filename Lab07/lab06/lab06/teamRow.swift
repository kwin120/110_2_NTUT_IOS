//
//  teamRow.swift
//  lab06
//
//  Created by Media Lab on 2022/5/18.
//  Copyright © 2022 Media Lab. All rights reserved.
//

import SwiftUI

struct teamRow: View {
    
    let team: team
    var body: some View {
        HStack{
            Image(team.name)
            .resizable()
            .scaledToFit()
            .frame(width: 80, height: 80)
                .clipped()
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            VStack(alignment: .leading){
                Text(team.name)
                    .font(.headline)
                Text(team.car)
                    .font(.body)
            }
            Spacer()
        }
    }
}

struct teamRow_Previews: PreviewProvider {
    static var previews: some View {
        teamRow(team: .demoTeam)
            .previewLayout(.sizeThatFits)
    }
}
