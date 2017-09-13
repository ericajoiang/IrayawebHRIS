<%-- 
    Document   : updateTaxCode
    Created on : 09 9, 17, 11:57:55 PM
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
        <title>Update Civil Status</title>
    </head>
   <body>
   <center>
        <form action="TaxCodeServlet" method="post">
            <input type="text" placeholder="Tax Code" name="taxCodeName" value="${taxCodeName}"  required>
            <br>
            <input type="hidden" name="taxCodeId" value=${taxCodeId}>
            <button type="submit" name="submit" value="update">Update</button>
            <c:choose>
                <c:when test= "${sessionScope.taxCodeExists}">
                    <jsp:include page="/WEB-INF/View/Error/nameExists.jsp"/>
                    <c:set var="taxCodeExists" value="false" scope="session" />
                </c:when>
            </c:choose>
        </form>
    </center>
    </body>
    <jsp:include page="HRAdminFooter.jsp"/>
</html>
