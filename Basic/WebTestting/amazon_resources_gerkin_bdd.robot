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

#Gerkin Steps
Dado que estou na home page da Amazon.com.br
    Wait Until Element Is Visible    locator=${LOGO_AWS}

Quando acessar o menu "${MENU}"
    Click Element    locator=//a[contains(.,'${MENU}')]
    Sleep    4

Então o título da página deve ficar "${TITLE}"
    Title Should Be    title=${TITLE}

E o texto "${FRASE}" deve ser exibido na página
    Wait Until Page Contains         text=${FRASE}
    Wait Until Element Is Visible    locator=${HEADER_ELETRONICOS}


E a categoria "${CATEGORY}" deve ser exibida na página
    Element Should Be Visible   locator=//a[@aria-label='${CATEGORY}']

Quando pesquisar pelo produto "${PRODUTO}"
    Input Text    locator=twotabsearchtextbox    text=${PRODUTO}
    Clicar no botão de pesquisa

E um produto da linha "${PESQUISADO}" deve ser mostrado na página
    Wait Until Element Is Visible    locator=//img[@alt='${PESQUISADO}']    

Clicar no botão de pesquisa
    Click Element    locator=${BTN_SEARCH}
    Sleep    4

Verificar se o título da página fica "${TITLE}"
    Title Should Be    title=${TITLE}

