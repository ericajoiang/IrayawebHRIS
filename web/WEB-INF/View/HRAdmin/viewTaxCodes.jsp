<%-- 
    Document   : viewTaxCode
    Created on : 09 9, 17, 11:07:59 PM
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
        <title>View Tax Codes</title>
    </head>
    <body>
    <center>
        <table>
            <tr>
                <th>ID</th>
                <th>Tax Code</th>
                <th>Options</th>
            </tr>
            <c:forEach var="taxCode" items="${sessionScope.data}" >
                <tr>
                    <td>${taxCode.id}</td>
                    <td>${taxCode.name}</td>
                    <td>
                        <form action="HRAdminServlet" method="post">
                            <input type="hidden" name="taxCodeId" value=${taxCode.id}>
                            <input type="hidden" name="taxCodeName" value="${taxCode.name}">
                            <input type="hidden" name="updateValue" value="taxCode">
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
