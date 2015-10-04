/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package servlet;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import medicalcenter.database;

/**
 *
 * @author Administrator
 */
public class RetrieveImage extends HttpServlet {

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
       // String connectionURL = "jdbc:mysql://localhost:3306/central_db";
        String sql=null;
        //java.sql.Connection con=null;
    try{
     // Class.forName("com.mysql.jdbc.Driver").newInstance();
    //  con=DriverManager.getConnection(connectionURL,"root","admin");

      sql="SELECT photo FROM student_personal_info,student "
              + "WHERE student.student_pk=student_personal_info.student_personal_pk_fk "
              + "and student.registration_no="+request.getParameter("regNo");
      //out.println(sql);
     // Statement st1=con.createStatement();
      database db=new database();
      ResultSet rs1 = db.executeQuery(sql); //+request.getAttribute("reg")); //+request.getAttribute("reg")); //getParameter("regNo"));
      String imgLen="";
      if(rs1.next()){
        imgLen = rs1.getString("photo");
        //out.println("<br>YEs<br>");
      }
      rs1 = db.executeQuery(sql);
      if(rs1.next()){

        int len = imgLen.length();
        byte [] rb = new byte[len];
        InputStream readImg = rs1.getBinaryStream("photo");

        int index=readImg.read(rb, 0, len);
        db.close();
        response.reset();

        response.setContentType("image/jpg");
        response.getOutputStream().write(rb,0,len);
        response.getOutputStream().flush();

        //out.println("<br>YEs<br>");
      }

     //getServletContext().getRequestDispatcher("/CheckValue.jsp").forward(request, response);
    }
    catch (Exception e){
      e.printStackTrace();
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
