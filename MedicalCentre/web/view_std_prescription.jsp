<%--
    Document   : view_std_prescription
    Created on : Apr 16, 2011, 1:40:12 AM
    Author     : Administrator
--%>

<%@page import="java.sql.Date"%>
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

<%
    String diagnos=null,reDate=null,gAdv=null,doctName=null;
    Date presDate=null;
    String press_pk=request.getParameter("pres_pk");
    rs=medicalcenter.getDiagnosisDetails(press_pk);
    while(rs.next()){
            diagnos=rs.getString("diagnosis_detail");
            reDate=rs.getString("reconsult_dt");
            presDate=rs.getDate("prescription_dt");
            gAdv=rs.getString("general_advice");
            doctName=rs.getString("full_name");
        }
%>
<div id="page_sub_title">
    Student Prescription
</div>

<div id="page_body">
       <br><br>
    <div align="center"> 
        <b>Prescription Date : <%=presDate %>  </b>
    </div>
    <br>
        <table class="stock_table" >
                                    <thead>
                                        <th width="35%"> Chief Complaint </th>
                                        <th width="35%"> On Examination </th>
                                        <th width="30%"> Investigation </th>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td width="35%">
                                                <br>
                                                <ul id="cc">
                                                </ul>
                                                <br>
                                            </td>
                                            <td width="35%">
                                                <br>
                                                <ul id="oe">
                                                </ul>
                                                <br>
                                            </td>
                                            <td width="30%">
                                                <br>
                                                <ul id="inv">
                                                </ul>
                                                <br>
                                            </td>
                                        </tr>
                                    </tbody>
        </table>
    <br><br>
    <div id="page_sub_title">
                       Medicine Details
                </div>
    <br>
    <table class="stock_table">
        <thead>
        <th width="30">Serial No.</th>
            <th> Med Type </th>
            <th> Commercial Name </th>
            <th> Doses No </th>
            <th> Duration </th>
            <th> Quantity </th>
            <th> Medication Instruction </th>
        </thead>
        <%
rs=medicalcenter.getPatientMedicine(press_pk);
int i=0;
    while(rs.next()){
        i++;
%>
        <tr>
            <td>
                <%=i %>
            </td>
            <td>
                <%= rs.getString("med_type") %>
            </td>
            <td>
<b><%= rs.getString("med_com_name") %> </b>(<%= rs.getString("med_weight") %> mg)
            </td>
            <td>
                <%= rs.getString("no_of_doses") %>
            </td>
            <td>
            <%= rs.getInt("day_duration") %>
            </td>
            <td>
            <%= rs.getInt("med_qty") %>
            </td>
            <td>
                <%= rs.getString("medication_inst_text") %>
            </td>
        </tr>
        <% } %>
    </table>
    <br>
    <table class="stock_table">
        <thead>
        <th> Patient General Advice  </th>
        <th> Reconsultation Date  </th>
        </thead>
        <tr>
            <td><br>
                <ul id="gadd">

                </ul>
                <br>
            </td>
            <td>
                <%=reDate %>
            </td>
        </tr>
    </table>
            <br>
            <div id="doct_sign">
                <b> <%=doctName %></b> <br>
                Senior Medical Officer,
                Medical Center<br>
                Shahjalal University of Science & Technology<br>
                Sylhet-3114.
            </div>

<br><br><br><br><br><br>
</div>
<style type="text/css">
 #doct_sign{
  width: 350px;
  padding: 10px;
  margin-right: 50px;
  float: right;

  border: 1px;
}
    ul{
list-style:decimal;
}

li{
border: 0px solid #CCCCCC;
padding:3px;
margin-bottom:0px;
margin-left: 30px;
}
</style>
<script type="text/javascript">

    $(document).ready(function(){
        var jsonData = null;

        //alert('fgdfg');
        var diagnosis_det='<%=diagnos %>';
        var g_adv='<%=gAdv %>';

        jsonData = JSON.parse(diagnosis_det);
        var cc=jsonData['chief_complaints'];
        var oe=jsonData['on_examination'];
        var inv=jsonData['investigation'];
        
          $.each(cc, function(key, val) {
              var ccHTML='<li>'+key+' for '+val+'</li>';
              $('#cc').append(ccHTML);
              //alert(key+'='+val);
            });
          $.each(oe, function(key, val) {
              var oeHTML='<li>'+key+'  '+val+'</li>';
              $('#oe').append(oeHTML);
              //alert(key+'='+val);
            });
          $.each(inv, function(key, val) {
              var invHTML='<li> '+val+' </li>';
              $('#inv').append(invHTML);
              //alert(key+'='+val);
            });
            var flag=true;
            var gadv=JSON.parse(g_adv);
            $.each(gadv, function(key, val) {             
                    flag=false;
                    $.ajax({
                           type: "POST",
                           url: "http://localhost:8084/MedicalCentre/GetGeneralAdvice",
                           data: { gadv_id: val },
                           dataType: "json",
                           success: function(data){                                
                                var gaddHTML='<li> '+data+' </li>';
                                $('#gadd').append(gaddHTML);
                           }
                         });
            });
            if(flag){
                var gaddHTML=' &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; N/A ';
                $('#gadd').append(gaddHTML);
            }
        
    });

</script>

<%@include file="include/footer.jsp" %>
