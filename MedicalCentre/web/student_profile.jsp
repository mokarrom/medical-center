<%-- 
    Document   : student_profile
    Created on : Apr 22, 2011, 8:46:53 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%
    try
    {
        if(!session.getAttribute( "user_type" ).equals("student"))
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
<%@include file="include/std_menu.jsp" %>
<%@include file="include/alwaysinclude.jsp" %>

<div id="page_title">
    Student Prescription
</div>
<div id="page_body">
    <br>
    Prescription Date :
    <br><br>
        <table class="stock_table" >
            <tr>
                <td>
                    sdf sdfklsdfjklasdhfjkl hasdfhasdfhafhjsdf
                    sdf hsdafjsadkl;f jsadfjsdaklfdjs
                </td>
            </tr>
        </table>
</div>
<%@include file="include/footer.jsp" %>
