<fieldset >
    <g:formRemote name="frmRemote" update="divAlterarSenha" url="[action: 'alterarSenha']" class="mainForm">
        <g:hiddenField name="id" value="${pessoaInstance?.id}" />
        <div ><label for="descricao">
            Nova senha
        </label>
            <div class="fieldcontain ${hasErrors(bean: atividadeInstance, field: 'descricao', 'error')} ">

                    <g:passwordField name="novasenha" value="${atividadeInstance?.descricao}"/>
                </div>
            <div class="fix"></div></div>

        <div ><label for="descricao">
            Repita a nova senha
        </label>
            <div>

                <g:passwordField name="novasenhaConfirm" value="${atividadeInstance?.descricao}"/>
            </div>
        <div class="fix"></div></div>
        <br/>
        <div>
            <g:submitButton name="btnSubmit" class="greyishBtn" value="Confirmar alteração"/>
            <div>


            </div>
            <div class="fix"></div></div>
    </g:formRemote>
</fieldset>