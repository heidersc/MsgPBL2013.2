<%@ page import="sisap.AtividadePeriodo" %>



<div class="rowElem"><label for="atividade">
    <g:message code="atividadePeriodo.atividade.label" default="Atividade" />
    <span class="required-indicator">*</span>
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: atividadePeriodoInstance, field: 'atividade', 'error')} required">

        <g:select id="atividade" name="atividade.id" from="${sisap.Atividade.list()}" optionKey="id" required="" value="${atividadePeriodoInstance?.atividade?.id}" class="many-to-one"/>
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="atividadesAluno">
    <g:message code="atividadePeriodo.atividadesAluno.label" default="Atividades Aluno" />
    
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: atividadePeriodoInstance, field: 'atividadesAluno', 'error')} ">

        
<ul class="one-to-many">
<g:each in="${atividadePeriodoInstance?.atividadesAluno?}" var="a">
    <li><g:link controller="atividadeAluno" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="atividadeAluno" action="create" params="['atividadePeriodo.id': atividadePeriodoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'atividadeAluno.label', default: 'AtividadeAluno')])}</g:link>
</li>
</ul>

    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="dataCriacao">
    <g:message code="atividadePeriodo.dataCriacao.label" default="Data Criacao" />
    <span class="required-indicator">*</span>
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: atividadePeriodoInstance, field: 'dataCriacao', 'error')} required">

        <g:datePicker name="dataCriacao" precision="day"  value="${atividadePeriodoInstance?.dataCriacao}"  />
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="dataPrazo">
    <g:message code="atividadePeriodo.dataPrazo.label" default="Data Prazo" />
    <span class="required-indicator">*</span>
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: atividadePeriodoInstance, field: 'dataPrazo', 'error')} required">

        <g:datePicker name="dataPrazo" precision="day"  value="${atividadePeriodoInstance?.dataPrazo}"  />
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="periodo">
    <g:message code="atividadePeriodo.periodo.label" default="Periodo" />
    
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: atividadePeriodoInstance, field: 'periodo', 'error')} ">

        <g:textField name="periodo" value="${atividadePeriodoInstance?.periodo}"/>
    </div>
</div><div class="fix"></div></div>


