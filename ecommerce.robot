*** Settings ***
Documentation        Esta é uma automaçao Acessar a Home Page do “e-commerce” , realizar o cadastro com sucesso, efetuar login, incluir e excluir itens ao carrinho e efetuar o logout do e-commerce com sucesso.
Resource             ecommerce_source.robot
Resource             BDD-ptbr.robot
Suite Setup          Abrir o navegador
Suite Teardown       Fechar Navegador

*** Test Cases ***
Cenário: Acessar a Home Page do “e-commerce”
    Dado que o usuário está no navegador
    Quando o usuário inserir a “url” do e-commerce
    Então o usuário será direcionado a home page do e-commerce

Cenário: Efetuar Cadastro com sucesso no “e-commerce”
    Dado que o usuário está na pagina de cadastro do “e-commerce”
    Quando o usuário inserir os dados válidos de cadastro
    Então será exibida uma mensagem: “usuário cadastrado com sucesso “

Cenário: Realizar login do usuário com sucesso
    Dado que o usuário é cadastrado no “e-commerce”
    Quando ele preencher os dados válidos
    Então ele será logado

Cenário: Incluir produtos ao carrinho com sucesso
    Dado que o usuário está logado no e-commerce
    Quando o usuário busca um produto
    E adiciona ao carrinho
    Então o produto será adicionado ao carrinho


Cenário: Remover produtos do carrinho com sucesso
    Dado que o usuário tem produto no carrinho de compras
    Quando o usuário excluir um produto do carrinho
    Então o produto será removido do carrinho

Cenário: Realizar logout do e-commerce com sucesso
    Dado que o usuário está logado no e-commerce
    Quando o usuário fizer o logout do e-commerce
    Então o usuário devera ser direcionado a home page do e-commerce


*** Keywords ***
Que o usuário está no navegador
    Abrir o navegador
O usuário inserir a “url” do e-commerce
    Inserir a ${URL}
O usuário será direcionado a home page do e-commerce
    Verificar o titulo da pagina
Que o usuário está na pagina de cadastro do “e-commerce”
    Acessar pagina de cadastro
O usuário inserir os dados válidos de cadastro
    Preencher cadastro
Que o usuário é cadastrado no “e-commerce”
    Abrir o Navegador
    Inserir a ${URL}
    Verificar o titulo da pagina
    Acessar pagina de login
Ele preencher os dados válidos
    Inserir dados
Ele será logado
    Verificar login com sucesso
Que o usuário está logado no e-commerce
    Verificar login com sucesso
O usuário busca um produto
    Buscar produto existente
adiciona ao carrinho
    Adicionar produto ao Carrinho
O produto será adicionado ao carrinho
    Verificar se o produto foi adicionado com sucesso
Que o usuário tem produto no carrinho de compras
    Verificar se tem produto no carrinho
O usuário excluir um produto do carrinho
    Excluir produto
O produto será removido do carrinho
    Verificar se o produto foi removido
Que o usuário está logado no e-commerce
    Verificar se o usuario está logado
O usuário fizer o logout do e-commerce
    Fazer logout
O usuário devera ser direcionado a home page do e-commerce
    Verificar o titulo da pagina