<%@ page import="sisap.Pessoa" %>



<div class="rowElem"><label for="usuario">
    <g:message code="pessoa.usuario.label" default="Usuario" />
    
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: pessoaInstance, field: 'usuario', 'error')} ">

        <g:select id="usuario" name="usuario.id" from="${sisap.Usuario.list()}" optionKey="id" value="${pessoaInstance?.usuario?.id}" class="many-to-one" noSelection="['': 'Selecione']"/>
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="email">
    <g:message code="pessoa.email.label" default="Email" />
    
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: pessoaInstance, field: 'email', 'error')} ">

        <g:textField name="email" value="${pessoaInstance?.email}"/>
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="nome">
    <g:message code="pessoa.nome.label" default="Nome" />
    
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: pessoaInstance, field: 'nome', 'error')} ">

        <g:textField name="nome" value="${pessoaInstance?.nome}"/>
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="perfis">
    <g:message code="pessoa.perfis.label" default="Perfis" />
    
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: pessoaInstance, field: 'perfis', 'error')} ">

        <g:select name="perfis" from="${sisap.Perfil.list()}" multiple="multiple" optionKey="id" size="5" value="${pessoaInstance?.perfis*.id}" class="many-to-many"/>
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="telefoneCelular">
    <g:message code="pessoa.telefoneCelular.label" default="Telefone Celular" />
    
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: pessoaInstance, field: 'telefoneCelular', 'error')} ">

        <g:textField name="telefoneCelular" value="${pessoaInstance?.telefoneCelular}"/>
    </div>
</div><div class="fix"></div></div>


