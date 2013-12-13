
<%@ page import="sisap.MensagemPredefinida" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'mensagemPredefinida.label', default: 'Mensagem Pré-definida')}" />
    <title>Mensagem Pré-definida</title>
</head>
<body>
<div class="wrapper">

    <div class="content" id="container">
        <div class="title"><h5><g:message code="default.show.label" args="[entityName]" /></h5></div>
        <div class="breadCrumbHolder module">
            <div class="breadCrumb module">
                <ul>
                    <li class="firstB"><a href="#">Home</a> </li>
                    <li><g:link action="index">Mensagens Pré-definidas</g:link></li>
                    <li><g:link action="show" id="${mensagemPredefinidaInstance.id}">Ver Mensagem</g:link></li>
                </ul>
            </div>
        </div>
        <g:hasErrors bean="${mensagemPredefinidaInstance}">
            <div class="pt20">
                <ul class="errors" role="alert">
                    <g:eachError bean="${mensagemPredefinidaInstance}" var="error">
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
                <g:hiddenField name="id" value="${mensagemPredefinidaInstance.id}" />
                <ul>
                    <li class="iEdit"><g:link id="${mensagemPredefinidaInstance.id}" action="edit"><span>Editar</span></g:link> </li>
                    <li class="iDelete"><a href="#" onclick="jConfirm('Tem certeza que deseja excluir este(a) ${message(code: 'mensagemPredefinida.label', default: 'Mensagem Predefinida')}?', 'Confirmação', function(e){if(e){$('form#formShow').submit();}});"><span><g:message code="default.button.delete.label" args="[entityName]" /></span></a></li>
                </ul>
            </g:form>
        </div>
        <div class="fix"></div>
        <div class="mainForm">
            <fieldset>
                <div class="widget first">
                    <div class="head"><h5 class="iList">Dados da Mensagem Pré-definidas</h5></div>
                    
                    <g:if test="${mensagemPredefinidaInstance?.titulo}">
                        <div class="rowElem"><label><span id="titulo-label" class="property-label"><g:message code="mensagemPredefinida.titulo.label" default="Titulo" /></span>:</label>
                            <div class="formRight">
                                
                                <span class="property-value" aria-labelledby="titulo-label"><g:textField readonly="readonly" name="${mensagemPredefinidaInstance}" value="${mensagemPredefinidaInstance.titulo}" /></span>
                                
                            </div><div class="fix"></div></div>
                    </g:if>
                    
                    <g:if test="${mensagemPredefinidaInstance?.mensagem}">
                        <div class="rowElem"><label><span id="mensagem-label" class="property-label"><g:message code="mensagemPredefinida.mensagem.label" default="Mensagem" /></span>:</label>
                            <div class="formRight">
                                
                                <span class="property-value" aria-labelledby="mensagem-label">
                                    <g:textArea name="mensagem" cols="40" rows="5" maxlength="300" readonly="readonly" name="${mensagemPredefinidaInstance}" value="${mensagemPredefinidaInstance.mensagem}" />
                                </span>
                                
                            </div><div class="fix"></div></div>
                    </g:if>
                    
                    %{--<g:if test="${mensagemPredefinidaInstance?.pessoa}">
                        <div class="rowElem"><label><span id="pessoa-label" class="property-label"><g:message code="mensagemPredefinida.pessoa.label" default="Pessoa" /></span>:</label>
                            <div class="formRight">
                                

                                <span class="property-value" aria-labelledby="pessoa-label"><g:link controller="pessoa" action="show" id="${mensagemPredefinidaInstance?.pessoa?.id}">${mensagemPredefinidaInstance?.pessoa?.encodeAsHTML()}</g:link></span>
                                
                            </div><div class="fix"></div></div>
                    </g:if>
                    --}%
                    <div class="fix"></div>
                </div>
            </fieldset>
        </div>
    </div>
    <div class="fix"></div>
</div>
</body>
</html>
