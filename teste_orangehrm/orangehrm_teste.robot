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
    ...                    E somente acessar a tela de login acessar a tela principal.
    [Tags]                 acesso_orangehrm
    # [Timeout]    20

    Acessar/logar a tela principal orangehrm

    Acessar somente a tela de login sem realizar login
 
# Caso de teste 02 -
Casos de teste 02 - Validar campos de login
    [Documentation]        Teste para acessar Validar vampos de longin com informações
    ...                    inválidas.
    [Tags]                 acesso_orangehrm_validar_campos
    # [Timeout]    20

    #Dados inválidos: Login e senha 
    Inserir dados inválidos no username sendo "teste" e password sendo "123"

Casos de testes 03 - Realizar o cadastro de usuário do sistema - OrangeHRM
    [Documentation]        Teste para cadastar usuário no sistema.
    [Tags]                 acesso_logar_orangehrm

    #Dados do usuário estão nas variáveis no arquivo resources:
    Cadastrar novo usuário no sistema OrangeHRM


    
    
