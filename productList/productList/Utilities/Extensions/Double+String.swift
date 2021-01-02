//
//  Double+String.swift
//  DesafioAfroDev
//
//  Created by Luan Pizzamiglio Audibert on 11/18/20.
//

import Foundation

public extension Double {

    var localized: String {
        var stringCurrency = ""
        let formatter = NumberFormatter()
        formatter.currencySymbol = "R$"
        formatter.locale = Calendar.current.locale
        formatter.numberStyle = .currency
        if let formattedMoney = formatter.string(from: self as NSNumber) {
            stringCurrency = formattedMoney
        }
        return stringCurrency
    }
}
