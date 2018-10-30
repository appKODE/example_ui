*** Settings ***
Documentation    Suite description
Library  AppiumLibrary

*** Variables ***
${SERVER}   http://localhost:4723/wd/hub
${DEVICE_NAME}  EMULATOR
${APP}  ru.appkode.friendsclub.internal
${PLATFORM_NAME}    Android
${PLATFORM_VERSION}    7.0
${START_BUTTON}    ${APP}:id/welcome_controller_phone_button
${PHONE_INPUT}    ${APP}:id/phone_input_edit_text
${PROGRESS_BUTTON}    ${APP}:id/progress_button_button
${PASSWORD_TOOLBAR}    ${APP}:id/password_input_controller_toolbar
${PASSWORD_INPUT}    ${APP}:id/password_input_controller_edit_text
${NO_PASSWORD}    ${APP}:id/password_input_controller_restore_password_button
${PASSWORD_EYE}    ${APP}:id/text_input_password_toggle
${PASSWORD_FORGOT}    ${APP}:id/password_input_forget_password_button
${MYCARD_TOOLBAR}    ${APP}:id/card_controller_toolbar
${BARCODE}    ${APP}:id/card_controller_barcode
${CARD}    ${APP}:id/card_layout_card
${SHOW_BARCODE_BUTTON}    ${APP}:id/card_controller_show_barcode
${CARD_TAB}    ${APP}:id/authorized_tabs_card
${SALES_TAB}    ${APP}:id/authorized_tabs_sale
${MAP_TAB}    ${APP}:id/authorized_tabs_map
${TUTORIAL}    ${APP}:id/tutorial_controller_foreground
${CLOSE_CARD}    ${APP}:id/card_controller_close_barcode
${SALE_TOOLBAR}    ${APP}:id/sale_list_toolbar
${LOOKFOR}    ${APP}:id/sale_download_weekly_catalog_button
${SALES_LIST}    ${APP}:id/sale_list_recycler_view
${SALE_ITEM}    ${APP}:id/sale_item_title


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
    Input text    id=${PHONE_INPUT}  text=9097848069
    Element Should Be Enabled   id=${PROGRESS_BUTTON}
    Click Element    id=${PROGRESS_BUTTON}

Enter Password
    Wait Until Element Is Visible    id=${PASSWORD_INPUT}
    Input text    id=${PASSWORD_INPUT}  text=123456
    Click Element    id=${PASSWORD_EYE}
    ${TEXT} =  Get Text    id=${PASSWORD_INPUT}
    SHOULD BE EQUAL  ${TEXT}  123456
    Click Element    id=${PROGRESS_BUTTON}

Give a glance on profile
    Wait Until Element Is Visible    id=${TUTORIAL}
    repeat keyword    6    Click Element    id=${TUTORIAL}
    Wait Until Element Is Visible    id=${MYCARD_TOOLBAR}
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
    Give a glance on sales
