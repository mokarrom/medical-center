/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
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
public class StocLedgerSubmit extends HttpServlet {

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
        JSONArray jsar=new JSONArray();
        JSONObject jsob=new JSONObject();
        ResultSet rs;
        String companyID,date,commission,empFk,medinfostr,id,qty,pp,mfgdt,expdt=null;
        int slNo=0;
        String fld1[]={"comp_id_fk","employee_pk_fk","purchase_dt","commission"};
        String fld2[]={"sl_no_fk","med_com_name_fk","medicine_qty","pp_price","manufacturing_dt","expiring_dt"};
        String val1[]=new String[4];
        //System.out.println("First Yes ");
        companyID=request.getParameter("company_id");
        date=request.getParameter("date");
        commission=request.getParameter("commission");
        empFk=request.getParameter("emp_fk");
        System.out.println(companyID+" "+date+"Yes "+commission+" emp pk "+empFk);
        val1[0]=companyID;val1[1]=empFk;val1[2]="'"+date+"'";val1[3]=commission;

            //String [] medicineType = request.getParameterValues("medicine_type");
            //String [] medicineComName = request.getParameterValues("medicine_com_name");
            //String [] medicineWeight = request.getParameterValues("medicine_weight");
            //String [] medicineQty = request.getParameterValues("medicine_qty");
            //String [] ppPrice = request.getParameterValues("pp_price");

            medinfostr = request.getParameter("slmedinfo");
            jsar = (JSONArray) JSONValue.parse(medinfostr);
            String rows[][] =new String[jsar.size()][6];
        try{
            database db=new database();
            db.setAutoCommit(false);
            db.insert("stock_ledger_comp", fld1, val1);
            rs=db.executeQuery("select LAST_INSERT_ID();");
            while(rs.next())
                slNo=rs.getInt(1);

            for(int i=0; i < jsar.size(); i++){
               jsob = (JSONObject) jsar.get(i);
               id = (String) jsob.get("med_id");
               qty = (String) jsob.get("med_qty");
               pp = (String) jsob.get("med_pp");
               mfgdt = (String) jsob.get("med_mfgdt");
               expdt = (String) jsob.get("med_expdt");
               rows[i][0]= ""+slNo;
               rows[i][1]= id;
               rows[i][2] = qty;
               rows[i][3]= pp;
               rows[i][4] = mfgdt;
               rows[i][5] = expdt;
            }
            db.insert3("stock_ledger_med", fld2, rows);
            db.commit();
            db.setAutoCommit(true);
        }catch(Exception e){
            System.out.println("Error "+e);
        }


	for(int i=0; i<jsar.size(); i++) {
		System.out.print(" "+rows[i][0] );
                System.out.print(" "+rows[i][1] );
                System.out.print(" "+rows[i][2] );
                System.out.print(" "+rows[i][3]);
                System.out.print(" "+rows[i][4]);
                System.out.print(" "+rows[i][5]);
                System.out.print("\n");
        }

        try {

            out.println("\nStock ledger submit servlet");

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
