//
//  List.swift
//  Home
//
//  Created by jiin heo on 2022/10/01.
//  Copyright © 2022 jiinheo. All rights reserved.
//

import SwiftUI

struct List: View {
    var body: some View {
        VStack (alignment: .leading) {
            Text("오늘 날씨는 어때요?")
                .font(.system(size: 18))
                .fontWeight(.bold)
            Spacer()
           
        }
        .padding(EdgeInsets(top: 13, leading: 13, bottom: 13, trailing: 13))
    }
}

struct List_Previews: PreviewProvider {
    static var previews: some View {
        List()
    }
}
