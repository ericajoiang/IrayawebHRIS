<%-- 
    Document   : createLeaveType
    Created on : 08 21, 17, 10:55:46 PM
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
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/websiteCss.css">
        <link href = "https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css" rel = "stylesheet">
        <script src = "https://code.jquery.com/jquery-1.10.2.js"></script>
        <script src = "https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
        
        <script>
            $(function() {
                $( "#datepicker" ).datepicker({ dateFormat: "yy-mm-dd"});
            });
        </script>
      
        <title>Create Leave Type</title>
    </head>
    <body>
        <form action="LeaveTypeServlet" method="POST">
            <input type="text" placeholder="Name" name="leave type name"><br>
            <input type="number" placeholder="Rate to Cash" step=0.01 name="rate to cash"><br>
            <input type="number" placeholder="Max Credit" name="max credit"><br>
            <input type="text" placeholder="Replenishment Date" name="replenishment date" id="datepicker"><br>
            <input type="hidden" name="create" value="create">
            <input type="submit" value="Create Leave Type">
        </form>
        
    <c:if test="${error != null}">
    <center>
        <div class="errorMessage">
            <c:out value="${error}"/>
        </div>
    </center>
    </c:if>
    
    <jsp:include page="HRAdminFooter.jsp"/>
