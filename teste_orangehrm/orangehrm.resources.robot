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
    Sleep    3
    Wait Until Element Is Visible    locator=//div[@class='orangehrm-login-branding']
    Click Element    locator=//input[contains(@name,'username')]
    Input Text    locator=//input[contains(@name,'username')]   text=${USUARIO}
    Sleep    3
    Click Element    locator=//input[contains(@type,'password')]
    Input Text    locator=//input[contains(@type,'password')]   text=${SENHA}
    Sleep    3
    Click Button    locator=//button[@type='submit'][contains(.,'Login')]
    Wait Until Element Is Visible    css=.oxd-text.oxd-text--h6.oxd-topbar-header-breadcrumb-module
    Sleep    3

    #Nos testes web, podemos logar Screenshot com a SeleniumLibrary
    Log     Tirando print da tela principal após executar o teste
    Capture Page Screenshot      tela_de_principal_hrm.png

    #Log no console
    Log To Console    Finalizando o caso de teste 01

#---------------------------------------------------------------------
# Casos de teste 02 - Validar campos de login com dados Inválidos
    #ESTUDOS: Validar os campos com dados inválidos com variáveis local:
Inserir dados inválidos no username sendo "${USERNAME}" e password sendo "${PASSWORD}"
    
    Go To    url=${URL}
    Location Should Contain    opensource-demo.orangehrmlive.com
    Sleep    3
    Wait Until Element Is Visible    locator=//div[@class='orangehrm-login-branding']
    Click Element    locator=//input[contains(@name,'username')]
    Input Text    locator=//input[contains(@name,'username')]   text=${USERNAME}
    Log    Inserindo login inválido "Teste"

    Click Element    locator=//input[contains(@type,'password')]
    Input Text    locator=//input[contains(@type,'password')]   text=${PASSWORD}
    Log    Inserindo password inválido "123"

    Click Button    locator=//button[@type='submit'][contains(.,'Login')]
    Wait Until Element Is Visible    locator=${ERROR_MESSAGE}
    Log    Realizando a validação da mensagem de erro ao inserir dados inválidos

# Treinando IF/ELSE
#     IF ${IMG_ORANGE} === .orangehrm-login-branding
#     Logar informações quando a mensagem for igual a Teste
#     Log    message=Aqui a mesagem corresponde a Teste    console=True


# Logar informações quando a mensagem for igual a Teste
#     Log    A mensagem ${IMG_ORANGE} de erro é Teste
#     Log To Console    A mensagem ${IMG_ORANGE} de erro é Teste
    


# Casos de testes 03 - Realizar o cadastro de usuário do sistema - OrangeHRM
Cadastrar novo usuário no sistema OrangeHRM
    #Criar dados do usuário com tipo de variável (Dicionário chave-valor)
    Acessar/logar a tela principal orangehrm
    
    Wait Until Element Is Visible    locator=//a[contains(.,'Admin')]
    Click Element    locator=//a[contains(.,'Admin')]
    Wait Until Element Is Visible    locator=//div[contains(@class,'oxd-topbar-header-title')]

    #inserindo e selecionando dados do usuário para o cadastro
    Wait Until Element Is Visible    locator=(//input[contains(@class,'oxd-input oxd-input--active')])[2]
    Input Text    locator=(//input[contains(@class,'oxd-input oxd-input--active')])[2]    text=@{DADO_USUARIO}

    Wait Until Element Is Visible    locator=//div[@class='oxd-input-group__label-wrapper'][contains(.,'User Role')]
    Click Element    locator=(//div[contains(@class,'oxd-select-text--after')])[1]
    Click Element    locator=//div[@class='oxd-select-text-input'][contains(.,'ESS')]
