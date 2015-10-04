/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Administrator
 */
package medicalcenter;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class database {
    private Connection con=null;
    private Statement st;
    private ResultSet rs;
    private String dbName = "central_db";
    private String userName = "root";
    private String password = "admin";
    private String host = "localhost";
    private String url = "jdbc:mysql://"+host+"/"+dbName;

    public database()throws SQLException{
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection(url, userName, password);
        }
        catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public ResultSet executeQuery(String query) throws SQLException{
       // System.out.println("Query is= "+query);
        st= con.createStatement();
        rs= st.executeQuery(query);
        return rs;
    }
    public void  executeProcedure(String procName,int paramValue) throws SQLException{
        String query=" { CALL "+procName+"( ? ) } ";
        System.out.println("Query is= "+query);
        CallableStatement cs=con.prepareCall(query);
        cs.setInt(1, paramValue);
        cs.execute();
    }
    public void  executeProcedure(String procName,int paramValue1,int paramValue2) throws SQLException{
        String query=" { CALL "+procName+"( ? , ? ) } ";
        System.out.println("Query is= "+query);
        CallableStatement cs=con.prepareCall(query);
        cs.setInt(1, paramValue1);
        cs.setInt(2, paramValue2);
        cs.execute();
    }

    public ResultSet select(String tbl) throws SQLException
    {
        return select(tbl, "*", "", "");
    }

    public ResultSet select(String tbl, String fld) throws SQLException
    {
        return select(tbl, fld, "", "");
    }

    public ResultSet select(String tbl, String fld, String cnd) throws SQLException
    {
        return select(tbl, fld, " where "+cnd, "");
    }

    public ResultSet select(String tbl, String fld, String cnd, String ord) throws SQLException
    {
        if(!ord.equals(""))
            ord = " order by "+ord;
        String query =  "select "+fld+" from "+tbl+cnd+ord;
        rs = null;
        st = con.createStatement();
        rs = st.executeQuery(query);
        //System.out.println("query is "+query);
        return rs;
    }

    public void closeStatement() throws SQLException
    {
        st.close();
    }


    public void  insert(String tbl, String fld, String values) throws SQLException
    {   int n=-1;
        if(!fld.equals(""))
            fld = "( "+fld+" ) ";

        String query = "insert into "+tbl+fld+" values ("+values+")";
        //System.out.println("h= "+query);
        st = con.createStatement();
        st.execute(query);
       // st.execute("");
        //n = LAST_INSERT_ID();
        return ;
    }
    //My code
    public void insert(String tbl, String[] fld, String[] values) throws SQLException
    {
        //System.out.println("dshf ksdfk");
       String temp1="",temp2="";
       temp1+=fld[0];
       temp2+=values[0];
       for(int i=1; i < fld.length; i++)
       {
           temp1 = temp1+", "+fld[i];
           temp2= temp2+", "+values[i];
       }
       String query = "insert into "+tbl+"("+temp1+")"+"values("+temp2+")";
       System.out.println(query);
       st = con.createStatement();
       st.execute(query);
       return ;
    }

    public void storeCache(String code, byte[] data) throws SQLException
    {
        String query = "insert into cache(code, data) values(?, ?)";;
        PreparedStatement pst = con.prepareStatement(query);
        pst.setString(1, code);
        pst.setBytes(2, data);
        pst.executeUpdate();
        con.commit();
        pst.close();
    }

    public byte[] getCache(String code) throws SQLException
    {
        String query = "select data from cache where code = '"+code+"'";
        rs = null;
        st = con.createStatement();
        rs = st.executeQuery(query);
        byte[] output = null;
        if(rs.next())
            output = rs.getBytes("data");
        return output;
    }

    public void insert(String tbl, String[] fld, String[][] rows) throws SQLException
    {
       String temp1="",temp2="";int i;
       for(i=0; i < fld.length-1 ; i++)
       {
           temp1 += fld[i]+", ";
           temp2 += "?, ";
       }
           temp1 += fld[i];
           temp2 += "?";
       String query = "insert into "+tbl+"("+temp1+")"+" values("+temp2+")";System.out.println("= "+query);
       PreparedStatement pst = con.prepareStatement(query);

       for(i=0; i<rows.length; i++)
       {
           for(int j=0; j<rows[i].length; j++)
               pst.setInt(j + 1, Integer.parseInt(rows[i][j]));
           pst.addBatch();
       }
       pst.executeBatch();
       //con.commit();
       pst.close();
    }
    public void insert2(String tbl, String[] fld, String[][] rows) throws SQLException
    {

       String temp1="",temp2="";int i;
       for(i=0; i < fld.length-1 ; i++)
       {
           temp1 += fld[i]+", ";
           temp2 += "?, ";
       }
           temp1 += fld[i];
           temp2 += "?";
       String query = "insert into "+tbl+"("+temp1+")"+" values("+temp2+")";//System.out.println("= "+query);
       PreparedStatement pst = con.prepareStatement(query);

       for(i=0; i<rows.length; i++)
       {
           for(int j=0; j<rows[i].length; j++)
           {
              if(j==1)
                  pst.setString(j + 1, rows[i][j]);
              else if(j==6)
                  pst.setString(j + 1, rows[i][j]);
              else if(j==2){
                  if(rows[i][j].equals("0"))
                      pst.setNull(j + 1, java.sql.Types.INTEGER);
                  else
                      pst.setInt(j + 1, Integer.parseInt(rows[i][j]));
              }            
              else
                  pst.setInt(j + 1, Integer.parseInt(rows[i][j]));
           }
           pst.addBatch();
       }
       pst.executeBatch();
       //con.commit();
       pst.close();
    }
    public void insert3(String tbl, String[] fld, String[][] rows) throws SQLException
    {
       String temp1="",temp2="";int i;
       for(i=0; i < fld.length-1 ; i++)
       {
           temp1 += fld[i]+", ";
           temp2 += "?, ";
       }
           temp1 += fld[i];
           temp2 += "?";
       String query = "insert into "+tbl+"("+temp1+")"+" values("+temp2+")";System.out.println("= "+query);
       PreparedStatement pst = con.prepareStatement(query);
       Date date = new Date(0000-00-00);
       for(i=0; i<rows.length; i++)
       {
           for(int j=0; j<rows[i].length; j++){
               if(j==3)
                   pst.setDouble(j+1, Double.parseDouble(rows[i][j]));
               else if(j==4 || j==5)
                   pst.setDate(j+1,date.valueOf(rows[i][j]));
               else
                  pst.setInt(j + 1, Integer.parseInt(rows[i][j]));
           }
           pst.addBatch();
       }
       pst.executeBatch();
       //con.commit();
       pst.close();
    }


    public void delete(String tbl, String cnd) throws SQLException
    {
        if(!cnd.equals(""))
            cnd = " where "+cnd;
        String query = "Delete from "+tbl+cnd;
        st = con.createStatement();
        st.execute(query);
    }

    public void update(String tbl, String values, String cnd) throws SQLException
    {
        if(!cnd.equals(""))
            cnd = " where "+cnd;
        String query = "update "+tbl+" set "+values+cnd;
        System.out.println(query);
        st = con.createStatement();
        st.execute(query);
    }

	public void truncate(String tbl) throws SQLException{
        String query= "truncate table "+tbl;
        st= con.createStatement();
        st.executeQuery(query);
    }

    public void commit() throws SQLException
    {
        con.commit();
    }

    public void setAutoCommit(boolean val) throws SQLException
    {
        con.setAutoCommit(val);
    }

    public Connection getCon()
    {
        return con;
    }

    public void close() throws SQLException
    {
        con.close();
    }
    /*
    public static void main(String args[]){
    String str1[]={"comp_id_fk", "purchase_dt","commison"};
    String str2[]={"5552","'2011-01-28'","4"};
    try{
      database db=new database();
    db.insert("stock_ledger_comp", str1, str2);
    }catch(SQLException e){

    }
}
     *
     */
}
