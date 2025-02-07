
*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${URL}          https://opensource-demo.orangehrmlive.com/web/index.php/auth/login

#Login inválido
${ERROR_MESSAGE}                        //p[contains(.,'Invalid credentials')]
${IMG_ORANGE}                           .orangehrm-login-branding

${LOGARINV_VISUAL_LOGIN}                //div[@class='orangehrm-login-branding']
${LOGARINV_USERNAME}                    //input[contains(@name,'username')]  
${LOGARINV_PASSWORD}                    //input[contains(@type,'password')] 
${LOGARINV_BTN_LOGIN}                   //button[@type='submit'][contains(.,'Login')] 
${LOGARINV_} 


*** Keywords ***

#---------------------------------------------------------------------
# Casos de teste 02 - Validar campos de login com dados Inválidos
    #ESTUDOS: Validar os campos com dados inválidos com variáveis local:
Inserir dados inválidos no username sendo "${USERNAME}" e password sendo "${PASSWORD}"
    
    Go To    url=${URL}
    Location Should Contain    opensource-demo.orangehrmlive.com

    Wait Until Element Is Visible    ${LOGARINV_VISUAL_LOGIN}

    Log    Inserindo login inválido "Teste"
    Click Element    ${LOGARINV_USERNAME}
    Input Text    ${LOGARINV_USERNAME}   text=${USERNAME}

    Log    Inserindo password inválido "123"
    Click Element    ${LOGARINV_PASSWORD}
    Input Text    ${LOGARINV_PASSWORD}   text=${PASSWORD}
    
    Log    Realizando a validação da mensagem de erro ao inserir dados inválidos
    Click Button    ${LOGARINV_BTN_LOGIN}
    Wait Until Element Is Visible    ${ERROR_MESSAGE}
    
    Log     Tirando print da tela após inserir login e senha
    Capture Page Screenshot      tela_de_principal_hrm.png
