//
//  HeadView.swift
//  finance app
//
//  Created by Izbassar on 05.12.2023.
//

import SwiftUI

struct HeadView: View {
    var currency: Currency
    var money: Int
    private var symbol: String? {
        
        return nil
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .center) {
                Text("BALANCE")
                    .font(.system(size: 12))
                    .foregroundStyle(.white)
                    .opacity(0.5)
                HStack {
                    if let symbol = currency.systemName {
                        Image(systemName: symbol)
                            .foregroundStyle(.white)
                    } else {
                        Text(currency.littleName)
                            .foregroundStyle(.white)
                    }
                    Text("\(money)")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .padding(.vertical, 2)
                }
                
                Text("+10%")
                    .font(.system(size: 16))
                    .foregroundStyle(.white)
                    .opacity(0.8)
            }
            .padding(.top, 20)
        }
    }
}
