<%-- 
    Document   : updatePosition
    Created on : 09 5, 17, 11:21:16 PM
    Author     : Martin
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/websiteCss.css">
        <title>Update Position</title>
    </head>
    <body>
        <jsp:include page="HRAdminHeader.jsp"/>
        
        <form action="PositionServlet" method="POST">
            <input type="text" value="${position.name}"name="name">
            <input type="submit" value="Save">
            <input type="hidden" name="update" value="${position.id}">
        </form>
        
        <c:if test="${error != null}">
            <center>
                <div class="errorMessage">
                    <c:out value="${error}"/>
                </div>
            </center>
        </c:if>
    
        <jsp:include page="HRAdminFooter.jsp"/>