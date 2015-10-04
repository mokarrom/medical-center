<%-- 
    Document   : user_profile
    Created on : Apr 22, 2011, 11:28:02 AM
    Author     : Administrator
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean id="medicalcenter" class="medicalcenter.StockLedgerEntry" scope="session"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%  int temp=Integer.parseInt(session.getAttribute( "desig_id" ).toString());
    try
    {   
        if( temp!= 11 && temp!= 9 && temp!= 10 )
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

<%@include file="include/header.jsp" %>

<% if(temp == 11) { %>
<%@include file="include/pharmacist_menu.jsp" %>
<% } else if(temp== 9) { %>
<%@include file="include/distributor_menu.jsp" %>
<% } else if( temp == 10) { %>
<%@include file="include/doctor_menu.jsp" %>
<% } else { %>
<jsp:forward page="InvalidPage.jsp"></jsp:forward>
<% } %>

<%@include file="include/alwaysinclude.jsp" %>

<div id="page_title">
                       Profile
</div>
<div id="page_body">
    <br>
  
<table class="bodytable" width="100%" height="200">
 <%
    ResultSet rs;
    String userPk=session.getAttribute("user_pk").toString();
    rs=medicalcenter.getUserProfile(userPk);
    if(rs.next()){
%>
    <tr>
        <td class="td_left">
             Employee Name
        </td>
        <td class="td_center"> : </td>
        <td class="td_right">
            <%=rs.getString("full_name") %>
        </td>
    </tr>
    <tr>
        <td class="td_left">
             Employee Code
        </td>
        <td class="td_center"> : </td>
        <td class="td_right">
             <%=rs.getString("employee_code") %>
        </td>
    </tr>
    <tr>
        <td class="td_left">
             Designation
        </td>
        <td class="td_center"> : </td>
        <td class="td_right">
             <%=rs.getString("designation_name") %>
        </td>
    </tr>
    <tr>
        <td class="td_left">
             Department
        </td>
        <td class="td_center"> : </td>
        <td class="td_right">
             <%=rs.getString("dept_name") %>
        </td>
    </tr>
    <tr>
        <td class="td_left">
             Sex
        </td>
        <td class="td_center"> : </td>
        <td class="td_right">
             <%=rs.getString("sex") %>
        </td>
    </tr>
    <% } else{ %>
    <tr>
        <td>
            Sorry! User Profile is not available
        </td>
    </tr>
    <% } %>
</table>
<br><br>
</div>

<style type="text/css">
    div,table,tr,td
{
	vertical-align:middle;
}

.td_left
{
	width:40%;
	text-align:right;
	padding:2px 0px 2px 5px;
	font-family: Tahoma;
	font-size:14px;
}
.td_center
{
	width:35px;
	text-align:center;
	padding:2px 0px 2px 0px;
	font-family: Tahoma;
	font-size:12px;
}
.td_right
{
	text-align:left;
	padding:2px 5px 2px 5px;
	font-family: Tahoma;
	font-size:12px;
}
</style>
<%@include file="include/footer.jsp" %>
