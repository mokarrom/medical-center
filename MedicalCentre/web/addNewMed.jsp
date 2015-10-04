<%-- 
    Document   : addNewMed
    Created on : Mar 20, 2011, 11:44:42 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<div class="new_med_demo" id="new_med_demo">
    <div class="new_med_dialog-form" id="new_med_dialog-form" title="Add New Medicine">
	<p class="new_med_validateTips">All form fields are required.</p>

	<form>
	<fieldset>
            <label for="name"> Medicine Type</label>
            <SELECT id="new_med_type" name="new_med_type" class="text ui-widget-content ui-corner-all">
                                                <OPTION value="-1" selected> - < Select One Item > - </OPTION>
                                                  <%
                                                    //ResultSet rs;
                                                    rs=medicalcenter.getInfo("med_type","medicine_gen_info");
                                                    while(rs.next()){
                                                  %>
                                                        <OPTION value="<%= rs.getString("med_type") %>" ><%= rs.getString("med_type") %></OPTION>
                                                  <%
                                                        }
                                                  %>
                                            </SELECT>
                                            <br><br>
		<label for="name"> Generic Name</label><br>
		<input type="text" name="new_gen_name" id="new_gen_name" class="text ui-widget-content ui-corner-all" /><br>
                <label for="name"> Commercial Name</label><br>
		<input type="text" name="new_com_name" id="new_com_name" class="text ui-widget-content ui-corner-all" /><br>
                <label for="name"> Medicine Weight</label> <br>
                <SELECT name="new_med_weight" id="new_med_weight">
                                            <OPTION value="-1" selected>-< Select Weight >-</OPTION>
                                            <OPTION value=250>250</OPTION>
                                            <OPTION value=500>500</OPTION>
                                            <OPTION value=1000>1000</OPTION>
                                            <OPTION value=1500>1500</OPTION>
                                            <OPTION value=2000>2000</OPTION>
                                            <OPTION value=2500>2500</OPTION>
                                            <OPTION value=5000>5000</OPTION>
                                            <OPTION value=10000>10000</OPTION>
                                     </SELECT>
	</fieldset>
	</form>
</div>
<span class="add_new_med" id="add_new_med">Add new Medicine</span>
</div><!-- End demo -->
<!-- End demo-description -->

    <style>


		#new_med_dialog-form .label, .input { display:block; }
		#new_med_dialog-form input { margin-bottom:12px; width:70%; padding: 5px;margin: 5px }
                #new_med_dialog-form select { margin-bottom:12px; width:72%; padding: 5px;margin: 5px }
		#new_med_dialog-form .fieldset { padding:5px; border:0; margin-top:15px; }

		div#users-contain { width: 350px; margin: 20px 0; }
		div#users-contain table { margin: 1em 0; border-collapse: collapse; width: 100%; }
		div#users-contain table td, div#users-contain table th { border: 1px solid #eee; padding: .6em 10px; text-align: left; }
		.ui-dialog .ui-state-error { padding: .3em; }
		.new_med_validateTips { border: .5px solid transparent; padding: 0.1em; }
#add_new_med{
    font-size: 14px;
    float:left;
    color: #0000FF;
    text-decoration: underline;
    cursor: pointer;

}
	</style>

    <script type="text/javascript">
	$(function() {
		// a workaround for a flaw in the demo system (http://dev.jqueryui.com/ticket/4375), ignore!
		$( "#new_med_dialog:ui-dialog" ).dialog( "destroy" );

		var gname = $( "#new_gen_name" ),
                        cname = $( "#new_com_name" ),
                        type = $("#new_med_type"),
                        weight = $("#new_med_weight"),
			//allFields = $([]).add(name).add(email).add(password),
			//tips = $(".validateTips");
			allFields = $([]).add(gname).add(cname).add(type).add(weight),
			tips = $( ".new_med_validateTips" );

		function updateTips( t ) {
			tips
				.text( t )
				.addClass( "ui-state-highlight" );
			setTimeout(function() {
				tips.removeClass( "ui-state-highlight", 1500 );
			}, 500 );
		}

		function checkLength( o, n, min, max ) {
			if ( o.val().length > max || o.val().length < min ) {
				o.addClass( "ui-state-error" );
				updateTips( "Length of " + n + " must be between " +
					min + " and " + max + "." );
				return false;
			} else {
				return true;
			}
		}
                function checkNull(o,n) {
                  
			if ( o.val() == -1 ) {
				o.addClass('ui-state-error');
				updateTips(n);
				return false;
			} else {
				return true;
			}

		}

		$( "#new_med_dialog-form" ).dialog({
			autoOpen: false,
			height: 500,
			width: 400,
			modal: true,
			buttons: {
				"Add Medicine": function() {
					var bValid = true;
					allFields.removeClass('ui-state-error');
                                        bValid = bValid && checkNull(type,"Select the Medicine Type");
                                        bValid = bValid && checkLength( gname, "Generic Name", 2, 30 );
					bValid = bValid && checkLength( cname, "Commercial Name", 2, 30 );
                                        bValid = bValid && checkNull(weight,"Select the Medicine Weight");
                                        var med_type=type.val();
                                        var gen_name=gname.val();
                                        var com_name=cname.val();
                                        var med_weight=weight.val();
					if ( bValid ) {
                                            $.post("http://localhost:8084/MedicalCentre/AddNewMed",
                                                    { mtype: med_type, genname: gen_name, comname: com_name, mweight: med_weight },
                                                        function(){
                                                            $('#invdfdsf').append('<input type="checkbox" name="inv" value="'+invname+'" />'+invname);
                                                            }
                                            );
						$( this ).dialog( "close" );
					}
				},
				Cancel: function() {
					$( this ).dialog( "close" );
				}
			},
			close: function() {
				allFields.val( "" ).removeClass( "ui-state-error" );
			}
		});

		$( "#add_new_med" )
			.click(function() {
				$( "#new_med_dialog-form" ).dialog( "open" );
			});
	});

    </script>