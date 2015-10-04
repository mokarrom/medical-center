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
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import medicalcenter.database;

/**
 *
 * @author Administrator
 */
public class GetMedInfo extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */

      public Object toJSONObject(int id,String name){
        JSONObject obj = new JSONObject();
        obj.put("name", name);
        obj.put("id", id);
        return obj;
  }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
         response.setContentType("text/html;charset=UTF-8");
    //     response.setContentType("application/json");
        PrintWriter out = response.getWriter();
            int id,temp;
            String name;
            ResultSet rs=null;
            String sql="SELECT med_com_name_pk,med_com_name,med_weight FROM medicine_com_info,medicine_gen_info "
                    + "where med_gen_name_fk=med_gen_name_pk "
                    + "and med_type='"+request.getParameter("medType")+"'";
           // "request.getParameter("med_type");
            //out.println(sql);
        try {
            JSONArray jsar=new JSONArray();
            database db=new database();
               rs=db.executeQuery(sql);
            while(rs.next()){
                id=rs.getInt("med_com_name_pk");
                temp=rs.getInt("med_weight");
                if(temp==0)
                    name=rs.getString("med_com_name");
                else
                    name=rs.getString("med_com_name")+ "  ("+rs.getInt("med_weight")+ " mg)";
                jsar.add(toJSONObject(id, name));
            }
               String jsonString = JSONValue.toJSONString(jsar);
           //    System.out.println(jsonString);
           //    System.out.println(jsar);
                out.println(jsonString);
                }catch(Exception e){
                    out.println("Error : "+e);
        }  finally {
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
