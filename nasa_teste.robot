*** Settings ***
Documentation    Essa suite testa o site da https://www.nasa.gov/
Resource         nasa_teste-resources.robot
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador
 
*** Test Cases ***
caso de teste 01 - Acessar a tela de "Images" da Nasa
    [Documentation]        Teste para visualizar a imagem do dia no site da Nasa
    [Tags]                 Teste01

    Dado que estou na tela inicio do site da "Nasa"
    # Quando selecionar o campo "Multimedia"
    # E selecionar em "Images"
    # Então a tela de "Nasa Images" deve aparecer

# Caso de teste 02 - Acessar a "Image Of The Day" da Nasa 
    # Dado que estou na tela de "Images" da Nasa
    # Quando acessar o botão seta "View image" 
    # Então a tela da "Image" deve aparecer

# Caso de teste 03 - Fazendo Download da "Image"
    # Dado que estou na tela de "Images" da Nasa
    # Quando acessar o botão "Download"
    # Então a image e baixada