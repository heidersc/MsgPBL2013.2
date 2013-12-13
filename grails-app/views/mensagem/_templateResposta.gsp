<g:each in="${mensagemInstance?.mensagens.sort{it.id}}" var="mensagemResposta">
    <div class="rowElem">
        <label><span id="mensagem-label" class="property-label"><b>${mensagemResposta.remetente.nome} - <g:formatDate date="${mensagemResposta.dataMensagem}" format="dd/MM/yyyy 'às' HH:mm" /></b></span>:</label>
        <div class="formRight">

            <span class="property-value" aria-labelledby="mensagem-label">${mensagemResposta.mensagem}</span>

        </div><div class="fix"></div></div>
</g:each>