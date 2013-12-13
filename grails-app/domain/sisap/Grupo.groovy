package sisap

class Grupo {
    //static mapWith="mongo"

    String nome
    String cor
    Pessoa professor

    static hasMany = [alunos: Pessoa]

    static constraints = {
    }
}
