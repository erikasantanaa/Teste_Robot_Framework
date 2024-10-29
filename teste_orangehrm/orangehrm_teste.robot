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
    ...                    
    [Tags]                 acesso_orangehrm
    # [Timeout]    20

    Acessar a tela principal orangehrm - usuário "Admin" e senha "admin123"
    Acessar somente a tela principal sem realizar login
    
 
# Caso de teste 02 -
Casos de teste 02 - Validar campos de login com condicional IF
    [Documentation]        Teste para acessar e logar no site orangehrm utilizando
    ...                    a condição de blocos IF 
    [Tags]                 acesso_orangehrm_blocos_if
    # [Timeout]    20

    #Dados inválidos: Login e senha
    Acessar somente a tela principal sem realizar login
    
    Inserir dados inválidos no username sendo "teste" e password sendo "123"
    
    
