
<%@ page import="sisap.MensagemPredefinida" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'mensagemPredefinida.label', default: 'Mensagem Predefinida')}" />
		<title>Mensagem Predefinida</title>
	</head>
	<body>
    <div class="content">
        <div class="title"><h5>Mensagens Predefinidas</h5></div>
        <div class="breadCrumbHolder module">
            <div class="breadCrumb module">
                <ul>
                    <li class="firstB"><a href="#">Home</a> </li>
                    <li><g:link action="index">Mensagens Predefinidas</g:link></li>

                </ul>
            </div>
        </div>

			<g:if test="${flash.message}">
                <div class="pt20">
                    <div class="nNote nSuccess hideit">
                        <p><strong>Mensagem criada com sucesso!!</strong>${flash.message}</p>
                    </div>
                </div>
			</g:if>
        <div class="fix"></div>
        <div class="table">
            <div class="head"><h5 class="iFrames">Listagem de Mensagem Predefinidas: ${mensagemPredefinidaInstanceTotal}</h5></div>
            <g:form name="formShow" method="POST"  action="delete">
                <g:hiddenField id="id" name="id" value=""/>
            <table cellpadding="0" cellspacing="0" width="100%" class="tableStatic resize">
				<thead>
					<tr>
					
                        <td>${message(code: 'mensagemPredefinida.titulo.label', default: 'Titulo')}</td>
					
                        <td>${message(code: 'mensagemPredefinida.mensagem.label', default: 'Mensagem')}</td>
					
						%{--<td><g:message code="mensagemPredefinida.pessoa.label" default="Pessoa" /></td>--}%
					
                        <td width="10%">Editar</td>
                        <td width="10%">Excluir</td>
					</tr>
				</thead>
				<tbody>
				<g:each in="${mensagemPredefinidaInstanceList}" status="i" var="mensagemPredefinidaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${mensagemPredefinidaInstance.id}">${fieldValue(bean: mensagemPredefinidaInstance, field: "titulo")}</g:link></td>

						%{--}<td>${fieldValue(bean: mensagemPredefinidaInstance, field: "mensagem")}</td>--}%

                        <td>${mensagemPredefinidaInstance?.mensagem?.substring(0, mensagemPredefinidaInstance?.mensagem?.length() > 25 ? 25 :mensagemPredefinidaInstance?.mensagem?.length())}${mensagemPredefinidaInstance?.mensagem?.length() > 25 ? "...":""}</td>


						%{--<td>${fieldValue(bean: mensagemPredefinidaInstance, field: "pessoa")}</td>--}%
                        %{--<td>${mensagemPredefinidaInstance?.pessoa.nome?.substring(0, mensagemPredefinidaInstance?.pessoa.nome?.length() > 25 ? 25 :mensagemPredefinidaInstance?.pessoa.nome?.length())}${mensagemPredefinidaInstance?.pessoa.nome?.length() > 25 ? "...":""}</td>--}%


                        <td align="center"><g:link action="edit" id="${mensagemPredefinidaInstance.id}"><img src="${createLinkTo(dir: 'images/icons/middlenav', file: 'pencil.png')}" style="width: 15px;height: 15px;" /></g:link></td>
                        <td align="center"><div id="auxDiv${mensagemPredefinidaInstance.id}"></div><a href="#auxDiv${mensagemPredefinidaInstance.id}" onclick="jConfirm('Tem certeza que deseja excluir este(a) ${message(code: 'mensagemPredefinida.label', default: 'Artefact > MensagemPredefinida')}?', 'Confirmação', function(e){if(e){
                        $('#id').val('${mensagemPredefinidaInstance.id}');$('form#formShow').submit();
                        $('#id').val('')}});"><img src="${createLinkTo(dir: 'images/icons/middlenav', file: 'trash.png')}" style="width: 15px;height: 15px;" /></a></td>
					</tr>
				</g:each>
				</tbody>
			</table>
                </g:form>
            </div>
        <div class="pagination">
            <ul class="pages">
                <g:paginateCustom total="${mensagemPredefinidaInstanceTotal}" />
            </ul>
        </div>
        <g:link style="float: right;" action="create" ><button class="greyishBtn">Adicionar</button></g:link>

		</div>
    <div class="fix"></div>
	</body>
</html>
