*** Settings ***
Documentation    Essa suite testa o site da https://opensource-demo.orangehrmlive.com/
Resource         orangehrm.resources.robot
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador
 
*** Test Cases ***
caso de teste 01 - Acessar/logar site orangehrm
    [Documentation]        Teste para acessar e logar no site orangehrm
    [Tags]                 acesso_orangehrm
    [Timeout]    20

    Acessar a tela principal orangehrm
 
# Caso de teste 02 -
