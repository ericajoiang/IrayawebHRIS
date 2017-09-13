<%-- 
    Document   : viewPositions
    Created on : 09 5, 17, 9:32:22 PM
    Author     : Martin
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Positions</title>
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
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="item" items="${data}">
                    <tr>
                        <td>${item.getId()}</td>
                        <td>${item.getName()}</td>
                        <td>
                            <form action="HRAdminServlet" method="POST">
                                <input type="submit" name="update" value="Update">
                                <input type="hidden" name="updateValue" value="position">
                                <input type="hidden" name="name" value="${item.name}">
                                <input type="hidden" name="id" value="${item.id}">
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <jsp:include page="HRAdminFooter.jsp"/>