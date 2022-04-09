//
//  Transaction_query_information.swift
//  IDPay
//
//  Created by Sina Taherkhani on 1/17/1401 AP.
//

import Foundation
public class Transaction_Query_Information{
    private var id:String
    private var order_id:String
    private var amount:String
    private var date:String
    private var Track_ID_Payment:String
    private var Track_ID_IDPay:String
    private var status:String
    private var description:String
    init(id:String,order_id:String,amount:String,date:String,Track_ID_Payment:String,Track_ID_IDPay:String,status:String,desc:String) {
        self.id = id
        self.order_id = order_id
        self.amount = amount
        self.date = date
        self.Track_ID_Payment = Track_ID_Payment
        self.Track_ID_IDPay = Track_ID_IDPay
        self.status = status
        self.description = desc
    }
    public func get_id () -> String{
        return self.id
    }
    public func get_orde_id () -> String{
        return self.order_id
    }
    public func get_amount () -> String{
        return self.amount
    }
    public func get_date () -> String{
        return self.date
    }
    public func get_Track_ID_Payment () -> String{
        return self.Track_ID_Payment
    }
    public func get_Track_ID_IDPay () -> String{
        return self.Track_ID_IDPay
    }
    public func get_status () -> String{
        return self.status
    }
    public func get_description () -> String{
        return self.description
    }
}
