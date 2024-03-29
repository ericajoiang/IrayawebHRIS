/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import controllers.DepartmentIO;
import controllers.TaxCodeIO;
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
public class DepartmentServlet extends HttpServlet {

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
        PrintWriter out = response.getWriter();
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet DepartmentServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DepartmentServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
            
            String uri = "";
            HttpSession session = request.getSession();
            int departmentId = 0;
            String name = request.getParameter("departmentName");
            
            if(request.getParameter("submit").equals("create"))
            {
                if(!DepartmentIO.departmentNameExists(name))
                {
                    DepartmentIO.createDepartment(name);
                    uri = "/WEB-INF/View/HRAdmin/viewDepartments.jsp";
                    session.setAttribute("departmentList", DepartmentIO.viewDepartments());
                }
                else
                {
                    uri = "/WEB-INF/View/HRAdmin/createDepartment.jsp";
                    session.setAttribute("departmentExists", true);
                    RequestDispatcher errorRD = request.getRequestDispatcher(uri);
                    errorRD.forward(request, response);
                }   
            }

            else if(request.getParameter("submit").equals("update"))
            {
                departmentId = Integer.parseInt(request.getParameter("departmentId"));
                if(!DepartmentIO.departmentUpdateExists(name, departmentId))
                {
                    DepartmentIO.updateDepartment(departmentId, name);
                    uri = "/WEB-INF/View/HRAdmin/viewDepartments.jsp";
                    session.setAttribute("departmentList", DepartmentIO.viewDepartments());
                }
                else
                {
                    uri = "/WEB-INF/View/HRAdmin/updateDepartment.jsp";
                    session.setAttribute("departmentExists", true);
                    RequestDispatcher errorRD = request.getRequestDispatcher(uri);
                    errorRD.forward(request, response);
                }
            }
                     
            RequestDispatcher rd = request.getRequestDispatcher(uri);
            rd.forward(request, response);
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
