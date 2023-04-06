*** Settings ***
Documentation    POST /usuario

Library    RequestsLibrary
Library    Collections
Library    SeleniumLibrary

***Variables***
${URL_BASE}    https://serverest.dev

*** Test Cases ***
Autenticar usuário
    Create Session         AutenticarLogin                                        ${URL_BASE}
    ${HEADER}              Create Dictionary                                      content-type=application/json
    ${RESPONSE}            Post On Session                                        AutenticarLogin                        /login
    ...                    data={"email": "fulano@qa.com","password": "teste"}
    ...                    headers=${HEADER}
    Set Global Variable    ${authentication_token}                                ${RESPONSE.json()["authorization"]}
    # # ${authorization}       Set Variable                                           ${RESPONSE.json()["authorization"]}
    # Set Global Variable    ${authentication_token}

    Set Suite Variable    ${message}    ${response.json()}[message]

Então o status code deverá ser 200 success
    Status Should Be    200

E deverá retornar no response header a Message Login realizado com sucesso
    Should Be Equal    ${message}    Login realizado com sucesso