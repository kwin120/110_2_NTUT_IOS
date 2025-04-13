//
//  dataRow.swift
//  lab9
//
//  Created by Media Lab on 2022/6/1.
//  Copyright © 2022 Media Lab. All rights reserved.
//

import SwiftUI

struct dataRow: View {
    let data: Data
    
    var body: some View {
        HStack{
            if(data.income){
                Text("收入")
                    .padding(.trailing)
                    .foregroundColor(.green)
            }else{
                Text("支出")
                    .padding(.trailing)
                    .foregroundColor(.red)
            }
            Spacer()
            Text(data.description)
                .padding(.trailing)
            Spacer()
            Text("$\(data.amount)")
        }
        
    }
}

struct dataRow_Previews: PreviewProvider {
    static var previews: some View {
        dataRow(data: Data())
            .previewLayout(.sizeThatFits)
    }
}
