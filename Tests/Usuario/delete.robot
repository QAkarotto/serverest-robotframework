*** Settings ***
Documentation    DELETE /usuario

Resource    ${EXECDIR}/Resources/base.robot
Resource    ${EXECDIR}/Resources/Usuario/delete.robot

Suite Setup    Autenticar usuário

*** Test Cases ***
Cenário 1: Deletar Usuário
    Quando criar usuário para deletar usuário
    Então o status code deverá ser 200
    E deve validar a mensagem de Registro excluído com sucesso

Cenário 1: Deletar o usuário já deletado
    Quando deletar o usuário já deletado
