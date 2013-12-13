package sisap
import br.edu.unime.util.Perfil

class Pessoa {
    //static mapWith="mongo"

    String nome
    String matricula
    String email
    String cpf
    String rg
    String senha
    Integer perfilId
    String telefoneCelular
    Boolean status

    static hasMany = [disciplinas: PeriodoDisciplina]


    String getPerfil(){ return Perfil.getPerfilByKey(perfilId)}
    static belongsTo = [curso: Curso]

    static transients = ['perfil']

    static constraints = {
        nome(nullable: false, blank: false)
        matricula(nullable: false, blank: false, unique: true)
        email(nullable: false, blank: false, email: true, unique: true)
        cpf(nullable: false)
        senha(nullable: false, blank: false)
        perfilId(nullable: false, inList: [1,2,3])
        status(nullable: false, blank: false)
        curso(nullable: true)
        telefoneCelular(nullable: false)


    }

    @Override
    String toString(){
        return nome +" - " + Perfil.getPerfilByKey(perfilId)
    }

    @Override
    boolean equals(obj){
        return obj?.id==id ? true:false
    }

    static namedQueries = {}


}