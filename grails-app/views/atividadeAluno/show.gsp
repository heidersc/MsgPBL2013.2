
<%@ page import="sisap.AtividadeAluno" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'atividadeAluno.label', default: 'AtividadeAluno')}" />
    <title><g:message code="default.show.label" args="[entityName]" /></title>
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
                    <li><g:link action="show" id="${atividadeAlunoInstance.id}"> <g:message code="default.show.label" args="[entityName]" /></g:link></li>
                </ul>
            </div>
        </div>
        <g:hasErrors bean="${atividadeAlunoInstance}">
            <div class="pt20">
                <ul class="errors" role="alert">
                    <g:eachError bean="${atividadeAlunoInstance}" var="error">
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
            <g:form method="POST" >
                <g:hiddenField name="id" value="${atividadeAlunoInstance}" />
                <ul>
                    <li class="iEdit"><g:link id="${atividadeAlunoInstance.id}" action="edit"><span><g:message code="default.edit.label" args="[entityName]" /></span></g:link> </li>
                    <li class="iDelete"><g:link  onclick="if(!(jConfirm('Tem certeza que deseja excluir este(a) ${message(code: 'atividadeAluno.label', default: 'AtividadeAluno')}?', 'Confirmação')))return false;"><span><g:message code="default.button.delete.label" args="[entityName]" /></span></g:link></li>
                </ul>
            </g:form>
        </div>
        <div class="fix"></div>
        <div class="mainForm">
            <fieldset>
                <div class="widget first">
                    <div class="head"><h5 class="iList">Dados do teste</h5></div>
                    
                    <g:if test="${atividadeAlunoInstance?.aluno}">
                        <div class="rowElem"><label><span id="aluno-label" class="property-label"><g:message code="atividadeAluno.aluno.label" default="Aluno" /></span>:</label>
                            <div class="formRight">
                                

                                <span class="property-value" aria-labelledby="aluno-label"><g:link controller="pessoa" action="show" id="${atividadeAlunoInstance?.aluno?.id}">${atividadeAlunoInstance?.aluno?.encodeAsHTML()}</g:link></span>
                                
                            </div><div class="fix"></div></div>
                    </g:if>
                    
                    <g:if test="${atividadeAlunoInstance?.atividadePeriodo}">
                        <div class="rowElem"><label><span id="atividadePeriodo-label" class="property-label"><g:message code="atividadeAluno.atividadePeriodo.label" default="Atividade Periodo" /></span>:</label>
                            <div class="formRight">
                                

                                <span class="property-value" aria-labelledby="atividadePeriodo-label"><g:link controller="atividadePeriodo" action="show" id="${atividadeAlunoInstance?.atividadePeriodo?.id}">${atividadeAlunoInstance?.atividadePeriodo?.encodeAsHTML()}</g:link></span>
                                
                            </div><div class="fix"></div></div>
                    </g:if>
                    
                    <g:if test="${atividadeAlunoInstance?.dataEntrega}">
                        <div class="rowElem"><label><span id="dataEntrega-label" class="property-label"><g:message code="atividadeAluno.dataEntrega.label" default="Data Entrega" /></span>:</label>
                            <div class="formRight">
                                
                                <span class="property-value" aria-labelledby="dataEntrega-label"><g:formatDate date="${atividadeAlunoInstance?.dataEntrega}" /></span>
                                
                            </div><div class="fix"></div></div>
                    </g:if>
                    
                    <g:if test="${atividadeAlunoInstance?.nota}">
                        <div class="rowElem"><label><span id="nota-label" class="property-label"><g:message code="atividadeAluno.nota.label" default="Nota" /></span>:</label>
                            <div class="formRight">
                                
                                <span class="property-value" aria-labelledby="nota-label"><g:textField readonly="readonly" name="${atividadeAlunoInstance}" value="${atividadeAlunoInstance.nota}" /></span>
                                
                            </div><div class="fix"></div></div>
                    </g:if>
                    
                    <div class="fix"></div>
                </div>
            </fieldset>
        </div>
    </div>
    <div class="fix"></div>
</div>
</body>
</html>
