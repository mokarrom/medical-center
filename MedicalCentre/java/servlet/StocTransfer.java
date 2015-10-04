/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import medicalcenter.database;

/**
 *
 * @author Administrator
 */
public class StocTransfer extends HttpServlet {
   
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
        int mId=0,tQty=0;
        String val,cnd=null;

        String [] medId = request.getParameterValues("med_id");
        System.out.println("YES          fg");
        String [] centralQty = request.getParameterValues("central_qty");
        String [] transferQty = request.getParameterValues("transferred_qty");
	
        try {
            database db=new database();

                for(int i=0; medId != null && i < medId.length; i++) {//transferQty[i].equals("") || transferQty[i]== null
                    if(transferQty[i].equals("") || transferQty[i]== null)
                        continue;                    
                    mId=Integer.parseInt(medId[i]);
                    tQty=Integer.parseInt(transferQty[i]);
                    System.out.println("= " +tQty+" "+mId);
                    db.executeProcedure("transfer_stock",mId,tQty);
                   
            //System.out.print(" "+medId[i] );
             //   System.out.print(" "+centralQty[i] );
             //   System.out.print(" "+transferQty[i] );
              //  System.out.println("\n");         
                }

       getServletConfig().getServletContext().getRequestDispatcher("/transfer_successful.jsp").forward(request, response);
        }catch(Exception e){
            System.out.println("Error :"+e);
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
