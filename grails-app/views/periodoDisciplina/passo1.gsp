<%@ page import="java.text.SimpleDateFormat; sisap.PeriodoDisciplina" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'periodoDisciplina.label', default: 'PeriodoDisciplina')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>
    <g:javascript>
    function pesquisa(){
        var matriculaValue = $("#matricula").val();
        var nomeValue = $("#nome").val();
        var emailValue = $("#email").val();
        ${remoteFunction(action: 'ajaxPesquisa', update: "tabelaProfessores", params: "'matricula=' + matriculaValue + '&nome=' + nomeValue + '&email=' + emailValue")}
    }
    function professorAttr(obj){
        $("#hiddenProfessorNome").val($("#tdNomeProfessor"+$(obj).val()).text());
        $("#hiddenProfessor").val($(obj).val())
    }
    function disciplinaAttr(obj){
        $("#hiddenDisciplinaNome").val($("#tdNomeDisciplina"+$(obj).val()).text());
        $("#hiddenDisciplina").val($(obj).val())
    }
    function alunosAttr(obj){
        $("#hiddenAlunoNome").val($("#tdNomeAluno"+$(obj).val()).text());
        $("#hiddenAluno").val($(obj).val())
    }
    </g:javascript>
</head>
<body>
<div class="wrapper">
<div class="content">
<div class="title"><h5>Cadastrar Disciplina em Período</h5></div>

    <g:form id="nextPasso2" name="nextPasso2" action="save" class="mainForm" onsubmit="\$('#box2View').find('option').attr('selected',true);">
    <fieldset class="form" >
        <div class="widget first">
            <div class="head"><h5 class="iList">Período</h5></div>

        <div class="rowElem">
            <label>Período:</label>
            <div class="formRight searchDrop">
                %{--<g:select name="curso.id" noSelection="${[null:'Selecione um Curso']}" from="${(1..9)}" optionValue="value" class="chzn-select" style="width:350px;" data-placeholder="Selecione um Curso..." />--}%
               <select class="chzn-select" style="width:350px;" data-placeholder="Selecione um Período..." name="periodo" >
                <g:each in="${((Long.parseLong(new SimpleDateFormat("yyyy").format(new Date()))).. (Long.parseLong(new SimpleDateFormat("yyyy").format(new Date()))+1) )}" var="ano">
                    <g:each in="${[1,2]}" var="semestre">
                        <option value="${ano}.${semestre}">${ano}.${semestre}</option>
                    </g:each>
                </g:each>
               </select>
            </div>
            <div class="fix"></div>
        </div>


        <div class="rowElem"><label for="sala">
            <g:message code="periodoDisciplina.sala.label" default="Sala" />

        </label><div class="formRight">
            <div class="fieldcontain ${hasErrors(bean: periodoDisciplinaInstance, field: 'sala', 'error')} ">

                <g:textField name="sala" value="${periodoDisciplinaInstance?.sala}"/>
            </div>
        </div><div class="fix"></div></div>


        <div class="rowElem"><label for="semestre">
                Professor
            </label><div class="formRight">
                <div class="fieldcontain ${hasErrors(bean: periodoDisciplinaInstance, field: 'professor', 'error')} ">

                    <div id="divProfessor">
                        <g:textField name="professorNome" id="professorNome" readonly="readonly" />
                        <a href="#" id="teste" onclick="${remoteFunction(action: 'ajaxPesquisaProfessor', update: 'professorDialog')};$('#professorDialog').dialog({'minWidth': '750', 'position': 'center top'});"><img src="${createLinkTo(dir: 'images/icons/dark', file: 'add.png')}"></a>
                    </div>

                    <div id="professorDialog" title="Selecionar Professor" style="display: none;"></div>
                </div>
                <g:hiddenField name="professor" id="professor" value="" />
            </div><div class="fix"></div></div>
        <div class="rowElem"><label>
            Disciplina
        </label><div class="formRight">
            <div class="fieldcontain ${hasErrors(bean: periodoDisciplinaInstance, field: 'disciplina', 'error')} ">
                <div id="divDisciplina">
                    <g:textField name="disciplinaNome" id="disciplinaNome" readonly="readonly" />
                    <a href="#" id="teste" onclick="${remoteFunction(action: 'ajaxPesquisaDisciplina', update: 'disciplinaDialog')};$('#disciplinaDialog').dialog({'minWidth': '750', 'position': 'center top'});"><img src="${createLinkTo(dir: 'images/icons/dark', file: 'add.png')}"></a>
                </div>

                <div id="disciplinaDialog" title="Selecionar Disciplina" style="display: none;"></div>
            </div>
            <g:hiddenField name="disciplina" id="disciplina" value="" />

        </div><div class="fix"></div></div>
        <div class="rowElem dualBoxes">
                    	<div class="floatleft w40">
                            <input type="text" id="box1Filter" class="boxFilter" placeholder="Procurar Aluno..." /><button type="button" id="box1Clear" class="dualBtn fltr">x</button><br />
                            <div class="boxFilter searchDrop">

                            <g:select noSelection="['':'Selecione o Curso']" onchange="${remoteFunction(action: 'ajaxPesquisaAlunos', update: 'divBoxView', params: " 'idCurso=' + \$(this).val()  ", onLoading: " \$('#loaderCurso').show() ", onComplete: " \$('#loaderCurso').hide() ")}" class="chzn-select" name="cursoSearch" from="${sisap.Curso.listOrderByNome()}" optionKey="id" optionValue="nome"/>
                            <div id="loaderCurso"  style="display: none;">
                                <img src="${createLinkTo(dir: 'images/loaders', file: 'loader.gif')}" alt="" class="p12 floatleft"   /> Carregando alunos...
                            </div>

                            </div>
                            <div id="divBoxView">
                                <select id="box1View" multiple="multiple" class="multiple" style="height:240px;">

                                </select>
                            </div>

                            <br/>
                            <span id="box1Counter" class="countLabel"></span>

                            <div class="displayNone"><select id="box1Storage"></select></div>
                        </div>

                        <div class="dualControl">
                            <button id="to2" type="button" class="dualBtn mr5 mb15">&nbsp;&gt;&nbsp;</button>
                            <button id="allTo2" type="button" class="dualBtn">&nbsp;&gt;&gt;&nbsp;</button><br />
                            <button id="to1" type="button" class="dualBtn mr5">&nbsp;&lt;&nbsp;</button>
                            <button id="allTo1" type="button" class="dualBtn">&nbsp;&lt;&lt;&nbsp;</button>
                        </div>

                        <div class="floatright w40">
                            <input type="text" id="box2Filter" class="boxFilter" placeholder="Procurar Aluno..." /><button type="button" id="box2Clear" class="dualBtn fltr">x</button><br />
                            <select id="box2View" name="alunos" multiple="multiple" class="multiple" style="height:300px;"></select><br/>
                            <span id="box2Counter" class="countLabel"></span>

                            <div class="displayNone"><select id="box2Storage"></select></div>
                        </div>
					<div class="fix"></div>

    </g:form>
    <div class="fix"></div>
    <div class="rowElem"><button class="greyishBtn" onclick="$('form#nextPasso2').submit();">Prosseguir</button></div>

        </div>
    </fieldset>



</div>
<div class="fix"></div>
</div>
</body>
</html>
