<%@ page import="sisap.PeriodoDisciplina" %>



<div class="rowElem"><label for="alunos">
    <g:message code="periodoDisciplina.alunos.label" default="Alunos" />
    
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: periodoDisciplinaInstance, field: 'alunos', 'error')} ">

        <g:select name="alunos" from="${sisap.Pessoa.list()}" multiple="multiple" optionKey="id" size="5" value="${periodoDisciplinaInstance?.alunos*.id}" class="many-to-many"/>
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="ano">
    <g:message code="periodoDisciplina.ano.label" default="Ano" />
    
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: periodoDisciplinaInstance, field: 'ano', 'error')} ">

        <g:textField name="ano" value="${periodoDisciplinaInstance?.ano}"/>
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="atividadesPeriodo">
    <g:message code="periodoDisciplina.atividadesPeriodo.label" default="Atividades Periodo" />
    
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: periodoDisciplinaInstance, field: 'atividadesPeriodo', 'error')} ">

        <g:select name="atividadesPeriodo" from="${sisap.AtividadeAluno.list()}" multiple="multiple" optionKey="id" size="5" value="${periodoDisciplinaInstance?.atividadesPeriodo*.id}" class="many-to-many"/>
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="disciplina">
    <g:message code="periodoDisciplina.disciplina.label" default="Disciplina" />
    <span class="required-indicator">*</span>
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: periodoDisciplinaInstance, field: 'disciplina', 'error')} required">

        <g:select id="disciplina" name="disciplina.id" from="${sisap.Disciplina.list()}" optionKey="id" required="" value="${periodoDisciplinaInstance?.disciplina?.id}" class="many-to-one"/>
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="professor">
    <g:message code="periodoDisciplina.professor.label" default="Professor" />
    <span class="required-indicator">*</span>
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: periodoDisciplinaInstance, field: 'professor', 'error')} required">

        <g:select id="professor" name="professor.id" from="${sisap.Pessoa.list()}" optionKey="id" required="" value="${periodoDisciplinaInstance?.professor?.id}" class="many-to-one"/>
    </div>
</div><div class="fix"></div></div>


<div class="rowElem"><label for="semestre">
    <g:message code="periodoDisciplina.semestre.label" default="Semestre" />
    
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: periodoDisciplinaInstance, field: 'semestre', 'error')} ">

        <g:textField name="semestre" value="${periodoDisciplinaInstance?.semestre}"/>
    </div>
</div><div class="fix"></div></div>


