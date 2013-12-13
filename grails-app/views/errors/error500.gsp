<%--
  Created by IntelliJ IDEA.
  User: Phillip
  Date: 05/03/13
  Time: 22:53
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="mainLogin"/>
    <title></title>
</head>
<body>
<div class="wrapper">
    <div class="errorPage">
        <h2 class="red errorTitle"><span>Algo está errado...</span></h2>
        <h1>500</h1>
        <span class="bubbles"></span>
        <p>Ocorreu um erro interno no servidor. Estamos trabalhando para resolvê-lo!</p>
        <div class="backToDash"><g:link controller="login" action="index" class="seaBtn button">Voltar</g:link> </div>
    </div>
</div>
</body>
</html>