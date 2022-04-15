//
//  File.swift
//  
//
//  Created by Sina Taherkhani on 1/26/1401 AP.
//

import Foundation
public class VerifyTransactionStatus{
    private var status:Int
    private var track_Id:Int32
    private var Id:String
    private var order_Id:String
    private var amount:Int
    private var date:String
    private var payment_trackId:String
    private var payment_amount:Int
    private var payment_cardNumber:String
    private var payment_hashCardNumber:String
    private var payment_date:String
    private var verify_date:String
    public init(status:Int,track_Id:Int32,Id:String,order_Id:String,amount:Int,date:String,payment_trackId:String,payment_amount:Int,payment_cardNumber:String,payment_hashCardNumber:String,payment_date:String,verify_date:String){
        self.status = status
        self.track_Id = track_Id
        self.Id = Id
        self.order_Id = order_Id
        self.amount = amount
        self.date = date
        self.payment_trackId = payment_trackId
        self.payment_amount = amount
        self.payment_cardNumber = payment_cardNumber
        self.payment_hashCardNumber = payment_hashCardNumber
        self.payment_date = payment_date
        self.verify_date = verify_date
    }
    public func get_status() ->Int{ return self.status }
    public func get_track_Id() ->Int32{ return self.track_Id }
    public func get_Id() ->String{ return self.Id }
    public func get_order_Id() ->String{ return self.order_Id }
    public func get_amount() ->Int{ return self.amount }
    public func get_date() ->String{ return self.date }
    public func get_payment_trackId() ->String{ return self.payment_trackId }
    public func get_payment_amount() ->Int{ return self.payment_amount }
    public func get_payment_cardNumber() ->String{ return self.payment_cardNumber }
    public func get_payment_hashCardNumber() ->String{ return self.payment_hashCardNumber }
    public func get_payment_date() ->String{ return self.payment_date }
    public func get_verify_date() ->String { return self.verify_date }
}
