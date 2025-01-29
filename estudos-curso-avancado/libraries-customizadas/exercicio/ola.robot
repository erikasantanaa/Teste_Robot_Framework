*** Settings ***
Library    ola.py

*** Test Cases ***
Teste de saudação e Log
    ## Keyword que retorna um valor
    ${saudacao}=    Greet User    Érika
    Log    ${saudacao}

    # Keyword que apenas imprime uma mensagem no log
    Log Message    Esta é uma mensagem de log simples.