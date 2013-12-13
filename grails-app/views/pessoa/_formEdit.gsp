<%@ page import="sisap.Pessoa" %>

<g:javascript src="${resource(dir:'js',file:'jquery-1.2.6.pack.js')}"/>
<g:javascript src="${resource(dir:'js',file:'jquery.maskedinput-1.1.4.pack.js')}"/>	 <g:javascript>

    $(document).ready(function(){
        $("#telefoneCelular").mask("99-9999-9999");
        $("#cpf").mask("999.999.999-99");
        $("#cep").mask("99999-999");
        //$("#data").mask("99/99/9999");
    });

</g:javascript>

<div class="rowElem"><label for="nome">
    <g:message code="pessoa.nome.label" default="Nome" />
    <span class="required-indicator">*</span>
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: pessoaInstance, field: 'nome', 'error')} required">

        <g:textField name="nome" required="" value="${pessoaInstance?.nome}"/>
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="matricula">
    <g:message code="pessoa.matricula.label" default="Matricula" />
    <span class="required-indicator">*</span>
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: pessoaInstance, field: 'matricula', 'error')} required">

        <g:textField name="matricula" required="" value="${pessoaInstance?.matricula}"/>
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="email">
    <g:message code="pessoa.email.label" default="Email" />
    <span class="required-indicator">*</span>
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: pessoaInstance, field: 'email', 'error')} required">

        <g:textField name="email" required="" value="${pessoaInstance?.email}"/>
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="cpf">
    <g:message code="pessoa.cpf.label" default="Cpf" />
    <span class="required-indicator">*</span>
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: pessoaInstance, field: 'cpf', 'error')} required">

        <g:textField name="cpf" required="" value="${pessoaInstance?.cpf}"/>
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="senha">
    <g:message code="pessoa.senha.label" default="Senha" />
    <span class="required-indicator">*</span>
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: pessoaInstance, field: 'senha', 'error')} required">

        <g:passwordField name="senha" required="" value="${pessoaInstance?.senha}"/>
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="perfilId">
    <g:message code="pessoa.perfilId.label" default="Perfil Id" />
    <span class="required-indicator">*</span>
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: pessoaInstance, field: 'perfilId', 'error')} required">
        <div class="formRight noSearch">
            <g:select class="chzn-select" name="perfilId" from="${br.edu.unime.util.Perfil.mapPerfil}" optionKey="key" optionValue="value" value="${fieldValue(bean: pessoaInstance, field: 'perfilId')}" valueMessagePrefix="pessoa.perfilId"/>
        </div>

    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="status">
    <g:message code="pessoa.status.label" default="Status" />
    
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: pessoaInstance, field: 'status', 'error')} ">

        <g:checkBox name="status" value="${pessoaInstance?.status}" />
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="rg">
    <g:message code="pessoa.rg.label" default="Rg" />
    
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: pessoaInstance, field: 'rg', 'error')} ">

        <g:textField name="rg" value="${pessoaInstance?.rg}"/>
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="telefoneCelular">
    <g:message code="pessoa.telefoneCelular.label" default="Telefone Celular" />
    <span class="required-indicator">*</span>
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: pessoaInstance, field: 'telefoneCelular', 'error')} ">

        <g:textField name="telefoneCelular" required="" value="${pessoaInstance?.telefoneCelular}"/>
    </div>
</div><div class="fix"></div></div>

                        <div class="rowElem">
                        <label>Curso:</label>
                        <div class="formRight searchDrop">
                        <g:select name="curso.id" class="chzn-select" from="${sisap.Curso.listOrderByNome()}" optionKey="id" optionValue="nome" value="${sisap.Curso.find("from Curso as c inner join fetch c.alunos as a where a.nome=?", [pessoaInstance.nome]).nome}" valueMessagePrefix="curso.nome" style="width:350px;" />

                        </div>
                        <div class="fix"></div>
                        </div>


