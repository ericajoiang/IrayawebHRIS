<%-- 
    Document   : viewLeaveTypes
    Created on : 08 24, 17, 11:45:00 PM
    Author     : Martin
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="../css/bootstrap.min.css"/>         
        <script src="../js/bootstrap.min.js"></script>  
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/websiteCss.css">
        <title>Leave Types</title>
    </head>
    <body>
        <jsp:include page="HRAdminHeader.jsp"/>
        
        <c:if test="${success != null}">
            <center>
                <div class="successMessage">
                    <c:out value="${success}"/>
                </div>
            </center>
        </c:if>
    
        <br><br><table border="1">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Rate to Cash</th>
                    <th>Max Credit</th>
                    <th>Replenishment Date</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="item" items="${data}">
                    <tr>
                        <td>${item.getId()}</td>
                        <td>${item.getName()}</td>
                        <td>${item.getRateToCash()}</td>
                        <td>${item.getMaxCredit()}</td>
                        <td>${item.getReplenishmentDate()}</td>
                        <td>
                            <form action="HRAdminServlet" method="POST">
                                <input type="submit" name="update" value="Update">
                                <input type="hidden" name="updateValue" value="leave type">
                                <input type="hidden" name="name" value="${item.name}">
                                <input type="hidden" name="id" value="${item.id}">
                                <input type="hidden" name="rateToCash" value="${item.rateToCash}">
                                <input type="hidden" name="maxCredit" value="${item.maxCredit}">
                                <input type="hidden" name="replenishmentDate" value="${item.replenishmentDate}">
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        
        <jsp:include page="HRAdminFooter.jsp"/>
