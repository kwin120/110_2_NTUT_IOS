//
//  Data.swift
//  lab9
//
//  Created by Media Lab on 2022/6/1.
//  Copyright © 2022 Media Lab. All rights reserved.
//

import Foundation

struct DataList: Identifiable {
    var id = UUID()
    var datas: [Data] = [Data()]
}

struct Data: Identifiable {
    var id = UUID()
    var income: Bool = true
    var amount: String = ""
    var description: String = ""
}

class DataViewModel: ObservableObject {
    @Published var newDataList = DataList()
}

class totalCount: ObservableObject {
    @Published var totalIncome = 0
    @Published var totalOutcome = 0
    @Published var leftover = 0
}
