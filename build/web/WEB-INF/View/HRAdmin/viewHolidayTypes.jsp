<%-- 
    Document   : viewHolidayTypes
    Created on : 09 10, 17, 10:52:26 PM
    Author     : Martin
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/websiteCss.css">
        <title>Holiday Types</title>
    </head>
    <body>
        <jsp:include page="HRAdminHeader.jsp"/>
        
        <br><br>
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
                    <th>Rate</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="item" items="${data}">
                    <tr>
                        <td>${item.getId()}</td>
                        <td>${item.getName()}</td>
                        <td>${item.getRate()}</td>
                        <td>
                            <form action="HRAdminServlet" method="POST">
                                <input type="submit" name="update" value="Update">
                                <input type="hidden" name="updateValue" value="holidayType">
                                <input type="hidden" name="name" value="${item.name}">
                                <input type="hidden" name="id" value="${item.id}">
                                <input type="hidden" name="rate" value="${item.rate}">
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
                            
        <jsp:include page="HRAdminFooter.jsp"/>