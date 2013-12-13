<%@ page import="sisap.Atividade" %>



<div class="rowElem"><label for="descricao">
    <g:message code="atividade.descricao.label" default="Descricao"/>

</label>

    <div class="formRight">
        <div class="fieldcontain ${hasErrors(bean: atividadeInstance, field: 'descricao', 'error')} ">

            <g:textField name="descricao" value="${atividadeInstance?.descricao}"/>
        </div>
    </div>

    <div class="fix"></div></div>


<div class="rowElem"><label for="nome">
    <g:message code="atividade.nome.label" default="Nome"/>

</label>

    <div class="formRight">
        <div class="fieldcontain ${hasErrors(bean: atividadeInstance, field: 'nome', 'error')} ">

            <g:textField name="nome" value="${atividadeInstance?.nome}"/>
        </div>
    </div>

    <div class="fix"></div></div>


