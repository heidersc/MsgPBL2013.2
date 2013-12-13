<%@ page import="sisap.Grupo" %>



<div class="rowElem"><label for="alunos">
    <g:message code="grupo.alunos.label" default="Alunos" />
    
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: grupoInstance, field: 'alunos', 'error')} ">

        <g:select name="alunos" from="${sisap.Pessoa.list()}" multiple="multiple" optionKey="id" size="5" value="${grupoInstance?.alunos*.id}" class="many-to-many"/>
    </div>
</div><div class="fix"></div></div>

<div class="rowElem"><label for="nome">
    <g:message code="grupo.nome.label" default="Nome" />
    
</label><div class="formRight">
    <div class="fieldcontain ${hasErrors(bean: grupoInstance, field: 'nome', 'error')} ">

        <g:textField name="nome" value="${grupoInstance?.nome}"/>
    </div>
</div><div class="fix"></div></div>


   <div class="rowElem">
                    <label>Cor:</label>
                    <div class="formRight">
                        <input type="text" class="colorpick" id="colorpickerField" name="colorpickerField" value="00ff00" />
                        <label for="colorpickerField" class="pick"></label>
                        
                        
                    <div class="fix"></div>
                </div></div>



