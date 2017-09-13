<%-- 
    Document   : updateCivilStatus
    Created on : Sep 12, 2017, 8:14:45 PM
    Author     : Editha's Laptop
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/websiteCss.css">
        <jsp:include page="HRAdminHeader.jsp"/>
        <title>Update CivilStatus</title>
    </head>
    <body>
        <center>
        <form action="CivilStatusServlet" method="post">
            <input type="text" placeholder="CivilStatus" name="civilStatusName" value="${civilStatusName}"  required>
            <br>
            <input type="hidden" name="civilStatusId" value=${civilStatusId}>
            <button type="submit" name="submit" value="update">Update</button>
            <c:choose>
                <c:when test= "${sessionScope.civilStatustExists}">
                    <jsp:include page="/WEB-INF/View/Error/nameExists.jsp"/>
                    <c:set var="civilStatusExists" value="false" scope="session" />
                </c:when>
            </c:choose>
        </form>
    </center>
    </body>
    <jsp:include page="HRAdminFooter.jsp"/>
</html>
