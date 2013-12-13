package br.edu.unime.util

/**
 * Created with IntelliJ IDEA.
 * User: pparente
 * Date: 27/03/13
 * Time: 14:43
 * To change this template use File | Settings | File Templates.
 */
public class DiaSemana {
    public static String getSemanaByKey(Integer integer){
        switch(integer){
            case 1: return "Domingo"
                break
            case 2: return "Segunda-Feira"
                break
            case 3: return "Terça-Feira"
                break
            case 4: return "Quarta-Feira"
                break
            case 5: return "Quinta-Feira"
                break
            case 5: return "Sexta-Feira"
                break
            case 6: return "Sábado"
                break
        }
    }
}
