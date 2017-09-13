<%-- 
    Document   : createCivilStatus
    Created on : 08 30, 17, 11:11:27 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/websiteCss.css">
        <jsp:include page="HRAdminHeader.jsp"/>
        <title>Create Civil Status</title>
    </head>
    <center>
    <body>
        <br>
        <form action="CivilStatusServlet" method="post">
            <input type="text" placeholder="Civil Status" name="civilStatus" maxlength="15"  required>
            <br>
            <button type="submit" name="submit" value="create">Create</button>
        </form>
        <c:choose>
            <c:when test= "${sessionScope.civilStatusExists}">
                <jsp:include page="/WEB-INF/View/Error/nameExists.jsp"/>
                <c:set var="civilStatusExists" value="false" scope="session" />
            </c:when>
        </c:choose>
    </body>
    </center>
    <jsp:include page="HRAdminFooter.jsp"/>
</html>
