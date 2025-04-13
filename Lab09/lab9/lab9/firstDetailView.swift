//
//  firstDetailView.swift
//  lab9
//
//  Created by Media Lab on 2022/6/1.
//  Copyright © 2022 Media Lab. All rights reserved.
//

import SwiftUI

struct firstDetailView: View {
    @EnvironmentObject var dm: DataViewModel
    @EnvironmentObject var total: totalCount
    @State private var newData = Data()
    
    var body: some View {
        VStack{
            Text("New data")
            Toggle(isOn: $newData.income) {
                Text("是否為收入?")
            }
            HStack {
                Text("金額: ")
                TextField("0", text: $newData.amount)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.decimalPad)
            }
            HStack {
                Text("描述: ")
                TextField("早餐 等...", text: $newData.description)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            Button(action: {
                self.dm.newDataList.datas.append(self.newData)
                if(self.newData.income){
                    self.total.totalIncome += Int(self.newData.amount)!
                    self.total.leftover += Int(self.newData.amount)!
                }else{
                    self.total.totalOutcome += Int(self.newData.amount)!
                    self.total.leftover -= Int(self.newData.amount)!
                }
            }) {
            Text("Save")
            }
        }
        .padding(.horizontal)
    }
}

struct firstDetailView_Previews: PreviewProvider {
    static var previews: some View {
        firstDetailView()
        .environmentObject(DataViewModel())
    }
}
