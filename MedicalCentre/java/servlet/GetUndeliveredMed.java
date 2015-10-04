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
public class GetUndeliveredMed extends HttpServlet {

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
        ResultSet rs=null;
        int id=-1;
        String regNo=request.getParameter("reg_id");
        String query1="SELECT std_prescription_pk"+
" FROM std_prescription_info,student"+
" where student_pk_fk=student_pk"+
" and registration_no="+regNo+
" order by std_prescription_pk desc limit 1";


        //out.println(regNo);
        try{
           database db=new database();
           rs=db.executeQuery(query1);
           if(rs.next())
             {
               id=rs.getInt("std_prescription_pk");
               db.executeProcedure("update_med_state", id);
               
               String query2="SELECT med_type,med_gen_name,med_com_name_pk,med_com_name,med_weight,med_qty FROM medicine_gen_info,medicine_com_info,patient_med_info "+
                            "where med_com_name_fk=med_com_name_pk "+
                            "and std_prescription_fk="+id+
                            " and state='undelivered' "+
                            "and med_gen_name_fk=med_gen_name_pk";
               rs=db.executeQuery(query2);
               request.setAttribute("data", rs);
               request.setAttribute("prescription_id", id);
                   getServletContext().getRequestDispatcher("/medicine_distributor.jsp").forward(request, response);
             }
            getServletContext().getRequestDispatcher("/med_dist_error.jsp").forward(request, response);

         //out.println("dsf");
        }catch(SQLException e){
            out.println("error : "+e);
        }
        out.println(id);
        try {
            /* TODO output your page here
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet GetUndeliveredMed</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet GetUndeliveredMed at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
            */
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
