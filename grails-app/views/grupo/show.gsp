
<%@ page import="sisap.Grupo" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'grupo.label', default: 'Grupo')}" />
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
                    <li><g:link action="show" id="${grupoInstance.id}"> <g:message code="default.show.label" args="[entityName]" /></g:link></li>
                </ul>
            </div>
        </div>
        <g:hasErrors bean="${grupoInstance}">
            <div class="pt20">
                <ul class="errors" role="alert">
                    <g:eachError bean="${grupoInstance}" var="error">
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
                <g:hiddenField name="id" value="${grupoInstance.id}" />
                <ul>
                    <li class="iEdit"><g:link id="${grupoInstance.id}" action="edit"><span><g:message code="default.edit.label" args="[entityName]" /></span></g:link> </li>
                    <li class="iDelete"><a href="#" onclick="jConfirm('Tem certeza que deseja excluir este(a) ${message(code: 'grupo.label', default: 'Grupo')}?', 'Confirmação', function(e){if(e){$('form#formShow').submit();}});"><span><g:message code="default.button.delete.label" args="[entityName]" /></span></a></li>
                </ul>
            </g:form>
        </div>
        <div class="fix"></div>
        <div class="mainForm">
            <fieldset>
                <div class="widget first">
                    <div class="head"><h5 class="iList">Dados do teste</h5></div>
                    
                    <g:if test="${grupoInstance?.alunos}">
                        <div class="rowElem"><label><span id="alunos-label" class="property-label"><g:message code="grupo.alunos.label" default="Alunos" /></span>:</label>
                            <div class="formRight">
                                

                                <g:each in="${grupoInstance.alunos}" var="a">
                                    <span class="property-value" aria-labelledby="alunos-label"><g:link controller="pessoa" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span> <div class="fix"></div>
                                </g:each>
                                
                            </div><div class="fix"></div></div>
                    </g:if>
                    
                    <g:if test="${grupoInstance?.nome}">
                        <div class="rowElem"><label><span id="nome-label" class="property-label"><g:message code="grupo.nome.label" default="Nome" /></span>:</label>
                            <div class="formRight">
                                
                                <span class="property-value" aria-labelledby="nome-label"><g:textField readonly="readonly" name="${grupoInstance}" value="${grupoInstance.nome}" /></span>
                                
                            </div><div class="fix"></div></div>
                    </g:if>
                    
                    
                    
                    <g:if test="${grupoInstance?.cor}">
                        <div class="rowElem"><label><span id="cor-label" class="property-label"><g:message code="grupo.cor.label" default="Cor" /></span>:</label>
                            <div class="formRight">
                                
                                <span class="property-value" aria-labelledby="cor-label"><g:textField readonly="readonly" name="${grupoInstance}" value="${grupoInstance.cor}" /></span>
                                
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
