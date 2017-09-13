<%-- 
    Document   : viewHolidays
    Created on : 09 10, 17, 11:54:21 PM
    Author     : Martin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/websiteCss.css">
        
        <title>Holidays</title>
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
                    <th>Holiday Type</th>
                    <th>Date</th>
                    <th>Start Time</th>
                    <th>End Time</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="item" items="${data}">
                    <tr>
                        <td>${item.id}</td>
                        <td>${item.holidayType}</td>
                        <td>${item.name}</td>
                        <td>${item.date}</td>
                        <td>${item.startTime}</td>
                        <td>${item.endTime}</td>
                        <td>
                            <form action="HRAdminServlet" method="POST">
                                <input type="submit" name="update" value="Update">
                                <input type="hidden" name="updateValue" value="holiday">
                                <input type="hidden" name="name" value="${item.name}">
                                <input type="hidden" name="id" value="${item.id}">
                                <input type="hidden" name="holidayType" value="${item.holidayType}">
                                <input type="hidden" name="date" value="${item.date}">
                                <input type="hidden" name="startTime" value="${item.startTime}">
                                <input type="hidden" name="endTime" value="${item.endTime}">
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    
        
        <jsp:include page="HRAdminFooter.jsp"/>
