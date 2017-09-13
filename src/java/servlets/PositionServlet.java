/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import controllers.PositionIO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.Position;

/**
 *
 * @author Martin
 */
public class PositionServlet extends HttpServlet {

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
            String name = request.getParameter("positionName");
            
            if(!PositionIO.checkIfExists(name)){
                PositionIO.createPosition(name);
                
                //retrieve all leave types for viewing 
                ArrayList<Position> positions = PositionIO.getPositions();
                request.setAttribute("data", positions);
                
                uri = "/WEB-INF/View/HRAdmin/viewPositions.jsp";
                request.setAttribute("success", "The position has been created.");
            }else{
                uri = "/WEB-INF/View/HRAdmin/createPosition.jsp";
                request.setAttribute("error", "The position already exists.");
            }
        }
        else if(request.getParameter("update")!=null){
            Position position = new Position();
            String newName = request.getParameter("name");
            int id = Integer.parseInt(request.getParameter("update"));
            
            position.setId(id);
            position.setName(newName);
            
            if(!PositionIO.checkIfExists(newName)){
                PositionIO.updatePosition(position);
                
                request.setAttribute("success", "Position has been updated.");
                uri = "/WEB-INF/View/HRAdmin/viewPositions.jsp";
            }
            else{
                request.setAttribute("error", "The position name is already in use.");
                request.setAttribute("position", position);
                uri = "/WEB-INF/View/HRAdmin/updatePosition.jsp";
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
