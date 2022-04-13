//
//  Transaction_List.swift
//  Aftabb22
//
//  Created by Sina Taherkhani on 7/3/1400 AP.
//

import Foundation
import SwiftyJSON
public protocol ListTransactionDelegate:class {
    func showListTransaction(data:[TransactionList])
    func errorTransaction(erroe:Error)
}
public struct ListTransactions {
        public weak var delegate:ListTransactionDelegate?
    public init(api_key:String) {
            let sessionConfig = URLSessionConfiguration.default
            let session = URLSession(configuration: sessionConfig)
            guard let URLL = URL(string: "https://api.idpay.ir/v1.1/payment/transactions?page=0&page_size=100") else { return}
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
                        let temp = TransactionList(count: responseString!["attachment"]["total_count"].int!, status: responseString!["record"][i]["status"].intValue, track_id: Int64(responseString!["record"][i]["track_id"].intValue), Id: (responseString?["record"][i]["Id"].stringValue)!, order_Id: responseString!["record"][i]["order_id"].stringValue, amount: responseString!["record"][i]["amount"].intValue, wage_by: responseString!["record"][i]["wage"]["by"].stringValue, wage_type: responseString!["record"][i]["wage"]["type"].stringValue, wage_amount: responseString!["record"][i]["wage"]["amount"].int32Value, timeStamp: responseString!["record"][i]["date"].stringValue, payer_name: responseString!["record"][i]["payer"]["name"].stringValue, payer_phone: responseString!["record"][i]["payer"]["phone"].stringValue, payer_mail: responseString!["record"][i]["payer"]["mail"].stringValue, payer_description: responseString!["record"][i]["payer"]["desc"].stringValue, payment_trackId: responseString!["record"][i]["payment"]["track_id"].stringValue, payment_amount: responseString!["record"][i]["payment"]["amount"].intValue, payment_cardNumber: responseString!["record"][i]["payment"]["card_no"].stringValue, payment_hashCardNumber: responseString!["record"][i]["payment"]["hashed_card_no"].stringValue, payment_date: responseString!["record"][i]["payment"]["date"].stringValue, verify_date: responseString!["record"][i]["verify"]["date"].stringValue ?? "" , settlement_amount: responseString!["record"][i]["settlement"]["amount"].intValue, settlement_trackId: responseString!["record"][i]["settlement"]["track_id"].intValue, settlement_date: responseString!["record"][i]["settlement"]["date"].stringValue, settlement_account_Id: responseString!["record"][i]["settlement"]["account"]["id"].stringValue, settlement_account_Name: responseString!["record"][i]["settlement"]["account"]["name"].stringValue, settlement_account_IBan: responseString!["record"][i]["settlement"]["account"]["iban"].stringValue, settlement_account_Number: responseString!["record"][i]["settlement"]["account"]["number"].stringValue, settlement_account_BankId: responseString!["record"][i]["settlement"]["account"]["bank"]["id"].stringValue, settlement_account_BankName: responseString!["record"][i]["settlement"]["account"]["bank"]["name"].stringValue)
                        data.append(temp)
                    }
                    self.delegate?.showListTransaction(data: data)
                    print(responseString!["records"][counts])
                }
                else {
                    // Failure
                    self.delegate?.errorTransaction(erroe: error!)
                    print("URL Session Task Failed: %@", error!.localizedDescription);
                    
                }
            }
            task.resume()
            session.finishTasksAndInvalidate()
        }
    }

