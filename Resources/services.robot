*** Settings ***
Documentation    Camada de serviços

Library    RequestsLibrary
Library    JSONLibrary


*** Variables ***
${BASE_URL}    https://serverest.dev
&{HEADERS}     Content-Type=application/json    

*** Keywords ***
Autenticar usuário
    Create Session         AutenticarLogin                                        https://serverest.dev                 
    ${HEADER}              Create Dictionary                                      content-type=application/json
    ${RESPONSE}            Post On Session                                        AutenticarLogin                        /login
    ...                    data={"email": "fulano@qa.com","password": "teste"}
    ...                    headers=${HEADER}
    Set Global Variable    ${authentication_token}                                ${RESPONSE.json()["authorization"]}

    Set Suite Variable    ${message}    ${response.json()}[message]

    Status Should Be    200

    Should Be Equal    ${message}    Login realizado com sucesso




POST Usuarios
    [Arguments]    ${payload}

    Create Session    PostUsuarios         ${BASE_URL}
    ${HEADERS}        Create Dictionary    content-type=application/json    authorization=${authentication_token} 

    ${response}    POST On Session        PostUsuarios    /usuarios    
    ...            json=${payload}
    ...            headers=${HEADERS}
    ...            expected_status=any

    [return]    ${response} 

POST Usuarios edicao
    [Arguments]    ${payload}

    Create Session    PostUsuariosEdicao    ${BASE_URL}

    ${HEADERS}    Create Dictionary    content-type=application/json    authorization=${authentication_token} 

    ${response}    POST On Session        PostUsuariosEdicao    /usuarios
    ...            json=${payload}
    ...            headers=${HEADERS}
    ...            expected_status=any

    [return]    ${response} 

POST Usuarios para GET
    [Arguments]    ${payload}

    Create Session    PostUsuariosParaGet    ${BASE_URL}
    ${response}       POST On Session        PostUsuariosParaGet    /usuarios
    ...               json=${payload}
    ...               headers=${HEADERS}
    ...               expected_status=any

    [return]    ${response}    

GET Usuarios
    Create Session    GetUsuarios            ${BASE_URL}
    ${response}       GET On Session         GetUsuarios    /usuarios    
    ...               headers=${HEADERS}
    ...               expected_status=any

    [return]    ${response} 

GET Usuarios Pelo Nome
    [Arguments]    ${nome}

    Create Session    GetUsuariosPeloNome    ${BASE_URL}

    ${query}    Create Dictionary    nome=${nome}    

    ${response}    GET On Session         GetUsuariosPeloNome    /usuarios    
    ...            params=${query}
    ...            headers=${HEADERS}
    ...            expected_status=any

    [return]    ${response}    

GET Usuarios Pelo Email
    [Arguments]    ${email}

    Create Session    GetUsuariosPeloEmail    ${BASE_URL}

    ${query}    Create Dictionary    email=${email}    

    ${response}    GET On Session         GetUsuariosPeloEmail    /usuarios    
    ...            params=${query}
    ...            headers=${HEADERS}
    ...            expected_status=any

    [return]    ${response}    

GET Usuarios Pelo Password
    [Arguments]    ${password}

    Create Session    GetUsuariosPeloPassword    ${BASE_URL}

    ${query}    Create Dictionary    password=${password}    

    ${response}    GET On Session         GetUsuariosPeloPassword    /usuarios    
    ...            params=${query}
    ...            headers=${HEADERS}
    ...            expected_status=any

    [return]    ${response}    

GET Usuarios Pelo Administrador
    [Arguments]    ${administrador}

    Create Session    GetUsuariosPeloAdministrador    ${BASE_URL}

    ${query}    Create Dictionary    administrador=${administrador}    

    ${response}    GET On Session         GetUsuariosPeloAdministrador    /usuarios    
    ...            params=${query}
    ...            headers=${HEADERS}
    ...            expected_status=any

    [return]    ${response} 

PUT Usuarios sem payload
    [Arguments]    ${_id}

    Create Session    PutUsuarioSemPayload    ${BASE_URL}

    ${HEADERS}    Create Dictionary    content-type=application/json    authorization=${authentication_token} 

    ${response}    PUT On Session         PutUsuarioSemPayload    /usuarios/${_id}    
    ...            headers=${HEADERS}
    ...            expected_status=any

    [return]    ${response} 

PUT Usuarios valido
    [Arguments]    ${payload}

    Create Session    PutUsuariosValido    ${BASE_URL}

    ${HEADERS}    Create Dictionary    content-type=application/json    authorization=${authentication_token} 

    ${response}    PUT On Session         PutUsuariosValido    /usuarios/${_id}    
    ...            json=${payload}
    ...            headers=${HEADERS}
    ...            expected_status=any

    [return]    ${response}    

DELETE Usuarios
    [Arguments]    ${payload}

    Create Session    DeleteUsuario          ${BASE_URL}
    ${response}       DELETE On Session      DeleteUsuario    /usuarios/${_id}    
    ...               json=${payload}
    ...               headers=${HEADERS}
    ...               expected_status=any

    [return]    ${response}    

DELETE Usuarios sem payload
    [Arguments]    ${_id}

    Create Session    DeleteUsuarioSemPayload    ${BASE_URL}
    ${response}       DELETE On Session          DeleteUsuarioSemPayload    /usuarios/${_id}    
    ...               headers=${HEADERS}
    ...               expected_status=any

    [return]    ${response} 