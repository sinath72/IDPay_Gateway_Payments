//
//  Transaction_List.swift
//  Aftabb22
//
//  Created by Sina Taherkhani on 7/3/1400 AP.
//

import Foundation
import SwiftyJSON
public struct ListTransaction {
    public init() {
        
    }
    public func showListTransaction(api_key:String){
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
                print(responseString!)
            }
            else {
                // Failure
                print("URL Session Task Failed: %@", error!.localizedDescription);
                
            }
        }
        task.resume()
        session.finishTasksAndInvalidate()
    }
}

