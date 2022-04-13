//
//  query_transaction.swift
//  Aftabb22
//
//  Created by Sina Taherkhani on 7/1/1400 AP.
//

import Foundation
import SwiftyJSON
public protocol ResultCodeDeleget:class {
    func Data_ResualtCode(data:TransactionStatusCodeResult)
    func Error_ResualtCode(error:String)
}
public protocol QueryDeleget:class {
    func data_query(data:Transaction_Query_Information)
    func error_query(erroe:Error)
}
public struct Query:class{
    public init(){
    }
        public weak var Query_deleget:QueryDeleget?
        public weak var ResultCode_delegate:ResultCodeDeleget?
        private var Transaction_Id = ""
        private var Transaction_Order = ""
        private var Class_Api_Key = ""
        private var status = ""
        public var manual:Bool = false // For Manual Query
        public func QueryStatusTransaction(id:String,order_id:String,api_key:String){
            self.Transaction_Id = id
            self.Transaction_Order = order_id
            self.Class_Api_Key = api_key
            let sessionConfig = URLSessionConfiguration.default
            let session = URLSession(configuration: sessionConfig)
            guard let URLL = URL(string: "https://api.idpay.ir/v1.1/payment/inquiry") else { return}
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
                    self.goStatusDescription(code: responseString!["status"].stringValue, completion: { statush in
                        if self.manual == false {
                            if statush == "برگشت خورده سیستمی" || statush == "طرف ۷۲ ساعت به شما بازگشت داده می شود" {
                                let query = Transaction_Query_Information(id: responseString!["id"].stringValue, order_id: responseString!["order_id"].stringValue, amount:  responseString!["amount"].stringValue, date: responseString!["date"].stringValue, Track_ID_Payment:  responseString!["payment"]["track_id"].stringValue, Track_ID_IDPay:  responseString!["track_id"].stringValue, status:  "برگشت خورده سیستمی", desc: responseString!["payer"]["desc"].stringValue.replacingOccurrences(of: ":", with: ""))
                                self.Query_deleget?.data_query(data: query)
                            }
                            else if responseString!["status"].stringValue == "10" {
                                let query = Transaction_Query_Information(id: responseString!["id"].stringValue, order_id: responseString!["order_id"].stringValue, amount:  responseString!["amount"].stringValue, date: responseString!["date"].stringValue, Track_ID_Payment:  responseString!["payment"]["track_id"].stringValue, Track_ID_IDPay:  responseString!["track_id"].stringValue, status: "تراکنش موفقیت آمیز بود", desc: responseString!["payer"]["desc"].stringValue.replacingOccurrences(of: ":", with: ""))
                                self.Query_deleget?.data_query(data: query)
                            }
                            else if statush != "به درگاه پرداخت منتقل شد"{
                                let query = Transaction_Query_Information(id: responseString!["id"].stringValue, order_id: responseString!["order_id"].stringValue, amount:  responseString!["amount"].stringValue, date: responseString!["date"].stringValue, Track_ID_Payment:  responseString!["payment"]["track_id"].stringValue, Track_ID_IDPay:  responseString!["track_id"].stringValue, status: self.status, desc: responseString!["payer"]["desc"].stringValue.replacingOccurrences(of: ":", with: ""))
                                self.Query_deleget?.data_query(data: query)
                            }
                        }
                        else{
                            let query = Transaction_Query_Information(id: responseString!["id"].stringValue, order_id: responseString!["order_id"].stringValue, amount:  responseString!["amount"].stringValue, date: responseString!["date"].stringValue, Track_ID_Payment:  responseString!["payment"]["track_id"].stringValue, Track_ID_IDPay:  responseString!["track_id"].stringValue, status: self.status, desc: responseString!["payer"]["desc"].stringValue.replacingOccurrences(of: ":", with: ""))
                            self.Query_deleget?.data_query(data: query)
                        }
                    })
                }
                else {
                    // Failure
                    print("URL Session Task Failed: %@", error!.localizedDescription);
                    self.Query_deleget?.error_query(erroe: error?.localizedDescription as! Error)
                }
            }
            task.resume()
            session.finishTasksAndInvalidate()
        }
        private func goStatusDescription(code:String,completion: @escaping (String) -> ()){
            let status = "t\(code)"
            var state:TransactionStatus!
            switch status {
            case "t1":
                state = TransactionStatus.t1
                break
            case "t2":
                state = TransactionStatus.t2
                break
            case "t3":
                state = TransactionStatus.t3
                break
            case "t4":
                state = TransactionStatus.t4
                break
            case "t5":
                state = TransactionStatus.t5
                break
            case "t6":
                state = TransactionStatus.t6
                break
            case "t7":
                state = TransactionStatus.t7
                break
            case "t8":
                state = TransactionStatus.t8
                break
            case "t10":
                state = TransactionStatus.t10
                break
            case "t100":
                state = TransactionStatus.t100
                break
            case "t101":
                state = TransactionStatus.t101
                break
            case "t200":
                state = TransactionStatus.t200
                break
            default:
                state = TransactionStatus.NF
                break
            }
            print(state.rawValue)
            if self.manual == false {
                if code == "10" {
                    VerifyTransaction().Verify(id: self.Transaction_Id, order_id: self.Transaction_Order, api_key: self.Class_Api_Key, completion: { (rep) in
                        if (rep != "") {
                            print("responsivity = \(rep)")
                            state = TransactionStatus.returned
                            self.status = state.rawValue
                            completion(state.rawValue)
                            let StatusCodeResult = TransactionStatusCodeResult(result: state.rawValue)
                            self.ResultCode_delegate?.Data_ResualtCode(data: StatusCodeResult)
                        }
                        else{
                            state = TransactionStatus.t100
                            self.status = state.rawValue
                            completion(state.rawValue)
                            let StatusCodeResult = TransactionStatusCodeResult(result: state.rawValue)
                            self.ResultCode_delegate?.Data_ResualtCode(data: StatusCodeResult)
                        }
                    })
                }
                else{
                    self.status = state.rawValue
                    completion(state.rawValue)
                    let StatusCodeResult = TransactionStatusCodeResult(result: state.rawValue)
                    self.ResultCode_delegate?.Data_ResualtCode(data: StatusCodeResult)
                }
            }
            else {
                self.status = state.rawValue
                let StatusCodeResult = TransactionStatusCodeResult(result: state.rawValue)
                self.ResultCode_delegate?.Data_ResualtCode(data: StatusCodeResult)
            }
        }
    }
