<%-- 
    Document   : createDepartment
    Created on : 08 17, 17, 5:42:18 PM
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
        <title>Create Department</title>
    </head>
    <center>
    <body>
        <br>
        <form action="DepartmentServlet" method="post">
            <input type="text" placeholder="Department Name" name="departmentName" required>
            <br>
            <button type="submit" name="submit" value="create">Create</button>
            <c:choose>
                <c:when test= "${sessionScope.departmentExists}">
                    <jsp:include page="/WEB-INF/View/Error/nameExists.jsp"/>
                    <c:set var="departmentExists" value="false" scope="session" />
                </c:when>
            </c:choose>
        </form>
    </body>
    </center>
    <jsp:include page="HRAdminFooter.jsp"/>
</html>
