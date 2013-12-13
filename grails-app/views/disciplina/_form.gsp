<%@ page import="sisap.Disciplina" %>



<div class="rowElem"><label for="codigo">
    <g:message code="disciplina.codigo.label" default="Codigo" />
    
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: disciplinaInstance, field: 'codigo', 'error')} ">

        <g:textField name="codigo" value="${disciplinaInstance?.codigo}"/>
    </div>
</div><div class="fix"></div></div>
<div class="rowElem"><label for="nome">
    <g:message code="disciplina.nome.label" default="Nome" />

</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: disciplinaInstance, field: 'nome', 'error')} ">

        <g:textField name="nome" value="${disciplinaInstance?.nome}"/>
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="descricao">
    <g:message code="disciplina.descricao.label" default="Descricao" />
    
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: disciplinaInstance, field: 'descricao', 'error')} ">

        <g:textField name="descricao" value="${disciplinaInstance?.descricao}"/>
    </div>
</div><div class="fix"></div></div>




