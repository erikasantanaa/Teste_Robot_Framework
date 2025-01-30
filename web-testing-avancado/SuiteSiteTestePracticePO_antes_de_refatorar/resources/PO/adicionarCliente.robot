*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***    
${ADC_CLEINTE_EMAIL}                            id=email_create
${ADC_CLEINTE_BTN_CREATE}                    id=SubmitCreate
${ADC_CLEINTE_ACCOUNT_CREATION_FORM}            xpath=//*[@id="account-creation_form"]//h3[contains(text(),"Your personal information")]
${ADC_CLEINTE_BTN_GENDER}                       id=id_gender2
${ADC_CLEINTE_FIRSTNAME}                        id=customer_firstname
${ADC_CLEINTE_LASTNAME}                         id=customer_lastname
${ADC_CLEINTE_PASSWORD}                         id=passwd 
${ADC_CLEINTE_ADDRESS}                          id=address1
${ADC_CLEINTE_CITY}                             id=city  
${ADC_CLEINTE_STATE}                            id=id_state 
${ADC_CLEINTE_BTN_ACCOUNT}                      submitAccount
${ADC_CLEINTE_CONFERIR_CADASTRO}                xpath=//*[@id="center_column"]/p
${ADC_CLEINTE_VISUALIZAR}                       xpath=//*[@id="header"]/div[2]//div[1]/a/span



*** Keywords ***
Informar um e-mail válido
    Wait Until Element Is Visible   ${ADC_CLEINTE_EMAIL}
    ${EMAIL}                        Generate Random String
    Input Text                      ${ADC_CLEINTE_EMAIL}    ${EMAIL}@testerobot.com

Clicar em "Create an account"
    Click Button    ${ADC_CLEINTE_BTN_CREATE}
Preencher os dados obrigatórios
    Wait Until Element Is Visible   ${ADC_CLEINTE_ACCOUNT_CREATION_FORM} 
    Click Element                   ${ADC_CLEINTE_BTN_GENDER}
    Input Text                      ${ADC_CLEINTE_FIRSTNAME}     May
    Input Text                      ${ADC_CLEINTE_LASTNAME}      Fernandes
    Input Text                      ${ADC_CLEINTE_PASSWORD}               123456
    Input Text                      ${ADC_CLEINTE_ADDRESS}               Rua Framework, Bairro Robot
    Input Text                      ${ADC_CLEINTE_CITY}                 Floripa
    Set Focus To Element            ${ADC_CLEINTE_STATE}

    ### No firefox ocorreu problema ao achar o listbox State, então coloquei um if para esperar
    ### pelo elemento quando for firefox

    # Run Keyword If    '${BROWSER}'=='firefox'  Wait Until Element Is Visible   id=id_state
    # Select From List By Index       id=id_state              9
    # Input Text                      id=postcode              12345
    # Input Text                      id=phone_mobile          99988877

Submeter cadastro
    Click Button    ${ADC_CLEINTE_BTN_ACCOUNT}

    ### Conferências
Conferir se o cadastro foi efetuado com sucesso
    Wait Until Element Is Visible    ${ADC_CLEINTE_CONFERIR_CADASTRO} 
    Element Text Should Be           ${ADC_CLEINTE_CONFERIR_CADASTRO} 
    ...    Welcome to your account. Here you can manage all of your personal information and orders.
    Element Text Should Be    ${ADC_CLEINTE_VISUALIZAR}     May Fernandes