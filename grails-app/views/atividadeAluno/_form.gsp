<%@ page import="sisap.AtividadeAluno" %>



<div class="rowElem"><label for="aluno">
    <g:message code="atividadeAluno.aluno.label" default="Aluno" />
    <span class="required-indicator">*</span>
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: atividadeAlunoInstance, field: 'aluno', 'error')} required">

        <g:select id="aluno" name="aluno.id" from="${sisap.Pessoa.list()}" optionKey="id" required="" value="${atividadeAlunoInstance?.aluno?.id}" class="many-to-one"/>
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="atividadePeriodo">
    <g:message code="atividadeAluno.atividadePeriodo.label" default="Atividade Periodo" />
    <span class="required-indicator">*</span>
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: atividadeAlunoInstance, field: 'atividadePeriodo', 'error')} required">

        <g:select id="atividadePeriodo" name="atividadePeriodo.id" from="${sisap.AtividadePeriodo.list()}" optionKey="id" required="" value="${atividadeAlunoInstance?.atividadePeriodo?.id}" class="many-to-one"/>
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="dataEntrega">
    <g:message code="atividadeAluno.dataEntrega.label" default="Data Entrega" />
    <span class="required-indicator">*</span>
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: atividadeAlunoInstance, field: 'dataEntrega', 'error')} required">

        <g:datePicker name="dataEntrega" precision="day"  value="${atividadeAlunoInstance?.dataEntrega}"  />
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="nota">
    <g:message code="atividadeAluno.nota.label" default="Nota" />
    <span class="required-indicator">*</span>
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: atividadeAlunoInstance, field: 'nota', 'error')} required">

        <g:field name="nota" value="${fieldValue(bean: atividadeAlunoInstance, field: 'nota')}" required=""/>
    </div>
</div><div class="fix"></div></div>


