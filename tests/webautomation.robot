*** Settings ***
Documentation   Aquui estarão presentes os testes web do curso Primehero
...             A ideia é criarmos cenarios de verificação com a Library Selenium

Library         SeleniumLibrary

Test Setup      Abrir navegador
Test Teardown   Fechar navegador

*** Variables ***

${URL}      http://automationpractice.com/index.php
${BROWSER}  gc
&{PESSOA}
...   nome=Fabiano
...   sobrenome=Corrêa
...   adia=6    ames=3    aano=2000
...   senha=123456
...   ende=R. Lagoa Dourada   comp=Casa   cidade=Curitiba   cep=81240
...   tel=+55 41 98534-0146

*** Keywords ***

Abrir navegador
  Open Browser                    browser=${BROWSER}
  Maximize Browser Window

Fechar navegador
  Capture Page Screenshot
  Close Browser

Acessar a página home do site Automation Practice
  Go To                           ${URL}
  Title Should Be                 My Store
  Wait Until Element Is Visible   id=block_top_menu

Digitar o nome do produto "${PRODUTO}" no campo de pesquisa
  Input Text                      id=search_query_top  ${PRODUTO}

Clicar no botão pesquisar
  Click Element                   xpath=//*[@id="searchbox"]/button

Conferir se o produto "Blouse" foi listado no site
  Wait Until Element Is Visible   id=center_column
  Title Should Be                 Search - My Store
  Page Should Contain Image       xpath=//*[@id="center_column"]/ul/li/div/div[1]/div/a[1]/img

Conferir mensagem "No results were found for your search "ItemNãoExistente""
  Wait Until Element Is Visible   id=center_column
  Title Should Be                 Search - My Store
  Element Text Should Be          xpath=//*[@id="center_column"]/p  No results were found for your search "ItemNãoExistente"

Passar o mouse por cima da categoria "Women" no menu principal superior de categorias
  Wait Until Element Is Visible   xpath=//*[@id="block_top_menu"]/ul/li[1]/a
  Mouse Over                      xpath=//*[@id="block_top_menu"]/ul/li[1]/a
  
CLicar na sub-categoria "Summer Dresses"
  Wait Until Element Is Visible   xpath=//*[@id="block_top_menu"]/ul/li[1]/ul/li[2]/ul/li[3]/a
  Click Element                   xpath=//*[@id="block_top_menu"]/ul/li[1]/ul/li[2]/ul/li[3]/a

Conferir se os produtos da sub-categoria "Summer Dresses" foram mostrados na página
  Wait Until Element Is Visible   xpath=//*[@id="center_column"]/div[1]/div/div/span
  Title Should Be                 Summer Dresses - My Store
  Element Text Should Be          xpath=//*[@id="center_column"]/div[1]/div/div/span    Summer Dresses

Clicar em "Sing in"
  Wait Until Element Is Visible   xpath=//*[@id="header"]/div[2]/div/div/nav/div[1]/a
  Click Element                   xpath=//*[@id="header"]/div[2]/div/div/nav/div[1]/a

Informar um email válido
  Title Should Be                 Login - My Store
  Wait Until Element Is Visible   id=email_create
  Input Text                      id=email_create   ${PESSOA.nome}.${PESSOA.sobrenome}.${PESSOA.aano}@gmail.com

clicar em "Create an account"
  Click Element                   id=SubmitCreate

Preencher os dados obrigatórios
  Wait Until Element Is Visible   xpath=//*[@id="account-creation_form"]/div[1]/h3
  Click Element                   xpath=//*[@id="id_gender1"]
  Input Text                      id=customer_firstname       ${PESSOA.nome}
  Input Text                      id=customer_lastname        ${PESSOA.sobrenome}
  Input Text                      id=passwd                   ${PESSOA.senha}
  Select From List By Value       xpath=//*[@id="days"]       ${PESSOA.adia}
  Select From List By Value       xpath=//*[@id="months"]     ${PESSOA.ames}
  Select From List By Value       xpath=//*[@id="years"]      ${PESSOA.aano}
  Input Text                      id=firstname                ${PESSOA.nome}
  Input Text                      id=lastname                 ${PESSOA.sobrenome}
  Input Text                      id=address1                 ${PESSOA.ende}
  Input Text                      id=address2                 ${PESSOA.comp}
  Input Text                      id=city                     ${PESSOA.cidade}
  Select From List By Value       xpath=//*[@id="id_state"]   1
  Input Text                      id=postcode                 ${PESSOA.cep}
  Input Text                      id=phone_mobile             ${PESSOA.tel}
  Click Element                   id=submitAccount

Conferir se o cadstro foi efetuado com sucesso
  Title Should Be                 My account - My Store

*** Test Cases ***

Caso de Teste 01: Pesquisar produto existente
  [Tags]    001
  Acessar a página home do site Automation Practice
  Digitar o nome do produto "Blouse" no campo de pesquisa
  Clicar no botão pesquisar
  Conferir se o produto "Blouse" foi listado no site

Caso de Teste 02: Pesquisar produto não existente
  [Tags]    002
  Acessar a página home do site Automation Practice
  Digitar o nome do produto "ItemNãoExistente" no campo de pesquisa
  Clicar no botão pesquisar
  Conferir mensagem "No results were found for your search "ItemNãoExistente""

Caso de Teste 03: Listar Produtos
  [Tags]    003
  Acessar a página home do site Automation Practice
  Passar o mouse por cima da categoria "Women" no menu principal superior de categorias
  CLicar na sub-categoria "Summer Dresses"
  Conferir se os produtos da sub-categoria "Summer Dresses" foram mostrados na página

Caso de Teste 04: Adicionar Cliente
  [Tags]    004
  Acessar a página home do site Automation Practice
  Clicar em "Sing in"
  Informar um email válido
  clicar em "Create an account"
  Preencher os dados obrigatórios
  Conferir se o cadstro foi efetuado com sucesso