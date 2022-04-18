//
//  Payment.swift
//  Aftabb22
//
//  Created by Sina Taherkhani on 6/31/1400 AP.
//

import Foundation
import SwiftyJSON
public protocol DataModelDelegate:AnyObject {
        func didReciveData(data:Transaction)
        func didFildWithError(error:Error)
        func didErrorCreate(errors:Transaction)
}
public struct payment{
    public weak var deleget:DataModelDelegate?
    public init(){
    }
    /* مقادیر api_key, callbackURL, order_id, amount ضروری میباشند و مقادیر دیگر بصورت دلخواه میتوان تنظیم کرد یا اصلا در تابع وجود نداشته باشند
     بصورت:
     getPay(api_key:self.apikey,callbackURL:self.callbackurl,order_id:self.orderid,amount:self.amount)
     باشد و مقادیر دیگر را بصورت دلخواه میتوان اضافه کرد که:
     name
     phone
     mail
     description
     می باشند
     */
    public func getPay(api_key:String,callbackURL:String,order_id:String,amount:Int,name:String = "",phone:String = "",mail:String = "",description:String = ""){
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig)
        guard let URLL = URL(string: "https://api.idpay.ir/v1.1/payment") else { return }
        let request = NSMutableURLRequest(url: URLL)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(api_key, forHTTPHeaderField: "X-API-KEY")
        request.addValue("0", forHTTPHeaderField: "X-SANDBOX")
        let bodyObject = [
            "order_id": order_id,
            "amount": amount,
            "name": name,
            "phone": phone,
            "mail": mail,
            "desc": description,
            "callback": callbackURL
        ] as [String : Any]
        request.httpBody = try! JSONSerialization.data(withJSONObject: bodyObject, options: [])
        let task = session.dataTask(with: request as URLRequest) { (data: Data?, response: URLResponse?, error: Error?) in
            if (error == nil) {
                let statusCode = (response as! HTTPURLResponse).statusCode
                print("URL Session Task Succeeded: HTTP \(statusCode)")
                if (statusCode == 201 || statusCode == 200) {
                    let responseString = try? JSON(data: data!)
                    let data = Transaction(order_ids: order_id, transaction_ids: responseString!["id"].stringValue,urls: responseString!["link"].stringValue)
                    self.deleget?.didReciveData(data: data)
                }
                else {
                    let responseString = try? JSON(data: data!)
                    let error = Transaction(error: responseString!["error_message"].stringValue)
                    self.deleget?.didErrorCreate(errors: error)
                }
            }
            else {
                self.deleget?.didFildWithError(error: error!)
                print("URL Session Task Failed: %@", error!.localizedDescription);
                
            }
        }
        task.resume()
        session.finishTasksAndInvalidate()
    }
}
