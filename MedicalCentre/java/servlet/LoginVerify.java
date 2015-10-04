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
import org.apache.catalina.Session;
import java.util.jar.Attributes.Name;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Administrator
 */
public class LoginVerify extends HttpServlet {
   
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
        PrintWriter out = response.getWriter();
        ResultSet rs;
        HttpSession session=request.getSession(true);

        int flag=0,user_pk=-1;

        char c;
        String user= request.getParameter("username");
        String pass= request.getParameter("password");
        
        c= user.charAt(0);
        if(c>='0' && c<='9'){
            String query= "Select student.student_pk from student where " +
                "student.registration_no= '"+user+"' and student.password= '"+pass+"'";
            try {
                database db = new database();
                rs= db.executeQuery(query);
                if(rs.next()){
                    user_pk= rs.getInt("student_pk");
                    flag=1;
                }
                else{
                    System.out.println("Login Failed 4");
                    response.setHeader("login", "failed");
                }
                if(flag==1){
                    //response.setHeader("login", "passed");
                    session.setAttribute("user_pk",user_pk);
                    session.setAttribute("user_type", "student");
                    //System.out.println("Student Registration No= "+user_pk);
                    db.close();
                    getServletContext().getRequestDispatcher("/student_profile.jsp").forward(request, response);
                }
                else{
                  getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
                }
                
            } catch (Exception ex) {
                out.println("error "+ex);
                ex.printStackTrace();
            }
        }
        else{
            String query= "SELECT employee_pk,designation_fk from employee,employee_status "
+" where employee.login_id= '"+user+"' and employee.password= '" +pass+"'"
+" and employee_pk=employee_status_pk_fk" ;
            int designationId=-1;
            try {
                database db = new database();
                rs= db.executeQuery(query);
                if(rs.next()){
                    user_pk= rs.getInt("employee_pk");
                    designationId= rs.getInt("designation_fk");
                    flag=1;
                }
                else{
                    System.out.println("Login Failed");
                    response.setHeader("login", "failed");
                }
                if(flag==1){
                    response.setHeader("login", "passed");
                    session.setAttribute("user_pk",user_pk);
                    session.setAttribute("desig_id", designationId);
                    session.setAttribute("user_type", "employee");
                    //System.out.println("Employee Id= "+user_pk);
                    if( designationId==9){
                        //Medicine Distributor
                        getServletConfig().getServletContext().getRequestDispatcher("/med_dist_first.jsp").forward(request, response);
                        //System.out.println("dfdsf");
                    }
                    else if(designationId==10){
                        //Doctor
                       // response.sendRedirect("doctor_first_if.jsp");
                        getServletConfig().getServletContext().getRequestDispatcher("/doctor_first_if.jsp").forward(request, response);
                        
                    }
                    else if(designationId==11){
                        //Pharmacist
                        getServletContext().getRequestDispatcher("/user_profile.jsp").forward(request, response);
                    }
                    else{
                        // Employee Prescription
                        getServletContext().getRequestDispatcher("/view_emp_prescription.jsp").forward(request, response);
                    }

                }else{
                   getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
                }
            } catch (Exception ex) {
                getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
                ex.printStackTrace();
            }
            try {

            } finally {
                out.close();
            }
        }

        try {
            
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
