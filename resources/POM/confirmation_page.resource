*** Settings ***
Library    Browser
Library    String


*** Variables ***
${CONFIRMATION}    //h2[.='Appointment Confirmation']
${APPOINTMENT_CARD}    //div[div/h2[.="Appointment Confirmation"]]
${C_VERIFY_STRING}    //div[label[contains(.,"[[TO_CHANGE]]")]]/following-sibling::div/p


${GO_HOME}    //a[.='Go to Homepage']



*** Keywords ***
Verify Selected Choice
    [Documentation]    Verify that the choice in confirmation page is the same from the appointment.
    [Arguments]    &{data}


    FOR    ${key}    ${value}    IN    &{data}
        # Replace word with key name.
        ${verify_string}    String.Replace String    ${C_VERIFY_STRING}    [[TO_CHANGE]]    ${key}
        # Get text from replace word XPATH
        ${text}    Get Text    ${verify_string}
        
        # Verify that text from confirmation page and value input from previous page is the same.
        Should Be Equal    ${text}    ${value}

    END
    
Go To Home Page
    [Documentation]    Test go to home page.
    common.Verify Element Then Click    ${GO_HOME} 