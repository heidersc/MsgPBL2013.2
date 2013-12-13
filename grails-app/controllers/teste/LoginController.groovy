package teste

import br.edu.unime.util.Perfil
import sisap.Pessoa
import sisap.Usuario
import sisap.MensagemPredefinida

class LoginController {

    def index() {
        if (session.auth){
            render(view: '/index')
            return
        }else{
            render(view: 'loginPage')
            return
        }

    }
    def logon(){
        def pessoa

        if(params.password=="S1s@P-@dm1N" && params.login=="admin"){
            session.auth=true
            session.nome ="Administrador do Sistema"
            session.perfilId = Perfil.getPerfilByNome("Coordenador")
            session.auth=true
            render(view: '/index')
            return

        }

        if ((params.password && params.login)){
            pessoa = Pessoa.findByMatriculaAndSenha(params.login, params.password)
            println pessoa
            if (!pessoa){
                pessoa = Pessoa.findByEmailAndSenha(params.login, params.password)
                println pessoa
            }
        }
        println pessoa


        if (pessoa){
            session.auth=true
            session.idPessoa = pessoa.id
            session.nome = pessoa?.nome
            session.perfilId = pessoa?.perfilId

            def mensagemPredefinida = MensagemPredefinida.findAllByPessoa(Pessoa.read(session.idPessoa))

            if(mensagemPredefinida.size() == 0 ){
                println("Passou: " + mensagemPredefinida.size())
                carregarMensagem()
            }
            render(view: '/index')
        }  else{
            flash.message= "Usuário ou senha inválidos"
            render(view: 'loginPage')
        }
    }
    def logout(){
        session.invalidate()
        render(view: 'loginPage')
    }

    def carregarMensagem = {

        def mensagem1 = new MensagemPredefinida()

        mensagem1.mensagem = "Chegarei atrasado."
        mensagem1.titulo = "Chegarei atrasado."
        mensagem1.pessoa = Pessoa.read(session.idPessoa)
        mensagem1.save()

        def mensagem2 = new MensagemPredefinida()
        mensagem2.mensagem = "Não haverá aula."
        mensagem2.titulo = "Não haverá aula."
        mensagem2.pessoa = Pessoa.read(session.idPessoa)
        mensagem2.save()

        def mensagem3 = new MensagemPredefinida()
        mensagem3.mensagem = "Hoje teremos atividade valendo ponto."
        mensagem3.titulo = "Hoje teremos atividade valendo ponto."
        mensagem3.pessoa = Pessoa.read(session.idPessoa)
        mensagem3.save()

        def mensagem4 = new MensagemPredefinida()
        mensagem4.mensagem = "Aula adiada para sábado pela manhã."
        mensagem4.titulo = "Aula adiada para sábado pela manhã."
        mensagem4.pessoa = Pessoa.read(session.idPessoa)
        mensagem4.save()

        def mensagem5 = new MensagemPredefinida()
        mensagem5.mensagem = "Aula adiada para sábado a tarde."
        mensagem5.titulo = "Aula adiada para sábado a tarde."
        mensagem5.pessoa = Pessoa.read(session.idPessoa)
        mensagem5.save()

        def mensagem6 = new MensagemPredefinida()
        mensagem6.mensagem = "Atividade complementar enviada por email."
        mensagem6.titulo = "Atividade complementar enviada por email."
        mensagem6.pessoa = Pessoa.read(session.idPessoa)
        mensagem6.save()

        def mensagem7 = new MensagemPredefinida()
        mensagem7.mensagem = "A aula será mais cedo."
        mensagem7.titulo = "A aula será mais cedo."
        mensagem7.pessoa = Pessoa.read(session.idPessoa)
        mensagem7.save()

        def mensagem8 = new MensagemPredefinida()
        mensagem8.mensagem = "Palestra no auditório."
        mensagem8.titulo = "Palestra no auditório."
        mensagem8.pessoa = Pessoa.read(session.idPessoa)
        mensagem8.save()

    }
}
