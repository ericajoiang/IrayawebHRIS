/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import controllers.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.Holiday;
import models.LeaveType;
import models.Position;
import models.HolidayType;

/**
 *
 * @author Martin
 */
public class HRAdminServlet extends HttpServlet {

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
        String queryValue = "";
        
        if(request.getParameter("home")!=null){
            uri = "/WEB-INF/View/HRAdmin/HRAdminProfile.jsp";
        }
        else if(request.getParameter("create")!=null){
            if(request.getParameter("create").equals("department")){
                uri = "/WEB-INF/View/HRAdmin/createDepartment.jsp";
                session.setAttribute("action", request.getParameter("create"));
            }
            else if(request.getParameter("create").equals("leave type")){
                uri = "/WEB-INF/View/HRAdmin/createLeaveType.jsp";
            }
            else if(request.getParameter("create").equals("position")){
                uri = "/WEB-INF/View/HRAdmin/createPosition.jsp";
            }
            else if(request.getParameter("create").equals("civil status")){
                uri = "/WEB-INF/View/HRAdmin/createCivilStatus.jsp";
            }
            else if(request.getParameter("create").equals("tax code")){
                uri = "/WEB-INF/View/HRAdmin/createTaxCode.jsp";
            }
            else if(request.getParameter("create").equals("holiday type")){
                uri = "/WEB-INF/View/HRAdmin/createHolidayType.jsp";
            }
            else if(request.getParameter("create").equals("holiday")){
                uri = "/WEB-INF/View/HRAdmin/createHoliday.jsp";
                request.setAttribute("data", HolidayTypeIO.getHolidayTypes());
            }
            else{
            uri = "/../ErrorPage.jsp";
            }
        }
        else if(request.getParameter("view")!=null){
            if(request.getParameter("view").equals("leave types")){
                uri = "/WEB-INF/View/HRAdmin/viewLeaveTypes.jsp";

                request.setAttribute("data", LeaveTypeIO.getLeaveTypes());
            }
            else if(request.getParameter("view").equals("departments")){
                uri = "/WEB-INF/View/HRAdmin/viewDepartments.jsp";
                
                session.setAttribute("departmentList", DepartmentIO.viewDepartments());
                
            }else if(request.getParameter("view").equals("civil status types")){
            
                uri = "/WEB-INF/View/HRAdmin/viewCivilStatusType.jsp";

                session.setAttribute("civStatusList", CivilStatusIO.viewCivilStatus());
            }
            else if(request.getParameter("view").equals("positions")){
                uri = "/WEB-INF/View/HRAdmin/viewPositions.jsp";
                
                request.setAttribute("data", PositionIO.getPositions());
            }
            else if(request.getParameter("view").equals("tax codes")){
                uri = "/WEB-INF/View/HRAdmin/viewTaxCodes.jsp";
                
                session.setAttribute("data", TaxCodeIO.getTaxCodes());
            }else if(request.getParameter("view").equals("holiday type")){
                uri = "/WEB-INF/View/HRAdmin/viewHolidayTypes.jsp";
                
                request.setAttribute("data", HolidayTypeIO.getHolidayTypes());
            }
            else if(request.getParameter("view").equals("holiday")){
                uri = "/WEB-INF/View/HRAdmin/viewHolidays.jsp";
                
                request.setAttribute("data", HolidayIO.getHolidays());
            }
        }
        else if(request.getParameter("update")!=null){
            if(request.getParameter("updateValue").equals("department")){
                uri="/WEB-INF/View/HRAdmin/updateDepartment.jsp";
                session.setAttribute("departmentName", request.getParameter("departmentName"));
                session.setAttribute("departmentId", Integer.parseInt(request.getParameter("departmentId")));
            }
            else if(request.getParameter("updateValue").equals("leave type")){
                uri="/WEB-INF/View/HRAdmin/updateLeaveType.jsp";
                
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
                
                LeaveType leaveType = new LeaveType();
                leaveType.setId(Integer.parseInt(request.getParameter("id")));
                leaveType.setName(request.getParameter("name"));
                leaveType.setRateToCash(Float.parseFloat(request.getParameter("rateToCash")));
                leaveType.setMaxCredit(Integer.parseInt(request.getParameter("maxCredit")));
                leaveType.setReplenishmentDate(sqlDate);
                request.setAttribute("leaveType", leaveType);
            }
            else if(request.getParameter("updateValue").equals("position")){
                uri = "/WEB-INF/View/HRAdmin/updatePosition.jsp";
                
                Position position = new Position();
                position.setId(Integer.parseInt(request.getParameter("id")));
                position.setName(request.getParameter("name"));
                
                request.setAttribute("position", position);
            }
            else if(request.getParameter("updateValue").equals("taxCode")){
                uri="/WEB-INF/View/HRAdmin/updateTaxCode.jsp";
                session.setAttribute("taxCodeName", request.getParameter("taxCodeName"));
                session.setAttribute("taxCodeId", Integer.parseInt(request.getParameter("taxCodeId")));
            }
            else if(request.getParameter("updateValue").equals("holidayType")){
                uri = "/WEB-INF/View/HRAdmin/updateHolidayType.jsp";
                
                HolidayType holidayType = new HolidayType();
                holidayType.setId(Integer.parseInt(request.getParameter("id")));
                holidayType.setName(request.getParameter("name"));
                holidayType.setRate(Float.parseFloat(request.getParameter("rate")));
                
                request.setAttribute("holidayType", holidayType);
            }
            else if(request.getParameter("updateValue").equals("holiday")){
                uri = "/WEB-INF/View/HRAdmin/updateHoliday.jsp";
                
                request.setAttribute("data", HolidayTypeIO.getHolidayTypes());
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
                
                Holiday holiday = new Holiday();
                holiday.setId(Integer.parseInt(request.getParameter("id")));
                holiday.setName(request.getParameter("name"));
                holiday.setDate(sqlDate);
                holiday.setHolidayType(Integer.parseInt(request.getParameter("holidayType")));
                holiday.setStartTime(request.getParameter("startTime"));
                holiday.setEndTime(request.getParameter("endTime"));
                
                session.setAttribute("holiday", holiday);
                session.setAttribute("startTime", request.getParameter("startTime"));
                session.setAttribute("endTime", request.getParameter("endTime"));
            }
        }
        else if(request.getParameter("logout")!=null){
            
            session.invalidate();
            uri = "/WEB-INF/View/LogOut/LogoutPage.jsp";
        }
        else{
            uri = "/../ErrorPage.jsp";
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
