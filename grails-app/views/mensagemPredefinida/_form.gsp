<%@ page import="sisap.MensagemPredefinida" %>



<div class="rowElem"><label for="titulo">
    <g:message code="mensagemPredefinida.titulo.label" default="Titulo" />
    <span class="required-indicator">*</span>
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: mensagemPredefinidaInstance, field: 'titulo', 'error')} required">

        <g:textField name="titulo" required="" value="${mensagemPredefinidaInstance?.titulo}"/>
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="mensagem">
    <g:message code="mensagemPredefinida.mensagem.label" default="Mensagem" />
    
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: mensagemPredefinidaInstance, field: 'mensagem', 'error')} ">

        <g:textArea name="mensagem" cols="40" rows="5" maxlength="300" value="${mensagemPredefinidaInstance?.mensagem}"/>
    </div>
</div><div class="fix"></div></div>
</div><div class="fix"></div></div>


