/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import models.LeaveType;
import controllers.LeaveTypeIO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Martin
 */
public class LeaveTypeServlet extends HttpServlet {

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
        HttpSession session = request.getSession();
        String uri = "";
        
        if(request.getParameter("create")!=null){
            
            DateFormat formatter = null;
            java.util.Date date = null;
            java.sql.Date sqlDate = null;
            try{
                formatter = new SimpleDateFormat("yyyy-mm-dd");
                date = formatter.parse(request.getParameter("replenishment date"));
                sqlDate = new java.sql.Date(date.getTime());
            }catch(Exception e){
                e.printStackTrace();
            }
        
            String name = request.getParameter("leave type name");
            float rateToCash = Float.parseFloat(request.getParameter("rate to cash"));
            int maxCredit = Integer.parseInt(request.getParameter("max credit"));
            Date replenishmentDate = sqlDate;
            if(request.getParameter("replenishment date")==null){
                System.out.println("Replenishment Date: " + request.getParameter("replenishment date"));
            }
        
            if(!LeaveTypeIO.checkIfExists(name)){
                LeaveType leaveType = new LeaveType();
            
                leaveType.setName(name);
                leaveType.setRateToCash(rateToCash);
                leaveType.setMaxCredit(maxCredit);
                leaveType.setReplenishmentDate(replenishmentDate);
            
                LeaveTypeIO.createLeaveType(leaveType);
                
                //retrieve all leave types for viewing 
                ArrayList<LeaveType> leaveTypes = LeaveTypeIO.getLeaveTypes();
                request.setAttribute("data", leaveTypes);
                
                uri = "/WEB-INF/View/HRAdmin/viewLeaveTypes.jsp";
                request.setAttribute("success", "Leave Type has been created.");
            }else{
                uri = "/WEB-INF/View/HRAdmin/createLeaveType.jsp";
                request.setAttribute("error", "Leave Type already exists.");
            }
        }
        else if(request.getParameter("update")!=null){
            LeaveType leaveType = new LeaveType();
            
            DateFormat formatter = null;
            java.util.Date date = null;
            java.sql.Date sqlDate = null;
            try{
                formatter = new SimpleDateFormat("yyyy-mm-dd");
                date = formatter.parse(request.getParameter("replenishmentDate"));
                sqlDate = new java.sql.Date(date.getTime());
            }catch(Exception e){
                e.printStackTrace();
            }
            
            int id = Integer.parseInt(request.getParameter("update"));
            String newName = request.getParameter("name");
            float newRateToCash = Float.parseFloat(request.getParameter("rateToCash"));
            int newMaxCredit = Integer.parseInt(request.getParameter("maxCredit"));
            Date newReplenishmentDate = sqlDate;
            
            leaveType.setId(id);
            leaveType.setName(newName);
            leaveType.setRateToCash(newRateToCash);
            leaveType.setMaxCredit(newMaxCredit);
            leaveType.setReplenishmentDate(newReplenishmentDate); 
            
            if(!LeaveTypeIO.checkIfExists(newName)){
                //update leave type
                LeaveTypeIO.updateLeaveType(leaveType);
                
                //retrieve all leave types for viewing 
                ArrayList<LeaveType> leaveTypes = LeaveTypeIO.getLeaveTypes();
                request.setAttribute("data", leaveTypes);
                
                uri = "/WEB-INF/View/HRAdmin/viewLeaveTypes.jsp";
                request.setAttribute("success", "The leave type servlet has been updated.");
                
            }else{
                uri = "/WEB-INF/View/Error/ErrorPage.jsp";
                request.setAttribute("error", "The leave type name is already in use.");
                request.setAttribute("leaveType", leaveType);
            }
            
        }else{
            uri = "/WEB-INF/View/Error/ErrorPage.jsp";
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
