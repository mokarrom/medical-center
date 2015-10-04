<%-- 
    Document   : med_dist_first
    Created on : Apr 7, 2011, 9:00:13 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%
    try
    {
        if(Integer.parseInt(session.getAttribute( "desig_id" ).toString()) != 9 )
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
<%@include file="include/distributor_menu.jsp" %>
<%@include file="include/alwaysinclude.jsp" %>

    <div id="page_title">
                        Medicine Distributor
    </div>
        <table align="center" border=0 width =100% height="500">
            <tr>
                <td align="center">
                    <form method="get" action="http://localhost:8084/MedicalCentre/GetUndeliveredMed" onsubmit="return checkReg()" >
                        <h3><b>Registration Number or Employee ID :
                        <input type="text" align="middle" name="reg_id" id="reg_id" size="20">
                         <input type="submit" name="rgidcommand" id="rgidcommand" value="GO" />
                        
                        </b></h3><br>
                        <span class="error" id="reg_error" name="reg_error"> </span>
                    </form>
                </td>
            </tr>
           </table>

<style type="text/css">
.error{
    color:#FF0000;
    font-size: 20px;
}
</style>

<%@include file="include/footer.jsp" %>