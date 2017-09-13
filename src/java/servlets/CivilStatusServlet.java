/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import controllers.CivilStatusIO;
import controllers.DepartmentIO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author user
 */
public class CivilStatusServlet extends HttpServlet {

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
            out.println("<title>Servlet CivilStatusServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CivilStatusServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
            
            String uri = "";
            String name = request.getParameter("civilStatus");
            HttpSession session = request.getSession();
            
            if(request.getParameter("submit").equals("create"))
            {
                if(!CivilStatusIO.civilStatusExists(name))
                {
                    CivilStatusIO.createCivilStatus(name);
                    uri = "/WEB-INF/View/HRAdmin/viewDepartments.jsp";
                    session.setAttribute("departmentList", CivilStatusIO.viewCivilStatus());
                }
                else
                {
                    uri = "/WEB-INF/View/HRAdmin/createCivilStatus.jsp";
                    session.setAttribute("civilStatusExists", true);
                    RequestDispatcher errorRD = request.getRequestDispatcher(uri);
                    errorRD.forward(request, response);
                }
            }else if(request.getParameter("submit").equals("update"))
            {
                
                 uri = "/WEB-INF/View/HRAdmin/updateCivilStatus.jsp";
                
                int civilstatusId = Integer.parseInt(request.getParameter("civilstatusId"));
                String civilStatusName = request.getParameter("civilstatusId");
                
                
                
                

               /* 
                if(!CivilStatusIO.civilStatusExists(civilStatusName))
                {
                    CivilStatusIO.updateCivilStatus(civilStatusName, civilstatusId);
                   
                    session.setAttribute("civilstatusList", CivilStatusIO.viewCivilStatus());
                }else
                {
                     uri = "/WEB-INF/View/HRAdmin/viewCivilStatusType.jsp";
                    session.setAttribute("civilstatusExists", true);
                    RequestDispatcher errorRD = request.getRequestDispatcher(uri);
                    errorRD.forward(request, response);
                }*/
            }        
            RequestDispatcher rd = request.getRequestDispatcher(uri);
            rd.forward(request, response);
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

