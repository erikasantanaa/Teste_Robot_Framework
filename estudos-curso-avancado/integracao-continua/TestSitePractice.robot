*** Settings ***
Documentation    Essa suite testa o site https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
Resource         ./resources/resource.robot 
Resource         ./resources/PO/logar.robot 
Resource         ./resources/PO/logar-invalido.robot
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador


*** Test Cases ***
caso de Teste 01 - Acessar/logar site orangehrm
    [Documentation]    Realizar teste para acessar o login e a tela principal.
    [Tags]            teste-acessar-logar
    [Timeout]    30

    Acessar/logar a tela principal orangehrm
  

caso de Teste 02 - Validar campos de login com dados Inválidos
    [Documentation]     Realizar teste para validação de campos com dados inválidos.
    [Tags]              teste-acessar-logar-invalido
    [Timeout]    30

    Inserir dados inválidos no username sendo "teste" e password sendo "123"