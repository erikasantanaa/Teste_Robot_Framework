*** Settings ***
Resource            ../resources/Resource.robot
#Importar os arquivos de resources que foram criados
Resource            ../resources/PO/Home.robot
Resource            ../resources/PO/carrinho.robot
Resource            ../resources/PO/adicionarCliente.robot
Test Setup          Abrir navegador
Test Teardown       Fechar navegador

*** Test Case ***
Caso de Teste com PO 01: Remover Produtos do Carrinho
#Colocar o nome do arquivo (home.acessar...) na frente da linha de comando para identificar o arquio
    Home.Acessar a página home do site
    Home.Adicionar o produto "t-shirt" no carrinho
    carrinho.Excluir o produto do carrinho
    carrinho.Conferir se o carrinho fica vazio

## EXERCÍCIO
Caso de Teste com PO 02: Adicionar Cliente
    Acessar a página home do site
    Clicar em "Sign in"
    Informar um e-mail válido
    Clicar em "Create an account"
    Preencher os dados obrigatórios
    Submeter cadastro
    Conferir se o cadastro foi efetuado com sucesso
