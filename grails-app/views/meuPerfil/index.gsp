
<%@ page import="br.edu.unime.util.Perfil; sisap.Pessoa" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'pessoa.label', default: 'Pessoa')}" />
    <title><g:message code="default.show.label" args="[entityName]" /></title>
     <g:javascript>

        function showHideAlterarSenha(){
            if(!($("#divAlterarSenha").is(":visible")))  {
                $("#divAlterarSenha").slideDown('slow');
                $("#alterarSenha").text("Cancelar");
            }else{
                $("#divAlterarSenha").slideUp('slow');
                $("#alterarSenha").text("Alterar Senha");
            }
        }

     </g:javascript>
</head>
<body>
<div class="wrapper">

<div class="content" id="container">
<div class="title"><h5><g:message code="default.show.label" args="[entityName]" /></h5></div>
<div class="breadCrumbHolder module">
    <div class="breadCrumb module">
        <ul>
            <li class="firstB"><a href="#">Home</a> </li>
            <li><g:link action="index"> <g:message code="default.list.label" args="[entityName]" /></g:link></li>
            <li><g:link action="show" id="${pessoaInstance.id}"> <g:message code="default.show.label" args="[entityName]" /></g:link></li>
        </ul>
    </div>
</div>
<g:hasErrors bean="${pessoaInstance}">
    <div class="pt20">
        <ul class="errors" role="alert">
            <g:eachError bean="${pessoaInstance}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>>
                    <div class="nNote nFailure hideit">
                        <p><strong>Erro: </strong><g:message error="${error}"/></p>
                    </div>

                </li>
            </g:eachError>
        </ul>
    </div>
</g:hasErrors>
<g:if test="${flash.message}">
    <div class="pt20">
        <div class="nNote nSuccess hideit">
            <p><strong>Sucesso: </strong>${flash.message}</p>
        </div>
    </div>
</g:if>
<div class="middleNav">
    <g:form name="formShow" method="POST"  action="delete">
        <g:hiddenField name="id" value="${pessoaInstance.id}" />
        <ul>
            <li class="iEdit"><g:link id="${pessoaInstance.id}" action="edit"><span><g:message code="default.edit.label" args="[entityName]" /></span></g:link> </li>
            <li class="iDelete"><a href="#" onclick="jConfirm('Tem certeza que deseja excluir este(a) ${message(code: 'pessoa.label', default: 'Pessoa')}?', 'Confirmação', function(e){if(e){$('form#formShow').submit();}});"><span><g:message code="default.button.delete.label" args="[entityName]" /></span></a></li>
        </ul>
    </g:form>
</div>
<div class="fix"></div>
<div class="mainForm">
    <fieldset>
        <div class="widget first">
            <div class="head"><h5 class="iList">Dados do ${pessoaInstance.perfil}</h5></div>
            <div class="rowElem"><label><span id="ano-label" class="property-label">Nome</span>:</label>
                <div class="formRight">

                    %{--<span class="property-value" aria-labelledby="ano-label"><g:textField readonly="readonly" name="${periodoDisciplinaInstance}" value="${periodoDisciplinaInstance.ano}" /></span>--}%
                    <h4 class="red pt10">${pessoaInstance?.nome}</h4>
                </div><div class="fix"></div></div>
            <div class="rowElem"><label><span id="ano-label" class="property-label">Matrícula</span>:</label>
                <div class="formRight">

                    %{--<span class="property-value" aria-labelledby="ano-label"><g:textField readonly="readonly" name="${periodoDisciplinaInstance}" value="${periodoDisciplinaInstance.ano}" /></span>--}%
                    <h4 class="red pt10">${pessoaInstance?.matricula}</h4>
                </div><div class="fix"></div></div>

            <div class="widget">
                <ul class="tabs">
                    <li><a href="#tab1">Detalhes</a></li>
                    <li><a href="#tab2">Disciplinas</a></li>
                </ul>

                <div class="tab_container">
                    <div id="tab1" class="tab_content"><g:if test="${pessoaInstance?.nome}">
                        <div class="rowElem"><label><span id="nome-label" class="property-label"><g:message code="pessoa.nome.label" default="Nome" /></span>:</label>
                            <div class="formRight">

                                <span class="property-value" aria-labelledby="nome-label"><h5>${pessoaInstance?.nome}</h5></span>

                            </div><div class="fix"></div></div>
                    </g:if>

                        <g:if test="${pessoaInstance?.matricula}">
                            <div class="rowElem"><label><span id="matricula-label" class="property-label"><g:message code="pessoa.matricula.label" default="Matricula" /></span>:</label>
                                <div class="formRight">

                                    <span class="property-value" aria-labelledby="matricula-label"><h5>${pessoaInstance?.matricula}</h5></span>

                                </div><div class="fix"></div></div>
                        </g:if>

                        <g:if test="${pessoaInstance?.email}">
                            <div class="rowElem"><label><span id="email-label" class="property-label"><g:message code="pessoa.email.label" default="Email" /></span>:</label>
                                <div class="formRight">

                                    <span class="property-value" aria-labelledby="email-label"><h5>${pessoaInstance?.email}</h5></span>

                                </div><div class="fix"></div></div>
                        </g:if>

                        <g:if test="${pessoaInstance?.cpf}">
                            <div class="rowElem"><label><span id="cpf-label" class="property-label"><g:message code="pessoa.cpf.label" default="Cpf" /></span>:</label>
                                <div class="formRight">

                                    <span class="property-value" aria-labelledby="cpf-label"><h5>${pessoaInstance?.cpf}</h5></span>

                                </div><div class="fix"></div></div>
                        </g:if>

                        <g:if test="${pessoaInstance?.perfilId}">
                            <div class="rowElem"><label><span id="perfilId-label" class="property-label">Perfil</span>:</label>
                                <div class="formRight">

                                    <span class="property-value" aria-labelledby="perfilId-label">
                                        <h5>${ Perfil.getPerfilByKey(pessoaInstance.perfilId)}</h5>
                                    </span>

                                </div><div class="fix"></div></div>
                        </g:if>

                        <g:if test="${pessoaInstance?.status}">
                            <div class="rowElem"><label><span id="status-label" class="property-label"><g:message code="pessoa.status.label" default="Status" /></span>:</label>
                                <div class="formRight">

                                    <span class="property-value" aria-labelledby="status-label">
                                        <h5><g:formatBoolean boolean="${pessoaInstance?.status}" true="Ativo" false="Inativo" /></h5>
                                    </span>

                                </div><div class="fix"></div></div>
                        </g:if>

                        <g:if test="${pessoaInstance?.rg}">
                            <div class="rowElem"><label><span id="rg-label" class="property-label"><g:message code="pessoa.rg.label" default="Rg" /></span>:</label>
                                <div class="formRight">

                                    <span class="property-value" aria-labelledby="rg-label">
                                        <h4>${pessoaInstance?.rg}</h4>
                                    </span>

                                </div><div class="fix"></div></div>
                        </g:if>

                        <g:if test="${pessoaInstance?.telefoneCelular}">
                            <div class="rowElem"><label><span id="telefoneCelular-label" class="property-label"><g:message code="pessoa.telefoneCelular.label" default="Telefone Celular" /></span>:</label>
                                <div class="formRight">

                                    <span class="property-value" aria-labelledby="telefoneCelular-label">
                                        <h4>  ${pessoaInstance?.telefoneCelular}</h4>
                                    </span>

                                </div><div class="fix"></div></div>
                        </g:if>
                        <g:if test="${pessoaInstance?.curso}">
                            <div class="rowElem"><label><span id="status-label" class="property-label"><g:message code="pessoa.curso.label" default="Curso" /></span>:</label>
                                <div class="formRight">

                                    <span class="property-value" aria-labelledby="status-label">
                                        <h4>${pessoaInstance?.curso.nome}</h4>
                                    </span>

                                </div><div class="fix"></div></div>
                        </g:if>
                        <div class="fix"></div>
                    </div>
                    <div id="tab2" class="tab_content">
                        %{--<g:if test="${aulas}">--}%
                        <div class="table">

                            <div class="head"><h5 class="iFrames">Listagem de Disciplinas: ${pessoaInstance.disciplinas.size()}</h5></div>
                            <table cellpadding="0" cellspacing="0" width="100%" class="tableStatic resize">
                                <thead class="head">
                                <tr>

                                    <td>Disciplina</td>
                                    <td>Professor</td>
                                    <td>Período</td>


                                </tr>
                                </thead>
                                <tbody>
                                <g:each in="${pessoaInstance?.disciplinas}" var="periodoDisciplina">
                                    <tr>

                                        <td>
                                            <g:link controller="periodoDisciplina" action="show" id="${periodoDisciplina?.id}">
                                                ${periodoDisciplina?.disciplina?.nome}
                                            </g:link>

                                        </td>
                                        <td>    ${periodoDisciplina?.professor.nome}</td>
                                        <td>    ${periodoDisciplina?.periodo}</td>

                                    </tr>
                                </g:each>

                                </tbody>
                            </table>
                        </div>
                        %{--</g:if>--}%
                    </div>
                </div>
                <div class="fix"></div>
            </div>


        </div>
    </fieldset>
</div>

</div>
<div class="fix"></div>

</div>
</body>
</html>
