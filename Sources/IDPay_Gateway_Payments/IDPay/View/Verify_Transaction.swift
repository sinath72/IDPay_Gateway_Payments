//
//  Verify_Transaction.swift
//  Aftabb22
//
//  Created by Sina Taherkhani on 7/3/1400 AP.
//

import Foundation
import SwiftyJSON
public protocol VerifyTransactionDelegate:class{
    func Verify_Data(data:VerifyTransactionStatus)
    func Verify_Error_System(error:Error)
    func Verify_Error(errorMessage:String)
}
public struct VerifyTransaction {
    public weak var delegat:VerifyTransactionDelegate?
    public init(){
    }
    public func Verify(id:String,order_id:String,api_key:String,completion: @escaping (String) -> () = {_ in }){
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig)
        guard let URLL = URL(string: "https://api.idpay.ir/v1.1/payment/verify") else { return}
        let request = NSMutableURLRequest(url: URLL)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(api_key, forHTTPHeaderField: "X-API-KEY")
        request.addValue("0", forHTTPHeaderField: "X-SANDBOX")
        let bodyObject = [
            "id": id,
            "order_id": order_id
        ] as [String : Any]
        request.httpBody = try! JSONSerialization.data(withJSONObject: bodyObject, options: [])
        let task = session.dataTask(with: request as URLRequest) { (data: Data?, response: URLResponse?, error: Error?) in
            if (error == nil) {
                // Success
                let statusCode = (response as! HTTPURLResponse).statusCode
                print("URL Session Task Succeeded: HTTP \(statusCode)")
                let responseString = try? JSON(data: data!)
                var response:String = ""
                if statusCode == 405 {
                    response = responseString!["error_message"].stringValue
                    self.delegat?.Verify_Error(errorMessage: response)
                }
                else{
                    let verifyData = VerifyTransactionStatus(status: responseString!["status"].intValue, track_Id: responseString!["track_id"].int32Value, Id: responseString!["id"].stringValue, order_Id: responseString!["order_id"].stringValue, amount: responseString!["amount"].intValue, date: responseString!["date"].stringValue, payment_trackId: responseString!["payment"]["track_id"].stringValue, payment_amount: responseString!["payment"]["amount"].intValue, payment_cardNumber: responseString!["payment"]["card_no"].stringValue, payment_hashCardNumber: responseString!["payment"]["hashed_card_no"].stringValue, payment_date:  responseString!["payment"]["date"].stringValue, verify_date:  responseString!["verify"]["date"].stringValue)
                    self.delegat?.Verify_Data(data: verifyData)
                }
                completion(response)
            }
            else {
                // Failure
                self.delegat?.Verify_Error_System(error: error!)
                print("URL Session Task Failed: %@", error!.localizedDescription);
                
            }
        }
        task.resume()
        session.finishTasksAndInvalidate()
    }
}
