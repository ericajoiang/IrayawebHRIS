<%-- 
    Document   : EmployeeHeader
    Created on : 12 Aug, 2017, 5:59:34 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bootstrap Example</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/EmployeeHeaderCss.css" >

       
    </head>
    <body>

        <div class="container">
            <a class="active" href="#home"><img src= "${pageContext.request.contextPath}/Images/IrayaLogo.png" width="150" height="60"></a>     
            <a href="#">Notifications</a>
            <a href="#">Profile</a>
                    <div class="dropdown">
                      <button class="dropbtn">Leave</button>
                        <div class="dropdown-content">
                          <a href="#">Sick</a>
                          <a href="#">Maternity/Paternity</a>
                          <a href="#">Emergency</a>
                        </div>
                    </div>
            <a href="#">Attendance</a>
            <a href="#">Loan</a>
            <a href="#">Payslip</a>
            <a href="#">Request</a>
            <a href="#">Logout</a>
         </div>
    </body>
    
    
    
</html>
