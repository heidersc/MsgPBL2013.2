<g:form class="mainForm" action="list">
    <fieldset>
        <div class="widget">
            <div class="head"><h5 class="iView">Filtro</h5></div>
            <div class="floatleft twoOne">
                <div class="rowElem noborder pb0"><label class="topLabel">Código:</label><div class="formBottom"><g:textField name="codigo" value="${params?.codigo}" /></div><div class="fix"></div></div>


            </div>
            <div class="floatright twoOne">
                <div class="rowElem noborder pb0"><label class="topLabel">Nome:</label><div class="formBottom"><g:textField name="nome" value="${params?.nome}" /></div><div class="fix"></div></div>
                <div class="rowElem noborder pb0" style="float: right;"><div class="formBottom"><g:submitButton name="teste" class="greyishBtn" value="Buscar"  /></div><div class="fix"></div></div>

            </div>

            <div class="fix"></div>
        </div>
    </fieldset>
</g:form>