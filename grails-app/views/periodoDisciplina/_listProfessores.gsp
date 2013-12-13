<h4 class="aligncenter red pt10">Escolha o professor responsável por ministrar a disciplina.</h4>
<g:form name="buscarProfessor"  id="buscarProfessor" class="mainForm">
    <fieldset>
        <div class="widget">
            <div class="head"><h5 class="iView">Buscar Professor</h5></div>
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
    <div class="head"><h5 class="iFrames">Professor da Disciplina: ${professoresTotal}</h5></div>

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
        <g:each in="${professores}" var="professor" status="i">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                <td width="10%"><div class="rowElem"><input type="radio" onclick="professorAttr(this);" value="${professor.id}" name="professorRadio"  /></div></td>
                <td width="20%">${professor?.matricula}</td>
                <td id="tdNomeProfessor${professor.id}">${professor?.nome}</td>
                <td>${professor?.email}</td>
            </tr>
        </g:each>
        </tbody>
    </table>
</div>
<div class="pagination">
    <ul class="pages">
        %{--<g:paginateCustom total="${professoresTotal}" action="ajaxPesquisaProfessor" params="${params}" />--}%

        <g:remotePaginateCustom update="professorDialog" total="${professoresTotal}" action="ajaxPesquisaProfessor" params="${params}" />
    </ul>
</div>
<g:hiddenField name="hiddenProfessor" id="hiddenProfessor" />
<g:hiddenField name="hiddenProfessorNome" id="hiddenProfessorNome" />
<button class="greyishBtn" onclick="$('#professorDialog').dialog('close');$('#professorNome').val($('#hiddenProfessorNome').val());$('#professor').val($('#hiddenProfessor').val())">Ok</button>