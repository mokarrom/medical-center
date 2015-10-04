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
import java.util.Date;
import java.util.Formatter;
import medicalcenter.database;
import javax.servlet.http.HttpSession;
import org.apache.catalina.Session;

/**
 *
 * @author Administrator
 */
public class SubmitStdPrescription extends HttpServlet {

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
        HttpSession session=request.getSession(true);
        PrintWriter out = response.getWriter();
        String medstr,medId,dose,tempqty,tempdr,tempInstId,query,stdFk=null,empFk=null;
        int dr,qty,instId;
        int prescriptionFk=-1;
        ResultSet rs;
        JSONArray jsar=new JSONArray();
        JSONObject jsob=new JSONObject();

        try {
            empFk=session.getAttribute("user_pk").toString();
            String reg=request.getParameter("regno");
            String diagnosisDetail=request.getParameter("diagnosis_detail");
            String re_date=request.getParameter("re_dt");
            String gen_adv=request.getParameter("gen_adv");
            medstr = request.getParameter("medicineinfo");
            jsar = (JSONArray) JSONValue.parse(medstr);

            query="SELECT student_pk FROM student where registration_no="+reg;
            String tbl,fld,val;
            Date dt=new Date();
            Formatter fmt=new Formatter();
                fmt.format("%tY-%tm-%td", dt,dt,dt);
            //System.out.println("Reg= "+fmt);
            database db=new database();
            rs=db.executeQuery(query);
            while(rs.next())
                stdFk=rs.getString("student_pk");
            tbl="std_prescription_info";
            fld="student_pk_fk,emplaoyee_pk_fk,prescription_dt,diagnosis_detail,reconsult_dt,general_advice";
            val=stdFk+","+empFk+",'"+fmt+"',"+"'"+diagnosisDetail+"',"+"'"+re_date+"','"+gen_adv+"'";
            String fld2[]={"med_com_name_fk","no_of_doses","medication_inst_fk","day_duration","med_qty","std_prescription_fk","state" };
            String rows[][] =new String[jsar.size()][7];
           // System.out.println("s="+gen_adv);
            try{                
                db.setAutoCommit(false);
                db.insert(tbl,fld,val);
                rs=db.executeQuery("select LAST_INSERT_ID();");
                while(rs.next())
                    prescriptionFk=rs.getInt(1);

                for (int i = 0; i < jsar.size(); i++)
                {
                    jsob = (JSONObject) jsar.get(i);
                    medId = (String) jsob.get("med_id");
                    dose= (String) jsob.get("med_dose");
                    tempdr = (String) jsob.get("med_dr");
                    dr = Integer.parseInt(tempdr);
                    tempqty = (String) jsob.get("med_qty");
                    qty = Integer.parseInt(tempqty);
                    tempInstId = (String) jsob.get("med_inst");
                    //instId = Integer.parseInt(tempInstId);

                    rows[i][0]= medId;
                    rows[i][1]= dose;
                    rows[i][2]= tempInstId;
                    rows[i][3]= tempdr;
                    rows[i][4]= tempqty;
                    rows[i][5]= ""+prescriptionFk;
                    rows[i][6]= "notavailable";

       /*
                System.out.println(medId);
                System.out.println(dose);
                System.out.println(tempInstId);
                System.out.println(tempdr);
                System.out.println(prescriptionFk);
        *
        */
                }
                  //  database db=new database();
               db.insert2("patient_med_info", fld2, rows);
               db.commit();
               db.setAutoCommit(true);
            }catch(SQLException e){
                System.out.println("Sql Erroe: "+e);
            }

            //System.out.println("c= "+medstr);
            //out.println("w= "+medstr);


    //System.out.print(jsar);



            getServletContext().getRequestDispatcher("/doctor_first_if.jsp").forward(request, response);
        }catch(Exception e){
        //out.println("$Error: " +e);
            getServletContext().getRequestDispatcher("/prescription_error.jsp").forward(request, response);
        System.out.println("$Error: " +e);
             }
        finally {
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
