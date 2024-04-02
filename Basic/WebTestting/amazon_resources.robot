*** Settings ***
Library        SeleniumLibrary

*** Variables ***
${BROWSER}                   edge
${URL_BASE}                  https://www.amazon.com.br
${LOGO_AWS}                  xpath=//a[contains(@class,'nav-logo-link nav-progressive-attribute')]
${HEADER_ELETRONICOS}        xpath=//h1[contains(.,'Eletrônicos e Tecnologia')]
${IMAGE_COMPUTER_INFO}       xpath=//img[contains(@alt,'Computadores e Informática')]
${BTN_SEARCH}                id=nav-search-submit-button

*** Keywords ***
Abrir o navegador                    #Caso o browser fechar sem ter o Close Browser usar está option
    Open Browser    url=${URL_BASE}    browser=${BROWSER}    #options=add_experimental_option("detach", True)
    Maximize Browser Window
    Wait Until Element Is Visible    locator=${LOGO_AWS}

Fechar o navegador
    #No Operation
    Capture Page Screenshot
    Close Browser

# Acessar a home page do site Amazon.com.br
#     Go To    url=${URL_BASE}
#     Wait Until Element Is Visible    locator=${LOGO_AWS}

Entrar no menu "${MENU}"
    Click Element    locator=//a[contains(.,'${MENU}')]

Verificar se aparece a frase "${FRASE}"
    Wait Until Page Contains         text=${FRASE}
    Wait Until Element Is Visible    locator=${HEADER_ELETRONICOS}

Verificar se o título da página fica "${TITLE}"
    Title Should Be    title=${TITLE}

Verificar se aparece a categoria "${CATEGORY}"
    Element Should Be Visible   locator=//a[@aria-label='${CATEGORY}']

Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
    Input Text    locator=twotabsearchtextbox    text=${PRODUTO}
Clicar no botão de pesquisa
    Click Element    locator=${BTN_SEARCH}
    Sleep    4

Verificar o resultado da pesquisa se está listando o produto "${PESQUISADO}"
    Wait Until Element Is Visible    locator=//img[@alt='${PESQUISADO}']    

#Gerkin Steps
Dado que estou na home page da Amazon.com.br
    Verificar se o título da página fica "Amazon.com.br | Tudo pra você, de A a Z."

Quando acessar o menu "Eletrônicos"
    Entrar no menu "Eletrônicos"

Então o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
    Verificar se o título da página fica "Eletrônicos e Tecnologia | Amazon.com.br"

E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
    Verificar se aparece a frase "Eletrônicos e Tecnologia"

E a categoria "Computadores e Informática" deve ser exibida na página
    Verificar se aparece a categoria "Computadores e Informática"

Quando pesquisar pelo produto "Xbox Series S"
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa

Então o título da página deve ficar "Amazon.com.br : Xbox Series S"
    Verificar se o título da página fica "Amazon.com.br : Xbox Series S"

E um produto da linha "Xbox Series S" deve ser mostrado na página
    Verificar o resultado da pesquisa se está listando o produto "Xbox Series S"
