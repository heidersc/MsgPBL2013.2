<g:form action="saveAtividade"  class="mainForm">
    <g:hiddenField name="idPeriodoDisciplina" value="${idPeriodoDisciplina}" />
    <fieldset class="form">
        <div class="widget first">
            <div class="head"><h5 class="iList">Preencha os campos abaixo</h5></div>

            <div class="rowElem"><label for="codigo">
                <g:message code="disciplina.codigo.label" default="Nome" />

            </label><div class="formRight">

                    <g:textField name="nome" value="${atividade?.nome}"/>

            </div><div class="fix"></div></div>
            <div class="rowElem">
                <label>Prazo:</label>
                <div class="formRight">
                    <input type="text" name="prazo" class="datepicker" />
                </div>
                <div class="fix"></div>
            </div>

            <fieldset>
                <div class="widget">
                    <div class="head"><h5 class="iPencil">Descrição</h5></div>
                    <textarea id="wyEditor" name="descricao"  rows="5" cols="">${atividade?.descricao}</textarea>
                </div>
            </fieldset>
            <div class="rowElem">
                <div class="formRight">
                    <g:submitButton name="create" class="greyishBtn submitForm" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                </div>
                <div class="fix"></div>
            </div>


            <div class="fix"></div>
        </div>
    </fieldset>
</g:form>