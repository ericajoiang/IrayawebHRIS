/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import controllers.HolidayTypeIO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.HolidayType;

/**
 *
 * @author Martin
 */
public class HolidayTypeServlet extends HttpServlet {

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
            String name = request.getParameter("holidayTypeName");
            float rate = Float.parseFloat(request.getParameter("rate"));
            
            if(!HolidayTypeIO.checkIfExists(name)){
                
                HolidayTypeIO.createHolidayType(name, rate);
                
                uri = "/WEB-INF/View/HRAdmin/viewHolidayTypes.jsp";
                request.setAttribute("success", "Holiday Type [" + name + "] has been created.");
                
                request.setAttribute("data", HolidayTypeIO.getHolidayTypes());
                
            }else{
                uri = "/WEB-INF/View/HRAdmin/createHolidayType.jsp";
                request.setAttribute("error", "Holiday Type [" + name + "] already exists.");
            }
        }else if(request.getParameter("update")!=null){
            int id = Integer.parseInt(request.getParameter("update"));  
            String name = request.getParameter("holidayTypeName");
            
            try{
                float rate = Float.parseFloat(request.getParameter("rate"));
                if(!HolidayTypeIO.checkIfExists2(name, id)){
                    HolidayTypeIO.updateHolidayType(id, name, rate);
                    
                    uri = "/WEB-INF/View/HRAdmin/viewHolidayTypes.jsp";
                    request.setAttribute("success", "The holiday type has been updated.");
                    request.setAttribute("data", HolidayTypeIO.getHolidayTypes());
                    
                }else{
                    uri = "/WEB-INF/View/HRAdmin/updateHolidayType.jsp";
                    request.setAttribute("error", "Holiday Type name is already in use.");
                
                    HolidayType holidayType = new HolidayType();
                    holidayType.setId(id);
                    holidayType.setName(name);
                    holidayType.setRate(rate);
                
                    request.setAttribute("holidayType", holidayType);
                }
                
            }catch(Exception e){
                uri = "/WEB-INF/View/HRAdmin/updateHolidayType.jsp";
                request.setAttribute("error", "Invalid rate.");
                System.out.println(e);
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
