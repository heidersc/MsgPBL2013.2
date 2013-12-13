package br.edu.unime.util

class UtilService {

    def serviceMethod() {

    }

    def findPlaceByCEP = {cep->
        def url = new URL("http://m.correios.com.br/movel/buscaCepConfirma.do?cepEntrada=42841000&tipoCep=&cepTemp=&metodo=buscarCep")
        def conn = url.openConnection()

        def is = url.openStream();
        def isr = new InputStreamReader(is,"ISO-8859-1");
        def br = new BufferedReader(isr)

        def input = new BufferedReader(isr)

        def linha = input.readLine()
        def str = "";
        while (linha != null) {
            str+=linha
            linha = br.readLine()

        }

        println str


    }
}
