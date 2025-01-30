*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***
#Organizar os elementos com variavéis para realizar a manutenção de forma fácil e organizada.
${BROWSER}      headlesschrome
${URL}          http://automationpractice.com

*** Keywords ***
#### Setup e Teardown
Abrir navegador
    Open Browser        about:blank   ${BROWSER}

Fechar navegador
    Capture Page Screenshot
    Close Browser



