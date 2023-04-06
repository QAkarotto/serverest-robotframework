*** Keywords ***
#Cenário 1: Inserir Usuario
Quando enviar requisição POST para usuário com o body válido
    ${payload}    Factory Criar Usuario

    ${response}    POST Usuarios    ${payload}

    Log To Console    ${response.json()}[_id]

    Set Suite Variable    ${message}    ${response.json()}[message]
    #Set Global Variable    ${_id}        ${response.json()}[_id]

    ${_id}                 Set Variable    ${response.json()}[_id]
    Set Global Variable    ${_id}

Então o status code deverá ser 201 created
    Status Should Be    201

E deverá retornar no response header a Message Cadastro realizado com sucesso
    Should Be Equal    ${message}    Cadastro realizado com sucesso


#Cenário 2: Validar usuário duplicado
Validar usuário duplicado
    ${payload}    Factory Criar Usuario

    POST Usuarios    ${payload}

    ${response}    POST Usuarios    ${payload}

    Set Suite Variable    ${message}    ${response.json()}[message]

Então o status code deverá ser 400
    Status Should Be    400

E deverá retornar no response header a Message Este email já está sendo usado
    Should Be Equal    ${message}    Este email já está sendo usado




#Cenário 3: Excluir massa de dados após os testes
Excluir massa de dados após os testes
    ${response}    DELETE Usuarios sem payload    ${_id} 

    Status Should Be    200

    Set Suite Variable    ${message}    ${response.json()}[message]

    Should Be Equal    ${message}    Registro excluído com sucesso
