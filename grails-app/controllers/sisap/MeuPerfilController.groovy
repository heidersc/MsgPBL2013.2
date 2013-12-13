package sisap

import static sisap.Pessoa.*

class MeuPerfilController {
    def utilService
    def index() {
        def pessoaInstance = Pessoa.get(session.idPessoa)
        render(view: 'index', model: [pessoaInstance: pessoaInstance])
    }
    def ajaxAlterarSenha(Long id){
        render(template: 'alterarSenha', model: [pessoaInstance: Pessoa.read(id)])
    }
    def alterarSenha = {
        def pessoa = Pessoa.get(params.id)
        pessoa.senha = params.novasenhaConfirm
        if (pessoa.save(flush: true)){
            render g.messageSuccess(message: "Senha Alterada!")
        }else{
            println pessoa.errors
            render "Não alterado"
        }
        return
    }
}
