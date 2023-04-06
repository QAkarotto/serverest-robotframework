*** Settings ***
Documentation    POST /usuario

Resource    ${EXECDIR}/Resources/base.robot
Resource    ${EXECDIR}/Resources/Usuario/post.robot

Suite Setup    Autenticar usuário

*** Test Cases ***
Cenário 1: Inserir Usuario
    Quando enviar requisição POST para usuário com o body válido
    Então o status code deverá ser 201 created
    E deverá retornar no response header a Message Cadastro realizado com sucesso

Cenário 2: Validar usuário duplicado
    Validar usuário duplicado
    Então o status code deverá ser 400
    E deverá retornar no response header a Message Este email já está sendo usado

Cenário 3: Excluir massa de dados após os testes
    Excluir massa de dados após os testes    
