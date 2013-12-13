package sisap

class Curso {
    //static mapWith="mongo"

    String codigo
    String nome
    String descricao

    static hasMany = [alunos: Pessoa]

    static constraints = {
        codigo(nullable: false,blank: false)
        nome(nullable: false,blank: false)
        descricao(nullable: false,blank: false)
        alunos(nullable: true,blank: true)
    }

    String toString(){
        return nome
    }
}