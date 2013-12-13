
<%@ page import="sisap.Curso" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'curso.label', default: 'Curso')}" />
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

        <div class="fix"></div>
        <g:render template="search" />
        <div class="table">
            <div class="head"><h5 class="iFrames">Listagem de <g:message code="default.list.label" args="[entityName]" />: ${cursoInstanceTotal}</h5></div>
			<table cellpadding="0" cellspacing="0" width="100%" class="tableStatic resize">
				<thead>
					<tr>
					
                        <td>${message(code: 'curso.codigo.label', default: 'Codigo')}</td>
					
                        <td>${message(code: 'curso.nome.label', default: 'Nome')}</td>
					
                        <td>${message(code: 'curso.descricao.label', default: 'Descricao')}</td>
					    <td width="7%">Editar</td>
					</tr>
				</thead>
				<tbody>
				<g:each in="${cursoInstanceList}" status="i" var="cursoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${cursoInstance.id}">${fieldValue(bean: cursoInstance, field: "codigo")}</g:link></td>
					
						<td>${fieldValue(bean: cursoInstance, field: "nome")}</td>
					
						<td>${fieldValue(bean: cursoInstance, field: "descricao")}</td>
                        <td width="7%" align="center"><g:link action="edit" id="${cursoInstance?.id}"><img src="${createLinkTo(dir: 'images/icons/dark', file: 'pencil.png')}"></g:link></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
            </div>
        <div class="pagination">
            <ul class="pages">
                <g:paginateCustom total="${cursoInstanceTotal}" />
            </ul>
        </div>
        <g:link action="create" style="float: right;"><button class="greyishBtn">Adicionar</button></g:link>
		</div>
    <div class="fix"></div>
	</body>
</html>
