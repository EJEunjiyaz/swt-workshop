*** Settings ***
Library    SeleniumLibrary
Resource    resource-exercise-g1.robot

*** Test Cases ***
Post สวัสดี Robotframework ลงไปใน Timeline ของตนเอง
    Open facebook.com
    Type email
    Type password
    Click login
    Click textbox
    Press keys for text
    Click post

*** Keywords ***
Open facebook.com
    Open Browser    https://www.facebook.com    googlechrome    executable_path=${PATH}
Type email
    Input Text    name:email    ${EMAIL}
Type password
    Input Text    name:pass    ${PASSWORD}
Click login
    Click Button    login
Click textbox
    Wait Until Element Is Enabled    css:div.oajrlxb2.b3i9ofy5
    Click Element    css:div.oajrlxb2.b3i9ofy5
Press keys for text
    Wait Until Element Is Enabled    css:div.taijpn5t.cb02d2ww.j83agx80.rq0escxv.linmgsc8.bp9cbjyn
    Press Keys    None    สวัสดี Robotframework
Click post
    Wait Until Element Is Enabled    css:div.oajrlxb2.s1i5eluu
    Click Element    css:div.oajrlxb2.s1i5eluu.qu0x051f.esr5mh6w

