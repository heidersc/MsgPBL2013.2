
<%@ page import="sisap.Mensagem" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'mensagem.label', default: 'Mensagem')}" />
		<title>Mensagens Enviadas</title>
	</head>
	<body>
    <div class="content">
        <div class="title"><h5>Mensagens Enviadas</h5></div>
        <div class="breadCrumbHolder module">
            <div class="breadCrumb module">
                <ul>
                    <li class="firstB"><a href="#">Home</a> </li>
                    <li><g:link action="listEnviadas">Mensagens Enviadas</g:link></li>

                </ul>
            </div>
        </div>

			<g:if test="${flash.message}">
                <div class="pt20">
                    <div class="nNote nSuccess hideit">
                        <p><strong>Mensagem excluída com sucesso! </strong></p>
                    </div>
                </div>
			</g:if>
        <div class="fix"></div>
        <div class="table">
            <div class="head"><h5 class="iFrames">Mensagens Enviadas: ${mensagemInstanceTotal}</h5></div>
            <g:form name="formShow" method="POST"  action="delete">
                <g:hiddenField id="id" name="id" value=""/>
            <table cellpadding="0" cellspacing="0" width="100%" class="tableStatic resize">
				<thead>
					<tr>
					
                        <td>${message(code: 'mensagem.titulo.label', default: 'Titulo')}</td>

                        %{--<td>${message(code: 'mensagem.titulo.label', default: 'Remetente')}</td>--}%
                        <td>${message(code: 'mensagem.titulo.label', default: 'Mensagem')}</td>

                        <td>${message(code: 'mensagem.titulo.label', default: 'Data')}</td>
					
                        <td width="10%">Excluir</td>
					</tr>
				</thead>
				<tbody>
				<g:each in="${mensagemInstanceList}" status="i" var="mensagemInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="showEnviadas" id="${mensagemInstance.id}">${fieldValue(bean: mensagemInstance, field: "titulo")}</g:link></td>

                        <td>${mensagemInstance?.mensagem?.substring(0, mensagemInstance?.mensagem?.length() > 30 ? 30:mensagemInstance?.mensagem?.length())}${mensagemInstance?.mensagem?.length() > 30 ? "...":""}</td>

                        <td><g:formatDate date="${mensagemInstance.dataMensagem}" format="dd/MM/yyyy HH:mm:ss"/></td>

			            <td align="center"><div id="auxDiv${mensagemInstance.id}"></div><a href="#auxDiv${mensagemInstance.id}" onclick="jConfirm('Tem certeza que deseja excluir este(a) ${message(code: 'mensagem.label', default:'Mensagem')}?', 'Confirmação', function(e){if(e){
                        $('#id').val('${mensagemInstance.id}');$('form#formShow').submit();
                        $('#id').val('')}});"><img src="${createLinkTo(dir: 'images/icons/middlenav', file: 'trash.png')}" style="width: 15px;height: 15px;" /></a></td>
					</tr>
				</g:each>
				</tbody>
			</table>
                </g:form>
            </div>
        <div class="pagination">
            <ul class="pages">
                <g:paginateCustom total="${mensagemInstanceTotal}" />
            </ul>
        </div>
        %{--}<g:link style="float: right;" action="create" ><button class="greyishBtn">Nova Mensagem</button></g:link>--}%
        <g:link style="float: right;" action="createMensagem" ><button class="greyishBtn">Nova Mensagem</button></g:link>

		</div>
    <div class="fix"></div>
	</body>
</html>
