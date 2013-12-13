<h4 class="aligncenter red pt10">Selecione a disciplina.</h4>
<g:form name="buscarDisciplina"  id="buscarDisciplina" class="mainForm">
    <fieldset>
        <div class="widget">
            <div class="head"><h5 class="iView">Buscar Disciplina</h5></div>
            <div class="floatleft twoOne">
                <div class="rowElem noborder pb0"><label class="topLabel">Código:</label><div class="formBottom"><g:textField name="codigo" value="${params?.codigo}" /></div><div class="fix"></div></div>
     </div>
            <div class="floatright twoOne">
                <div class="rowElem noborder pb0"><label class="topLabel">Nome:</label><div class="formBottom"><g:textField name="nome" value="${params?.nome}" /></div><div class="fix"></div></div>
                <div class="rowElem noborder pb0" style="float: right;"><div class="formBottom"><g:submitToRemote update="disciplinaDialog" url="[action: 'ajaxPesquisaDisciplina']" name="teste" value="Buscar" class="greyishBtn" /></div><div class="fix"></div></div>
            </div>
            <div class="fix"></div>
        </div>
    </fieldset>
</g:form>
<div class="table">
    <div class="head"><h5 class="iFrames">Disciplina: ${disciplinasTotal}</h5></div>

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
        <g:each in="${disciplinas}" var="disciplina" status="i">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                <td width="10%"><div class="rowElem"><input type="radio" onclick="disciplinaAttr(this);" value="${disciplina.id}" name="disciplinaRadio"  /></div></td>
                <td width="20%">${disciplina?.codigo}</td>
                <td id="tdNomeDisciplina${disciplina.id}">${disciplina?.nome}</td>
                <td>${disciplina?.descricao}</td>
            </tr>
        </g:each>
        </tbody>
    </table>
</div>
<div class="pagination">
    <ul class="pages">
        %{--<g:paginateCustom total="${professoresTotal}" action="ajaxPesquisaProfessor" params="${params}" />--}%

        <g:remotePaginateCustom update="disciplinaDialog" total="${disciplinasTotal ?:1}" action="ajaxPesquisaDisciplina" params="${params}" />
    </ul>
</div>
<g:hiddenField name="hiddenDisciplina" id="hiddenDisciplina" />
<g:hiddenField name="hiddenDisciplinaNome" id="hiddenDisciplinaNome" />
<button class="greyishBtn" onclick="$('#disciplinaDialog').dialog('close');$('#disciplinaNome').val($('#hiddenDisciplinaNome').val());$('#disciplina').val($('#hiddenDisciplina').val())">Ok</button>