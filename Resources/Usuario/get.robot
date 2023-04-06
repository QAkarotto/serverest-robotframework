*** Keywords ***
####Gancho para os testes abaixo
Criar Lista de Usuários
    # ${payload}    Factory Criar Usuario Lista

    # FOR              ${i}    IN    @{payload}
    # POST Usuarios    ${i}
    # END

    ${payload}     Factory Get Usuario
    ${response}    POST Usuarios para GET    ${payload}

    ${_id}                 Set Variable    ${response.json()}[_id]
    Set Global Variable    ${_id}


#Cenário 1: Buscar lista de usuários
Quando enviar requisição GET para buscar a lista de parceiros

    ${response}    GET Usuarios    

    Set Suite Variable    ${result}    ${response.json()}

Então o status code deverá ser 200
    Status Should Be    200

E deverá retornar a lista de usuários
    ${size}    Get Length    ${result}

    Should Be True    ${size} > 0




#Cenário 2: Buscar por usuário especifíco
Quando enviar requisição GET para buscar a lista de usuário especifíco
    ${response}    GET Usuarios Pelo Nome    Usuario GET

    Set Suite Variable    ${result}    ${response.json()}

Então o status code deverá ser 200 para usuário especifíco
    Status Should Be    200

    [return]    ${result}

E deverá retornar validar os parâmetros do json de resposta
    ${nome}=    Get value from JSON    ${result}    $.usuarios[0].nome

    Should Be Equal As Strings    ${nome}    ['Usuario GET']


E validar email
    ${response}                   GET Usuarios Pelo Email    usuario@get.com.br
    Set Suite Variable            ${result}                  ${response.json()}
    ${email}=                     Get value from JSON        ${result}                 $.usuarios[0].email
    Should Be Equal As Strings    ${email}                   ['usuario@get.com.br']

E validar password
    ${response}                   GET Usuarios Pelo Password    scoleta
    Set Suite Variable            ${result}                     ${response.json()}
    ${password}=                  Get value from JSON           ${result}             $.usuarios[0].password
    Should Be Equal As Strings    ${password}                   ['scoleta']

E validar administrador
    ${response}                   GET Usuarios Pelo Administrador    true
    Set Suite Variable            ${result}                          ${response.json()}
    ${administrador}=             Get value from JSON                ${result}             $.usuarios[0].administrador
    Should Be Equal As Strings    ${administrador}                   ['true']

    ${_id}=                       Get value from JSON    ${result}    $.usuarios[0]._id
    Should Be Equal As Strings    ${_id}                 ${_id}



#Cenário 3: Excluir massa de dados após os testes
Excluir massa de dados após os testes
    ${response}    DELETE Usuarios sem payload    ${_id} 

    Status Should Be    200

    Set Suite Variable    ${message}    ${response.json()}[message]

    Should Be Equal    ${message}    Registro excluído com sucesso