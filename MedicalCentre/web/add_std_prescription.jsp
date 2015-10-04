<%-- 
    Document   : add_std_prescription
    Created on : Apr 16, 2011, 4:03:50 PM
    Author     : Administrator
--%>
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

<%@page import="java.sql.*"%>
<%@page import="medicalcenter.database"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%@include file="include/header.jsp" %>
<%@include file="include/doctor_menu.jsp" %>
<%@include file="include/alwaysinclude.jsp" %>

<%
    ResultSet rs=null;
    String query=null;
    database db;
%>
<div id="page_title">
                       Patient Information
    </div>
<div id="page_body">
<form name="prescription_frm" >
        <table border="0"  width="100%" >
            <tbody>
                <tr>
                    <td colspan="2">
                        <fieldset>
                        <table border="0" width="100%">
                            <tbody>
                                <tr>
                                    <td width="40%" >
                                        <label for ="reg_no"> &nbsp;&nbsp; Registration No. : </label>
                                        <%=request.getParameter("reg_id") %>
                                        <br><br>
                                        <label for="name"> &nbsp;&nbsp; Patient Name : </label>
                                        <%=request.getAttribute("name")%>
                                        <br><br>
                                        <label for="dept"> &nbsp;&nbsp; Department : </label>
                                        <%=request.getAttribute("dept")%>
                                        
                                    </td>
                                    
                                    <td width="20%" align="center">
                                        <img src="http://localhost:8084/MedicalCentre/RetrieveImage?regNo=<%= request.getParameter("reg_id") %>" width="150" height="150" alt="Image not found"/>
                                    </td>
                                    <td width="40%" align="center">
                                        <label for ="reg_no"> &nbsp;&nbsp; Date : </label>
                                        <%= medicalcenter.ClientDate.getDate()%>
                                        <br><br>
                                        <label for="name"> &nbsp;&nbsp; Age : </label>
                                        <%=request.getAttribute("age") %>
                                        <br><br>
                                        <label for="dept"> &nbsp;&nbsp; Sex : </label>
                                        <%=request.getAttribute("sex") %>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                     </fieldset>

                    </td>                    
                </tr>
                <tr>
                    <td>
                        <table class="stock_table" >
                            <thead>
                                <th> Chief Complaint </th>
                                <th> On Examination </th>
                                <th> Investigation </th>
                            </thead>
                            <tr>
                                <td width="35%" bgcolor="#FFFFCC">
                                    <br>
                                                <label for ="ct">Complain :</label>
                                                <SELECT name="ccName" id="ccName" >
                                                    <OPTION value="" selected>Select one</OPTION>
                                                    <%
                                                    try{
                                                        db=new database();
                                                        rs=db.select("diagnosis_info", "observation_name", "observation_type='cheif_complaint'");

                                                    }catch(SQLException e){
                                                            //out.println(e);
                                                            }
                                                        while(rs.next()){
                                                    %>
                                                    <OPTION value="<%= rs.getString("observation_name") %>"> <%= rs.getString("observation_name") %> </OPTION>
                                                    <%
                                                        }
                                                    %>
                                                </SELECT>

                                                <br><br>
                                                <label for ="ct">Duration :</label>&nbsp;
                                                <SELECT name="ccDuration" id="ccDuration" >
                                                    <OPTION value="" selected>Select..</OPTION>
                                                    <%
                                                    int n1=1;
                                                    while(n1<30){
                                                        %>
                                                        <OPTION value="<%=n1 %>"><%=n1 %> </OPTION>
                                                    <% n1++;
                                                        } %>
                                                </SELECT>
                                                <select name="ccDurationUnit" id="ccDurationUnit">
                                                    <option value="Days" selected>Days  </option>
                                                    <option value="Months">Months</option>
                                                </select>

                                                <input type="button" value="Add" name="ccAdd" id="ccAdd" /><br>
                                                 <div id="cc_container" class="" style="display:none">
                                                    Complaints :
                                                    <ul id="cc">
                                                    </ul>
                                                 </div>
                                                <br>
                                                     <%@include file="addnewcc.jsp" %>
                                </td>
                                <td width="35%" bgcolor="#FFFFCC">
                                    <br>
                                    <label for ="exam">Examination Name :</label>
                                                <SELECT name="oeName" id="oeName" >
                                                    <OPTION value="" selected>Select one</OPTION>
                                                    <%
                                                    try{
                                                        db=new database();
                                                        rs=db.select("diagnosis_info", "observation_name", "observation_type='on_examination'");

                                                    }catch(SQLException e){
                                                            //out.println(e);
                                                            }
                                                        while(rs.next()){
                                                    %>
                                                    <OPTION value="<%= rs.getString("observation_name") %>"> <%= rs.getString("observation_name") %> </OPTION>
                                                    <%
                                                        }
                                                    %>
                                                </SELECT>
                                                <br><br>
                                                <label for ="examVal">Examined Value :</label>
                                                <select name="oeValue" id="oeValue" >
                                                    <option value="" selected>Select...  </option>
                                                </select>
                                                &nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="Add" name="oeAdd" id="oeAdd" />
                                                <div id="oe_container" class="" style="display: none">
                                                    Examination Details :
                                                    <ul id="oe">
                                                    </ul>
                                                 </div>
                                </td>
                                <td width="30%" bgcolor="#FFFFCC">
                                    <br>
                                    <div  id="inv" align="left">
                                                <%
                                                    try{
                                                        db=new database();
                                                        rs=db.select("diagnosis_info", "observation_name", "observation_type='investigation'");
                                                    }catch(SQLException e){
                                                            //out.println(e);
                                                            }
                                                        while(rs.next()){
                                                    %>
                                                    <input type="checkbox" name="inv" value="<%= rs.getString("observation_name") %>" />  <%= rs.getString("observation_name") %><BR>
                                                    <%
                                                        }
                                                    %>
                                            </div>
                                                   <br> <%@include file="addnewinv.jsp" %>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                
                <tr><td>
                <div id="page_title">
                       Medicine Details
                </div>
                    </td>
                </tr>

                <tr>
                    <td>
                        
                            <table border="1" width="100%" id="dataTable" cellspacing="0" cellpadding="3" >
                                <tr>
                                    <td width="50%">
                                        <table class="entry_table" width="100%">
                                            <tr>
                                                <td class="td_left"> Medicine Type </td>
                                                <td class="td_center"> : </td>
                                                <td class="td_right">
                                                     <SELECT name=medicine_type id="medicine_type">
                                                        <OPTION value="" selected> Select One </OPTION>
                                                        <%
                                                        query="select distinct(med_type) from medicine_gen_info order by  med_type";
                                                        try{
                                                        db=new database();
                                                        rs=db.executeQuery(query);
                                                        }catch(Exception e){

                                                            }
                                                        while(rs.next()){
                                                            %>
                                                            <OPTION value="<%= rs.getString("med_type") %>" ><%= rs.getString("med_type") %></OPTION>
                                                            <% } %>

                                                    </SELECT>
                                                </td>
                                            </tr>
                                               <%
    query="SELECT med_com_name_pk,med_com_name,med_weight  FROM medicine_com_info";
            try{
            db=new database();
            rs=db.executeQuery(query);
            }catch(Exception e){

                }
%>
                                            <tr>
                                                <td class="td_left"> Commercial Name </td>
                                                <td class="td_center"> : </td>
                                                <td class="td_right">
                                                    <SELECT name=medicine_com_name id="medicine_com_name">
                                                <OPTION value="" selected> Select Type First </OPTION>

                                                    </SELECT>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="td_left"> Time Interval </td>
                                                <td class="td_center"> : </td>
                                                <td class="td_right">
                                                    <SELECT name=dose_no id="dose_no">
                                                        <OPTION value="" selected> Instruction </OPTION>
                                                        <OPTION value="1+0+0"> 1+0+0 </OPTION>
                                                        <OPTION value="0+1+0"> 0+1+0 </OPTION>
                                                        <OPTION value="0+0+1"> 0+0+1 </OPTION>
                                                        <OPTION value="1+1+0"> 1+1+0 </OPTION>
                                                        <OPTION value="0+1+1"> 0+1+1 </OPTION>
                                                        <OPTION value="1+0+1"> 1+0+1 </OPTION>
                                                        <OPTION value="1+1+1"> 1+1+1 </OPTION>
                                                        <OPTION value="1+1+1+1"> 1+1+1+1 </OPTION>
                                                        <OPTION value="0+2+0"> 0+2+0 </OPTION>
                                                        <OPTION value="2+0+2"> 2+0+2 </OPTION>
                                                        <OPTION value="2+2+2"> 2+2+2 </OPTION>
                                                        <OPTION value="0+3+0"> 0+3+0 </OPTION>
                                                        <OPTION value="3+0+3"> 3+0+3 </OPTION>
                                                        <OPTION value="3+3+3"> 3+3+3 </OPTION>
                                                    </SELECT>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="td_left"> Day Duration </td>
                                                <td class="td_center"> : </td>
                                                <td class="td_right">
                                                    <select name="day_duration" id="day_duration">
                                                <option value="" selected>Duration</option>
                                                <%
                                                    int day=1;
                                                    while(day<31){
                                                %>
                                                <option value="<%= day %>"><%= day %> </option>
                                                <%
                                                    day++;
                                                    }
                                                %>
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="td_left"> Quantity </td>
                                                <td class="td_center"> : </td>
                                                <td class="td_right">
                                                 <input type="text" name="medicine_qty" id="medicine_qty" value="" size="5" />
                                                </td>
                                            </tr>
                                            <%
    query="SELECT medication_inst_pk, medication_inst_text FROM medication_inst_detail";
            try{
            db=new database();
            rs=db.executeQuery(query);
            }catch(Exception e){

                }
%>
                                            <tr>
                                                <td colspan="3">
                                                 <label for="qty">Medication Instruction (OPTIONAL) : </label><br>
                                            <select name="medication_inst" id="medication_inst">
                                                <option value="" selected>Select One...</option>
                                                <%
                                                while(rs.next()){
                                                    %>
                                                    <OPTION value=<%= rs.getString("medication_inst_pk") %> ><%= rs.getString("medication_inst_text") %></OPTION>
                                                    <% } %>
                                            </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td></td>
                                                <td align="center">
                                               <input type="button" value="Add" name="medicineAdd" id="medicineAdd" />
                                                </td>
                                            </tr>
                                        </table>                                          
                                                                                                                                                                            
                                           <div id="hd">
                                              
                                           </div>
                                    </td>
                                    <td width="50%">
                                        <div id="medicine_container" class="" style="display:none">
                                                    <font size="8" color="red"><strong>R</strong></font>
                                                    <font size="5" color="red"><strong>X</strong></font>
                                                    <ul id="medicine">
                                                    </ul>
                                       </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="50%">
                                        <label for="ga">Patients General Advice (OPTIONAL) : </label><br>
                                        <select name="general_adv" id="general_adv" >
                                            <option value="" selected>Please Select one Advice </option>
                                            <%
                                                    try{
                                                        db=new database();
                                                        rs=db.select("general_advice");
                                                    }catch(SQLException e){
                                                            //out.println(e);
                                                            }
                                                        while(rs.next()){
                                                    %>
                                                    <OPTION value=<%= rs.getInt("general_adv_pk") %> > <%= rs.getString("general_adv_txt") %></OPTION>
                                                    <% } %>
                                        </select>
                                        <input type="button" name="gadd" id="gadd" value="Add" />
                                        <div id="advice_container" class="" style="display:none">
                                                    Advice :
                                                    <ul id="advice">

                                                    </ul>
                                      </div>
                                    </td>

                                    <td align="center" width="50%">
                                        <label for="rdt"> Please  Re-consult After
                                            <select name="reconsult_dr" id="reconsult_dr">
                                                <option value="" selected>....</option>
                                                <% int reday=1; while(reday<29){ %>
                                                <option value=<%=reday %> selected><%=reday %></option>
                                                <%  reday++; }  %>
                                            </select>
                                            <select name="reconsult_unit" id="reconsult_unit">
                                                <option value="Days" selected>Days</option>
                                                <option value="Months" >Months</option>
                                            </select>
                                                </label>
                                    </td>
                                </tr>
                                
                                
                            </table>
                        
                   <table border="0" width="100%" cellpadding="5" cellspacing="5">
                       
                        <tr height="50">
                            <td align="center">
                               <input type="submit" name="cancel_prescription" id="cancel_prescription" value="Cancel Prescription" />
                            </td>
                            <td align="center">
                               <input type="submit" name="save_prescription" id="save_prescription" value="Insert Prescription" />
                            </td>

                        </tr>
                    </table>
                  
                    </td>
                </tr>
            </tbody>
        </table>
    </form>
 <br><br>
</div>
<%@include file="include/footer.jsp" %>

<style type="text/css" >

.error{
color:#FF0000;
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

li .marks{
padding-top:10px;
}


li .remove{
float:right;
color:#0000FF;
text-decoration:underline;
cursor:pointer;
}

#total_marks{
float:right;
}
#question-creator{
    padding-top: 20px;
}
.entry_table tr{
    height: 40px;
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
	width:15px;
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

<script type="text/javascript">
      $(document).ready(function(){
          var diagnosis_details={};

               $('#ccAdd').click(function(){
                // alert("djsflsd fdlsfj l") ;

		var cc_name = $('#ccName').val();   //var cc_name = $('#ccName :selected').text();
		var cc_duration = $('#ccDuration').val();
		var cc_durationtunit = $('#ccDurationUnit').val();
                //var cc_error = $('#descriptive_error');

		if( cc_name=='' )
			alert("Select Comnpaint Type");
		else if(cc_duration=='')
			alert("Select Duration");
		else
		{//alert(cc_name+ ' '+cc_duration+ ' ' +cc_durationtunit);
			var ccHTML = '<li type="cc"><span class="remove" onclick="remove_element(this)">Remove</span><span class="complaint">'+cc_name+'</span> for <span class="duration">'+cc_duration+'</span> <span class="duration_unit">'+cc_durationtunit+'</span></li>';
			$('#cc_container').show();
			$('#cc').append(ccHTML);
			$('#ccName').val('');
			$('#ccDuration').val('');
			//$(error).html('');
		}

	});
        $('#oeAdd').click(function(){
            var oe_name=$('#oeName').val();
            var oe_value=$('#oeValue').val();
            if(oe_name==''){
                alert('Select Examination Name');
                $('#oeName').focus();
            }
            else{
                var oeHTML = '<li type="oe"><span class="remove" onclick="remove_element(this)">Remove</span><span class="oename">'+oe_name+'</span>  <span class="oevalue">'+oe_value+'</span> </li>';
			$('#oe_container').show();
			$('#oe').append(oeHTML);
			$('#oeName').val('');
			$('#oeValue').val('');
            }


        });

    $('#gadd').click(function(){

        var gen_adv_id=$('#general_adv').val();
        var advHTML = '<li type="genadv" gadv_id="'+gen_adv_id+'"><span class="remove" onclick="remove_element(this)">Remove</span>'+$('#general_adv :selected').text()+'</li>';
			$('#advice_container').show();
			$('#advice').append(advHTML);
			$('#general_adv').val('');
	//alert(gen_adv_id);
    });

        $('#oeName').change(function(){
		if($(this).val()=='' )
                    alert('Select examination name');
		else
		{
                        var flag=true;
			var oe_name = $(this).val();
                        var oeValuedd= $('#oeValue');
                        //var temp = ['120/80','130/70','120/90','110/80','130/60','140/80'];
                       // var t=JSON.stringify(temp);
                       // alert(t);
                        $.ajax({
                           type: "POST",
                           url: "http://localhost:8084/MedicalCentre/GetOEValue",
                           data: { oename: oe_name },
                           dataType: "json",
                           success: function(data){
                                $('#oeValue >option').remove();
                                var oe_value=JSON.parse(data);
                                $.each(oe_value, function(i, item) {
                                    flag=false;
                                    oeValuedd.append( new Option(item,item));
                                        });
                                if(flag)
                                oeValuedd.append( new Option("Select Type First","") );
                           }
                         });
                            //oeValuedd.append( new Option(98,98) );
			//alert(name);
		}
	});
        $('#medicine_type').change(function(){
            var med_type=$(this).val();
            var med_info=$('#medicine_com_name');
            var flag=true; //alert(med_type);
            $.ajax({
               type: "POST",
               url: "http://localhost:8084/MedicalCentre/GetMedInfo",
               data: { medType: med_type },
               dataType: "json",
               success: function(data){
                    $('#medicine_com_name >option').remove();
                    $.each(data, function(key, val) {
                        flag=false;
                        med_info.append( new Option(val['name'],val['id']) );
                        //alert('id= ' + val['id'] +'  '+'name= ' + val['name']);
                            });
                    if(flag)
                    med_info.append( new Option("Select Type First","") );
                    //med_info.append($('<option/>').text("Please select dropdown1"));
               }
             });
        });
        $('#medicineAdd').click(function(){
                var med_type = $('#medicine_type').val();   //var cc_name = $('#ccName :selected').text();
		var med_com_id = $('#medicine_com_name').val();
                var med_com_name = $('#medicine_com_name :selected').text();
		var doses_no = $('#dose_no').val();
                var dr=$('#day_duration').val();
                var qty=$('#medicine_qty').val();
                var inst=$('#medication_inst').val();
                var inst_text=$('#medication_inst :selected').text();
                var numericExpression = /^[0-9]+$/;

                if(med_type==''){
                    alert('Select Medicine Type')
                }
                else if(doses_no==''){
                    alert('Select Time Interval')
                }
                else if(dr =='' ){
                    alert('Select Time Duration')
                }
                else if(qty =='' || !(qty.match(numericExpression)) ){
                    alert('Enter a valid quantity')
                }
                else{
                    if(inst=='')
                   var medHTML = '<li type="medicine_add" med_id="'+med_com_id+'" inst="0"><span class="remove" onclick="remove_element(this)">Remove</span>'+med_type+' <b>'+med_com_name+'</b> (<span class="doses_no">'+doses_no+'</span>) for <b><span class="dr">'+dr+'</span></b> Days (<span class="qty">'+qty+'</span>)</li>';
                   else
                   var medHTML = '<li type="medicine_add" med_id="'+med_com_id+'" inst="'+inst+'"><span class="remove" onclick="remove_element(this)">Remove</span>'+med_type+' <b>'+med_com_name+'</b> (<span class="doses_no">'+doses_no+'</span>) for <b><span class="dr">'+dr+'</span></b> Days (<span class="qty">'+qty+'</span>)<br>'+inst_text+'</li>';
			$('#medicine_container').show();
			$('#medicine').append(medHTML);
			$('#medicine_type').val('');
			$('#medicine_com_name').val('');
                }
        });

        $('#save_prescription').click(function(){
            //Chief Complaint
		var domcc = $('ul#cc');
                var domoe = $('ul#oe');
                var dommedicine=$('ul#medicine');

                ccobj={};oeobj={};invest=[];
                var medicine=[];

                $('li', domcc).each(function(i){
                        var ccText = $('span.complaint', this).html();
                        var ccDuration = $('span.duration', this).html();
                        var ccDurationUnit = $('span.duration_unit', this).html();

                        ccobj[ccText]=ccDuration+ccDurationUnit;
                });
                diagnosis_details["chief_complaints"]=ccobj;
                 //On Examination
                $('li', domoe).each(function(i){
                        var oeName = $('span.oename', this).html();
                        var oeValue = $('span.oevalue', this).html();

                        oeobj[oeName]=oeValue;
                });
                diagnosis_details["on_examination"]=oeobj;
                // Investigation
                $('input:checked').each(function(i){
                    var t=$(this).val()
                    invest.push(t);
                    });
                diagnosis_details["investigation"]=invest;
                var diagnosisString= JSON.stringify(diagnosis_details);//alert('dfgf2');
               // alert(diagnosisString);

                // Medicine
                $('li', dommedicine).each(function(i){
                        var id=$(this).attr('med_id');
                        var dose = $('span.doses_no', this).html();
                        var dr = $('span.dr', this).html();
                        var qty=$('span.qty',this).html();
                        var inst=$(this).attr('inst');
                        var medicineobj={
                            med_id: id,
                            med_dose: dose,
                            med_dr: dr,
                            med_qty: qty,
                            med_inst: inst
                        }
                        medicine.push(medicineobj);
       // alert(med_dr+'$'+med_dose+'$'+med_id);alert(med_inst);
                });
                var medicinestr= JSON.stringify(medicine);
               // alert(medicineString);

               /// Reconsult Date Calculation
               var reconsult_dt;
               var re_dt=parseInt($('#reconsult_dr').val());

               if(re_dt==''){
                   reconsult_dt=null;
               }else{//alert('ghfh');
                   var re_unit=$('#reconsult_unit').val();
                   var cur_dt=new Date();
                   var cur_day=cur_dt.getDate();
                   var cur_month=cur_dt.getMonth();
                   var cur_year=cur_dt.getFullYear();
                   if(re_unit=='Days')
                       cur_day=cur_day+re_dt;
                   else
                       cur_month=cur_month+re_dt;
                   if(cur_day>30)
                       {cur_day=cur_day-30; cur_month=cur_month+1;}
                   cur_month=cur_month+1;
                   reconsult_dt=cur_day+'/'+cur_month+'/'+cur_year;
                  // alert(reconsult_dt);
               }
               /// General Advice Calculation
               var domgadv=$('ul#advice');
               var gen_adv=[];
               $('li', domgadv).each(function(i){
                    var gadv_id=$(this).attr('gadv_id');
                    gen_adv.push(gadv_id);
               });
               gen_advstr=JSON.stringify(gen_adv);
    //alert(gen_advstr);
                //http://localhost:8084/mcms/SubmitPrescription
               $.post("http://localhost:8084/MedicalCentre/SubmitStdPrescription",
                        { diagnosis_detail: diagnosisString,medicineinfo: medicinestr,  regno: <%=request.getParameter("reg_id") %> ,re_dt: reconsult_dt, gen_adv: gen_advstr },
                        function(){
                            window.location= "doctor_first_if.jsp";
                });
        });

    });

 var remove_element = function(obj){
	element = obj.parentNode;
	$(element).remove();
//	if( $('#element > li').size() < 1)
//		$('#questions-container').hide();
        }

        </script>
