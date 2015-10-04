<%-- 
    Document   : doctor_first_if
    Created on : Apr 16, 2011, 4:08:52 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%
    try
    {
        if(Integer.parseInt(session.getAttribute( "desig_id" ).toString()) != 10 )
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
<%@include file="include/doctor_menu.jsp" %>
<%@include file="include/alwaysinclude.jsp" %>

<table class="bodytable" id="bodytable" align="center" border="0" width =100% height="500" >
            <tr>
                <td align="center">
                    <form method="post" name="doctor_first_if" onsubmit="return checkReg()" action="http://localhost:8084/MedicalCentre/GetStdInfo" >
                        <h3><b>Registration Number or Employee ID :
                                <input type="text" align="middle" name="reg_id" id="reg_id" size="20">
                                <%--      <button name="rgidcommand" id="rgidcommand"  > GO </button>  --%>
                                <input type="submit" name="rgidcommand" id="rgidcommand" value="GO" />
                        </b></h3><br>                   
                        <span class="error" id="reg_error" name="reg_error"> </span>
                     </form>
                </td>
            </tr>
 </table>


<%@include file="include/footer.jsp" %>

<style type="text/css">
.error{
    color:#FF0000;
    font-size: 20px;
}
</style>

