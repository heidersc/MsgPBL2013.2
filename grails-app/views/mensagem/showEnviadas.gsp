
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="sisap.Grupo; sisap.Mensagem" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'mensagem.label', default: 'Mensagem')}" />
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
                    <li><g:link action="listEnviadas">Mensagens Enviadas</g:link></li>
                    <li><g:link action="showEnviadas" id="${mensagemInstance.id}"> <g:message code="default.show.label" args="[entityName]" /></g:link></li>
                </ul>
            </div>
        </div>
        <g:hasErrors bean="${mensagemInstance}">
            <div class="pt20">
                <ul class="errors" role="alert">
                    <g:eachError bean="${mensagemInstance}" var="error">
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
                    <p><strong>Mensagem enviada com sucesso!</strong></p>
                </div>
            </div>
        </g:if>
    %{--<div class="middleNav">--}%
    %{--<g:form name="formShow" method="POST"  action="delete">--}%
    %{--<g:hiddenField name="id" value="${mensagemInstance.id}" />--}%
    %{--<ul>--}%
    %{--<li class="iDelete"><a href="#" onclick="jConfirm('Tem certeza que deseja excluir este(a) ${message(code: 'mensagem.label', default: 'Mensagem')}?', 'Confirmação', function(e){if(e){$('form#formShow').submit();}});"><span><g:message code="default.button.delete.label" args="[entityName]" /></span></a></li>--}%
    %{--</ul>--}%
    %{--</g:form>--}%
    %{--</div>--}%
        <div class="fix"></div>
        <div class="mainForm">
            <fieldset>
                <div class="widget first">
                    <div class="head"><h5 class="iList">Dados da Mensagem</h5></div>

                    <g:if test="${mensagemInstance?.titulo}">
                        <div class="rowElem"><label><span id="titulo-label" class="property-label"><g:message code="mensagem.titulo.label" default="Titulo" /></span>:</label>
                            <div class="formRight">

                                <span class="property-value" aria-labelledby="titulo-label"><h4> ${mensagemInstance.titulo}</h4></span>

                            </div><div class="fix"></div></div>
                    </g:if>

                    <g:if test="${mensagemInstance?.remetente}">
                        <div class="rowElem"><label><span id="titulo-label" class="property-label"><g:message code="mensagem.remetente.label" default="Remetente" /></span>:</label>
                            <div class="formRight">

                                <span class="property-value" aria-labelledby="titulo-label"><h4> ${mensagemInstance.remetente.nome}</h4></span>

                            </div><div class="fix"></div></div>
                    </g:if>

                    <g:if test="${mensagemInstance?.dataMensagem}">
                        <div class="rowElem"><label><span id="titulo-label" class="property-label"><g:message code="mensagem.dataMensagem.label" default="Data" /></span>:</label>
                            <div class="formRight">

                                <span class="property-value" aria-labelledby="titulo-label"><h4><g:formatDate date="${mensagemInstance.dataMensagem}" format="dd/MM/yyyy 'às' HH:mm" />  </h4></span>

                            </div><div class="fix"></div></div>
                    </g:if>

                    <g:if test="${mensagemInstance?.emailDestinatario}">
                        <div class="rowElem"><label><span id="destinatarios-label" class="property-label"><g:message code="mensagem.destinatarios.label" default="Destinatarios" /></span>:</label>
                            <div class="formRight">

                                <span class="property-value" aria-labelledby="destinatarios-label"><h4>${mensagemInstance?.grupos.nome.toArray().toArrayString().replaceAll("\\[|\\]","")}</h4></span>

                            </div><div class="fix"></div></div>
                    </g:if>

                    <g:if test="${mensagemInstance?.mensagem}">

                        <div class="rowElem" style="background-color: #99ccff"><label><span id="mensagem-label" class="property-label"><g:message code="mensagem.mensagem.label" default="Mensagem" /></span>:</label>

                            <div class="formRight">

                                <span class="property-value"  aria-labelledby="mensagem-label"><h4>${mensagemInstance.mensagem}</h4></span>

                            </div><div class="fix"></div>
                        </div>
                    </g:if>

                    <div id="listaResposta">
                        <g:if test="${mensagemInstance?.mensagens}">
                            <g:render template="templateResposta" model="[mensagemInstance: mensagemInstance]" />
                        </g:if>
                    </div>

                    <div class="rowElem">
                        <div class="formRight">

                            <g:formRemote name="formResposta" url="[action: 'ajaxResposta']" update="listaResposta" onLoading="\$('#loaderResposta').show();\$('#btnCreateResposta').hide();" onComplete="\$('#btnCreateResposta').show();\$('#loaderResposta').hide();\$('#resposta').val('');">
                                <g:hiddenField name="mensagemOrginal" value="${mensagemInstance?.id}" />

                                <g:textArea name="resposta" rows="5" value="" />

                                <div id="loaderResposta"  style="display: none;">
                                    <img src="${createLinkTo(dir: 'images/loaders', file: 'loader.gif')}" alt="" class="p12 floatleft"   /> Aguarde...
                                </div>
                                <g:submitButton name="create" id="btnCreateResposta" class="greyishBtn submitForm" value="${message(code: 'default.button.enviar.label', default: 'Responder')}" />
                            </g:formRemote>

                            <div class="fix"></div>


                        </div><div class="fix"></div></div>

                    <div class="fix"></div>
                </div>
            </fieldset>
        </div>
    </div>
    <div class="fix"></div>
</div>
</body>
</html>
