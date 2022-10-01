//
//  MyView.swift
//  Home
//
//  Created by jiin heo on 2022/10/01.
//  Copyright © 2022 jiinheo. All rights reserved.
//

import SwiftUI
import DesignKit

@main
struct MyView: App {
    var body: some Scene {
        WindowGroup {
            ScrollView {
                HomeView()
            }
        }
    }
}
