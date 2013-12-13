<%--
  Created by IntelliJ IDEA.
  User: Phillip
  Date: 05/03/13
  Time: 21:57
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="mainLogin"/>
  <title></title>
</head>
<body>
<div class="loginWrapper">
    <div class="loginLogo"><img src="${createLinkTo(dir: 'images', file: 'GRAILS_LOGO.png')}" alt="" /></div>
    <g:if test="${flash.message}">
        <div class="nNote nFailure hideit">
            <p><strong>Erro: </strong>${flash.message}</p>
        </div>
    </g:if>

    <div class="loginPanel">
        <div class="head"><h5 class="iUser">Login</h5></div>
        <g:form action="logon" id="valid" class="mainForm">
            <fieldset>
                <div class="loginRow noborder">
                    <label for="req1">Usuário:</label>
                    <div class="loginInput"><input type="text" name="login" class="validate[required]" id="req1" /></div>
                    <div class="fix"></div>
                </div>

                <div class="loginRow">
                    <label for="req2">Senha:</label>
                    <div class="loginInput"><input type="password" name="password" class="validate[required]" id="req2" /></div>
                    <div class="fix"></div>
                </div>

                <div class="loginRow">
                    <div class="rememberMe"><input type="checkbox" id="check2" name="chbox" /><label>Lembre-me</label></div>
                    <input type="submit" value="Login" class="greyishBtn submitForm" />
                    <div class="fix"></div>
                </div>
            </fieldset>
        </g:form>
    </div>
</div>
</body>
</html>