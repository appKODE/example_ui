*** Settings ***
Documentation    Source file with reusable actions
Library  AppiumLibrary


*** Keywords ***
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

