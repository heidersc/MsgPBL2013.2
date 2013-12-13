
<%@ page import="sisap.Pessoa" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pessoa.label', default: 'Pessoa')}" />
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

            <div class="head"><h5 class="iFrames">Listagem de Pessoas: ${pessoaInstanceTotal}</h5></div>
			<table cellpadding="0" cellspacing="0" width="100%" class="tableStatic resize">
				<thead class="head">
					<tr>
					
                        <td>${message(code: 'pessoa.nome.label', default: 'Nome')}</td>
					
                        <td>${message(code: 'pessoa.matricula.label', default: 'Matricula')}</td>
					
                        <td>${message(code: 'pessoa.email.label', default: 'Email')}</td>
					

                        <td>Perfil</td>
                        <td align="center">Status</td>
                        <td width="7%" align="center">Editar</td>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${pessoaInstanceList}" status="i" var="pessoaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${pessoaInstance.id}">${fieldValue(bean: pessoaInstance, field: "nome")}</g:link></td>
					
						<td align="center">${fieldValue(bean: pessoaInstance, field: "matricula")}</td>
					
						<td align="left">${fieldValue(bean: pessoaInstance, field: "email")}</td>

						<td>${fieldValue(bean: pessoaInstance, field: "perfil")}</td>
                        <td align="center"><g:formatBoolean boolean="${pessoaInstance.status}" true="Ativo" false="Inativo" /></td>
                        <td width="7%" align="center"><g:link action="edit" id="${pessoaInstance.id}"><img src="${createLinkTo(dir: 'images/icons/dark', file: 'pencil.png')}"></g:link></td>
					</tr>
				</g:each>
				</tbody>
			</table>
            </div>
        <div class="pagination">
            <ul class="pages">
                <g:paginateCustom total="${pessoaInstanceTotal}" params="${params}" />
            </ul>
        </div>
                 <g:link action="create" style="float: right;"><button class="greyishBtn">Adicionar</button></g:link>
		</div>
    <div class="fix"></div>
	</body>
</html>
