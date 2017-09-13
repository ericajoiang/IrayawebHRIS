<%-- 
    Document   : updateHoliday
    Created on : 09 12, 17, 9:30:28 PM
    Author     : user
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/websiteCss.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/wickedpicker.css">
        <link href = "https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css" rel = "stylesheet">
        <script src = "https://code.jquery.com/jquery-1.10.2.js"></script>
        <script src = "https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/wickedpicker.js"></script>
        
        <script>
            $(function() {
                $( "#datepicker" ).datepicker({ dateFormat: "yy-mm-dd"});
                $('.timepicker').wickedpicker();
            });
        </script>
        <title>Update Holiday</title>
    </head>
    <body>
        <jsp:include page="HRAdminHeader.jsp"/>
        
        <br><br>
        <form action="HolidayServlet" method="POST">
            <input type="text" name="holidayName" value="${holiday.name}" placeholder="Holiday Name"><br>
            <div class="select-dropdown">
                <select name="holidayType">
                    <option selected hidden>Choose Holiday Type</option>
                    <c:forEach var="item" items="${data}">
                        <option value="${item.id}">${item.name}</option>
                    </c:forEach>
                </select>
            </div>
            
            <input type="hidden" value="${holiday.id}">
            <input type="text" name="date" value="${holiday.date}" id="datepicker" placeholder="Date"><br>
            <input type="text" name="startTime" value="${startTime}" class="timepicker" placeholder="Start Time"><br>
            <input type="text" name="endTime" value="${endTime}" class="timepicker" placeholder="End Time"><br>
            <input type="submit" value="Update Holiday">
            <input type="hidden" name="update" value="update">
        </form>
        
        <c:if test="${error != null}">
            <center>
                <div class="errorMessage">
                    <c:out value="${error}"/>
                </div>
            </center>
        </c:if>
    
        <jsp:include page="HRAdminFooter.jsp"/>
