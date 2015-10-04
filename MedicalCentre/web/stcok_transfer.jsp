<%--
    Document   : stcok_transfer.jsp
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
                       Central Stock to Substock Transfer
</div>
<div id="page_body">
           <br>
<form method="post" action="http://localhost:8084/MedicalCentre/StocTransfer" onsubmit="return checkValidity();" >
    <table class="stock_table" id="stock_table" >
       <thead>
            <th> Med Type </th>
            <th> Generic Name </th>
            <th> Commercial Name </th>
            <th> Quantity(centralstock) </th>
            <th> Transferred qty(substock)</th>
        </thead>
        <%
            ResultSet rs=null;
            rs=medicalcenter.getCentralStocInfo("stock_transfer");
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
<input type="text" name="transferred_qty" class="transferred_qty" id="transferred_qty"  size="5" />
<input type="hidden" name="central_qty" class="central_qty"id="central_qty" value="<%= rs.getInt("med_qty") %>" size="5" />
<input type="hidden" name="med_id" class="med_id" id="med_id" value="<%= rs.getInt("medicine_id_fk") %>" size="5" />
            </td>

        </tr>
        <% } %>
        <tr border="0">
            <td colspan="3" align="center">
                <button name="trans_cancel" id="trans_cancel" >Cancel Transfer</button>
            </td>
            <td colspan="2" align="center">
                <input type="submit" name="trans_submit" id="trans_submit" value="Transfer Stock"/>
            </td>
        </tr>
    </table>
</form>
<br><br>
</div>

<%@include file="include/footer.jsp" %>

<script type="text/javascript">
    function checkValidity(){


        var c_qty =[];
        var t_qty=[];var i;
        var numericExpression = /^[0-9]+$/;

        $('.central_qty').each(function(){
            c_qty.push($(this).val());
            //alert($(this).val());
    });
     $('.transferred_qty').each(function(){
            t_qty.push($(this).val());
            //alert($(this).val());
    });
    for(i=0;i<c_qty.length;i++){
        if( !(t_qty[i].match(numericExpression)) && t_qty[i] != '')
            {
                alert("Transferred Quantity is invalid");
                return false;
            }
            tqty=parseInt(t_qty[i]);
            cqty=parseInt(c_qty[i]);
        if(tqty > cqty)
            {
                alert("Transferred quantity = "+t_qty[i]+" is not possible "+c_qty[i]);
                return false;
            }
    }
    //alert(c_qty);alert(t_qty);
    return true;
    }

</script>