;" class="mopcoes orientacao"><span>Opções <img style="position: relative right:0px;" src="images/template/mais.png"/>
</span></div>                    </div>                    <div
        class="divopcoes"><!-- Para usuários originários do Busca CEP -->                            <div>Simule um envio utilizando <br/> o CEP <strong>42841000</strong> como:
    </div>                            <ul><li><a onclick="retornarParaPrecos('42841000', '1');">CEP Origem <img
            src="images/template/cep_r.png"/></a></li>                                <li><a
            onclick="retornarParaPrecos('42841000', '2');"><img src="images/template/cep_d.png"/>CEP Destino</a></li>
    </ul></div>

<div class="botoes"><div class="iconeesq"><a href="buscaCep.do"><img src="images/template/seta-esquerda.gif"><span
        class="nav">&nbsp;Nova Consulta</span></a></div>                                                <br
        class="clr">                <input type="hidden" name="metodo" value="buscarCep"
                                           id="metodo">                <input type="hidden" name="numPagina"
                                                                              value="1">                <input
        type="hidden" name="regTotal" value="1">                <input type="hidden" name="cepEntrada" value="42841000"
                                                                       id="cepEntrada">                <input
        type="hidden" name="tipoCep" value="" id="tipoCep">                <input type="hidden" name="cepTemp" value=""
                                                                                  id="cepTemp">
</div>        </form>    </div>    <script>            $('document').ready(function () {
    $('div div.mopcoes span').click(function () {
        $(this).parents().next('div.divopcoes').slideToggle(500);
    });
});
function retornarParaPrecos(pCepSelecionado, pTipoCep) {
    var tipoCep = null;
    if (pTipoCep == null) {
        tipoCep = $('#tipoCep').val();
    } else {
        tipoCep = pTipoCep;
    }
    var cepOrigem;
    var cepDestino;
    if (tipoCep != null) {
        switch (tipoCep) {
            case "1":
                cepOrigem = pCepSelecionado;
                cepDestino = $('#cepTemp').val();
                break;
            case "2":
                cepOrigem = $('#cepTemp').val();
                cepDestino = pCepSelecionado;
                break;
        }
        $('#cepOrigem').val(cepOrigem);
        $('#cepDestino').val(cepDestino);
        $('#calcularPrecos').submit();
    }
}    </script>

<form name="precoForm" method="post" action="/movel/precos.do" id="calcularPrecos"><input type="hidden" name="cepOrigem"
                                                                                          value=""
                                                                                          id="cepOrigem">        <input
        type="hidden" name="cepDestino" value="" id="cepDestino"></form>

<form name="buscaCepForm" method="post" action="/movel/buscaCep.do" id="buscaCepInicio"><input type="hidden"
                                                                                               name="cepEntrada"
                                                                                               value="42841000"
                                                                                               class="comptotal">        <input
        type="hidden" name="tipoCep" value="" id="tipoCep">        <input type="hidden" name="cepTemp" value=""
                                                                          id="cepTemp">
</form>                <br/>            </div>            <div class="rodape">&nbsp;<a
        href="/movel/faleCorreios.do"><img src="images/template/fcc.gif" align="absmiddle">    <span
            class="orientacao">&nbsp;Fale com os Correios</span></a> | <a href="http://www.correios.com.br/"><span
        class="orientacao">&nbsp;Versão clássica</span></a><br>

    <div class="textorodape">&copy; Copyright 2013 Correios - Todos os direitos reservados</div>
</div>        </div>	</body></html>