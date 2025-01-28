*** Settings ***
Library         DateTime
Test Teardown   Teardown do meu teste
#É 1s por teste
Test Timeout    1 seconds

*** Test Cases ***
#### Controles de TIMEOUT
Exemplo 01: Teste lidando com o timeout do teste
    Simular espera do teste    2s

#### ESPERANDO UMA KEYWORD
Exemplo 02: Teste de espera
    #OBS: O tempo de 2 min é somente para esse caso de teste, 
    #sendo assim nao gera erro relacionado ao tempo Test Timeout  
    [Timeout]   2 minutes
    Esperar uma keyword obter sucesso!

*** Keywords ***
Teardown do meu teste
    #O Keyword If Timeout Occurred só funciona para o Test Teardown 
    Run Keyword If Timeout Occurred     Log  Esse teste demorou demais, possível problema de performance!

Simular espera do teste
    [Arguments]     ${TEMPO}
    Sleep           ${TEMPO}

Esperar uma keyword obter sucesso!
    Wait Until Keyword Succeeds    60x   1 seconds   Essa keyword só passa se estivermos no segundo 15!

Essa keyword só passa se estivermos no segundo 15!
    ${HORA_ATUAL}   Get Current Date
    ${HORA_ATUAL}   Convert Date    ${HORA_ATUAL}    datetime
    Log    Hora atual: ${HORA_ATUAL.hour}\nMinuto atual: ${HORA_ATUAL.minute}\nSegundo atual: ${HORA_ATUAL.second}
    Run Keyword If    "${HORA_ATUAL.second}"!="15"    Fail    msg=Ainda não estamos no segundo 15!!

# Pontos Importantes
# O uso de Wait Until Keyword Succeeds é útil para testes que dependem de condições externas (como horários específicos).

# O Test Timeout global e o [Timeout] específico para cada teste ajudam a evitar que os testes fiquem travados indefinidamente.

# O Teardown é uma boa prática para garantir que ações de limpeza ou verificação sejam realizadas após cada teste.