*** Settings ***
Library    SeleniumLibrary
#Suite Teardown    Close All Browsers

*** Variables ***
${PATH}    C:/Users/princ/OneDrive/Software Verification and Validation/swt-workshop/chromedriver.exe

*** Test Cases ***
User ซื้อของเล่นให้ลูกสาว เลือกวิธีการจัดส่งเป็น Kerry ชำระเงินบัตรเครดิตด้วย Visa และชำระเงินสำเร็จ
    แสดงสินค้า
    แสดงรายละเอียดสินค้า
    ระบุจำนวนสินค้าที่ซื้อ
    นำสินค้าใส่ตะกร้า
    เช็คชื่อที่อยู่จัดส่ง
    ยืนยันการสั่งซื้อและชำระเงินด้วยบัตรเครดิตวีซ่าคาร์ด
    ขอบคุณ

*** Keywords ***
แสดงสินค้า
    Open Browser    https://www.dminer.in.th/Product-list.html    gc    executable_path=${PATH}
    Element Should Contain    id=productName-1    expected=43 Piece Dinner Set
    Element Should Contain    id=productPrice-1    expected=12.95 USD
แสดงรายละเอียดสินค้า
    Click Button    viewMore-1
    Wait Until Element Contains    id=productName    43 Piece dinner Set
    Wait Until Element Contains    id=productBrand    CoolKidz
    Wait Until Element Contains    id=productPrice    12.95 USD
ระบุจำนวนสินค้าที่ซื้อ
    Input Text    id=productQuantity    1
นำสินค้าใส่ตะกร้า
    Click Button    addToCart
เช็คชื่อที่อยู่จัดส่ง
    Wait Until Element Contains    id=receiverName    ณัฐญา ชุติบุตร
    Element Should Contain    recevierAddress    405/37 ถ.มหิดล ต.ท่าศาลา อ.เมือง จ.เชียงใหม่ 50000
    Element Should Contain    recevierPhonenumber    0970809292
    Element Should Contain    totalProductPrice    12.95 USD
ยืนยันการสั่งซื้อและชำระเงินด้วยบัตรเครดิตวีซ่าคาร์ด
    Click Button    confirmPayment
    Wait Until Location Is    https://www.dminer.in.th/Payment
    Input Text    cardNumber    4719700591590995
    Input Text    expiredMonth    7
    Input Text    expiredYear    20
    Input Text    cvv    752
    Input Text    cardName    Karnwat Wongudom
    Click Button    Payment
ขอบคุณ
    Wait Until Element Contains    notify    วันเวลาที่ชำระเงิน 1/3/2563 13:30:00 หมายเลขคำสั่งซื้อ 8004359103 คุณสามารถติดตามสินค้าผ่านช่องทาง Kerry ด้วยหมายเลข 1785261900