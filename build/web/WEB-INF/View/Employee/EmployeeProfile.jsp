<%-- 
    Document   : EmployeeProfile
    Created on : 12 Aug, 2017, 7:29:17 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/EmployeeProfileCss.css" >
    </head>
    <body>
        <jsp:include page="EmployeeHeader.jsp"/> 
             
        <h1>Welcome Employee!</h1>
        <form action="" method="post">
            <input type="submit" value="Submit">
        </form>
        
        <jsp:include page="EmployeeFooter.jsp"/> 
    </body>
</html>
