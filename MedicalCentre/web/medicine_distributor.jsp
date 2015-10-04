<%-- 
    Document   : medicine_distributor.jsp
    Created on : Feb 28, 2011, 12:09:57 AM
    Author     : Administrator
--%>
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

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%@include file="include/header.jsp" %>
<%@include file="include/distributor_menu.jsp" %>
<%@include file="include/alwaysinclude.jsp" %>

<div id="page_title">
                        Medicine Distributor
    </div>

<div id="page_body">
<br><br>
                    <form method="post" >
                        <table class="stock_table" id="stock_table" width="100%"  >
                        <thead>
                                <th> Sr. No. </th>
                                <th>
                                    Medicine Type
                                </th>
                                <th>
                                    Generic Name
                                </th>
                                <th>
                                    Commercial Name
                                </th>
                                <th>
                                    Quantity
                                </th>
                                <th>Location</th>
                        </thead>
                        <tbody>
                            <%
                            int medId[]=new int[20];
                            int i=0,presNo;
                            ResultSet rs=null;boolean flag=true;
                            rs=(ResultSet)request.getAttribute("data");
                            presNo=(Integer)request.getAttribute("prescription_id");
                            while(rs.next()){
                                i++;
                                %>
                            <tr>
                                <td> <%= i %> </td>
                                <td> <%= rs.getString("med_type")%> </td>
                                <td> <%= rs.getString("med_gen_name")%> </td>
                                <td> <%= rs.getString("med_com_name")+" (" + rs.getString("med_weight")+"mg)"%> </td>
                                <td> <%= rs.getString("med_qty")%> </td>
                                <td><a href="#"> see loc </a> </td>
                            </tr>
                                <%
                                    flag=false;
                                }

                             if(flag) {
                            %>
                            <jsp:forward page="med_dist_error.jsp"/>
                            <% } %>
                            <tr>
                                <td colspan="3" align="center">
              <input type="button" name="med_dist_cancel" id="med_dist_cancel" value="Cancel" />
                                </td>
                                <td colspan="3" align="center">
              <input type="button" name="med_dist_submit" id="med_dist_submit" value="Delivered" />
                                </td>
                            </tr>

                        </tbody>
                    </table>
                            
                </form>
                <br> <br> <br>
</div>
<%@include file="include/footer.jsp" %>



 <script type="text/javascript">
 $(document).ready(function(){


        $('#med_dist_submit').click(function(){
           // var t= ;
            //alert("sdf"+t[0]);
            $.post("http://localhost:8084/MedicalCentre/MedicineDelivered",
                        {pres_id: <%= presNo %> },
                        function(){
                            window.location= "med_dist_first.jsp";
                }
            );

        });
        $('#med_dist_cancel').click(function(){
            window.location= "med_dist_first.jsp";
        });
 })
 </script>