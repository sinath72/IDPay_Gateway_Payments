//
//  Transaction_Status.swift
//  Aftabb22
//
//  Created by Sina Taherkhani on 7/1/1400 AP.
//

import Foundation
enum TransactionStatus:  String{
    case t1 = "پرداخت انجام نشده است"
    case t2 = "پرداخت ناموفق بوده است"
    case t3 = "خطا رخ داده است"
    case t4 = "بلوکه شده"
    case t5 = "برگشت به پرداخت کننده"
    case t6 = "برگشت خورده سیستمی"
    case t7 = "انصراف از پرداخت"
    case t8 = "به درگاه پرداخت منتقل شد"
    case t10 = "در انتظار تایید پرداخت"
    case t100 = "پرداخت تایید شده است"
    case t101 = "پرداخت قبلا تایید شده است"
    case t200 = "به دریافت کننده واریز شد"
    case NF = "not found"
    case returned = "طرف ۷۲ ساعت به شما بازگشت داده می شود"
}
