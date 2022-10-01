//
//  Chart.swift
//  Home
//
//  Created by jiin heo on 2022/10/01.
//  Copyright © 2022 jiinheo. All rights reserved.
//

import SwiftUI

struct Chart: View {
    var body: some View {
        VStack (alignment: .leading) {
            Text("오늘은 뭘 입을까?")
                .font(.system(size: 18))
                .fontWeight(.bold)
            Spacer()
           
        }
        .padding(EdgeInsets(top: 13, leading: 13, bottom: 13, trailing: 13))
    }
}

struct Chart_Previews: PreviewProvider {
    static var previews: some View {
        Chart()
    }
}
