
<%@ page import="sisap.AtividadePeriodo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'atividadePeriodo.label', default: 'AtividadePeriodo')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
    <div class="content">
        <div class="title"><h5><g:message code="default.list.label" args="[entityName]" /></h5></div>
        <div class="breadCrumbHolder module">
            <div class="breadCrumb module">
                <ul>
                    <li class="firstB"><a href="#">Home</a> </li>
                    <li><g:link action="index"> <g:message code="default.list.label" args="[entityName]" /></g:link></li>

                </ul>
            </div>
        </div>

			<g:if test="${flash.message}">
                <div class="pt20">
                    <div class="nNote nSuccess hideit">
                        <p><strong>Sucesso: </strong>${flash.message}</p>
                    </div>
                </div>
			</g:if>
        <div class="middleNav">
            <ul>
                <li class="iPlus"><g:link action="create"><span>Adicionar ${message(code: 'atividadePeriodo.label', default: 'AtividadePeriodo')}</span></g:link> </li>
                %{--<li class="iStat"><a href="#" title=""><span>Buscar usuário</span></a></li>--}%
                %{--<li class="iUser"><a href="#" title=""><span>User list</span></a></li>--}%
                %{--<li class="iOrders"><a href="#" title=""><span>Billing panel</span></a></li>--}%
            </ul>
        </div>
        <div class="fix"></div>
        <div class="table">
            <div class="head"><h5 class="iFrames">Listagem de <g:message code="default.list.label" args="[entityName]" />: ${atividadePeriodoInstanceTotal}</h5></div>
			<table cellpadding="0" cellspacing="0" width="100%" class="tableStatic resize">
				<thead>
					<tr>
					
						<td><g:message code="atividadePeriodo.atividade.label" default="Atividade" /></td>
					
                        <td>${message(code: 'atividadePeriodo.dataCriacao.label', default: 'Data Criacao')}</td>
					
                        <td>${message(code: 'atividadePeriodo.dataPrazo.label', default: 'Data Prazo')}</td>
					
                        <td>${message(code: 'atividadePeriodo.periodo.label', default: 'Periodo')}</td>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${atividadePeriodoInstanceList}" status="i" var="atividadePeriodoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${atividadePeriodoInstance.id}">${fieldValue(bean: atividadePeriodoInstance, field: "atividade")}</g:link></td>
					
						<td><g:formatDate date="${atividadePeriodoInstance.dataCriacao}" /></td>
					
						<td><g:formatDate date="${atividadePeriodoInstance.dataPrazo}" /></td>
					
						<td>${fieldValue(bean: atividadePeriodoInstance, field: "periodo")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
            </div>
        <div class="pagination">
            <ul class="pages">
                <g:paginateCustom total="${atividadePeriodoInstanceTotal}" />
            </ul>
        </div>

		</div>
    <div class="fix"></div>
	</body>
</html>
