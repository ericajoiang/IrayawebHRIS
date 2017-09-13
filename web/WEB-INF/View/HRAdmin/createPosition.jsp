<%-- 
    Document   : createPosition
    Created on : 08 30, 17, 8:52:24 PM
    Author     : Martin
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/websiteCss.css">
        <title>Create Position</title>
    </head>
    <body>
        <form action="PositionServlet" method="POST">
            <input type="text" placeholder="Name" name="positionName" required><br>
            <input type="submit" value="Create Position">
            <input type="hidden" name="create" value="create">
        </form>
        
        <c:if test="${error != null}">
            <center>
                <div class="errorMessage">
                    <c:out value="${error}"/>
                </div>
            </center>
        </c:if>
    </body>
</html>
