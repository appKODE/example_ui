*** Settings ***
Documentation    Suite description
Variables    test_variables.py
Resource  resource.robot
Test Setup  Open Application  ${SERVER}
                   ...   deviceName=${DEVICE_NAME}
                   ...   appPackage=${APP}
                   ...   appActivity=ru.app.MainActivity
                   ...   platformName=${PLATFORM_NAME}
                   ...   platformVersion=${PLATFORM_VERSION}
Test Teardown  Close Application


*** Keywords ***
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


*** Test Cases ***
Demo
    [Tags]  Blabla
    Be sure you see the begin button
    Enter the phone number
