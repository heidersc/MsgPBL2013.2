package sisap

class PeriodoDisciplina {
    //static mapWith="mongo"

    Integer ano
    Integer semestre
    Integer sala

    String getPeriodo() {return ano.toString() + "." + semestre.toString()}
    Pessoa professor
    Disciplina disciplina


    static transients = ['periodo']

    static hasMany = [alunos:Pessoa, atividadesPeriodo: AtividadePeriodo, grupos: Grupo]
    static belongsTo = Pessoa

    static constraints = {
    }
    static mapping = {
        //alunos sort: 'nome'
    }



}
