//
//  secondTab.swift
//  lab9
//
//  Created by Media Lab on 2022/6/1.
//  Copyright © 2022 Media Lab. All rights reserved.
//

import SwiftUI

struct secondTab: View {
    @EnvironmentObject var total: totalCount
    
    var body: some View {
        VStack {
            HStack{
                VStack{
                    Text("總收入")
                        .font(.largeTitle)
                    Text("\(total.totalIncome)")
                        .font(.title)
                        .foregroundColor(.green)
                }
                VStack{
                    Text("總支出")
                        .font(.largeTitle)
                    Text("\(total.totalOutcome)")
                        .font(.title)
                        .foregroundColor(.red)
                }
            }
            VStack{
                Text("剩餘")
                    .font(.largeTitle)
                Text("\(total.leftover)")
                    .font(.title)
                    .foregroundColor(.blue)
            }
            .padding(.top)
        }
    }
}

struct secondTab_Previews: PreviewProvider {
    static var previews: some View {
        secondTab()
        .environmentObject(totalCount())
    }
}
