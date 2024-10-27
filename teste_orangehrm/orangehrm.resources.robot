*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${BROWSER}      chrome
${URL}          https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${TELA_LOGIN}    //div[@class='orangehrm-login-branding']
        

*** Keywords ***
Abrir o navegador
    Open Browser    browser=chrome
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot 
    Close Browser


#caso de teste 01 - Acessar/logar site orangehrm
Acessar a tela principal orangehrm
    Go To    url=${URL}
    Location Should Contain    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
    Sleep    10
#----------------------------------


    
    
 