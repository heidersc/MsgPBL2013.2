
<%@ page import="sisap.AtividadePeriodo" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'atividadePeriodo.label', default: 'AtividadePeriodo')}" />
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
                    <li><g:link action="show" id="${atividadePeriodoInstance.id}"> <g:message code="default.show.label" args="[entityName]" /></g:link></li>
                </ul>
            </div>
        </div>
        <g:hasErrors bean="${atividadePeriodoInstance}">
            <div class="pt20">
                <ul class="errors" role="alert">
                    <g:eachError bean="${atividadePeriodoInstance}" var="error">
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
                <g:hiddenField name="id" value="${atividadePeriodoInstance}" />
                <ul>
                    <li class="iEdit"><g:link id="${atividadePeriodoInstance.id}" action="edit"><span><g:message code="default.edit.label" args="[entityName]" /></span></g:link> </li>
                    <li class="iDelete"><g:link  onclick="if(!(jConfirm('Tem certeza que deseja excluir este(a) ${message(code: 'atividadePeriodo.label', default: 'AtividadePeriodo')}?', 'Confirmação')))return false;"><span><g:message code="default.button.delete.label" args="[entityName]" /></span></g:link></li>
                </ul>
            </g:form>
        </div>
        <div class="fix"></div>
        <div class="mainForm">
            <fieldset>
                <div class="widget first">
                    <div class="head"><h5 class="iList">Dados do teste</h5></div>
                    
                    <g:if test="${atividadePeriodoInstance?.atividade}">
                        <div class="rowElem"><label><span id="atividade-label" class="property-label"><g:message code="atividadePeriodo.atividade.label" default="Atividade" /></span>:</label>
                            <div class="formRight">
                                

                                <span class="property-value" aria-labelledby="atividade-label"><g:link controller="atividade" action="show" id="${atividadePeriodoInstance?.atividade?.id}">${atividadePeriodoInstance?.atividade?.encodeAsHTML()}</g:link></span>
                                
                            </div><div class="fix"></div></div>
                    </g:if>
                    
                    <g:if test="${atividadePeriodoInstance?.atividadesAluno}">
                        <div class="rowElem"><label><span id="atividadesAluno-label" class="property-label"><g:message code="atividadePeriodo.atividadesAluno.label" default="Atividades Aluno" /></span>:</label>
                            <div class="formRight">
                                

                                <g:each in="${atividadePeriodoInstance.atividadesAluno}" var="a">
                                    <span class="property-value" aria-labelledby="atividadesAluno-label"><g:link controller="atividadeAluno" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span> <div class="fix"></div>
                                </g:each>
                                
                            </div><div class="fix"></div></div>
                    </g:if>
                    
                    <g:if test="${atividadePeriodoInstance?.dataCriacao}">
                        <div class="rowElem"><label><span id="dataCriacao-label" class="property-label"><g:message code="atividadePeriodo.dataCriacao.label" default="Data Criacao" /></span>:</label>
                            <div class="formRight">
                                
                                <span class="property-value" aria-labelledby="dataCriacao-label"><g:formatDate date="${atividadePeriodoInstance?.dataCriacao}" /></span>
                                
                            </div><div class="fix"></div></div>
                    </g:if>
                    
                    <g:if test="${atividadePeriodoInstance?.dataPrazo}">
                        <div class="rowElem"><label><span id="dataPrazo-label" class="property-label"><g:message code="atividadePeriodo.dataPrazo.label" default="Data Prazo" /></span>:</label>
                            <div class="formRight">
                                
                                <span class="property-value" aria-labelledby="dataPrazo-label"><g:formatDate date="${atividadePeriodoInstance?.dataPrazo}" /></span>
                                
                            </div><div class="fix"></div></div>
                    </g:if>
                    
                    <g:if test="${atividadePeriodoInstance?.periodo}">
                        <div class="rowElem"><label><span id="periodo-label" class="property-label"><g:message code="atividadePeriodo.periodo.label" default="Periodo" /></span>:</label>
                            <div class="formRight">
                                
                                <span class="property-value" aria-labelledby="periodo-label"><g:textField readonly="readonly" name="${atividadePeriodoInstance}" value="${atividadePeriodoInstance.periodo}" /></span>
                                
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
