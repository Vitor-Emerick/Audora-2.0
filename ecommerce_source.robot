*** Settings ***
Library     SeleniumLibrary
Library     AppiumLibrary
Library     Process
library     FakerLibrary    locale=pt_BR

*** Variables ***
${BROWSER}          Chrome
${URL}              https://www.centauro.com.br
${NOME}             FakerLibrary.firstname
${SOBRENOME}        FakerLibrary.lastname
${CPF}              FakerLibrary.CPF
${NASC}             FakerLibrary.NASC
${TEL}              FakerLibrary.TEL
${CEP}              FakerLibrary.CEP
${uname}            Fakerlibrary.Email
${pass}             FakerLibrary.password

*** Keywords ***

Abrir o navegador
    Open Browser  browser=${BROWSER}
    Maximize Browser Window

Inserir a ${URL}
    Go To  ${URL}

Verificar o titulo da pagina
    Title Should Be    Centauro Loja de Esportes - Nike, Adidas, Mizuno, Asics, Oakley e mais! - Seu esporte, nossa paixão
    Click Button       //button[contains(@id,'adopt-accept-all-button')]

Acessar pagina de cadastro
    Mouse Up    locator=//a[@data-testid='router-link'][contains(.,'Meus pedidos')]
    Wait Until Element Is Visible   locator=//a[contains(.,'Entre / Cadastre-se')]
    Click Element   locator=//a[@data-testid='router-link'][contains(.,'Entre / Cadastre-se')]
    Wait Until Element Is Visible   locator=//button[contains(.,'Entrar')]
    Click Button    locator=//button[contains(.,'Criar uma conta')]
    
Preencher cadastro 
    Wait Until Element Is Visible   locator=//div[@class='_15hru0s'][contains(.,'Dados Pessoais')]
    Input Value  locator=(//input[contains(@name,'Nome')])[1]    text=${NOME}
    Input Value  locator=(//input[contains(@data-testid,'lastName')])[1]     text=${SOBRENOME}
    Press Keys  (//input[contains(@placeholder,'CPF*')])[1]     ${CPF}
    Click Element   (//input[contains(@data-testid,'birthDate')])[1]
    Press Keys  None    ${NASC}
    Select From List By Index   (//select[@data-testid='gender'])[1]    1
    Click Element   locator=(//input[contains(@data-testid,'cep')])[1]
    Press Keys  None    ${CEP}
    Click Element   locator=//label[@id='terms-accept']//*[name()='svg']
    Press Keys  (//input[@placeholder='Telefone Celular'])[1]   ${TEL}
    Input Value  locator=(//input[@placeholder='Digite seu E-mail*'])[1]     text=${uname}
    Input Value  locator=(//input[@name='Senha'])[1]     text=${CPF}
    Input Value  locator=(//input[@data-testid='confirmPassword'])[1]    text=${CPF}
    Click Element   locator=//input[@class='_159r3op8']
    Input Text  locator=//input[contains(@class,'_1s0vxaa0')]    text=7
    Wait Until Element Contains     locator=(//li[contains(.,'E-mail, CPF ou CNPJ jÃ¡ cadastrado')])[1]  text=CPF
    Sleep   15
    Click Element    (//input[contains(@value,'Cadastrar')])[1]

Fechar Navegador
    Close Browser

Acessar pagina de login
    Mouse Up    locator=//a[@data-testid='router-link'][contains(.,'Meus pedidos')]
    Wait Until Element Is Visible   locator=//a[contains(.,'Entre / Cadastre-se')]
    Click Element   locator=//a[@data-testid='router-link'][contains(.,'Entre / Cadastre-se')]
    Wait Until Element Is Visible   locator=//button[contains(.,'Entrar')]

Inserir dados
    Input Value  locator=//input[@id='username']     text=${uname}
    Input Value  locator=//input[@id='password']     text=${pass}
    Click Button    locator=//button[@type='submit']

Verificar login com sucesso
    Wait Until Element Is Visible   locator=//a[contains(.,'Meus pedidos')]

Buscar produto existente
    Input Text    //input[@placeholder='O que vocÃª procura? :)']    Bola
    Press Keys    //input[@placeholder='O que vocÃª procura? :)']    ENTER
Adicionar produto ao Carrinho
    Mouse Up    (//img[contains(@alt,'Bola de Basquete Penalty PlayOff I')])[1]
    Click Element    //button[contains(.,'Adicionar ao carrinho')]
Verificar se o produto foi adicionado com sucesso
    Click Element    //svg[contains(@class,'jss1 _137j409')]
    Sleep    5
Verificar se tem produto no carrinho
    Wait Until Element Contains    //span[@class='_1kcsd3f'][contains(.,'remover')]    remover
Excluir produto
    Click Element    //div[@class='_12to336'][contains(.,'remover')]
Verificar se o produto foi removido
    Wait Until Element Contains    //h3[@class='_a3z50j'][contains(.,'Seu carrinho está vazio')]    text=vazio
    Sleep    5

Verificar se o usuario está logado
    Wait Until Element Contains    //div[@class='login_hover _pyet5k'][contains(.,'Olá, ${NOME}Meus pedidos')]     ${NOME}

Fazer logout
    Mouse Up    //div[@class='login_hover _pyet5k'][contains(.,'Olá, VitorMeus pedidos')]
    Click Element    (//font[contains(.,'Sair')])[2]

Fechar Navegador
    Close Browser
