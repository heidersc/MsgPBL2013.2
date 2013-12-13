<%@ page import="sisap.MensagemPredefinida" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'mensagemPredefinida.label', default: 'MensagemPredefinida')}" />
    <title>Mensagem Pré-definida</title>
</head>
<body>
<div class="wrapper">
    <div class="content" id="container">
        <div class="title"><h5>Editar Mensagem Pré-definida</h5></div>
        <div class="breadCrumbHolder module">
            <div class="breadCrumb module">
                <ul>
                    <li class="firstB"><a href="#">Home</a> </li>
                    <li><g:link action="index">Mensagens Pré-definidas</g:link></li>
                    <li><g:link action="edit">Editar Mensagem Pré-definida</g:link></li>
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
        <g:form action="update"  class="mainForm">

        <fieldset class="form">
            <div class="widget first">
                <div class="head"><h5 class="iList">Preencha os campos abaixo</h5></div>
                <g:hiddenField name="id" value="${mensagemPredefinidaInstance.id}" />
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

            <g:submitButton name="create" class="greyishBtn submitForm" value="${message(code: 'default.button.update.label', default: 'Create')}" />
                <div class="fix"></div>
            </div>
        </fieldset>


        </g:form>
    </div>
    <div class="fix"></div>
</div>
</body>
</html>
