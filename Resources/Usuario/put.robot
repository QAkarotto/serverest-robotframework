*** Keywords ***
#Cenário 1: Editar usuários
Quando enviar requisição PUT para edidar um usuário sem payload
    ${payload}    Factory Editar Usuario

    ${response}    PUT Usuarios sem payload    ${payload}    

    Set Suite Variable    ${nome}             ${response.json()}[nome]
    Set Suite Variable    ${email}            ${response.json()}[email]
    Set Suite Variable    ${password}         ${response.json()}[password]
    Set Suite Variable    ${administrador}    ${response.json()}[administrador]

Então o status code deverá ser 400
    Status Should Be    400

E deve validar o campo Nome
    Should Be Equal    ${nome}    nome é obrigatório

E deve validar o campo Email
    Should Be Equal    ${email}    email é obrigatório

E deve validar o campo Password
    Should Be Equal    ${password}    password é obrigatório

E deve validar o campo Administrador
    Should Be Equal    ${administrador}    administrador é obrigatório



Quando enviar requisição PUT para edidar um usuário
    #${payload}    Factory Criar Usuario

    ${payload}     Factory Criar Usuario Editar    
    ${response}    POST Usuarios edicao            ${payload}

    # ${response}            POST Usuarios              ${payload}
    ${_id}                 Set Variable               ${response.json()}[_id]
    Log To Console         ${response.json()}[_id]
    Set Global Variable    ${_id}

    ${payload}    Factory Editar Usuario

    ${response}    PUT Usuarios valido    ${payload}    

    Set Suite Variable    ${message}    ${response.json()}[message]

Então o status code deverá ser 200
    Status Should Be    200

E deve validar a mensagem de registro alterado com sucesso
    Should Be Equal    ${message}    Registro alterado com sucesso


#Cenário 3: Excluir massa de dados após os testes
Excluir massa de dados após os testes
    ${response}    DELETE Usuarios sem payload    ${_id} 

    Status Should Be    200

    Set Suite Variable    ${message}    ${response.json()}[message]

    Should Be Equal    ${message}    Registro excluído com sucesso