/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Login;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author HP
 */
public class LoginServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EmployeeLoginServ</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginServlet at " + request.getContextPath() + "</h1>");
            
            HttpServletRequest req = (HttpServletRequest) request;
            HttpSession session = req.getSession();
            
            
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String account_type = request.getParameter("account_type");
            
           ServletContext sc = request.getSession().getServletContext(); 
           String dbUrl = sc.getInitParameter("dbUrl");
           String dbUser = sc.getInitParameter("dbUser");
           String dbPass = sc.getInitParameter("dbPass");
          
            
           LoginBean lb = new LoginBean();
           

           
           LoginIO lo = new LoginIO(dbUser, dbPass, dbUrl);
           
           boolean valid = false;
           
            try {
                
               valid = lo.getUserIfValidAdmin(username, password);
               
            } catch (SQLException ex) {
                Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            
           lb.setUsername(username);
           lb.setPassword(password);
           lb.setAccount_type(account_type);
           lb.setValid(valid);
            
            
            session.setAttribute("username", username);
            session.setAttribute("password", password);
            session.setAttribute("account_type", account_type);
            session.setAttribute("valid",  valid);

            
           /* out.println(lb.getUsername());
            out.println(lb.getPassword());
            out.println(account_type);
            out.println(valid);*/
            
            EmployeeAccountBean useraccount = new EmployeeAccountBean();

            try {
                useraccount = lo.getEmployeeAccount(Integer.parseInt(username), password);
            } catch (SQLException ex) {
                Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            
           session.setAttribute("useraccount", useraccount);

            if(account_type.equals("hradmin") && valid != false)
            {
               request.getRequestDispatcher("/WEB-INF/View/HRAdmin/HRAdminProfile.jsp").forward(request, response);
               
            } else if(account_type.equals("employee") && valid != false){
               
                request.getRequestDispatcher("/WEB-INF/View/Employee/EmployeeProfile.jsp").forward(request, response);
            
            }else{
                
                request.getRequestDispatcher("/WEB-INF/View/Error/ErrorPage.jsp").forward(request, response);
                
            }
          
            
            
            
            //request.getRequestDispatcher("ProfileRedirect").forward(request, response);
           
            
            
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
