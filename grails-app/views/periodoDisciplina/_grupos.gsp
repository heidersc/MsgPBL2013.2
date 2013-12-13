<h4 class="aligncenter red pt10">Grupos na Disciplina.</h4>
<div class="table">
    <div class="head"><h5 class="iFrames">Grupos</h5></div>
    <table cellpadding="0" cellspacing="0" width="100%" class="tableStatic resize">
        <tbody>
        <g:each in="${periodoDisciplina.grupos}" var="grupo">

            <tr>
                <td style="background-color: #${grupo.cor};text-decoration: underline;"><b>${grupo.nome}</b></td>
            </tr>

            <g:each in="${grupo.alunos}" var="integrante">
                <tr style="background-color: #${grupo?.cor}">
                    <td><g:link controller="pessoa" action="show" id="${integrante?.id}">${integrante?.nome}</g:link></td>
                </tr>
            </g:each>
            <tr><td><hr/></td></tr>
        </g:each>
        </tbody>
    </table>
    <div class="fix"></div>
</div>

<br/>
<button class="greyishBtn" onclick="$('#grupoDialog').dialog({'width': '600px'});$('.colorpicker').css({'zIndex': 9999});">Adicionar Grupo</button>


<div id="grupoDialog" title="Grupos" style="display: none;">
    <h4 class="aligncenter red pt10">Selecione os alunos que farão parte do grupo.</h4>
    <g:form action="saveGrupo"  class="mainForm">
       <g:hiddenField name="idPeriodoDisciplina" value="${periodoDisciplina?.id}" />
        <fieldset class="form">
            <div class="widget">
                <div class="head"><h5 class="iList">Preencha os campos abaixo</h5></div>

                <div class="rowElem"><label for="nome">
                    <g:message code="grupo.nome.label" default="Nome" />

                </label><div class="formRight">
                    <div class="fieldcontain ${hasErrors(bean: grupo, field: 'nome', 'error')} ">

                        <g:textField name="nome" value="${grupo?.nome}"/>
                    </div>
                </div><div class="fix"></div></div>

                <div class="rowElem">
                    <label>Cor:</label>
                    <div class="formRight">
                        <input type="text" class="colorpick" id="colorpickerField" name="colorpickerField" value="00ff00" />
                        <label for="colorpickerField" class="pick"></label>
                        <div class="fix"></div>
                    </div>
                    <div class="fix"></div>
                </div>

                <div class="table">
                    <div class="head"><h5 class="iFrames">Alunos</h5></div>
                    <table cellpadding="0" cellspacing="0" width="100%" class="tableStatic resize">
                   <thead>
                    <tr>
                        <td align="center" width="10%">selecione</td>
                        <td align="left" width="90%">Nome</td>
                    </tr>
                   </thead>
                    <tbody>
                       <g:each in="${periodoDisciplina?.alunos}" var="aluno">
                           <tr>
                               <td align="center" style="text-align: center;"><g:checkBox name="checkAluno" checked="false" value="${aluno?.id}"  /></td>
                               <td align="left">${aluno?.nome}</td>
                           </tr>
                       </g:each>
                    </tbody>
                    </table>
                    <div class="fix"></div>
                    </div>
                   <br/>

                <g:submitButton name="create" class="greyishBtn submitForm" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                <div class="fix"></div>
            </div>
        </fieldset>


    </g:form>
</div>