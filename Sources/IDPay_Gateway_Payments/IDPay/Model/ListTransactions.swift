//
//  File.swift
//  
//
//  Created by Sina Taherkhani on 1/23/1401 AP.
//

import Foundation
public class TransactionList{
    private var count:Int
    private var status:Int
    private var track_id:Int64
    private var Id:String
    private var order_Id:String
    private var amount:Int
    private var wage_by:String
    private var wage_type:String
    private var wage_amount:Int32
    private var timeStamp:String
    private var payer_name:String
    private var payer_phone:String
    private var payer_mail:String
    private var payer_description:String
    private var payment_trackId:String
    private var payment_amount:Int
    private var payment_cardNumber:String
    private var payment_hashCardNumber:String
    private var payment_date:String
    private var verify_date:String
    private var settlement_amount:Int
    private var settlement_trackId:Int
    private var settlement_date:String
    private var settlement_account_Id:String
    private var settlement_account_Name:String
    private var settlement_account_IBan:String
    private var settlement_account_Number:String
    private var settlement_account_BankId:String
    private var settlement_account_BankName:String
    public init(count:Int, status:Int, track_id:Int64, Id:String, order_Id:String, amount:Int, wage_by:String, wage_type:String, wage_amount:Int32, timeStamp:String, payer_name:String, payer_phone:String, payer_mail:String, payer_description:String, payment_trackId:String, payment_amount:Int, payment_cardNumber:String, payment_hashCardNumber:String, payment_date:String, verify_date:String, settlement_amount:Int, settlement_trackId:Int, settlement_date:String, settlement_account_Id:String, settlement_account_Name:String, settlement_account_IBan:String, settlement_account_Number:String, settlement_account_BankId:String, settlement_account_BankName:String){
        self.count = count
        self.status = status
        self.track_id = track_id
        self.Id = Id
        self.order_Id = order_Id
        self.amount = amount
        self.wage_by = wage_by
        self.wage_type = wage_type
        self.wage_amount = wage_amount
        self.timeStamp = timeStamp
        self.payer_name = payer_name
        self.payer_phone = payer_phone
        self.payer_mail = payer_mail
        self.payer_description = payer_description
        self.payment_trackId = payment_trackId
        self.payment_amount = payment_amount
        self.payment_cardNumber = payment_cardNumber
        self.payment_hashCardNumber = payment_hashCardNumber
        self.payment_date = payment_date
        self.verify_date = verify_date
        self.settlement_amount = settlement_amount
        self.settlement_trackId = settlement_trackId
        self.settlement_date = settlement_date
        self.settlement_account_Id = settlement_account_Id
        self.settlement_account_Name = settlement_account_Name
        self.settlement_account_IBan = settlement_account_IBan
        self.settlement_account_Number = settlement_account_Number
        self.settlement_account_BankId = settlement_account_BankId
        self.settlement_account_BankName = settlement_account_BankName
    }
}
