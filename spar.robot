*** Settings ***
Documentation    Suite description
Library  AppiumLibrary
Variables    test_variables.py


*** Keywords ***
Open the app
    Open Application  ${SERVER}
                   ...   deviceName=${DEVICE_NAME}
                   ...   appPackage=${APP}
                   ...   appActivity=ru.appkode.friendsclub.MainActivity
                   ...   platformName=${PLATFORM_NAME}
                   ...   platformVersion=${PLATFORM_VERSION}

Swipe that crazy screen
    ${WIDTH} =  Get Window Width
    ${HEIGHT} =  Get Window Height
    ${STARTX} =  Evaluate  (${WIDTH} * 0.8)
    ${STARTY} =  EVALUATE  (${HEIGHT} * 0.5)
    ${ENDY} =  EVALUATE  (${HEIGHT} * 0.5)
    ${ENDX} =  EVALUATE  (${WIDTH} * 0.1)
    Swipe  ${STARTX}  ${STARTY}  ${ENDX}  ${ENDY}

Scroll that crazy screen
    ${WIDTH} =  Get Window Width
    ${HEIGHT} =  Get Window Height
    ${STARTX} =  Evaluate  (${WIDTH} * 0.5)
    ${STARTY} =  EVALUATE  (${HEIGHT} * 0.8)
    ${ENDY} =  EVALUATE  (${HEIGHT} * 0.2)
    ${ENDX} =  EVALUATE  (${WIDTH} * 0.5)
    Swipe  ${STARTX}  ${STARTY}  ${ENDX}  ${ENDY}

Be sure you see the begin button
    Sleep  1
    Swipe that crazy screen
    Sleep  2
    Swipe that crazy screen
    Sleep  2
    Swipe that crazy screen
    Sleep  2
    Wait Until Element Is Visible    id=${START_BUTTON}
    Click Element    id=${START_BUTTON}

Enter the phone number
    Wait Until Element Is Visible    id=${PHONE_INPUT}
    Input text    id=${PHONE_INPUT}  text=9097848068
    Element Should Be Enabled   id=${PROGRESS_BUTTON}
    Click Element    id=${PROGRESS_BUTTON}

Check Next screen
    ${OTP_NEEDED} =  run keyword  element should be visible    id=${OTP_CONTROLL}
    run keyword if   ${OTP_NEEDED}    Enter OTP    else    Enter Password


Enter OTP
    element should be visible    id=${OTP_CONTROLL}
    Click Element    id=${OTP_KEYBOARD}_1
    Click Element    id=${OTP_KEYBOARD}_2
    Click Element    id=${OTP_KEYBOARD}_3
    Click Element    id=${OTP_KEYBOARD}_4

Enter Password
    Wait Until Element Is Visible    id=${PASSWORD_INPUT}
    Input text    id=${PASSWORD_INPUT}  text=123456
    Click Element    id=${PASSWORD_EYE}
    ${TEXT} =  Get Text    id=${PASSWORD_INPUT}
    SHOULD BE EQUAL  ${TEXT}  123456
    Click Element    id=${PROGRESS_BUTTON}

Give a glance on profile
    wait until element is visible  id=${PROFILE_SKIP}
    Click Element    id=${PROFILE_SKIP}
    Wait Until Element Is Visible    id=${TUTORIAL}
    repeat keyword    5    Click Element    id=${TUTORIAL}
    Wait Until Element Is Visible    id=${BARCODE}
    Click Element    id=${BARCODE}
    Click Element    id=${CARD}
    Click Element    id=${SHOW_BARCODE_BUTTON}
    Click Element    id=${CLOSE_CARD}

Give a glance on sales
    Click Element    id=${SALES_TAB}
    Element Should Be Visible    id=${SALE_TOOLBAR}
    Element Should Be Visible    id=${SALES_LIST}
    Scroll that crazy screen
    Sleep  2
    Click Element    id=${SALE_ITEM}
    Go Back
    Click Element    id=${LOOKFOR}


*** Test Cases ***
Demo
    [Tags]  Blabla
    Open the app
    Be sure you see the begin button
    Enter the phone number
    Enter Password
    Give a glance on profile
