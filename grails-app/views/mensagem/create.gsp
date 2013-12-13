<%@ page import="sisap.Pessoa; sisap.Mensagem" %>
<!DOCTYPE html>
<html>
	<head>
        <meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'mensagem.label', default: 'Mensagem')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
        <g:javascript>
        function pesquisa(){
            var matriculaValue = $("#matricula").val();
            var nomeValue = $("#nome").val();
            var emailValue = $("#email").val();
            ${remoteFunction(action: 'ajaxPesquisa', update: "tabelaProfessores", params: "'matricula=' + matriculaValue + '&nome=' + nomeValue + '&email=' + emailValue")}
                    }
                    function alunosAttr(obj){
                        $("#hiddenAlunoNome").val($("#tdNomeAluno"+$(obj).val()).text());
                        $("#hiddenAluno").val($(obj).val())
                    }
        </g:javascript>
	</head>
<body>
<div class="wrapper">
<div class="content" id="container">
<div class="title"><h5>Criar ${message(code: 'mensagem.label', default: 'Mensagem')}</h5></div>
       <div class="breadCrumbHolder module">
           <div class="breadCrumb module">
               <ul>
                 <li class="firstB"><a href="#">Home</a> </li>
                    <li><g:link action="listEnviadas">Intens Enviados</g:link></li>
                 <li><g:link action="create"> <g:message code="default.create.label" args="[entityName]" /></g:link></li>
               </ul>
           </div>
       </div>
        <g:hasErrors bean="${mensagemInstance}">
            <div class="pt20">
                            <ul class="errors" role="alert">
				                <g:eachError bean="${mensagemInstance}" var="error">
				                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>>
                                        <div class="nNote nFailure hideit">
                                            <p><strong>Erro: </strong><g:message error="${error}"/></p>
                                        </div>
                                    </li>
				                </g:eachError>
			                </ul>
                        </div>
			        </g:hasErrors>
			        <g:form action="save"  class="mainForm">

    <fieldset class="form">

      <div class="widget first">
          <div class="head"><h5 class="iList">Preencha os campos abaixo</h5></div>


      <div class="rowElem dualBoxes">
           <div class="rowElem">
              <label for="titulo">

                        <g:message code="mensagem.titulo.label" default="Titulo" />
                        <span class="required-indicator">*</span>

                        </label>
                        <div class="formRight searchDrop">
                            <g:select name="titulo" noSelection="['null':'Selecione a Mensagem']" onchange="${remoteFunction(action:'ajaxTextArea', update: 'textAreaMensagem',  params: " 'idMensagem=' + \$(this).val()  ")}" from="${sisap.MensagemPredefinida.findAllByPessoa(Pessoa.read(session.idPessoa))}" optionKey="id" optionValue="titulo" class="chzn-select" style="width:350px;" data-placeholder="Selecione uma Mensagem..." />

                        </div>
                        <div class="fix"></div>
                        <label for="mensagem">
                            <g:message code="mensagem.mensagem.label" default="Mensagem" />
                        </label>
                        <div class="formRight" >
                            <g:formRemote name="formEnviar" url="[action: 'showEnviadas']" onLoading="\$('#loaderMensagema').show();\$('#btnCreateEnviar').hide();" onComplete="\$('#btnCreateEnviar').show();\$('#loaderMensagem').hide();">
                                <g:hiddenField name="mensagemOrginal" value="${mensagemInstance?.id}" />

                                <g:textArea name="mensagem" rows="5" id="textAreaMensagem" value=""/>

                                <div id="loaderMensagem"  style="display: none;">
                                    <img src="${createLinkTo(dir: 'images/loaders', file: 'loader.gif')}" alt="" class="p12 floatleft"   /> Aguarde...
                                </div>

                            </g:formRemote>
                            <div class="fix"></div>
                        </div>
                        <div class="fix"></div>
                        </div>

                        <div class="floatleft w40">
                %{--<input type="text" id="box1Filter" class="boxFilter" placeholder="Procurar Grupo..." /><button type="button" id="box1Clear" class="dualBtn fltr">x</button><br />--}%
            <div class="boxFilter searchDrop">

                <g:select noSelection="['':'Selecione a Disciplina']" onchange="${remoteFunction(action: 'ajaxPesquisaAlunos', update: 'divBoxView', params: " 'idDisciplina=' + \$(this).val()  ", onLoading: " \$('#loaderCurso').show() ", onComplete: " \$('#loaderCurso').hide() ")}" class="chzn-select" name="cursoSearch" from="${sisap.PeriodoDisciplina.findAllByProfessor(Pessoa.read(session.idPessoa))}" optionKey="id" optionValue="disciplina"/>
                <div id="loaderCurso"  style="display: none;">
                    <img src="${createLinkTo(dir: 'images/loaders', file: 'loader.gif')}" alt="" class="p12 floatleft"   /> Carregando alunos...
                </div>
            </div>
                <div id="divBoxView">
                    <select id="box1View" multiple="multiple" class="multiple" style="height:255px;"></select>
                </div>

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
                %{--<input type="text" id="box2Filter" class="boxFilter" placeholder="Procurar Aluno..." /><button type="button" id="box2Clear" class="dualBtn fltr">x</button><br />--}%
                    <select id="box2View" name="grupos" multiple="multiple" class="multiple" style="height:300px;"></select><br/>

                <span id="box2Counter" class="countLabel"></span>

                <div class="displayNone"><select id="box2Storage"></select></div>
            </div>


                        <div class="fix"></div>
                        <g:submitButton name="create" id="btnCreateEnviar" class="greyishBtn submitForm" value="${message(code: 'default.button.enviar.label', default: 'Enviar')}" />
                        </div>
                        <div class="fix"></div>
                        </div>
                    </g:form>
</fieldset>
</div>
</div>
</div>
<div class="fix"></div>
</div>
</body>
</html>


