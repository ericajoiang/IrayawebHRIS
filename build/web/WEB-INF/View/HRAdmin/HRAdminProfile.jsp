<%-- 
    Document   : HRAdminProfile
    Created on : 17 Aug, 2017, 11:15:43 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
    </head>
    <body>  
        <jsp:include page="HRAdminHeader.jsp"/>

        
        <%--
        <h1>CREATE</h1>
        <form action="HRAdminServlet" method="POST">
            <input type="submit" value="Create department" name="query">
            <input type="submit" value="Create leave type" name="query">
            <input type="submit" value="Create employee" name="query">
        </form>
       --%>
       
       <jsp:include page="HRAdminFooter.jsp"/>
    </body>
</html>
