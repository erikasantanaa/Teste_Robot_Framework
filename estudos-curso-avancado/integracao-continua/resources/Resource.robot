*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${BROWSER}      browser=chrome
${URL}          https://opensource-demo.orangehrmlive.com/web/index.php/auth/login

${OPTIONS}      add_argument("--disable-dev-shm-usage"); add_argument("--headless"); add_argument("--no-sandbox")

#Opções necessárias

*** Keywords ***
Abrir o navegador
    Open Browser    ${BROWSER}    options=${OPTIONS}
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser