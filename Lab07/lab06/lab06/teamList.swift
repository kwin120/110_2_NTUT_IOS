//
//  teamList.swift
//  lab06
//
//  Created by Media Lab on 2022/5/18.
//  Copyright © 2022 Media Lab. All rights reserved.
//

import SwiftUI

struct teamList: View {
    
    let teams = [
        team(name: "TEAM WRT", car: "AUDI R8 LMS GT3", description: "W Racing Team, better known as Team WRT, is a professional Belgian race Team, founded in 2009 and owned by former driver Vincent Vosse and entrepreneur Yves Weerts. "),
        team(name: "BARWELL MOTORSPORT", car: "LAMBORGHINI HURACAN GT3 EVO", description: "Barwell Motorsport are one of the UK’s most successful professional racing teams, competing at the forefront of various motorsport categories over the past five decades. Their race-winning history dates back to the 1960s, competing in GT/sportscars, touring cars, single-seaters and historic racing. Since starting its GT racing programme at the end of 2005, the team has been one of the most successful and versatile outfits of its kind, racing in GT1, GT2, GT3 and GT4 categories around the world."),
        team(name: "AF CORSE", car: "FERRARI 488 GT3", description: "Italian team AF Corse was founded by Amato Ferrari in 2002. The Piancenza based squad has won titles in the Le Mans Series, GT Sprint International Championship and the Endurance Champions Cup, as well as the European FIA GT3 championship. The team is  set to run two Ferrari 488 GT3 for the 2018 Blancpain GT Series Endurance Cup season.")
    ]
    
    var body: some View {
        NavigationView{
            List{
                ForEach(teams){
                    team in NavigationLink(destination: teamDetail(team: team)) {
                        teamRow(team: team)
                    }
                }
            }
        .navigationBarTitle("Teams")
        }
    }
}

struct teamList_Previews: PreviewProvider {
    static var previews: some View {
        teamList()
            .previewLayout(.sizeThatFits)
    }
}
