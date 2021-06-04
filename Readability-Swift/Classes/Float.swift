//
//  Float.swift
//  Readability-Swift
//
//  Created by Bracken Spencer.
//  Copyright (c) 2014-2021 Bracken Spencer. All rights reserved.
//

import Foundation

extension Float {
    func round(to places: Float) -> Float {
        let stringFromFloat = String(format: "%.13f", self)
        let decimalNumber = NSDecimalNumber(string: stringFromFloat)
        let decimalNumberHandler = NSDecimalNumberHandler(roundingMode: .plain, scale: Int16(places), raiseOnExactness: false, raiseOnOverflow: false, raiseOnUnderflow: false, raiseOnDivideByZero: false)
        let decimalNumberRounded = decimalNumber.rounding(accordingToBehavior: decimalNumberHandler)

        return Float(truncating: decimalNumberRounded)
    }
}
