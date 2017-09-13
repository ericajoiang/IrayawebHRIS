<%-- 
    Document   : updateLeaveType
    Created on : 08 30, 17, 12:22:34 AM
    Author     : Martin
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/websiteCss.css">
        <link href = "https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css" rel = "stylesheet">
        <script src = "https://code.jquery.com/jquery-1.10.2.js"></script>
        <script src = "https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
        
        <script>
            $(function() {
                $( "#datepicker" ).datepicker({ dateFormat: "yy-mm-dd"});
            });
        </script>
        <title>Update Leave Type</title>
    </head>
    <body>
        <jsp:include page="HRAdminHeader.jsp"/>
        <h1><c:out value="${leaveType.name}"/> Leave</h1>
        
        <form action="LeaveTypeServlet" method="POST">
            <input type="text" value="${leaveType.name}" name="name"><br>
            <input type="number" value="${leaveType.rateToCash}" step=0.01 name="rateToCash"><br>
            <input type="number" value="${leaveType.maxCredit}" name="maxCredit"><br>
            <input type="text" value="${leaveType.replenishmentDate}" name="replenishmentDate" id="datepicker"><br>
            <input type="submit" value="Save">
            <input type="hidden" name="update" value="${leaveType.id}">
        </form>
        
        <c:if test="${error != null}">
            <center>
                <div class="errorMessage">
                    <c:out value="${error}"/>
                </div>
            </center>
        </c:if>
    
        <jsp:include page="HRAdminFooter.jsp"/>
