//
//  Transaction_List.swift
//  Aftabb22
//
//  Created by Sina Taherkhani on 7/3/1400 AP.
//

import Foundation
import SwiftyJSON
public protocol ListTransactionDelegate:AnyObject {
    func showListTransaction(data:[TransactionList])
    func errorTransaction(erroe:Error)
}
public struct ListTransaction {
    public weak var delegate:ListTransactionDelegate?
    public init() {        
    }
    public func showListTransaction(api_key:String,count:Int = 25){
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig)
        guard let URLL = URL(string: "https://api.idpay.ir/v1.1/payment/transactions?page=0&page_size=\(count)") else { return}
        let request = NSMutableURLRequest(url: URLL)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(api_key, forHTTPHeaderField: "X-API-KEY")
        request.addValue("0", forHTTPHeaderField: "X-SANDBOX")
        let task = session.dataTask(with: request as URLRequest) { (data: Data?, response: URLResponse?, error: Error?) in
            if (error == nil) {
                // Success
                let statusCode = (response as! HTTPURLResponse).statusCode
                print("URL Session Task Succeeded: HTTP \(statusCode)")
                let responseString = try? JSON(data: data!)
                let counts = responseString!["attachment"]["total_count"].int! - 1
                var data = [TransactionList]()
                for i in 0...counts {
                    let temp = TransactionList(count: responseString!["attachment"]["total_count"].int!, status: responseString!["records"][i]["status"].intValue, track_id: Int64(responseString!["records"][i]["track_id"].intValue), Id: (responseString?["records"][i]["id"].stringValue)!, order_Id: responseString!["records"][i]["order_id"].stringValue, amount: responseString!["records"][i]["amount"].intValue, wage_by: responseString!["records"][i]["wage"]["by"].stringValue, wage_type: responseString!["records"][i]["wage"]["type"].stringValue, wage_amount: responseString!["records"][i]["wage"]["amount"].int32Value, timeStamp: responseString!["records"][i]["date"].stringValue, payer_name: responseString!["records"][i]["payer"]["name"].stringValue, payer_phone: responseString!["records"][i]["payer"]["phone"].stringValue, payer_mail: responseString!["records"][i]["payer"]["mail"].stringValue, payer_description: responseString!["records"][i]["payer"]["desc"].stringValue, payment_trackId: responseString!["records"][i]["payment"]["track_id"].stringValue, payment_amount: responseString!["records"][i]["payment"]["amount"].intValue, payment_cardNumber: responseString!["records"][i]["payment"]["card_no"].stringValue, payment_hashCardNumber: responseString!["records"][i]["payment"]["hashed_card_no"].stringValue, payment_date: responseString!["records"][i]["payment"]["date"].stringValue, verify_date: responseString!["records"][i]["verify"]["date"].stringValue ?? "" , settlement_amount: responseString!["records"][i]["settlement"]["amount"].intValue, settlement_trackId: responseString!["records"][i]["settlement"]["track_id"].intValue, settlement_date: responseString!["records"][i]["settlement"]["date"].stringValue, settlement_account_Id: responseString!["records"][i]["settlement"]["account"]["id"].stringValue, settlement_account_Name: responseString!["records"][i]["settlement"]["account"]["name"].stringValue, settlement_account_IBan: responseString!["records"][i]["settlement"]["account"]["iban"].stringValue, settlement_account_Number: responseString!["records"][i]["settlement"]["account"]["number"].stringValue, settlement_account_BankId: responseString!["records"][i]["settlement"]["account"]["bank"]["id"].stringValue, settlement_account_BankName: responseString!["records"][i]["settlement"]["account"]["bank"]["name"].stringValue)
                    data.append(temp)
                }
                self.delegate?.showListTransaction(data: data)
            }
            else {
                // Failure
                self.delegate?.errorTransaction(erroe: error!)
                
            }
        }
        task.resume()
        session.finishTasksAndInvalidate()
    }
}
