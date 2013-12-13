<%@ page import="sisap.Usuario" %>



<div class="rowElem"><label for="login">
    <g:message code="usuario.login.label" default="Login" />
    <span class="required-indicator">*</span>
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'login', 'error')} required">

        <g:textField name="login" required="" value="${usuarioInstance?.login}"/>
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="senha">
    <g:message code="usuario.senha.label" default="Senha" />
    <span class="required-indicator">*</span>
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'senha', 'error')} required">

        <g:textField name="senha" required="" value="${usuarioInstance?.senha}"/>
    </div>
</div><div class="fix"></div></div>


