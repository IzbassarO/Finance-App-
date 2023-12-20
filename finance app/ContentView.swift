//
//  ContentView.swift
//  finance app
//
//  Created by Izbassar on 01.12.2023.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("login") private var isIntroFinished: Bool?
    
    var body: some View {
        Group {
            if let move = isIntroFinished {
                if move {
                    Dashboard()
                } else {
                    Intro()
                }
            } else {
                Intro()
            }
        }
    }
}

#Preview {
    ContentView()
}
