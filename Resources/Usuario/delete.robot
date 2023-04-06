*** Keywords ***
#Cenário 1: Deletar Usuário
Quando criar usuário para deletar usuário
    ${payload}             Factory Deletar Usuario
    ${response}            POST Usuarios              ${payload}
    ${_id}                 Set Variable               ${response.json()}[_id]
    Set Global Variable    ${_id}


    ${resposta}    DELETE Usuarios    ${response.json()} 

    Set Suite Variable    ${message}    ${resposta.json()}[message]

Então o status code deverá ser 200
    Status Should Be    200

E deve validar a mensagem de Registro excluído com sucesso
    Should Be Equal    ${message}    Registro excluído com sucesso



#Cenário 1: Deletar o usuário já deletado
Quando deletar o usuário já deletado

    ${response}     DELETE Usuarios sem payload    ${_id} 

    Status Should Be    200

    Set Suite Variable    ${message}    ${response.json()}[message]

    Should Be Equal    ${message}    Nenhum registro excluído