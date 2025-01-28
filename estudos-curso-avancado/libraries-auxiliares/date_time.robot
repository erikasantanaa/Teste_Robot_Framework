*** Settings ***
Documentation   http://robotframework.org/robotframework/latest/libraries/DateTime.html
Library         DateTime

*** Test Cases ***
Exemplo 01: Pegando data e hora atuais
    Teste pegando data atual
    Teste pegando data e hora atuais
    Teste pegando ano - mês - dia separadamente

Exemplo 02: Manipulando o tempo
    Trabalhando com tempo

Exemplo 03: Cálculos com data
    Adicionando tempo de data
    Subtraindo tempo de data

*** Keywords ***
Teste pegando data atual
    #O 'y' do ano esta em minusculo, indicando que somente os 2 ultimos digitos serão informados.
    #Pegar a data atual que o robot esta rodando
    ${AGORA}    Get Current Date     result_format=%d-%m-%y
    Log         ${AGORA}

Teste pegando data e hora atuais
     #O 'Y' do ano esta em maiusculo, indicando que somente os 4 digitos serão informados.
    ${AGORA}    Get Current Date     result_format=%Y-%m-%dT%H:%M:%S
    Log         ${AGORA}

Teste pegando ano - mês - dia separadamente
    ${HOJE}     Get Current Date
    ${HOJE}     Convert Date   ${HOJE}   datetime
    Log         ${HOJE.day}-${HOJE.month}-${HOJE.year}

Trabalhando com tempo
    ${HORA}     Convert Time	1 minute 30 seconds
    Log         São ${HORA} segundos em 1 minuto e 30 segundos!
    ${HORA}     Convert Time	5400   verbose
    Log         5400 segundos é ${HORA}!
    ${HORA}     Convert Time	5500   timer   exclude_millis=yes
    Log         5500 segundos é ${HORA}!

Adicionando tempo de data
    #podemos manipular a data para passar uma data ou pegar a data atual
    ${ANTES}    Get Current Date
    ${DEPOIS}   Add Time To Date    ${ANTES}   4 hours   result_format=%d-%m-%Y %H:%M:%S
    Log         Antes: ${ANTES} - Depois: ${DEPOIS}
    ${ANTES}    Get Current Date
    ${DEPOIS}   Add Time To Date    ${ANTES}   7 days    result_format=%d-%m-%Y %H:%M:%S
    Log         Antes: ${ANTES} - Depois: ${DEPOIS}

Subtraindo tempo de data
    ${ANTES}    Get Current Date
    ${DEPOIS}   Subtract Time From Date    ${ANTES}   25 minutes    result_format=%d-%m-%Y %H:%M:%S
    Log         Antes: ${ANTES} - Depois: ${DEPOIS}
    ${ANTES}    Get Current Date
    ${DEPOIS}   Subtract Time From Date    ${ANTES}   2 days        result_format=%d-%m-%Y %H:%M:%S
    Log         Antes: ${ANTES} - Depois: ${DEPOIS}
