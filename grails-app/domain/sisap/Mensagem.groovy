package sisap

class Mensagem {

    //static mapWith="mongo"

    Pessoa remetente
    String titulo
    String mensagem
    Boolean status
    Date dataMensagem
    String emailDestinatario
    Boolean excluida

    static hasMany = [destinatarios: Pessoa, mensagens: Mensagem, grupos: Grupo, mensagemDestinatario: MensagemDestinatario]

    static constraints = {
        titulo(blank: false)
        destinatarios(blank: false)
        mensagem(maxSize: 300)
    }
}