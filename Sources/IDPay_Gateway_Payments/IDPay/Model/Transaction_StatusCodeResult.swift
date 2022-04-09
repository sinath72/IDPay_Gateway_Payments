//
//  Transaction_StatusCodeResult.swift
//  Aftabb22
//
//  Created by Sina Taherkhani on 7/3/1400 AP.
//

import Foundation
public class TransactionStatusCodeResult {
    private var Result:String
    init(result:String) {
        self.Result = result
    }
    public func getResult() -> String{
        return self.Result
    }
}
