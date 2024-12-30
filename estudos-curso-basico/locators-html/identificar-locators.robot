#Identificação simples do locators:

    #Pelo ID

    Click Element    id=teste
    Click Element    teste

    #Pelo Nome

    Click Element    name=teste
    Click Element    teste

    #Pelo texto do link

    Click link    partial link=site.com
    Click link    Your site.com

    #Pelo Texto parcial do link

    Click link    partial link=site.com

    #Pelo XPATH
    Click link    xpath=//a[@id='Theld']

    #Pelo CSS
    Click Link    css=//a[@id='Theld']

    #Pelo Dom
    Click Element    dom=document.images[5]

    #Pela tag
    Click Element    tag=div

#Explorando o CSS e XPATH para locators dinâmicos ou complexos:

    #Contendo um texto
    Click Element    xpath=//*[contains(text(), "exemplo")]

    #Contendo um valor
    Click Element    xpath=//input[contains(@type, 'submit')]
    Click Element    css=input[contains(@type, 'submit')]

    #Iniciando por um valor 
    Click Element    xpath=//input[starts-with(@type, 'submit')] 
    Click Element    css=input[type^='submit']

    #Terminando por um valor
    Click Element    xpath=//input[ends-with(type, 'submit')]
    Click Element    css=input[ends-with(type, 'submit')]
