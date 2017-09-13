<%-- 
    Document   : createHolidayType
    Created on : 09 10, 17, 9:30:17 PM
    Author     : Martin
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/websiteCss.css">
        <title>Create Holiday Type</title>
    </head>
    <body>
        <jsp:include page="HRAdminHeader.jsp"/>
        
        <form action="HolidayTypeServlet" method="POST">
            <input type="text" name="holidayTypeName" placeholder="Holiday Type Name"><br>
            <input type="number" name="rate" step=0.01 placeholder="Rate"><br>
            <input type="submit" value="Create Holiday Type"><br>
            <input type="hidden" name="create" value="create">
        </form>
        
        <c:if test="${error != null}">
            <center>
                <div class="errorMessage">
                    <c:out value="${error}"/>
                </div>
            </center>
        </c:if>
    
        <jsp:include page="HRAdminFooter.jsp"/>