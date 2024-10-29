*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${BROWSER}      chrome
${URL}          https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${TELA_LOGIN}    //div[@class='orangehrm-login-branding']
${STATUS}   ${0}

#Existe tipos de variaveis globais - verificando cada uma que pode ser abordada para cada caso de teste: 
#Charve=valor ; Simples ;  Lista.
&{PESSOA}    nome=Érika Santana   email=erika@exemplo.com.br   idade=28   sexo=feminino
${SIMPLES}   Vamos ver os tipos de variáveis no robot!
@{FRUTAS}    morango   banana   maça   uva   abacaxi


#Login inválido
${ERROR_MESSAGE}    //p[contains(.,'Invalid credentials')]


*** Keywords ***
Abrir o navegador
    Open Browser    browser=chrome
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot 
    Close Browser


#caso de teste 01 - Acessar/logar site orangehrm
Acessar a tela principal orangehrm - usuário "${USUARIO}" e senha "${SENHA}"
    #ESTUDOS: Verificando resultados Variavies locail - pode ser utilizada somente na keyword em execução
    # "${USUARIO}" e "${SENHA}"
    Go To    url=${URL}
    Location Should Contain    opensource-demo.orangehrmlive.com

    Wait Until Element Is Visible    locator=//div[@class='orangehrm-login-branding']
    Click Element    locator=//input[contains(@name,'username')]
    Input Text    locator=//input[contains(@name,'username')]   text=${USUARIO}

    Click Element    locator=//input[contains(@type,'password')]
    Input Text    locator=//input[contains(@type,'password')]   text=${SENHA}

    Click Button    locator=//button[@type='submit'][contains(.,'Login')]
    Wait Until Element Is Visible    locator=//h6[contains(.,'Dashboard')]

    #ESTUDOS: Verificando resultados Variavies Globais - tipos de variaveis
    Log    Nome: ${PESSOA.nome} e email: ${PESSOA.email}
    Log    ${SIMPLES}
    Log    Essa tem que ser maça: ${FRUTAS[2]} e essa tem que ser morango: ${FRUTAS[0]}

    #ESTUDOS: Verificando resultados Variavies usando ARGUMENTOS - utilizando variáveis globais (PESSOA) e Set Variable If
    Uma subkeyword com argumentos   ${PESSOA.nome}   ${PESSOA.email}
    ${MENSAGEM_ALERTA}   Uma subkeyword com retorno   ${PESSOA.nome}   ${PESSOA.idade}
    Log     ${MENSAGEM_ALERTA}

Uma subkeyword com argumentos
    [Arguments]     ${NOME_USUARIO}   ${EMAIL_USUARIO}
    Log             Nome Usuário: ${NOME_USUARIO}
    Log             Email: ${EMAIL_USUARIO}

Uma subkeyword com retorno
    [Arguments]     ${NOME_USUARIO}   ${IDADE_USUARIO}
    ${MENSAGEM}     Set Variable If    ${IDADE_USUARIO}<18    Não autorizado! O usuário ${NOME_USUARIO} é menor de idade!   OK!Usuário é maior de idade!
    [Return]        ${MENSAGEM}


Acessar somente a tela principal sem realizar login
    Go To    url=${URL}
    Location Should Contain    opensource-demo.orangehrmlive.com

    Wait Until Element Is Visible    locator=//div[@class='orangehrm-login-branding']


#----------------------------------
# Casos de teste 02 - Validar campos de login 
    #ESTUDOS: Validar os campos com dados inválidos
Inserir dados inválidos no username sendo "${USERNAME}" e password sendo "${PASSWORD}"
    

    Wait Until Element Is Visible    locator=//div[@class='orangehrm-login-branding']
    Click Element    locator=//input[contains(@name,'username')]
    Input Text    locator=//input[contains(@name,'username')]   text=${USERNAME}

    Click Element    locator=//input[contains(@type,'password')]
    Input Text    locator=//input[contains(@type,'password')]   text=${PASSWORD}

    Click Button    locator=//button[@type='submit'][contains(.,'Login')]
    Wait Until Element Is Visible    locator=${ERROR_MESSAGE}