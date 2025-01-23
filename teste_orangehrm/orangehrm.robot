*** Settings ***
Documentation    Essa suite testa o site https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
Resource         orangehrm.resources.robot
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


caso de teste 03 - cadastrar usuário em menu Admin
    [Documentation]     Realizar o cadastramento de usuário no menu Admin.
    [Tags]              teste-cadastrar-usuario
    [Timeout]    30
    


# caso de teste 04 - Pesquisar por usuário 
#     [Documentation]     Realizar teste de pesquisa de usuário.
#     [Tags]              teste-pesquisar
#     [Timeout]    30

#     Acessar/logar a tela principal orangehrm
#     Seleciono o campo Admin
#     Preencher o campo Username sendo "${USER_NAME}" no formulário System Users 
#     Selecionar o campo User role sendo "ESS" no formulário System Users 

caso de teste 05 - Excluir usuário cadastrado
    [Documentation]     Realizar a exclusão de usuário no menu Admin.
    [Tags]              teste-excluir-usuário
    [Timeout]    30