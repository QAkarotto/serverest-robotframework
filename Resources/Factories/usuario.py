

def factory_editar_usuario():
    usuario = {
        'nome': 'Usuário Para Editar',
        'email': 'usuario_editar@outlook.com.br',
        'password': 'scoleta',
        'administrador': 'true'
    }
    return usuario

def factory_criar_usuario_editar():
    usuario = {
        'nome': 'Scola ABC',
        'email': 'scolaabc@outlook.com.br',
        'password': 'scoleta',
        'administrador': 'true'
    }
    return usuario

def factory_criar_usuario():
    usuario = {
        'nome': 'Scola Teste',
        'email': 'scola@teste.com.br',
        'password': 'teste',
        'administrador': 'true'
    }
    return usuario 

def factory_criar_usuario_lista():
    usuario_lista = [
        {
        'nome': 'Primeiro Usuario',
        'email': 'primeiro@usuario.com.br',
        'password': 'primeiro',
        'administrador': 'true'   
        },
        {
        'nome': 'Segundo Usuario',
        'email': 'segundo@usuario.com.br',
        'password': 'segundo',
        'administrador': 'true'   
        },
        {
        'nome': 'Terceiro Usuario',
        'email': 'terceiro@usuario.com.br',
        'password': 'terceiro',
        'administrador': 'false'   
        }
    ]
    return usuario_lista

def factory_get_usuario():
    usuario = {
        'nome': 'Usuario GET',
        'email': 'usuario@get.com.br',
        'password': 'scoleta',
        'administrador': 'true'
    }
    return usuario        

def factory_deletar_usuario():
    usuario = {
        'nome': 'Usuario Delete',
        'email': 'usuario@delete.com.br',
        'password': 'scoleta',
        'administrador': 'true'
    }
    return usuario    