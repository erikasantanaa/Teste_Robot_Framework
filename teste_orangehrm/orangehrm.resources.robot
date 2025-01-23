*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${BROWSER}      chrome
${URL}          https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${STATUS}   ${0}

${USUARIO}     Admin
${SENHA}       admin123

@{DADO_USUARIO}    Testando

#Login inválido
${ERROR_MESSAGE}      //p[contains(.,'Invalid credentials')]

${IMG_ORANGE}        .orangehrm-login-branding



*** Keywords ***
Abrir o navegador
    Open Browser    browser=chrome
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser


#caso de teste 01 - Acessar/logar site orangehrm
Acessar/logar a tela principal orangehrm
    #ESTUDOS: Verificando resultados Variavies locail - pode ser utilizada somente na keyword em execução
    # "${USUARIO}" e "${SENHA}"

    Go To    url=${URL}
    Location Should Contain    opensource-demo.orangehrmlive.com
    Wait Until Element Is Visible    locator=//div[@class='orangehrm-login-branding']
    Click Element    locator=//input[contains(@name,'username')]
    Input Text    locator=//input[contains(@name,'username')]   text=${USUARIO}
    Click Element    locator=//input[contains(@type,'password')]
    Input Text    locator=//input[contains(@type,'password')]   text=${SENHA}

    Log     Tirando print da tela após inserir login e senha
    Capture Page Screenshot      tela_de_principal_hrm.png

    Click Button    locator=//button[@type='submit'][contains(.,'Login')]
    Wait Until Element Is Visible    css=.oxd-text.oxd-text--h6.oxd-topbar-header-breadcrumb-module

    #Log no console
    Log To Console    Finalizando o caso de teste 01
    

#---------------------------------------------------------------------
# Casos de teste 02 - Validar campos de login com dados Inválidos
    #ESTUDOS: Validar os campos com dados inválidos com variáveis local:
Inserir dados inválidos no username sendo "${USERNAME}" e password sendo "${PASSWORD}"
    
    Go To    url=${URL}
    Location Should Contain    opensource-demo.orangehrmlive.com

    Wait Until Element Is Visible    locator=//div[@class='orangehrm-login-branding']
    Click Element    locator=//input[contains(@name,'username')]
    Input Text    locator=//input[contains(@name,'username')]   text=${USERNAME}
    Log    Inserindo login inválido "Teste"

    Click Element    locator=//input[contains(@type,'password')]
    Input Text    locator=//input[contains(@type,'password')]   text=${PASSWORD}
    
    Log     Tirando print da tela após inserir login e senha
    Capture Page Screenshot      tela_de_principal_hrm.png

    Log    Inserindo password inválido "123"

    Click Button    locator=//button[@type='submit'][contains(.,'Login')]
    Wait Until Element Is Visible    locator=${ERROR_MESSAGE}
    Log    Realizando a validação da mensagem de erro ao inserir dados inválidos
    



#---------------------------------------------------------------------

#Caso de teste 03 - Cadastrar usuário em menu Admin



#---------------------------------------------------------------------
# Caso de teste 04 - Pesquisar por usuário 
Seleciono o campo Admin
    Wait Until Element Is Visible    locator=//span[normalize-space()='Admin']
    Click Element    locator=//span[normalize-space()='Admin']
    Wait Until Element Is Visible    locator=//div[@class='oxd-topbar-header-title']
    Sleep    2

    Log     Tirando print da tela após clicar no campo Admin
    Capture Page Screenshot      tela_de_principal_hrm.png


Preencher o campo Username sendo "${USER_NAME}" no formulário System Users 
    Wait Until Element Is Visible    locator=//label[normalize-space()='Username']
    Wait Until Element Is Visible    locator=//div[@class='oxd-input-group oxd-input-field-bottom-space']//div//input[@class='oxd-input oxd-input--active']

    Input Text    locator=//div[@class='oxd-input-group oxd-input-field-bottom-space']//div//input[@class='oxd-input oxd-input--active']    text=${USER_NAME}

Selecionar o campo User role sendo "ESS" no formulário System Users 
    Wait Until Element Is Visible    locator=(//div[@class='oxd-input-group__label-wrapper'])[2]
    Wait Until Element Is Visible    locator=(//i[@class='oxd-icon bi-caret-down-fill oxd-select-text--arrow'])[1]

    Click Element    locator=(//i[@class='oxd-icon bi-caret-down-fill oxd-select-text--arrow'])[1]
    Click Element    locator=//div[@class='oxd-select-text-input'][normalize-space()='ESS']


    Log     Tirando print da tela após inserir informações no formulário
    Capture Page Screenshot      tela_de_principal_hrm.png


#---------------------------------------------------------------------
# caso de teste 05 - Excluir usuário cadastrado