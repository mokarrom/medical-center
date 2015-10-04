/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import medicalcenter.database;
/**
 *
 * @author Administrator
 */
public class AddNewMed extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String type,weight,cName,gName,fld1,val1,fld2,val2=null;
        ResultSet rs=null;
        int genNameFk=-1;
        type=request.getParameter("mtype");
        weight=request.getParameter("mweight");
        gName=request.getParameter("genname");
        cName=request.getParameter("comname");
        fld1="med_gen_name,med_type";
        fld2="med_gen_name_fk, med_com_name, med_weight";
        val1="'"+gName+"','"+type+"'";

        PrintWriter out = response.getWriter();
        try {
            database db=new database();
            db.setAutoCommit(false);
            db.insert("medicine_gen_info", fld1,val1);
            rs=db.executeQuery("select LAST_INSERT_ID();");
            while(rs.next())
                genNameFk=rs.getInt(1);
            val2=genNameFk+",'"+cName+"','"+weight+"'";
            db.insert("medicine_com_info", fld2,val2);
            db.commit();
            db.setAutoCommit(true);
        }catch(SQLException e){
           System.out.println("Erroe "+e);
        } finally {
            out.close();
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
