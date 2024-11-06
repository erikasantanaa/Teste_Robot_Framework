*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${BROWSER}      chrome
${URL}          https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${TELA_LOGIN}    //div[@class='orangehrm-login-branding']
${STATUS}   ${0}

${USUARIO}     Admin
${SENHA}       admin123


    #ESTUDOS: Existe tipos de variaveis globais - verificando cada uma que pode ser abordada para cada caso de teste: 
    #Charve=valor ; Simples ;  Lista.
&{PESSOA}    nome=Érika Santana   email=erika@exemplo.com.br   idade=28   sexo=feminino
${SIMPLES}   Vamos ver os tipos de variáveis no robot!
@{FRUTAS}    morango   banana   maça   uva   abacaxi

@{DADO_USUARIO}    Testando 


#Login inválido
${ERROR_MESSAGE}    //p[contains(.,'Invalid credentials')]

    #ESTUDOS:     Escopos das variáveis
    # A variável "global" pode ser utilizada em todas as suítes em execução
        #Set Global Variable    ${GLOBAL_CRIADA_EM_TEMPO_EXECUCAO}

    #A variável "suite" pode ser utilizada somente nos testes da suíte em execução
        #Set Suite Variable     ${SUITE_CRIADA_EM_TEMPO_EXECUCAO}    Variável da suíte

    #A variável "test" pode ser utilizada somente nas todas as keywords do teste em execução
        #Set Test Variable      ${TESTE_01}   Variável do teste 01

    #A variável "local" pode ser utilizada somente na keyword em execução
        #${LOCAL}    Set Variable    Variável local da keyword 01
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


Acessar somente a tela de login sem realizar login
    Go To    url=${URL}
    Location Should Contain    opensource-demo.orangehrmlive.com

    Wait Until Element Is Visible    locator=//div[@class='orangehrm-login-branding']


#----------------------------------
# Casos de teste 02 - Validar campos de login 
    #ESTUDOS: Validar os campos com dados inválidos com variáveis local:
Inserir dados inválidos no username sendo "${USERNAME}" e password sendo "${PASSWORD}"
    

    Wait Until Element Is Visible    locator=//div[@class='orangehrm-login-branding']
    Click Element    locator=//input[contains(@name,'username')]
    Input Text    locator=//input[contains(@name,'username')]   text=${USERNAME}

    Click Element    locator=//input[contains(@type,'password')]
    Input Text    locator=//input[contains(@type,'password')]   text=${PASSWORD}

    Click Button    locator=//button[@type='submit'][contains(.,'Login')]
    Wait Until Element Is Visible    locator=${ERROR_MESSAGE}


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
