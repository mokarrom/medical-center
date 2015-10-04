<%-- 
    Document   : transfer_successful
    Created on : Apr 22, 2011, 10:42:59 AM
    Author     : Administrator
--%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

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
                        Transfer Successful
</div>
<div id="page_body">
           <br>
<form method="post" action="http://localhost:8084/MedicalCentre/StocTransfer" onsubmit="return checkValidity();" >
    <table height="300" border="0" width="100%">
        <tr align="center">
            <td align="center">
                <p>
                    Your transfer has been successfully completed.........
                </p>
            </td>
        </tr>
    </table>

</form>
<br><br>
</div>

<%@include file="include/footer.jsp" %>