*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${BROWSER}      chrome
${URL}          https://www.nasa.gov/


*** Keywords ***
Abrir o navegador
    Open Browser    browser=chrome
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser

#----------------------------------
    
Dado que estou na tela inicio do site da "Nasa"
    Go To    url=${URL}
    Location Should Contain    nasa.gov
    
# Quando selecionar o campo "Multimedia"
    
    
 