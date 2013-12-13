<%@ page import="sisap.Mensagem" %>



<div class="rowElem"><label for="titulo">
    <g:message code="mensagem.titulo.label" default="Titulo" />
    <span class="required-indicator">*</span>
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: mensagemInstance, field: 'titulo', 'error')} required">

        <g:textField name="titulo" required="" value="${mensagemInstance?.titulo}"/>
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="destinatarios">
    <g:message code="mensagem.destinatarios.label" default="Destinatarios" />
    
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: mensagemInstance, field: 'destinatarios', 'error')} ">

        <g:select name="destinatarios" from="${sisap.Pessoa.list()}" multiple="multiple" optionKey="id" size="5" value="${mensagemInstance?.destinatarios*.id}" class="many-to-many"/>
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="mensagem">
    <g:message code="mensagem.mensagem.label" default="Mensagem" />
    
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: mensagemInstance, field: 'mensagem', 'error')} ">

        <g:textArea name="mensagem" cols="40" rows="5" maxlength="300" value="${mensagemInstance?.mensagem}"/>
    </div>
</div><div class="fix"></div></div>


