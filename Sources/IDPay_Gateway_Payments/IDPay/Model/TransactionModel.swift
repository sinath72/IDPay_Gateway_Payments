//
//  TransactionModel.swift
//  Aftabb22
//
//  Created by Sina Taherkhani on 7/1/1400 AP.
//

import Foundation
public class Transaction{
    private var order_id: String
    private var transaction_id: String
    private var url:String
    private var eroor:String
    init(order_ids:String,transaction_ids:String,urls:String) {
        self.order_id = order_ids
        self.transaction_id = transaction_ids
        self.url = urls
        self.eroor = ""
    }
    init(error:String) {
        self.eroor = error
        self.order_id = ""
        self.transaction_id = ""
        self.url = ""
    }
    public func getError() -> String{
        return self.eroor
    }
    public func getOrderId() -> String{
        return self.order_id
    }
    public func getTransactionId() -> String{
        return self.transaction_id
    }
    public func getUrl() -> String{
        return self.url
    }
}
