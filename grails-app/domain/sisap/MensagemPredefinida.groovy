package sisap

class MensagemPredefinida {

    //static mapWith="mongo"
    String titulo
    String mensagem
    Pessoa pessoa

    static hasMany = [mensagem: MensagemPredefinida]
    static constraints = {
        titulo(blank: false)
        mensagem(maxSize: 300)
    }
}
