<%-- 
    Document   : updateDepartment
    Created on : 08 29, 17, 12:29:15 AM
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
        <title>Update Department</title>
    </head>
   <body>
   <center>
        <form action="DepartmentServlet" method="post">
            <input type="text" placeholder="Department" name="departmentName" value="${departmentName}"  required>
            <br>
            <input type="hidden" name="departmentId" value=${departmentId}>
            <button type="submit" name="submit" value="update">Update</button>
            <c:choose>
                <c:when test= "${sessionScope.departmentExists}">
                    <jsp:include page="/WEB-INF/View/Error/nameExists.jsp"/>
                    <c:set var="departmentExists" value="false" scope="session" />
                </c:when>
            </c:choose>
        </form>
    </center>
    </body>
    <jsp:include page="HRAdminFooter.jsp"/>
</html>
