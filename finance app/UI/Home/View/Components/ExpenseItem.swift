import SwiftUI
import Foundation
struct ExpenseItem: View {
    var purchase: Purchase
    var currency: Currency
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMM"
        return formatter
    }()
    @AppStorage("currency_type") var currencyType: String!
    
    var body: some View {
        NavigationLink(destination: EditExpenseView(expense: purchase)) {
            HStack {
                VStack(alignment: .leading, spacing: 6) {
                    Text(purchase.title ?? "")
                        .bold()
                    
                    Text(purchase.category ?? "")
                        .foregroundStyle(.gray)
                }
                
                Spacer()
                VStack(alignment: .trailing, spacing: 5) {
                    HStack {
                        if let symbol = currency.systemName {
                            Image(systemName: symbol)
                        } else {
                            Text(currency.littleName)
                        }
                        Text("\(Int(purchase.amountSpent))")
                    }
                    .foregroundStyle(purchase.isIncome ? Color("CustomGreen") : Color("CustomRed"))
                    let str = dateFormatter.string(from: purchase.dateOfPurchase!)
                    Text(str)
                        .font(.system(size: 12))
                        .foregroundStyle(.gray)
                }
            }
        }
        .foregroundStyle(.black)
        .padding()
    }
}
