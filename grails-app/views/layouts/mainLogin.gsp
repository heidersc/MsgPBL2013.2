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

    <script type="text/javascript" src="${createLinkTo(dir: 'js', file: 'jquery-1.8.1.js')}"></script>

    <script type="text/javascript" src="${createLinkTo(dir: 'js/plugins/spinner', file:  'jquery.mousewheel.js')}"></script>
    <script type="text/javascript" src="${createLinkTo(dir: 'js/plugins/spinner', file:  'ui.spinner.js')}"></script>

    <script type="text/javascript" src="${createLinkTo(dir: 'js', file: 'jquery-ui.min.js')}"></script>

    <script type="text/javascript" src="${createLinkTo(dir: 'js/plugins/wysiwyg', file:  'jquery.wysiwyg.js')}"></script>
    <script type="text/javascript" src="${createLinkTo(dir: 'js/plugins/wysiwyg', file:  'wysiwyg.image.js')}"></script>
    <script type="text/javascript" src="${createLinkTo(dir: 'js/plugins/wysiwyg', file:  'wysiwyg.link.js')}"></script>
    <script type="text/javascript" src="${createLinkTo(dir: 'js/plugins/wysiwyg', file:  'wysiwyg.table.js')}"></script>

    %{--<script type="text/javascript" src="${createLinkTo(dir: 'js/plugins/flot', file:  'jquery.flot.js')}"></script>--}%
    %{--<script type="text/javascript" src="${createLinkTo(dir: 'js/plugins/flot', file:  'jquery.flot.orderBars.js')}"></script>--}%
    %{--<script type="text/javascript" src="${createLinkTo(dir: 'js/plugins/flot', file:  'jquery.flot.pie.js')}"></script>--}%
    %{--<script type="text/javascript" src="${createLinkTo(dir: 'js/plugins/flot', file:  'excanvas.min.js')}"></script>--}%
    %{--<script type="text/javascript" src="${createLinkTo(dir: 'js/plugins/flot', file:  'jquery.flot.resize.js')}"></script>--}%

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

    %{--<script type="text/javascript" src="${createLinkTo(dir: 'js/charts', file:  'chart.js')}"></script>--}%
    <g:layoutHead/>
    <r:layoutResources />
</head>
<body>
<div id="topNav">
    <div class="fixed">
        <div class="wrapper">
            <div class="welcome"><a href="#" title=""></a><span>&nbsp;</span></div>
            %{--<div class="userNav">--}%
                %{--<ul>--}%
                    %{--<li><a href="#" title=""><img src="${createLinkTo(dir: 'images/icons/topnav', file: 'profile.png')}" alt="" /><span>Profile</span></a></li>--}%
                    %{--<li><a href="#" title=""><img src="${createLinkTo(dir: 'images/icons/topnav', file: 'tasks.png')}" alt="" /><span>Tasks</span></a></li>--}%
                    %{--<li class="dd"><img src="${createLinkTo(dir: 'images/icons/topnav', file: 'messages.png')}" alt="" /><span>Messages</span><span class="numberTop">8</span>--}%
                        %{--<ul class="menu_body">--}%
                            %{--<li><a href="#" title="">new message</a></li>--}%
                            %{--<li><a href="#" title="">inbox</a></li>--}%
                            %{--<li><a href="#" title="">outbox</a></li>--}%
                            %{--<li><a href="#" title="">trash</a></li>--}%
                        %{--</ul>--}%
                    %{--</li>--}%
                    %{--<li><a href="#" title=""><img src="${createLinkTo(dir: 'images/icons/topnav', file: 'settings.png')}" alt="" /><span>Settings</span></a></li>--}%
                    %{--<li><a href="login.html" title=""><img src="${createLinkTo(dir: 'images/icons/topnav', file: 'logout.png')}" alt="" /><span>Logout</span></a></li>--}%
                %{--</ul>--}%
            %{--</div>--}%
            <div class="fix"></div>
        </div>
    </div>
</div>
    <g:layoutBody/>
<div id="footer">
    <div class="wrapper">
        <span>&copy; Copyright ${new java.text.SimpleDateFormat("yyyy").format(new Date())}. Todos os direito reservados. UNIME</span>
    </div>
</div>
<r:layoutResources />
</body>
</html>
