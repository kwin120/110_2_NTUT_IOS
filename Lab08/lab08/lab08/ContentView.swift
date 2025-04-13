//
//  ContentView.swift
//  lab08
//
//  Created by Media Lab on 2022/5/23.
//  Copyright © 2022 Media Lab. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var name = ""
    @State private var gender = 0
    @State private var luckyNum: Double = 0
    @State private var birthday = Date()
    @State private var human:Bool = false
    @State private var meals = 0
    @State private var sentAlert = false
    let genderSelection = ["男", "女", "其他"]
    var body: some View {
        VStack{
            Text("問卷調查")
            Image("img-member")
                .resizable()
                .padding(.bottom)
                .scaledToFit()
                .frame(width: 400, height: 200)
            HStack {
                Text("姓名:")
                TextField("你的名字", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            HStack {
                Text("性別:")
                Picker(selection: $gender, label: Text("性別")) {
                    Text(genderSelection[0]).tag(0)
                    Text(genderSelection[1]).tag(1)
                    Text(genderSelection[2]).tag(2)
                }.pickerStyle(SegmentedPickerStyle())
            }
            HStack{
                DatePicker(selection: $birthday, in: ...Date(), displayedComponents: .date, label: { Text("生日:") })
            }
            HStack {
                Text("幸運數字: \(Int(luckyNum))")
                Slider(value: $luckyNum, in: 0...100, step: 1, minimumValueLabel: Text("0"), maximumValueLabel: Text("100")){
                    Text("幸運數字")
                }
            }
            Toggle(isOn: $human) {
                Text("是否為人類")
            }
            Stepper(value: $meals, in: 0...10) {
                Text("今天吃了\(meals)餐")
            }
            Button(action: {
                self.sentAlert.toggle()
            }) {
                Text("送出")
            }
            .alert(isPresented: self.$sentAlert) {
                Alert(title: Text("謝謝你的參與!"))
            }
        }
        .padding(.horizontal)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
