/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;
import controllers.HolidayIO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
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
public class HolidayServlet extends HttpServlet {

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
            java.util.Date dt = null;
            java.sql.Date sqlDate = null;
            try{
                formatter = new SimpleDateFormat("yyyy-mm-dd");
                dt = formatter.parse(request.getParameter("date"));
                sqlDate = new java.sql.Date(dt.getTime());
            }catch(Exception e){
                e.printStackTrace();
            }
            
            String name = request.getParameter("holidayName");
            Date date = sqlDate;
            String startTime = request.getParameter("startTime");
            String endTime = request.getParameter("endTime");
            int holidayType = Integer.parseInt(request.getParameter("holidayType"));

            if(!HolidayIO.checkIfExists(name)){
                HolidayIO.createHoliday(name, holidayType, date, startTime, endTime);
                
                //retrieve all holidays for viewing 
                request.setAttribute("data", HolidayIO.getHolidays());
                uri = "/WEB-INF/View/HRAdmin/viewHolidays.jsp";
                request.setAttribute("success", "The holiday has been created.");
            }else{
                uri = "/WEB-INF/View/HRAdmin/createHoliday.jsp";
                request.setAttribute("error", "The holiday [" + name + "] already exists.");
            }
        }
        
        if(request.getParameter("update")!=null){
            
            DateFormat formatter = null;
            java.util.Date dt = null;
            java.sql.Date sqlDate = null;
            try{
                formatter = new SimpleDateFormat("yyyy-mm-dd");
                dt = formatter.parse(request.getParameter("date"));
                sqlDate = new java.sql.Date(dt.getTime());
            }catch(Exception e){
                e.printStackTrace();
            }
            
            String name = request.getParameter("name");
            Date date = sqlDate;
            int id = Integer.parseInt(request.getParameter("id"));
            String startTime = request.getParameter("startTime");
            String endTime = request.getParameter("endTime");
            int holidayType = Integer.parseInt(request.getParameter("holidayType"));

            if(!HolidayIO.checkIfUpdateExists(id, name, date)){
                HolidayIO.updateHoliday(id, name, holidayType, date, startTime, endTime);
                
                //retrieve all holidays for viewing 
                request.setAttribute("data", HolidayIO.getHolidays());
                uri = "/WEB-INF/View/HRAdmin/viewHolidays.jsp";
                request.setAttribute("success", "The holiday has been created.");
            }else{
                uri = "/WEB-INF/View/HRAdmin/createHoliday.jsp";
                request.setAttribute("error", "The holiday [" + name + "] already exists.");
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
