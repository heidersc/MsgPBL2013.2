package br.edu.unime.util
/**
 * Created with IntelliJ IDEA.
 * User: phillip
 * Date: 23/03/13
 * Time: 11:22
 * To change this template use File | Settings | File Templates.
 */
public class Perfil {

    public static String getPerfilByKey(Integer integer){
        switch(integer){
            case 1: return "Aluno"
            break
            case 2: return "Professor"
            break
            case 3: return "Coordenador"
        }
    }
    public static Integer getPerfilByNome(String nome){
        if (nome.toLowerCase() in "aluno"){
            return 1
        }else if (nome.toLowerCase() in "professor"){
            return 2
        }else if (nome.toLowerCase() in "coordenador"){
            return 3
        }
    }
    public static getMapPerfil(){
        def perfis = [:]

        perfis.putAt("1", "Aluno")
        perfis.putAt("2", "Professor")
        perfis.putAt("3", "Coordenador")

        return perfis

    }
}
