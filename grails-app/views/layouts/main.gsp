<%@ page import="sisap.Pessoa" %>
<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><title><g:layoutTitle default="SISAP"/></title>

    <link href="${createLinkTo(dir: 'css', file:  'main.css')}" rel="stylesheet" type="text/css" />
    <link href='http://fonts.googleapis.com/css?family=Cuprum' rel='stylesheet' type='text/css' />
    <style type="text/css">
    @font-face {
        font-family: 'Cuprum';
        font-style: normal;
        font-weight: 400;
        src: local('Cuprum'), local('Cuprum-Regular'), url("${createLinkTo(dir: 'css', file: 'sp1_LTSOMWWV0K5VTuZzvQ.woff')}") format('woff');
    }
    </style>

    <script type="text/javascript" src="${createLinkTo(dir: 'js', file: 'jquery-1.8.1.js')}"></script>


    <script type="text/javascript" src="${createLinkTo(dir: 'js/plugins/spinner', file:  'jquery.mousewheel.js')}"></script>
    <script type="text/javascript" src="${createLinkTo(dir: 'js/plugins/spinner', file:  'ui.spinner.js')}"></script>

    <script type="text/javascript" src="${createLinkTo(dir: 'js', file: 'jquery-ui.min.js')}"></script>

    <script type="text/javascript" src="${createLinkTo(dir: 'js/plugins/wysiwyg', file:  'jquery.wysiwyg.js')}"></script>
    <script type="text/javascript" src="${createLinkTo(dir: 'js/plugins/wysiwyg', file:  'wysiwyg.image.js')}"></script>
    <script type="text/javascript" src="${createLinkTo(dir: 'js/plugins/wysiwyg', file:  'wysiwyg.link.js')}"></script>
    <script type="text/javascript" src="${createLinkTo(dir: 'js/plugins/wysiwyg', file:  'wysiwyg.table.js')}"></script>



    <script type="text/javascript" src="${createLinkTo(dir: 'js/plugins/tables', file:  'jquery.dataTables.js')}"></script>
    <script type="text/javascript" src="${createLinkTo(dir: 'js/plugins/tables', file:  'colResizable.min.js')}"></script>

    <script type="text/javascript" src="${createLinkTo(dir: 'js/plugins/forms', file:  'forms.js')}"></script>
    <script type="text/javascript" src="${createLinkTo(dir: 'js/plugins/forms', file:  'autogrowtextarea.js')}"></script>
    <script type="text/javascript" src="${createLinkTo(dir: 'js/plugins/forms', file:  'autotab.js')}"></script>
    <script type="text/javascript" src="${createLinkTo(dir: 'js/plugins/forms', file:  'jquery.validationEngine-en.js')}"></script>
    <script type="text/javascript" src="${createLinkTo(dir: 'js/plugins/forms', file:  'jquery.validationEngine.js')}"></script>
    <script type="text/javascript" src="${createLinkTo(dir: 'js/plugins/forms', file:  'jquery.dualListBox.js')}"></script>
    <script type="text/javascript" src="${createLinkTo(dir: 'js/plugins/forms', file:  'chosen.jquery.min.js')}"></script>
    <script type="text/javascript" src="${createLinkTo(dir: 'js/plugins/forms', file:  'jquery.maskedinput.min.js')}"></script>
    <script type="text/javascript" src="${createLinkTo(dir: 'js/plugins/forms', file:  'jquery.inputlimiter.min.js')}"></script>
    <script type="text/javascript" src="${createLinkTo(dir: 'js/plugins/forms', file:  'jquery.tagsinput.min.js')}"></script>

    <script type="text/javascript" src="${createLinkTo(dir: 'js/plugins/other', file:  'calendar.min.js')}"></script>
    <script type="text/javascript" src="${createLinkTo(dir: 'js/plugins/other', file:  'elfinder.min.js')}"></script>

    <script type="text/javascript" src="${createLinkTo(dir: 'js/plugins/uploader', file:  'plupload.js')}"></script>
    <script type="text/javascript" src="${createLinkTo(dir: 'js/plugins/uploader', file:  'plupload.html5.js')}"></script>
    <script type="text/javascript" src="${createLinkTo(dir: 'js/plugins/uploader', file:  'plupload.html4.js')}"></script>
    <script type="text/javascript" src="${createLinkTo(dir: 'js/plugins/uploader', file:  'jquery.plupload.queue.js')}"></script>

    <script type="text/javascript" src="${createLinkTo(dir: 'js/plugins/ui', file:  'jquery.progress.js')}"></script>
    <script type="text/javascript" src="${createLinkTo(dir: 'js/plugins/ui', file:  'jquery.jgrowl.js')}"></script>
    <script type="text/javascript" src="${createLinkTo(dir: 'js/plugins/ui', file:  'jquery.tipsy.js')}"></script>
    <script type="text/javascript" src="${createLinkTo(dir: 'js/plugins/ui', file:  'jquery.alerts.js')}"></script>
    <script type="text/javascript" src="${createLinkTo(dir: 'js/plugins/ui', file:  'jquery.colorpicker.js')}"></script>

    <script type="text/javascript" src="${createLinkTo(dir: 'js/plugins/wizards', file:  'jquery.form.wizard.js')}"></script>
    <script type="text/javascript" src="${createLinkTo(dir: 'js/plugins/wizards', file:  'jquery.validate.js')}"></script>

    <script type="text/javascript" src="${createLinkTo(dir: 'js/plugins/ui', file:  'jquery.breadcrumbs.js')}"></script>
    <script type="text/javascript" src="${createLinkTo(dir: 'js/plugins/ui', file:  'jquery.collapsible.min.js')}"></script>
    <script type="text/javascript" src="${createLinkTo(dir: 'js/plugins/ui', file:  'jquery.ToTop.js')}"></script>
    <script type="text/javascript" src="${createLinkTo(dir: 'js/plugins/ui', file:  'jquery.listnav.js')}"></script>
    <script type="text/javascript" src="${createLinkTo(dir: 'js/plugins/ui', file:  'jquery.sourcerer.js')}"></script>
    <script type="text/javascript" src="${createLinkTo(dir: 'js/plugins/ui', file:  'jquery.timeentry.min.js')}"></script>
    <script type="text/javascript" src="${createLinkTo(dir: 'js/plugins/ui', file:  'jquery.prettyPhoto.js')}"></script>

    <script type="text/javascript" src="${createLinkTo(dir: 'js', file:  'custom.js')}"></script>

    <g:layoutHead/>
		%{--<r:layoutResources />--}%
	</head>
	<body>
    <div id="topNav">
        <div class="fixed">
            <div class="wrapper">
                <div class="welcome"><img src="${createLinkTo(dir: 'images', file: 'userPic.png')}" alt="" /><span style="color: #ffffff;">Olá, ${session.nome}!</span></div>
                <div class="userNav">
                    <ul>
                        <li><a href="#" title=""><g:link controller="meuPerfil" action="index"><img src="${createLinkTo(dir: 'images/icons/topnav', file: 'profile.png')}" alt="" /><span>Perfil</span></g:link> </li>
                        %{--<li><a href="#" title=""><img src="${createLinkTo(dir: 'images/icons/topnav', file: 'tasks.png')}" alt="" /><span>Tarefas</span></a></li>--}%
                        <li class="dd"><img src="${createLinkTo(dir: 'images/icons/topnav', file: 'messages.png')}" alt="" /><span>Mensagens</span><span class="numberTop">${sisap.MensagemDestinatario.findAllByDestinatarioAndLida(Pessoa.read(session.idPessoa), false).size()}</span>
                        <ul class="menu_body">
                            <li><g:link controller="mensagem" action="createMensagem">Nova Mensagem</g:link></li>
                            <li><g:link controller="mensagem" action="listEntradas">Caixa de Entrada</g:link></li>
                            <li><g:link controller="mensagem" action="listEnviadas">Itens Enviados</g:link></li>
                            <li><g:link controller="mensagemPredefinida" action="list">Predefinidas</g:link></li>
                        </ul>
                        </li>
                        <li><g:link controller="login"  action="logout"><img src="${createLinkTo(dir: 'images/icons/topnav', file: 'logout.png')}" alt="" /><span>Sair</span></g:link> </li>
                    </ul>
                </div>
                <div class="fix"></div>
            </div>
        </div>
    </div>


    <div class="wrapper">
        <g:render template="/layouts/header" />
        <g:render template="/layouts/menu" />
		<g:layoutBody/>
        </div>
        <div id="footer">
        <div class="wrapper">
            <span>&copy; Copyright ${new java.text.SimpleDateFormat("yyyy").format(new Date())}. Todos os direito reservados. UNIME</span>
        </div>
        </div>
		<r:layoutResources />
	</body>
</html>
