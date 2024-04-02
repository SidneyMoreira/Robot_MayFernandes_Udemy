*** Settings ***
Documentation         Essa suite testa o site da Amazon.com.br 
Resource              ./amazon_resources_gerkin_bdd.robot

Test Setup            Abrir o navegador
Test Teardown         Fechar o navegador

*** Test Cases ***
CT001 - Acesso ao menu "Eletronicos"
    [Documentation]    Esse teste verifica o menu Eletronicos do site Amazon.com.br
    ...                e verifica a categoria Computadores e Informática
    [Tags]             menus  categorias
    # Acessar a home page do site Amazon.com.br
    Dado que estou na home page da Amazon.com.br
    Quando acessar o menu "Eletrônicos"
    Então o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
    E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
    E a categoria "Computadores e Informática" deve ser exibida na página

CR002 - Pesquisa de Produtos
    [Documentation]    Esse teste verifica a busca de um produto
    [Tags]             busca_produtos  lista_busca
    # Acessar a home page do site Amazon.com.br
    Dado que estou na home page da Amazon.com.br
    Quando pesquisar pelo produto "Xbox Series S"
    Então o título da página deve ficar "Amazon.com.br : Xbox Series S"
    E um produto da linha "Xbox Series S" deve ser mostrado na página
