<%-- 
    Document   : central_stock
    Created on : Apr 21, 2011, 5:54:41 PM
    Author     : Administrator
--%>
<%
    try
    {
        if(Integer.parseInt(session.getAttribute( "desig_id" ).toString()) != 11 )
        {
%>
    <jsp:forward page="InvalidPage.jsp"></jsp:forward>
        <%}%>
<%}
    catch(Exception e)
    {
%>
    <jsp:forward page="InvalidPage.jsp"></jsp:forward>
<%}%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean id="medicalcenter" class="medicalcenter.StockLedgerEntry" scope="session"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%@include file="include/header.jsp" %>
<%@include file="include/pharmacist_menu.jsp" %>
<%@include file="include/alwaysinclude.jsp" %>

<div id="page_title">
                        Central Stock 
    </div>
<div id="page_body">
           <br>
    <table class="stock_table" id="stock_table" >
       <thead>
            <th> Med Type </th>
            <th> Generic Name </th>
            <th> Commercial Name </th>
            <th> Quantity </th>
            <th> PP Price </th>
            <th>Purchase Date</th>
            <th>Mfg. Date</th>
            <th>Exp. Date</th>
        </thead>
        <%
            ResultSet rs=null;
            rs=medicalcenter.getCentralStocInfo("central_stock_info");
            while(rs.next()){
        %>
        <tr >
            <td>
                <%= rs.getString("med_type") %>
            </td>
            <td class="comname">
                <%= rs.getString("med_gen_name") %>
            </td>
            <td>
                <b><%= rs.getString("med_com_name") %> </b>(<%= rs.getString("med_weight") %> mg)
            </td>
            <td>
                <%= rs.getInt("med_qty") %>
            </td>
            <td>
                <%= rs.getDouble("pp_price") %>
            </td>
            <td>
                <%= rs.getDate("purchase_dt") %>
            </td>
            <td>
                <%= rs.getDate("manufacturing_dt") %>
            </td>
            <td>
                <%= rs.getDate("expiring_dt") %>
            </td>
        </tr>
        <% } %>
    </table>
    
<br><br>
</div>

<%@include file="include/footer.jsp" %>