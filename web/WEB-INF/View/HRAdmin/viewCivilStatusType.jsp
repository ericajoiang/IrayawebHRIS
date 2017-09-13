<%-- 
    Document   : viewCivilStatusType
    Created on : 30 Aug, 2017, 9:16:05 AM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="../css/bootstrap.min.css"/>         
        <script src="../js/bootstrap.min.js"></script>  
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/websiteCss.css">
    </head>
    <body>
         <table>
            <tr>
                <th>Civil Status ID</th>
                <th>Civil Status Name</th>
                <th>Options</th>
            </tr>
            
            <c:forEach var="civilStatus" items="${sessionScope.civStatusList}" >
                <tr>
                    <td>${civilStatus.getCivil_statusId()}</td>
                    <td>${civilStatus.getCivilStatusName()}</td>
                    <td>
                        <form action="ProfileRedirect" method="post">
                            <input type="hidden" name="civilStatusId" value="${civilStatus.getCivil_statusId()}">
                            <input type="hidden" name="civilStatusName" value="${civilStatus.getCivilStatusName()}">
                            <input type="hidden" name="updatecivilStatus" value="civilStatus">
                            <input type="submit" name="update" value="update">
                        </form>
                    </td>
                </tr>
            </c:forEach>
                
                <td>

                </td>
        </table>
    </body>
</html>
