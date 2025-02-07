*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${BROWSER}      browser=chrome
${URL}          https://opensource-demo.orangehrmlive.com/web/index.php/auth/login

${OPTIONS}      add_argument("--disable-dev-shm-usage"); add_argument("--headless"); add_argument("--no-sandbox")

#Opções necessárias

*** Keywords ***
Abrir o navegador
    Open Browser    ${BROWSER}    options=${OPTIONS}
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser

    
#---------------------------------------------------------------------
# Casos de teste 02 - Validar campos de login com dados Inválidos
    #ESTUDOS: Validar os campos com dados inválidos com variáveis local:


#---------------------------------------------------------------------

#Caso de teste 03 - Cadastrar usuário em menu Admin


# FAZEEEER


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