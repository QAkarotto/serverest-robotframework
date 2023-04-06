*** Settings ***
Documentation    PUT /usuario

Resource    ${EXECDIR}/Resources/base.robot
Resource    ${EXECDIR}/Resources/Usuario/put.robot

Suite Setup    Autenticar usuário

*** Test Cases ***
Cenário 1: Editar usuários sem payload
    Quando enviar requisição PUT para edidar um usuário sem payload
    Então o status code deverá ser 400
    E deve validar o campo Nome
    E deve validar o campo Email
    E deve validar o campo Password
    E deve validar o campo Administrador

Cenário 2: Editar usuários valido
    Quando enviar requisição PUT para edidar um usuário
    Então o status code deverá ser 200
    E deve validar a mensagem de registro alterado com sucesso

Cenário 3: Excluir massa de dados após os testes
    Excluir massa de dados após os testes    