<!-- Header -->
<div id="header" class="wrapper">
    <div class="logo">

        <g:link controller="login" action="index"> <img src="${createLinkTo(dir: 'images', file: 'GRAILS_LOGO.png')}" alt="" /></g:link>
    </div>
    <div class="middleNav">
        <ul>
            <g:if test="${br.edu.unime.util.Perfil.getPerfilByKey(session.perfilId) == 'Aluno'}">
                <li class="iCalendar">
                <g:link controller="login" action="index">
                    <span>Calendário</span>
                </g:link>

                    </a>
                </li>
            </g:if>
            <g:if test="${br.edu.unime.util.Perfil.getPerfilByKey(session.perfilId) == 'Professor'}">
                <li class="iCalendar">
                <g:link controller="login" action="index">
                    <span>Calendário</span>
                 </g:link>

                </a>
            </li>
            </g:if>


        </ul>
    </div>
    <div class="fix"></div>
</div>