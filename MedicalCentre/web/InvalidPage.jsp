<%-- 
    Document   : InvalidPage
    Created on : Apr 16, 2011, 10:55:33 AM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%@include file="include/header.jsp" %>
<%@include file="include/alwaysinclude.jsp" %>
<table align="center" border="0" width =100% height="500">
            <tr>
                <td align="center">
                    <h1> You are not authorized here </h1>
                </td>
            </tr>
            <tr>
                <td align="center"> <h1>Please Log in here.....</h1><br>
                    <form action="login.jsp" method="post">
                        <input type="submit" name="login" id="login" value="Log In" />
                    </form>
                </td>
            </tr>
            
 </table>
<%@include file="include/footer.jsp" %>
