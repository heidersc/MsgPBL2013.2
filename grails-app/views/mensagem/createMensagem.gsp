<%@ page import="sisap.Grupo; sisap.Pessoa; sisap.Mensagem" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'mensagem.label', default: 'Mensagem')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>

</head>
<body>
<div class="wrapper">
    <div class="content" id="container">
        <div class="title"><h5>Criar ${message(code: 'mensagem.label', default: 'Mensagem')}</h5></div>
        <div class="breadCrumbHolder module">
            <div class="breadCrumb module">
                <ul>
                    <li class="firstB"><a href="#">Home</a> </li>
                    <li><g:link action="listEnviadas">Intens Enviados</g:link></li>
                    <li><g:link action="createMensagem"> <g:message code="default.create.label" args="[entityName]" /></g:link></li>
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
        <g:form action="save"  class="mainForm">

            <fieldset class="form">

              <div class="widget first">
                  <div class="head"><h5 class="iList">Preencha os campos abaixo</h5>

                           <div class="rowElem">
                              <label for="titulo">
                                    <g:message code="mensagem.titulo.label" default="Titulo" />
                                    <span class="required-indicator">*</span>

                              </label>
                                <div class="formRight searchDrop">

                                    <g:select name="titulo" noSelection="['null':'Selecione a Mensagem']" onchange="${remoteFunction(action:'ajaxTextArea', update: 'textAreaMensagem',  params: " 'idMensagem=' + \$(this).val()  ")}" from="${sisap.MensagemPredefinida.findAllByPessoa(Pessoa.read(session.idPessoa))}" optionKey="id" optionValue="titulo" class="chzn-select" style="width:350px;" data-placeholder="Selecione uma Mensagem..." />

                                </div>
                                <div class="fix"></div>
                                <label for="destinatario">
                                    <g:message code="mensagem.destinatario.label" default="Destinatario" />
                                    <span class="required-indicator">*</span>

                                </label>
                                <div class="formRight searchDrop">
                                    <g:set var="grupoList" value="${sisap.PeriodoDisciplina.findAllByAlunos(Pessoa.findByNome(Pessoa.read(session.idPessoa)))}"  optionKey="id" />

                                    <g:select name="grupo" noSelection="['':'Selecione o Grupo']" class="chzn-select" from="${sisap.Grupo.findAllById(grupoList)}" optionKey="id" optionValue="nome" style="width:350px;"/>

                                </div>
                                <div class="fix"></div>
                                <label for="mensagem">
                                    <g:message code="mensagem.mensagem.label" default="Mensagem" />
                                </label>
                                <div class="formRight" >
                                    <g:formRemote name="formEnviar" url="[action: 'showEnviadas']" onLoading="\$('#loaderMensagema').show();\$('#btnCreateEnviar').hide();" onComplete="\$('#btnCreateEnviar').show();\$('#loaderMensagem').hide();">
                                        <g:hiddenField name="mensagemOrginal" value="${mensagemInstance?.id}" />

                                        <g:textArea name="mensagem" rows="5" id="textAreaMensagem" value=""/>

                                        <div id="loaderMensagem"  style="display: none;">
                                            <img src="${createLinkTo(dir: 'images/loaders', file: 'loader.gif')}" alt="" class="p12 floatleft"   /> Aguarde...
                                        </div>

                                    </g:formRemote>
                                        <div class="fix"></div>
                                </div>
                                        <div class="fix"></div>
                         </div>
                        <div class="fix"></div>



                        <g:submitButton name="create" id="btnCreateEnviar" class="greyishBtn submitForm" value="${message(code: 'default.button.enviar.label', default: 'Enviar')}" />
                                </div>
                                <div class="fix"></div>
                                </div>
                        </div>
            </div>

            </fieldset>
    </g:form>
</div>
<div class="fix"></div>
</div>
</body>
</html>