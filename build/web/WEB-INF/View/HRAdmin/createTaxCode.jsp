<%-- 
    Document   : createTaxCode
    Created on : 09 6, 17, 12:47:24 AM
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
        <title>Create Tax Code</title>
    </head>
    <center>
    <body>
        <br>
        <form action="TaxCodeServlet" method="post">
            <input type="text" placeholder="Tax Code Name" name="taxCodeName" required>
            <br>
            <button type="submit" name="submit" value="create">Create</button>
            <c:choose>
                <c:when test= "${sessionScope.taxCodeExists}">
                    <jsp:include page="/WEB-INF/View/Error/nameExists.jsp"/>
                    <c:set var="taxCodeExists" value="false" scope="session" />
                </c:when>
            </c:choose>
        </form>
    </body>
    </center>
    <jsp:include page="HRAdminFooter.jsp"/>
</html>
