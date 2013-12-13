<h4 class="aligncenter red pt10">Selecione os alunos que farão parte da disciplina .</h4>
<g:form name="buscarAlunos"  id="buscarAlunos" class="mainForm">
    <fieldset>
        <div class="widget">
            <div class="head"><h5 class="iView">Buscar Alunos</h5></div>
            <div class="floatleft twoOne">
                <div class="rowElem noborder pb0"><label class="topLabel">Nome:</label><div class="formBottom"><g:textField name="nome" value="${params?.nome}" /></div><div class="fix"></div></div>


            </div>
            <div class="floatright twoOne">
                <div class="rowElem noborder pb0"><label class="topLabel">Matrícula:</label><div class="formBottom"><g:textField name="matricula" value="${params?.matricula}" /></div><div class="fix"></div></div>
                <div class="rowElem noborder pb0" style="float: right;"><div class="formBottom"><g:submitToRemote update="professorDialog" url="[action: 'ajaxPesquisaProfessor']" name="teste" value="Buscar" class="greyishBtn" /></div><div class="fix"></div></div>

            </div>

            <div class="fix"></div>
        </div>
    </fieldset>


</g:form>
<div class="table">
    <div class="head"><h5 class="iFrames">Alunos da Disciplina: ${alunosTotal}</h5></div>

    <table cellpadding="0" cellspacing="0" width="100%" class="tableStatic resize">
        <thead class="head">
        <tr>
            <td width="10%">Selecione</td>
            <td width="20%">Matrícula</td>
            <td>Nome</td>
            <td>Email</td>
        </tr>

        </thead>
        <tbody>
        <g:each in="${alunos}" var="aluno" status="i">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                <td width="10%"><div class="rowElem"><input type="checkbox" onclick="professorAttr(this);" value="${aluno.id}" name="professorRadio"  /></div></td>
                <td width="20%">${aluno?.matricula}</td>
                <td id="tdNomeAluno${aluno.id}">${aluno?.nome}</td>
                <td>${aluno?.email}</td>
            </tr>
        </g:each>
        </tbody>
    </table>
</div>
<div class="pagination">
    <ul class="pages">
        %{--<g:paginateCustom total="${professoresTotal}" action="ajaxPesquisaProfessor" params="${params}" />--}%

        <g:remotePaginateCustom update="alunosDialog" total="${alunosTotal}" action="ajaxPesquisaAlunos" params="${params}" />
    </ul>
</div>
<g:hiddenField name="hiddenAluno" id="hiddenAluno" />
<g:hiddenField name="hiddenAlunoNome" id="hiddenAlunoNome" />
<button class="greyishBtn" onclick="$('#alunosDialog').dialog('close');$('#alunosNome').val($('#hiddenAlunoNome').val());$('#alunos').val($('#hiddenAluno').val())">Ok</button>