<%-- 
    Document   : newjsp
    Created on : 17 Aug, 2017, 8:13:32 PM
    Author     : HP
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error!</title>
    </head>
    <body>
        <c:choose>
            <c:when test="${message != null}">
                <c:out value="${message}"/>
            </c:when>
            <c:otherwise>
                <center>
                    <h1>Page Cannot Be Found</h1>
                </center>
            </c:otherwise>
        </c:choose>
    
        <form action="index.html" method="post">
            <button type="submit">Go Back</button>
        </form>
    </body>
</html>
