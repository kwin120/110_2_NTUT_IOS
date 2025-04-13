//
//  firstTab.swift
//  lab9
//
//  Created by Media Lab on 2022/6/1.
//  Copyright © 2022 Media Lab. All rights reserved.
//

import SwiftUI

struct firstTab: View {
    @EnvironmentObject var dm: DataViewModel
    @EnvironmentObject var total: totalCount
    @State private var show = false
    
    var body: some View {
        VStack{
            Text("收支明細")
                .font(.largeTitle)
            ForEach(dm.newDataList.datas.indices, id: \.self){
                i in dataRow(data: self.dm.newDataList.datas[i])
            }
            
            Button(action: {self.show = true}) {
                Text("新增")
                    .padding(.top)
            }
        }
        .padding(.horizontal)
        .sheet(isPresented: $show, content: {firstDetailView()
        .environmentObject(self.dm)
        .environmentObject(self.total)
        })
    }
}

struct firstTab_Previews: PreviewProvider {
    static var previews: some View {
        firstTab()
        .environmentObject(DataViewModel())
    }
}
