//
//  HomeView.swift
//  Home
//
//  Created by jiin heo on 2022/10/01.
//  Copyright © 2022 jiinheo. All rights reserved.
//

import SwiftUI
import APIKit

struct HomeView: View {
    
    @EnvironmentObject var network: RequestAPI
    
    @StateObject private var networks = RequestAPI.shared
    
    var body: some View {
        
        VStack {
            HStack {
                // TODO: Button으로 변경해야함
                Image.logo
                Image.misoweatherLogo
                Spacer()
                Image.location
                Image.person
            }
            HStack {
                VStack(alignment: .leading) {
                    Text("안녕하세요!")
                        .font(.system(size: 20))
                    Text("파주의 유쾌한 막내사자님 🦁")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                }
                Spacer()
            }
            .padding(.top, 35)
            
            HStack {
                Image.location
                Text("야당 스타벅스")
                    .font(.system(size: 16))
                Spacer()
                Text("24°")
                Spacer()
            }
            VStack {
                ForEach(networks.comment.first?.data.commentList ?? [], id: \.self) { user in
                    
                    Text("sdg")
                    
                    HStack {
                        VStack {
                            Chart()
                            List()
                        }
                        Spacer()
                    }
                    .frame(height: 628)
                    .background(Color.cellBackground)
                    .cornerRadius(21)
                    .padding(.top, 25)
                    
                    Spacer()
                    Image.misobuildLogo
                }
            }
            .onAppear {
                network.fetchData()
                
            }
            .padding(.top, 20)
            .padding(.leading, 28)
            .padding(.trailing, 28)
            
        }
    }
}
ㅎ
