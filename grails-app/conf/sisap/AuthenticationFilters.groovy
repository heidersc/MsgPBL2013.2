package sisap

class AuthenticationFilters {


    def filters = {
        all(controller:'*', action:'*') {
            before = {
//                def pessoa = Pessoa.read(session.idPessoa)

                if(!session.auth && (params.controller != 'login')){
                    flash.message = "Usuário não logado ou a sessão expirou."
                    redirect(controller: 'login', action: 'index')
                    return false
                }


            }
            after = { Map model ->

            }
            afterView = { Exception e ->

            }
        }
    }
}
