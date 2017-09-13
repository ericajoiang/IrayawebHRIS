<%-- 
    Document   : login
    Created on : 08 12, 17, 12:52:01 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/EmployeeLoginCss.css">
        
    </head>
    <body>          

    <center>
<%-- width="150" height="60"--%>
        <br>
        <br>
        <br>
        <br>
        <br>

        <div class="logo">
        <h1><img src= "${pageContext.request.contextPath}/Images/IrayaLogo.png"></h1>
        </div>
        
        <form action="LoginServlet" method="post">
                <input type="text" placeholder="Employee Username" name="username" required>
                <br>
                <input type="password" placeholder="Password" name="password" required>
                <br>
                <input type="hidden" name="account_type" value="employee">
           <div class="button">
                <button class="login" type="submit">Login</button>
           </div>
        </form>
    </center>  
    </body>
</html>
