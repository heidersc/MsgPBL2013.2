package sisap

import javax.xml.bind.annotation.XmlAccessType
import javax.xml.bind.annotation.XmlAccessorType
import javax.xml.bind.annotation.XmlElement

@XmlAccessorType(XmlAccessType.NONE)
class Disciplina {

    //static mapWith="mongo"

    @XmlElement(name = "codigo")
    String codigo

    @XmlElement(name = "nome")
    String nome

    @XmlElement(name = "descricao")
    String descricao

    static constraints = {
        codigo(blank: false, unique: true)
        nome(blank: false, unique: true)
        descricao(maxSize: 500)
    }
    String toString(){
        return nome
    }
}


