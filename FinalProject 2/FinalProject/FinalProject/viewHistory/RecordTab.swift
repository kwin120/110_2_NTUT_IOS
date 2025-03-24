//
//  RecordTab.swift
//  FinalProject
//
//  Created by iMedia on 2022/6/22.
//

import SwiftUI

struct RecordTab: View {
    @EnvironmentObject var history: viewHistory
    var itemIndex: Int = 0
    
    var body: some View {
        NavigationView {
            List{
                ForEach(self.history.history.Items.filter({$0.name != "name"})){
                    item in NavigationLink{
                        historyDetial(item: item)
                            .environmentObject(self.history)
                    } label: {
                        itemCell(item: item)
                    }
                }
            }
        }
    }
}

struct RecordTab_Previews: PreviewProvider {
    static var previews: some View {
        RecordTab()
            .environmentObject(viewHistory())
    }
}
