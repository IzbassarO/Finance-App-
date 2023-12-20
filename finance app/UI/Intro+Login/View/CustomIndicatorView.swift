//
//  CustomIndicatorView.swift
//  finance app
//
//  Created by Izbassar on 04.12.2023.
//

import SwiftUI

struct CustomIndicatorVIew: View {
    /// View Properties
    var totalPages: Int
    var currentPage: Int
    var activeTint: Color = .black
    var inActiveTint: Color = .gray.opacity(0.5)
    
    var body: some View {
        HStack(spacing: 8, content: {
            ForEach(0..<totalPages, id: \.self) {
                Circle()
                    .fill(currentPage == $0 ? activeTint : inActiveTint)
                    .frame(width: 4, height: 4)
            }
        })
    }
}

#Preview {
    ContentView()
}
