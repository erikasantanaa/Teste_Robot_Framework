*** Settings ***
Suite Teardown  Controlando o teardown da suite
Test Teardown   Controlando o teardown do teste

*** Test Cases ***
#### SUCESSO
Exemplo 01: Teste lidando com Suite e Test Teardowns
    Essa keyword fará o teste passar, não executando as keywords abaixo!
    Esse keyword vai passar sozinha!
    Essa keyword fará o teste falhar, não executando as keywords abaixo!

Exemplo 02: Teste lidando com Suite e Test Teardowns
    Esse keyword vai passar sozinha!
    Esse keyword vai passar sozinha!
    Esse aqui também vai passar com uma condição e vai parar de executar as keywords abaixo!
    Esse keyword vai passar sozinha!
    Esse keyword vai passar sozinha!

#### FALHAS
Exemplo 03: Teste lidando com Suite e Test Teardowns
    Esse keyword vai passar sozinha!
    Essa keyword fará o teste falhar, não executando as keywords abaixo!
    Esse keyword vai passar sozinha!
    Esse keyword vai falhar sozinha!

Exemplo 04: Teste lidando com Suite e Test Teardowns
    Esse keyword vai falhar sozinha!



*** Keywords ***
### SUITE TEARDOWNS
Controlando o teardown da suite
    Run Keyword If All Tests Passed     Log  Todos os testes passaram, posso enviar um e-mail, por exemplo!
    Run Keyword If Any Tests Failed     Log  Alguns testes falharam, posso enviar um e-mail, por exemplo!

### TEST TEARDOWNS
Controlando o teardown do teste
    Run Keyword If Test Passed          Log  Meu teste passou, não preciso apagar dados do banco de dados, por exemplo!
    Run Keyword If Test Failed          Log  Meu teste falhou, posso imprimir ou manter uma informação no banco de dados para analisar o erro, por exemplo!

### Controlando o STATUS
Essa keyword fará o teste passar, não executando as keywords abaixo!
    ##Pass Execution: Força o teste a passar e interrompe a execução das keywords seguintes.
    Pass Execution      message=Estou forçando meu teste a passar com sucesso!

Essa keyword fará o teste falhar, não executando as keywords abaixo!
    #Fail: Força o teste a falhar e interrompe a execução das keywords seguintes.
    Fail                msg=Estou forçando meu teste a falhar!

Esse aqui também vai passar com uma condição e vai parar de executar as keywords abaixo!
    #Run Keyword And Return Status: Executa uma keyword e retorna True ou False dependendo do resultado.
    ${STATUS}   Run Keyword And Return Status   Should Be True    "May" == "May"
    Log  ${STATUS}
    #Pass Execution: Força o teste a passar e interrompe a execução das keywords seguintes.
    #Pass Execution If: Força o teste a passar se a condição for verdadeira.
    Pass Execution If    ${STATUS}    message=May é igual a May, então passou!!

#Should Be True: Verifica se uma condição é verdadeira. Se for falsa, o teste falha.
Esse keyword vai passar sozinha!
    Should Be True    "May" == "May"

Esse keyword vai falhar sozinha!
    Should Be True    "May" == "João"

#RESUMO
# O código demonstra como controlar o comportamento de testes usando Suite Teardown e Test Teardown.
# Mostra como forçar a passagem ou falha de testes com Pass Execution e Fail.
# Utiliza condições para executar ações específicas com base no resultado dos testes (Run Keyword If All Tests Passed, Run Keyword If Any Tests Failed, etc.).
# É um exemplo didático para entender o fluxo de execução e o controle de teardowns no Robot Framework.