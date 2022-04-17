//
//  File.swift
//  
//
//  Created by Sina Taherkhani on 1/23/1401 AP.
//

import Foundation
public class TransactionList{
    private var count:Int
    private var status = [Int]()
    private var track_id = [Int64]()
    private var Id = [String]()
    private var order_Id = [String]()
    private var amount = [Int]()
    private var wage_by = [String]()
    private var wage_type = [String]()
    private var wage_amount = [Int32]()
    private var timeStamp = [String]()
    private var payer_name = [String]()
    private var payer_phone = [String]()
    private var payer_mail = [String]()
    private var payer_description = [String]()
    private var payment_trackId = [String]()
    private var payment_amount = [Int]()
    private var payment_cardNumber = [String]()
    private var payment_hashCardNumber = [String]()
    private var payment_date = [String]()
    private var verify_date = [String]()
    private var settlement_amount = [Int]()
    private var settlement_trackId = [Int]()
    private var settlement_date = [String]()
    private var settlement_account_Id = [String]()
    private var settlement_account_Name = [String]()
    private var settlement_account_IBan = [String]()
    private var settlement_account_Number = [String]()
    private var settlement_account_BankId = [String]()
    private var settlement_account_BankName = [String]()
    public init(count:Int, status:Int, track_id:Int64, Id:String, order_Id:String, amount:Int, wage_by:String, wage_type:String, wage_amount:Int32, timeStamp:String, payer_name:String, payer_phone:String, payer_mail:String, payer_description:String, payment_trackId:String, payment_amount:Int, payment_cardNumber:String, payment_hashCardNumber:String, payment_date:String, verify_date:String, settlement_amount:Int, settlement_trackId:Int, settlement_date:String, settlement_account_Id:String, settlement_account_Name:String, settlement_account_IBan:String, settlement_account_Number:String, settlement_account_BankId:String, settlement_account_BankName:String){
        self.count = count
        self.status.append(status)
        self.track_id.append(track_id)
        self.Id.append(Id)
        self.order_Id.append(order_Id)
        self.amount.append(amount)
        self.wage_by.append(wage_by)
        self.wage_type.append(wage_type)
        self.wage_amount.append(wage_amount)
        self.timeStamp.append(timeStamp)
        self.payer_name.append(payer_name)
        self.payer_phone.append(payer_phone)
        self.payer_mail.append(payer_mail)
        self.payer_description.append(payer_description)
        self.payment_trackId.append(payment_trackId)
        self.payment_amount.append(payment_amount)
        self.payment_cardNumber.append(payment_cardNumber)
        self.payment_hashCardNumber.append(payment_hashCardNumber)
        self.payment_date.append(payment_date)
        self.verify_date.append(verify_date)
        self.settlement_amount.append(settlement_amount)
        self.settlement_trackId.append(settlement_trackId)
        self.settlement_date.append(settlement_date)
        self.settlement_account_Id.append(settlement_account_Id)
        self.settlement_account_Name.append(settlement_account_Name)
        self.settlement_account_IBan.append(settlement_account_IBan)
        self.settlement_account_Number.append(settlement_account_Number)
        self.settlement_account_BankId.append(settlement_account_BankId)
        self.settlement_account_BankName.append(settlement_account_BankName)
    }
    public func get_count_all_transactions() -> Int { return self.count }
    public func get_status() -> [Int] { return self.status }
    public func get_track_id() -> [Int64] { return self.track_id }
    public func get_Id() -> [String] { return self.Id }
    public func get_order_Id() -> [String] { return self.order_Id }
    public func get_amount() -> [Int] { return self.amount }
    public func get_wage_by() -> [String] { return self.wage_by }
    public func get_wage_type() -> [String] { return self.wage_type }
    public func get_wage_amount() -> [Int32] { return self.wage_amount }
    public func get_timeStamp() -> [String] { return self.timeStamp }
    public func get_payer_name() -> [String] { return self.payer_name }
    public func get_payer_phone() -> [String] { return self.payer_phone }
    public func get_payer_mail() -> [String] { return self.payer_mail }
    public func get_payer_description() -> [String] { return self.payer_description }
    public func get_payment_trackId() -> [String] { return self.payment_trackId }
    public func get_payment_amount() -> [Int] { return self.payment_amount }
    public func get_payment_cardNumber() -> [String] { return self.payment_cardNumber }
    public func get_payment_hashCardNumber() -> [String] { return self.payment_hashCardNumber }
    public func get_payment_date() -> [String] { return self.payment_date }
    public func get_verify_date() -> [String] { return self.verify_date }
    public func get_settlement_amount() -> [Int] { return self.settlement_amount }
    public func get_settlement_trackId() -> [Int] { return self.settlement_trackId }
    public func get_settlement_date() -> [String] { return self.settlement_date }
    public func get_settlement_account_Id() -> [String] { return self.settlement_account_Id }
    public func get_settlement_account_Name() -> [String] { return self.settlement_account_Name }
    public func get_settlement_account_IBan() -> [String] { return self.settlement_account_IBan }
    public func get_settlement_account_Number() -> [String] { return self.settlement_account_Number }
    public func get_settlement_account_BankId() -> [String] { return self.settlement_account_BankId }
    public func get_settlement_account_BankName() -> [String] { return self.settlement_account_BankName }
}
