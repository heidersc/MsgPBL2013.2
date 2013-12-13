package sisap

class MensagemDestinatario {

	//static mapWith="mongo"

    Boolean lida
    Mensagem mensagem
    Pessoa destinatario
    Long raiz

    static constraints = {
    }
    static mapping = {
        version false
    }
}
