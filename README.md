# IDPay_Gateway_Payments

# برای دریافت لینک پرداخت یا داده های مربوطه میبایست به صورت زیر عمل کرد:

### 1- تعریف متغیر ها و ارسال پارامتر ها به توابع 



        var getpayment = payment()
        
        getpayment.delegate = self --> شناساندن delegate به controller تان
        
        getpayment.getPay(api_key: "api key ای که برای وب سرویس شما است", callbackURL: "آدرس ای که در وب سرویس داده اید" ,order_id: "شناسه ی خرید شما", amount: مبلغ)


### 2- افزودن delegate به controller مربوطه مثال:
   
        
         extention viewcontroller:DataModelDelegate{
        
            func didReciveData(data:Transaction){
        
        برای دریافت لینک درگاه پرداخت و id تراکنش می باشد

            }
       
            func didFildWithError(error:Error){
        برای ارور احتمالی یا عدم برقراری ارتباط با سرور و.... می باشد

            }
            
            func didErrorCreate(errors:Transaction){
        
        برای ارور در ساخت لینک درگاه پرداخت از سوی سرور می باشد

            }
        
        }
        
   </code>
   
### 3- پارامتر های زیر در تابع ساخت لینک درگاه پرداخت اختیاری می باشد:
   
   <code>
        
    name,
        
    phone,
        
    mail,
        
    description 

</code>
    
#### و میتوانید از هر کدام به دلخواه اسفاده نمایید

### ۴- در تابع showListTransaction در کلاس  ListTransaction پارامتر count بصورت دلخواه برای دریافت  لیست تراکنش ها به تعداد دلخواه تنظیم شده است

### ۵- در کلاس VerifyTransaction تابع Verify پارامتر completion برای مسائل داخل پکیج طراحی شده است و کاربر نباید از آن استفاده کند

### ۶- کلاس ها٫ توابع ها٫ delegate ها‍٬ توابع delegate ها و کاربد آنها

### مثال payment که در بالا اشاره شده است

### کلاس QueryTransacction

#### نام تابع:
        QueryStatusTransaction:
        
        id: شناسه ی تراکنش دریافت شده از شمت سرور
     
        order_id: شناسه ی تراکنش شما
        
        api_key: api key ای که برای وب سرویس شما است

#### نامdelegate:

        QueryDeleget
        
#### توابعdelegate:

    func data_query(data:Transaction_Query_Information): برای دریافت داده ها اعم از:
   
    id
   
    order_id
    
    amount
    
    date:تاریخ بصورت timestamp است و باید به وقت ملحی تبدیل گردد
    
    Track_ID_Payment
    
    Track_ID_IDPay
    
    status
    
    description
    
    func error_query(erroe:Error): برای ارور احتمالی یا عدم برقراری ارتباط با سرور و.... می باشد

## نکته : متغیر عمومی manual اگر false باشد تراکنش درحال اننتظار تایید را بطور خودکار تایید می نماید و وضعیت نهایی را نشان می دهد ولی اگر true باشد فقط وضعیت تراکنش را نشان میدهد که بطور پیشفرض روی false می باشد

### کلاس ListTransaction

#### نام تابع:
       
       showListTransaction
       
       api_key: api key ای که برای وب سرویس شما است
       
       count: تعداد تراکنش های دلخواه (اختیاری)
    
#### نام delegate:

    ListTransactionDelegate

#### توابعdelegate:
   
    func showListTransaction(data:[TransactionList]): آرایه ای از تمام اجزاء هر تراکنش بطور کامل
    func errorTransaction(erroe:Error): برای ارور احتمالی یا عدم برقراری ارتباط با سرور و.... می باشد


### کلاس VerifyTransaction

#### نام تابع:Verify

        id: شناسه ی تراکنش دریافت شده از شمت سرور
        
        order_id: شناسه ی تراکنش شما
        
        api_key: api key ای که برای وب سرویس شما است
        
        complition: برای موارد درون پکیجی است و در کد شما می تواند خالی باشد یا حذف شود

#### نام delegate:

    VerifyTransactionDelegate
    
#### توابع delegate:
   
    func Verify_Data(data:VerifyTransactionStatus): نتایج دریافتی از حاصل تایید تراکنش که شامل موارد زیر است:
    
     status
     track_Id
     Id
     order_Id
     amount
     date
     payment_trackId
     payment_amount
     payment_cardNumber
     payment_hashCardNumber
     payment_date
     verify_date
     
    func Verify_Error_System(error:Error):  برای ارور احتمالی یا عدم برقراری ارتباط با سرور و.... می باشد
    func Verify_Error(errorMessage:String): برای اررور های احتمالی که از طرف سرور فرستاده می شود


# برای حمایت مالی (DONATE) می توانید از لینک زیر استفاده کنید

## https://idpay.ir//sinatah
