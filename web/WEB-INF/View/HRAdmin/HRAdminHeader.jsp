<%-- 
    Document   : HRAdminHeader
    Created on : 23 Aug, 2017, 6:33:25 AM
    Author     : HP
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/HRAdminHeaderCss.css" >

    </head>
    <body>
        <div class="container">
            <!--<a class="active" href="${pageContext.request.contextPath}/WEB-INF/View/HRAdmin/HRAdminProfile.jsp"><img src= "${pageContext.request.contextPath}/Images/IrayaLogo.png" width="150" height="60"></a>-->     
            <form action="HRAdminServlet" method="POST">
                
                <div class="home-button" style="float: left; margin-right: 20px; margin-left: 20px;">
                    <input type="submit" name="home" value="" style="background:url(${pageContext.request.contextPath}/Images/IrayaLogo.png) no-repeat; width: 140px; height: 50px; background-size:cover;">
                </div>
                <div class="dropdown">
                <span>Create</span>
                    <div class="dropdown-content">
                        <input type="submit" name="create" value="department">
                        <input type="submit" name="create" value="leave type">
                        <input type="submit" name="create" value="position">
                        <input type="submit" name="create" value="civil status">
                        <input type="submit" name="create" value="tax code">
                        <input type="submit" name="create" value="holiday type">
                        <input type="submit" name="create" value="holiday">
                    </div>
                </div>
                <div class="dropdown">
                    <span>View</span>
                    <div class="dropdown-content">
                        <input type="submit" name="view" value="departments">
                        <input type="submit" name="view" value="leave types">
                        <input type="submit" name="view" value="civil status types">
                        <input type="submit" name="view" value="positions">
                        <input type="submit" name="view" value="tax codes">
                        <input type="submit" name="view" value="holiday type">
                        <input type="submit" name="view" value="holiday">
                    </div>
                </div>
                <div class="logout">
                    <input type="submit" value="Logout" name="logout">
                    <input type="hidden" name="useraccount" value="${useraccount.getEmployeeNum()}">
                </div>
            </form>
            </div>
            
            
            
    </body>
</html>
