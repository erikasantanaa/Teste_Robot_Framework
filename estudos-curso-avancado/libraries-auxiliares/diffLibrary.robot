*** Settings ***
Library    DiffLibrary

*** Test Cases ***
Exemplo de Comparação de Strings
    # Define duas strings para comparação
    ${string1}=    Set Variable    Olá, mundo!
    ${string2}=    Set Variable    Olá, Robot!

    # Compara as duas strings
    ${diff}=    Diff Strings    ${string1}    ${string2}

    # Exibe o resultado da comparação no log
    Log    Diferenças encontradas: ${diff}

# A DiffLibrary é uma ferramenta poderosa para identificar diferenças entre conjuntos de dados,
# ...    o que pode ser extremamente útil em testes automatizados para garantir a integridade 
# ...    dos dados e a correta execução de funcionalidades. Dependendo da sua necessidade, você 
# ...    pode adaptar o uso da biblioteca para diferentes tipos de dados e cenários.