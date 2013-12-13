<%@ page import="sisap.PeriodoDisciplina; java.text.SimpleDateFormat; sisap.Pessoa" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>SISAP - Sistema de Apoio a Projetos</title>

    <script type="text/javascript">
        $(document).ready(function(){
            var date = new Date();
            var d = date.getDate();
            var m = date.getMonth();
            var y = date.getFullYear();


            $('#calendar').fullCalendar({
                header: {
                    left: 'prev,next',
                    center: 'title',
                    right: 'month,basicWeek,basicDay'
                },
                editable: false,
                events: [
                    <g:if test="${br.edu.unime.util.Perfil.getPerfilByKey(session.perfilId) in ['Professor', 'Coordenador']}">
                        <g:each in="${sisap.AtividadePeriodo.findAllByPeriodoDisciplinaInList(PeriodoDisciplina.findAllByProfessor(Pessoa.read(session.idPessoa)))}" var="atividadePeriodo">

                        {
                            title: "${atividadePeriodo.atividade.nome} - ${atividadePeriodo.periodoDisciplina.disciplina.nome}",
                            start: new Date(${new SimpleDateFormat("yyyy").format(atividadePeriodo.dataCriacao)}, ${Integer.parseInt(new SimpleDateFormat("MM").format(atividadePeriodo.dataCriacao))-1}, ${new SimpleDateFormat("dd").format(atividadePeriodo.dataCriacao)}),
                            end: new Date(${new SimpleDateFormat("yyyy").format(atividadePeriodo.dataPrazo)}, ${Integer.parseInt(new SimpleDateFormat("MM").format(atividadePeriodo.dataPrazo))-1}, ${new SimpleDateFormat("dd").format(atividadePeriodo.dataPrazo)}),
                            url: "${createLink(controller: 'periodoDisciplina', action: 'show', params: [id: atividadePeriodo.periodoDisciplina.id])}"
                        },
                        </g:each>
                    </g:if>
                        %{--<g:elseif test="${br.edu.unime.util.Perfil.getPerfilByKey(session.perfilId) == 'Aluno'}">--}%
                            %{--<g:each in="${Pessoa.read(session.idPessoa).disciplinas.atividadesPeriodo}" var="atividadePeriodo">--}%
                                    %{--{--}%
                                        %{--title: "${atividadePeriodo.atividade.nome} - ${atividadePeriodo.periodoDisciplina.disciplina.nome}",--}%
                                        %{--start: new Date(${new SimpleDateFormat("yyyy").format(atividadePeriodo.dataCriacao)}, ${Integer.parseInt(new SimpleDateFormat("MM").format(atividadePeriodo.dataCriacao))-1}, ${new SimpleDateFormat("dd").format(atividadePeriodo.dataCriacao)}),--}%
                                        %{--end: new Date(${new SimpleDateFormat("yyyy").format(atividadePeriodo.dataPrazo)}, ${Integer.parseInt(new SimpleDateFormat("MM").format(atividadePeriodo.dataPrazo))-1}, ${new SimpleDateFormat("dd").format(atividadePeriodo.dataPrazo)}),--}%
                                        %{--url: "${createLink(controller: 'periodoDisciplina', action: 'show', params: [id: atividadePeriodo.periodoDisciplina.id])}"--}%
                                    %{--},--}%
                            %{--</g:each>--}%
                        %{--</g:elseif>--}%
                    {
                        title: ''

                    }
                ]
            });
        });
    </script>

    </head>
<body>



<!-- Content -->
<div class="content">
<div class="title"><h5>${session.nome}</h5></div>

<g:if test="${br.edu.unime.util.Perfil.getPerfilByKey(session.perfilId) == 'Aluno'}">
    <div class="widget">
        <div class="head"><h5 class="iDayCalendar">Calendário</h5></div>
        <div id="calendar" class="calendarDiv"></div>
    </div>

</g:if>

<g:if test="${br.edu.unime.util.Perfil.getPerfilByKey(session.perfilId) == 'Professor'}">
    <div class="stats">
        <ul>

            <li><a href="#" class="count grey" title="">520</a><span>pending orders</span></li>
            <li><a href="#" class="count grey" title="">14</a><span>new opened tickets</span></li>
            <li class="last"><a href="#" class="count grey" title="">48</a><span>new user registrations</span></li>
        </ul>
        <div class="fix"></div>
    </div>
        <div class="widget">
            <div class="head"><h5 class="iDayCalendar">Calendário</h5></div>
            <div id="calendar"></div>
        </div>

</g:if>




</div>
<div class="fix"></div>



</body>
</html>
