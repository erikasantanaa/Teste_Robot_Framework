*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${LOGAR_URL}                         https://opensource-demo.orangehrmlive.com/web/index.php/auth/login

${LOGAR_USUARIO}                     Admin
${LOGAR_SENHA}                       admin123

${LOGAR_VISUAL_LOGIN}                //div[@class='orangehrm-login-branding']
${LOGAR_USERNAME}             //input[contains(@name,'username')]
${LOGAR_PASSWORD}             //input[contains(@type,'password')]
${LOGAR_BTN_LOGIN}            //button[@type='submit'][contains(.,'Login')]
${LOGAR_VISUAL_TELA_PRINCIPAL}       css=.oxd-text.oxd-text--h6.oxd-topbar-header-breadcrumb-module

*** Keywords ***

#caso de teste 01 - Acessar/logar site orangehrm
Acessar/logar a tela principal orangehrm
    
    Log    Inserir usuários
    Go To    url=${LOGAR_URL}
    Location Should Contain    opensource-demo.orangehrmlive.com
    Wait Until Element Is Visible    ${LOGAR_VISUAL_LOGIN}
    Click Element    ${LOGAR_USERNAME}
    Input Text    ${LOGAR__USERNAME}   text=${LOGAR_USUARIO}
    Click Element    ${LOGAR_PASSWORD}
    Input Text    ${LOGAR_PASSWORD}   text=${LOGAR_SENHA}

    Log     Tirando print da tela após inserir login e senha
    Capture Page Screenshot      tela_de_principal_hrm.png

    Click Button    ${LOGAR_BTN_LOGIN}
    Wait Until Element Is Visible    ${LOGAR_VISUAL_TELA_PRINCIPAL}

    Log     Tirando print da tela após logar
    Capture Page Screenshot      tela_de_principal_hrm.png