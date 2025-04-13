//
//  team.swift
//  lab06
//
//  Created by Media Lab on 2022/5/18.
//  Copyright © 2022 Media Lab. All rights reserved.
//

import Foundation

struct team: Identifiable{
    var id: String { name }
    let name: String
    let car: String
    let description: String
}

extension team{
    static let demoTeam = team(name: "TEAM WRT", car: "audi r8", description: "aaa")
}
