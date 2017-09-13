<%-- 
    Document   : updateHolidayType
    Created on : 09 11, 17, 1:38:26 AM
    Author     : Martin
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/websiteCss.css">
        <title>Update Holiday Type</title>
    </head>
    <body>
        <jsp:include page="HRAdminHeader.jsp"/>
        
        <form action="HolidayTypeServlet" method="POST">
            <input type="text" value="${holidayType.name}" name="holidayTypeName" placeholder="Holiday Type Name"><br>
            <input type="number" value="${holidayType.rate}" name="rate" step=0.01 placeholder="Rate"><br>
            <input type="submit" value="Update Holiday Type"><br>
            <input type="hidden" name="update" value="${holidayType.id}">
        </form>
        
        <c:if test="${error != null}">
            <center>
                <div class="errorMessage">
                    <c:out value="${error}"/>
                </div>
            </center>
        </c:if>
        
        <jsp:include page="HRAdminFooter.jsp"/>
    </body>
</html>
