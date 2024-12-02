//
//  Double+CurrencyAmount.swift
//  ProductListing
//
//  Created by Asad Mehmood on 02/12/2024.
//

import Foundation

extension Double {
    
    func getAmountWithCurrency() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.maximumFractionDigits = 0
        numberFormatter.locale = Locale(identifier: AppConstant.currencyIndentifier)
        return numberFormatter.string(from: NSNumber(value: self)) ?? ""
    }
}
