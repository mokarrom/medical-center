<%-- 
    Document   : stock_ledger_entry
    Created on : Apr 16, 2011, 11:18:35 AM
    Author     : Administrator
--%>
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
                        Stock Ledger
    </div>
<div id="page_body">
<br>
<form method="post" name="stock_ledger_entry_form" >
    
    <table border="0" width ="100%" >
        
            <tr>
                <td align="center">
                    <br>
                </td>
            </tr>
            <tr>
                <td>
                    <table border="0" width="100%" cellpadding="5"cellspacing="5">
                        <tr>
                            <td align="center" width="40%">
                                 M/S :
                                 <SELECT id="company_id" name="company_id">
                                    <OPTION value="" selected>- Select Company Name -</OPTION>
                                            <%//onsubmit="return formvalidate()"
                                                ResultSet rs;
                                                rs=medicalcenter.getInfo("company_id_pk","company_name","company_info");
                                                while(rs.next()){
                                              %>
                                              <OPTION value=<%= rs.getInt("company_id_pk") %> ><%= rs.getString("company_name") %></OPTION>
                                              <%
                                                    }
                                              %>

                                </SELECT>
                            </td>
                            <td align="center" width="30%">
                                <label for ="date">Select Date:</label>&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="text" class="datepicker" name="date" id="date"/>
                                <%--
                                Date :
                                <input type="text" name="sledate" size="10" value="<%= user.ClientDate.getDate()%>" />
                                --%>
                            </td>
                            <td align="center" width="30%">
                                Commission :
                                <select name="commission" id="commission" >
                                    <option value="-1" selected>Sel..</option>
                                    <% int c=0;
                                    while(c<31){ %>
                                    <option value="<%= c %>" > <%= c %> </option>
                                    <% c++; } %>
                                </select>
                                %
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr> <td> <br> </td> </tr>
            <tr>
                <td>
                    <table  border="1" width="100%" cellpadding="0" cellspacing="0">
                        <tr>
                            <td width="50%">
                                <table class="entry_table" border="0" cellpadding="7" cellspacing="10" width="100%">
                                    <tr >
                                        <td class="td_left"> Medicine Type </td>
                                        <td class="td_center"> : </td>
                                        <td class="td_right">
                                            <SELECT id="medicine_type" name="medicine_type">
                                                <OPTION value="" selected> - < Select One Item > - </OPTION>
                                                  <%
                                                    //ResultSet rs;
                                                    int n=1;
                                                    rs=medicalcenter.getInfo("med_type","medicine_gen_info");
                                                    while(rs.next()){
                                                        n++;
                                                  %>
                                                        <OPTION value="<%= rs.getString("med_type") %>" ><%= rs.getString("med_type") %></OPTION>
                                                  <%
                                                        }
                                                  %>
                                            </SELECT>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td_left"> Commercial Name </td>
                                        <td class="td_center"> : </td>
                                        <td class="td_right">
                                            <SELECT name="medicine_com_name" id="medicine_com_name">
                                                <OPTION value="" selected> Select Type First </OPTION>
                                            </SELECT>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td_left"> Medicine Quantity</td>
                                        <td class="td_center"> : </td>
                                        <td class="td_right">
                                            <input type="text" name="medicine_qty" id="medicine_qty" size="5">&nbsp;Pieces
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td_left"> Per Piece Price </td>
                                        <td class="td_center"> : </td>
                                        <td class="td_right">
                                            <input type="text" name="pp_price" id="pp_price" size="5">&nbsp;Taka.
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td_left"> Manufacturing Date </td>
                                        <td class="td_center"> : </td>
                                        <td class="td_right">
                                            <select name="mfg_day" id="mfg_day">
                                                <option value="-1" selected>Day:</option>
                                                <% int day=1;
                                                while(day<32) { %>
                                                <option value="<%= day %>"><%= day %></option>
                                                <% day++; } %>
                                            </select>
                                            <select name="mfg_month" id="mfg_month">
                                                <option value="-1" selected >Month:</option>
                                                <OPTION value="1">Jan</OPTION><
                                                <OPTION value="2">Feb</OPTION>
                                                <OPTION value="3">Mar</OPTION>
                                                <OPTION value="4">Apr</OPTION>
                                                <OPTION value="5">May</OPTION>
                                                <OPTION value="6">Jun</OPTION>
                                                <OPTION value="7">Jul</OPTION>
                                                <OPTION value="8">Aug</OPTION>
                                                <OPTION value="9">Sep</OPTION>
                                                <OPTION value="10">Oct</OPTION>
                                                <OPTION value="11">Nov</OPTION>
                                                <OPTION value="12">Dec</OPTION>
                                            </select>
                                            <select name="mfg_year" id="mfg_year">
                                                <option value="-1" selected>Year:</option>
                                                <% int year=2010;
                                                while(year<2021) { %>
                                                <option value="<%= year %>"><%= year %></option>
                                                <% year++; } %>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td_left"> Expiring Date </td>
                                        <td class="td_center"> : </td>
                                        <td class="td_right">
                                            <select name="exp_day" id="exp_day">
                                                <option value="-1" selected>Day:</option>
                                                <% day=1;
                                                while(day<32) { %>
                                                <option value="<%= day %>"><%= day %></option>
                                                <% day++; } %>
                                            </select>
                                            <select name="exp_month" id="exp_month">
                                                <option value="-1" selected >Month:</option>
                                                <OPTION value="1">Jan</OPTION><
                                                <OPTION value="2">Feb</OPTION>
                                                <OPTION value="3">Mar</OPTION>
                                                <OPTION value="4">Apr</OPTION>
                                                <OPTION value="5">May</OPTION>
                                                <OPTION value="6">Jun</OPTION>
                                                <OPTION value="7">Jul</OPTION>
                                                <OPTION value="8">Aug</OPTION>
                                                <OPTION value="9">Sep</OPTION>
                                                <OPTION value="10">Oct</OPTION>
                                                <OPTION value="11">Nov</OPTION>
                                                <OPTION value="12">Dec</OPTION>
                                            </select>
                                            <select name="exp_year" id="exp_year">
                                                <option value="-1" selected>Year:</option>
                                                <% year=2011;
                                                while(year<2021) { %>
                                                <option value="<%= year %>"><%= year %></option>
                                                <% year++; } %>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td_left">
                                        <%@include file="addNewMed.jsp" %>
                                        </td>
                                        <td>     </td>
                                        <td align="right"><input type="button" name="slmedAdd" id="slmedAdd" value="Add" /></td>
                                    </tr>
                                </table>
                            </td>
                            <td width="50%" class="slmed">
                                       <div id="slmed_container" class="" style="display:none">
                                                    <font size="5" color="red"><strong>Medicine Details</strong></font>
                                                    <ul id="slmedinfo">
                                                    </ul>
                                       </div>
                            </td>
                        </tr>
                        
                    </table>

                     <table class="entry_table" border="0" width="100%" cellpadding="5" cellspacing="10">
                        <tr><td> </td>
                            <td align="center"><span id="total_taka">Total Amount: 0 Taka </span></td>
                        </tr>
                        <tr>
                            <td align="center">
                                <button  name="cancel_entry" id="cancel_entry" > Cancel Entry</button>
                              <!--<button name="sl_submit" id="sl_submit" value="Submit Entry" > Submit Entry</button> -->
                            </td>
                            <td align="center">
                                <input type="button" name="sl_submit" id="sl_submit" value="Submit Entry" >
                            </td>

                        </tr>
                    </table>
                                      <br>  <br>
                  </td>
            </tr>            

        </table>
      </form>
</div>
<%@include file="include/footer.jsp" %>
         <script type="text/javascript">
$(document).ready(function(){

    $('#medicine_type').change(function(){

            var med_type=$(this).val();
            var med_info=$('#medicine_com_name');
            var flag=true;//alert(med_type);
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

    $('#slmedAdd').click(function(){
                //alert("dkfjl;dsf");
                var med_type = $('#medicine_type').val();   //var cc_name = $('#ccName :selected').text();
		var med_com_id = $('#medicine_com_name').val();
                var med_com_name = $('#medicine_com_name :selected').text();
                var pp_price=$('#pp_price').val();
                var qty=$('#medicine_qty').val();
                //Manufacturing Date Retrieve
                var mfg_d=$('#mfg_day').val();
                var mfg_m=$('#mfg_month').val();
                var mfg_y=$('#mfg_year').val();
                var mfg_date=mfg_y+'-'+mfg_m+'-'+mfg_d;//alert(mfg_date);
                //Expiring Date Retrieve
                var exp_d=$('#exp_day').val();
                var exp_m=$('#exp_month').val();
                var exp_y=$('#exp_year').val();
                var exp_date=exp_y+'-'+exp_m+'-'+exp_d;
                //alert(exp_date);
                var numericExpression = /^[0-9]+$/;
                var floatExpression = /^[0-9.]+$/;
                if(med_type==''){
                    alert('Please Select Medicine Type')
                    $('#medicine_type').focus();
                }
                else if(med_com_id==''){
                    alert('Please Select Medicine Type First')
                    $('#medicine_type').focus();
                }
                else if(qty == '' || !(qty.match(numericExpression) ) ){
                    alert('Please Enter valid quantity')
                    $('#medicine_qty').focus();
                }
                else if(pp_price == '' || !(pp_price.match(floatExpression))  ){
                    alert('Invalid Per Peace Price')
                    $('#pp_price').focus();
                }
                else if(mfg_d==-1){
                    alert('Invalid Manufacturing Date')
                    $('#mfg_day').focus();
                }
                else if(mfg_m==-1){
                    alert('Invalid Manufacturing Date')
                    $('#mfg_month').focus();
                }
                else if(mfg_y==-1){
                    alert('Invalid Manufacturing Date')
                    $('#mfg_year').focus();
                }
                else if(exp_d==-1){
                    alert('Invalid Expiring Date')
                    $('#exp_day').focus();
                }
                else if(exp_m==-1){
                    alert('Invalid Expiring Date')
                    $('#exp_month').focus();
                }
                else if(exp_y==-1){
                    alert('Invalid Expiring Date')
                    $('#exp_year').focus();
                }
                else{
                  //  if(inst=='')
                //   var medHTML = '<li type="medicine_add" med_id="'+med_com_id+'" inst="0"><span class="remove" onclick="remove_element(this)">Remove</span>'+med_type+' <b>'+med_com_name+'</b> (<span class="doses_no">'+doses_no+'</span>) for <b><span class="dr">'+dr+'</span></b> Days (<span class="qty">'+qty+'</span>)</li>';
                   //else
                   var slmedHTML = '<li type="medicine_add" med_id="'+med_com_id+'"><span class="remove" onclick="remove_element(this)">Remove</span>'+med_type+' <b>'+med_com_name+'</b> <span class="med_qty">'+qty+'</span> pieces @ <b><span class="pprice">'+pp_price+'</span></b>Taka <br>Manufacturing dt=<b><span class="mfg_dt">'+mfg_date+'</span></b> Expiring dt=<b><span class="exp_dt">'+exp_date+'</span></b></li>';
			$('#slmed_container').show();
			$('#slmedinfo').append(slmedHTML);
			$('#medicine_type').val('');
			$('#medicine_com_name').val('');
                        calcTotalTaka();
                }
        });
        $('#sl_submit').click(function(){
            var comp_id=$('#company_id').val();
            var dt=$('#date').val();
            var comm=$('#commission').val();
            var domslmedinfo=$('ul#slmedinfo');
            var sl_medinfo=[];
            if(comp_id==''){
                alert('Please select the Company Name')
                    $('#company_id').focus();
            }
            else if(dt==''){
                alert('Please select the Purchase Date')
                    $('#date').focus();
            }
            else if(comm == -1){
                    alert('Please Enter the Commission')
                        $('#commission').focus();
                }
            else{
                $('li', domslmedinfo).each(function(i){
                        var id=$(this).attr('med_id');
                        var qty = $('span.med_qty', this).html();
                        var pp_price = $('span.pprice', this).html();
                        var mfg_date=$('span.mfg_dt',this).html();
                        var exp_date=$('span.exp_dt',this).html();
                        var sl_medobj={
                            med_id: id,
                            med_qty: qty,
                            med_pp: pp_price,
                            med_mfgdt: mfg_date,
                            med_expdt: exp_date
                        }
                        sl_medinfo.push(sl_medobj);
       // alert(med_dr+'$'+med_dose+'$'+med_id);alert(med_inst);
                });
           var sl_medinfostr= JSON.stringify(sl_medinfo);//alert(sl_medinfostr);

           $.post("http://localhost:8084/MedicalCentre/StocLedgerSubmit",
           { slmedinfo: sl_medinfostr ,company_id: comp_id, date: dt, commission: comm, emp_fk: <%=session.getAttribute("user_pk") %> },
                        function(){
                            window.location= "stock_ledger_entry.jsp";
                });
            }

        });

});
var calcTotalTaka = function(){
		domslmedinfo=$('ul#slmedinfo');
		var totaltk = 0;
		$('li', domslmedinfo).each(function(i){
			var qty = $('span.med_qty', this).html();
                        var pp_price = $('span.pprice', this).html();
			totaltk += parseInt(qty) * parseFloat(pp_price);
		});
                totaltk=totaltk.toFixed(2);
		$('#total_taka').html('Total Amount: <b>'+totaltk+'</b> Taka');
}

var remove_element = function(obj){
	element = obj.parentNode;
	$(element).remove();
        calcTotalTaka();
//	if( $('#element > li').size() < 1)
//		$('#questions-container').hide();
        }
         </script>
<style type="text/css">
#total_taka{
float: centre;
color: #0000FF;
font-size: 17px;
}
.slmed ul{
list-style:decimal;
margin-left: 20px;
border: 0px solid #0000FF;
}

.slmed li{
border: 0px solid #CCCCCC;
padding:3px;
margin-left: 10px;
}
.slmed li .remove{
float:right;
color:#0000FF;
text-decoration:underline;
cursor:pointer;
}
.entry_table tr{
    height: 30px;
}
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
