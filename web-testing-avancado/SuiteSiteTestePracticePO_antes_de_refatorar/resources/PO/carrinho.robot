*** Settings ***
Library    SeleniumLibrary

*** Variables ***
#Organizar os elementos com variavéis para realizar a manutenção de forma fácil e organizada.
${CARRINHO_TITLE}            Order - My Store
${CARRINHO_DELETAR}          xpath=//*[@class="cart_quantity_delete"]
${CARRINHO_MSG}              xpath=//*[@id="center_column"]/p[@class='alert alert-warning']


*** Keywords ***
Excluir o produto do carrinho
    Title Should Be    ${CARRINHO_TITLE} 
    Click Element      ${CARRINHO_DELETAR}

#Conferencias
Conferir se o carrinho fica vazio
    Wait Until Element Is Visible   ${CARRINHO_MSG}
    Element Text Should Be          ${CARRINHO_MSG}    Your shopping cart is empty.
