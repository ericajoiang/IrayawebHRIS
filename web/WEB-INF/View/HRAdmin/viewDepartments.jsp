<%-- 
    Document   : viewDepartments
    Created on : 08 26, 17, 10:32:36 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head> 
        <jsp:include page="HRAdminHeader.jsp"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/websiteCss.css">
        <title>View Departments</title>
    </head>
    <body>
    <center>
        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Options</th>
            </tr>
            <c:forEach var="department" items="${sessionScope.departmentList}" >
                <tr>
                    <td>${department.id}</td>
                    <td>${department.name}</td>
                    <td>
                        <form action="HRAdminServlet" method="post">
                            <input type="hidden" name="departmentId" value=${department.id}>
                            <input type="hidden" name="departmentName" value="${department.name}">
                            <input type="hidden" name="updateValue" value="department">
                            <input type="submit" name="update" value="Update">
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </center>
    </body>
<jsp:include page="HRAdminFooter.jsp"/>
</html>
