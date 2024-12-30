*** Settings ***
Documentation    Essa suite testa o site da https://opensource-demo.orangehrmlive.com/
Resource         orangehrm.resources.robot
Test Setup       Abrir o navegador 
Test Teardown    Fechar o navegador 

#Exemplo para testar log  no console
# Test Setup      Log To Console    ${\n}
# Test Teardown   Log To Console    ${\n}
 
*** Test Cases ***
casos de teste 01 - Acessar/logar site orangehrm
    [Documentation]        Teste para acessar e logar no site orangehrm.
    ...                    E somente acessar a tela de login e tela principal.
    [Tags]                 acesso_orangehrm
    # [Timeout]    20

    Acessar/logar a tela principal orangehrm

    Acessar somente a tela de login sem realizar login
 
# Caso de teste 02 -
Caso de teste 02 - Verificar Validação nos campos de login (Username e Password)
    [Documentation]        Teste para acessar Validar vampos de longin com informações
    ...                    inválidas.
    [Tags]                 acesso_orangehrm_validar_campos
    # [Timeout]    20

    #Dados inválidos: Login e senha 
    Inserir dados invalidos no campo username sendo "teste" e password sendo "123"
    Verificar a mensagem de alerta para dados invalidos

Caso de testes 03 - Realizar o login de acesso 
    [Documentation]        Teste para realizar o login e acessar a tela principal do OrangeHRM
    [Tags]                 acesso_logar_orangehrm

    Inserir dados no campo username sendo "Admin" e password sendo "admin123"
    Acessar a tela principal do OrangeHRM

Caso de teste 04 - Pesquisar por usuário 
    [Documentation]        Teste para realizar a pesquisa de usuário
    [Tags]                 pesquisar-usuario_orangehrm
    
    Selecionar o campo Admin
    Preencher o campo Username sendo "usertestname" no formulário System Users 
    Selecionar o campo User role sendo "ESS" no formulário System Users 
    Preencher o campo Employee Name sendo "Vin Diesel" no formulário System Users 
    Selecionar o campo Status sendo "Enabled" no formulário System Users 
    Selecionar o botão Search
    Visualizar o resultado da pesquisa confirmando os dados informados

Caso de teste 05 - Cadastrar usuário   
    [Documentation]        Teste para realizar o cadastro de usuário
    [Tags]                 cadastrar-usuario_orangehrm

    
    Selecionar o campo Admin
    Selecionar o botão Add
    Selecionar o campo User Role sendo "Admin"
    Preencher o campo Employee Name sendo "#COLOCAR AUTOMATICO PARA O NOME"
    Selecionar o campo Status sendo "Enabled"
    Preencher o campo Username sendo "#COLOCAR AUTOMATICO PARA O NOME"
    Preencher o campo Password sendo "123456789"
    Preencher o campo Confirm Password sendo "123456789"
    Selecionar o botão Save
    Visualizar o cadastro concluido do usuário na tela principal Admin
    
    
