*** Settings ***
Documentation    GET /usuario

Resource    ${EXECDIR}/Resources/base.robot
Resource    ${EXECDIR}/Resources/Usuario/get.robot

#Suite Setup    Autenticar usuário
Suite Setup    Criar Lista de Usuários

*** Test Cases ***
Cenário 1: Buscar lista de usuários
    Quando enviar requisição GET para buscar a lista de parceiros
    Então o status code deverá ser 200
    E deverá retornar a lista de usuários

Cenário 2: Buscar por usuário especifíco
    Quando enviar requisição GET para buscar a lista de usuário especifíco
    Então o status code deverá ser 200 para usuário especifíco
    E deverá retornar validar os parâmetros do json de resposta
    E validar email
    E validar password
    E validar administrador

Cenário 3: Excluir massa de dados após os testes
    Excluir massa de dados após os testes