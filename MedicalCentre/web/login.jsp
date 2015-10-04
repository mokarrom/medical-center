<%-- 
    Document   : login
    Created on : Apr 15, 2011, 11:02:17 PM
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
                    <form method="post" action="http://localhost:8084/MedicalCentre/LoginVerify" onsubmit="return isEmpty();">

                            <fieldset style="width: 300px">
                                <table border="0" cellpadding="10" cellspacing="10" id="logintable">
                                    <thead>
                                    <th></th>
                                    <th></th>
                                    <th align="left"> LogIn Area </th>
                                    </thead>

                                    <tr></tr>
                                    <tr>
                                        <td> Username </td>
                                        <td> : </td>
                                        <td><input type="text" align="middle" name="username" id="username" size="20" value="" /></td>
                                    </tr>
                                    <tr>
                                        <td> Password </td>
                                        <td> : </td>
                                        <td><input type="password" align="middle" name="password" id="password" size="20" value="" /></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <input type="submit" name="command" id="command" value="Log In"></td>
                                    </tr>
                        </table>
                        </fieldset>
                    </form>
                </td>
            </tr>
 </table>
<%@include file="include/footer.jsp" %>

<script type="text/javascript">
    function isEmpty(){

        var user = $('#username').val();
        var pass = $('#password').val();

        if(user == "" || pass == "")
            return false;
        else
            return true;      
    }

</script>