*** Settings ***
Documentation   Testcase1
Library         SeleniumLibrary
Suite Setup     Open Browser    http://automationexercise.com   chrome
Suite Teardown    Close Browser

*** Variables ***
${name}     user01
${email}    ex00@example.com
${password}     123456
${firstname}    usert
${lastname}     passt
${company}      tester comp.
${address1}      1234
${address2}      1234
${State}        Alabama
${City}         Alabama
${Zip}          12345
${phone}    1234567890



*** Keywords ***
Click SignupPage
    Click Element   //*[@id="header"]/div/div/div/div[2]/div/ul/li[4]/a

Input SignupData
    Input Text  //*[@id="form"]/div/div/div[3]/div/form/input[2]    ${name}
    Input Text  //*[@id="form"]/div/div/div[3]/div/form/input[3]    ${email}

Click SignupData
    Click Element   //*[@id="form"]/div/div/div[3]/div/form/button

Click choosePrefixName
    Click Element   id_gender1

Input informationSignUp
    Input Text  password   ${password}
    Select From List By Label  days    1
    Select From List By Label  months  January
    Select From List By Label  years   2000

Select Checkbox
    Click Element   newsletter
    Click Element   optin

Input MoreInformationSignUp
    Input Text  first_name   ${firstname}
    Input Text  last_name    ${lastname}
    Input Text  company      ${company}
    Input Text  address1     ${address1}
    Input Text  address2     ${address2}
    Select From List By Label  country  United States
    Input Text  state        ${State}
    Input Text  city         ${City}
    Input Text  zipcode    ${Zip}
    input Text  mobile_number  ${phone}

Click CreateAccount
    Click Element   //*[@id="form"]/div/div/div/div[1]/form/button

Click Continue1
    Click Element   //*[@id="form"]/div/div/div/div/a

Click DeleteAccount
    Click Element   //*[@id="header"]/div/div/div/div[2]/div/ul/li[5]/a

Click Continue2
    Click Element    //*[@id="form"]/div/div/div/div/a

*** Test Cases ***
Testcase1
    [Documentation]   Testcase1
    Page Should Contain Element   //*[@id="header"]/div/div/div/div[2]/div/ul/li[1]/a
    Click SignupPage
    Page Should Contain Element   //*[@id="form"]/div/div/div[3]/div/h2
    Input SignupData
    Click SignupData
    Page Should Contain Element   //*[@id="form"]/div/div/div/div[1]/h2/b
    Click choosePrefixName
    Input informationSignUp
    Select Checkbox
    Input MoreInformationSignUp
    Click CreateAccount
    Page Should Contain Element   //*[@id="form"]/div/div/div/h2/b
    Click Continue1
    Page Should Contain Element   //*[@id="header"]/div/div/div/div[2]/div/ul/li[10]/a
    Click DeleteAccount
    Page Should Contain Element   //*[@id="form"]/div/div/div/h2/b
    Click Continue2
