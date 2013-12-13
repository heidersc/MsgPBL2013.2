<div class="leftNav">
    <ul id="menu">


        <g:if test="${br.edu.unime.util.Perfil.getPerfilByKey(session.perfilId) == 'Coordenador'}">
            <li class="widgets"><a href="#" title="" class="exp"><span>Coordenação</span></a>
                <ul class="sub">
                    <li><g:link controller="pessoa" action="index" title="">Usuários</g:link> </li>
                    <li><g:link controller="disciplina" action="index" title="">Disciplinas</g:link> </li>
                    <li><g:link controller="curso" action="index" title="">Cursos</g:link> </li>

                </ul>
            </li>
        </g:if>

        <g:if test="${br.edu.unime.util.Perfil.getPerfilByKey(session.perfilId) in ['Coordenador', 'Professor']}">
            <li class="widgets"><a href="#" title="" class="exp"><span>Docentes</span></a>
                <ul class="sub">
                    <li><g:link controller="grupo" action="index" title="">Grupos</g:link> </li>
                    <li><g:link controller="periodoDisciplina" action="index" title="">Disciplina por período</g:link> </li>
                </ul>
            </li>
        </g:if>


        <li class="widgets"><a href="#" title="" class="exp"><span>Discentes</span></a>
            <ul class="sub">
                <li><g:link controller="periodoDisciplina" action="index" title="">Disciplina por período</g:link> </li>
            </ul>
        </li>

    </ul>
</div>