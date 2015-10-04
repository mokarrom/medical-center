<%-- 
    Document   : addnewcc
    Created on : Mar 2, 2011, 12:43:48 AM
    Author     : Administrator
<link type="text/css" href="javascript/jquery/themes/base/jquery.ui.all.css" rel="stylesheet" />
	<script type="text/javascript" src="javascript/jquery/jquery-1.4.2.js"></script>
--%>


<link type="text/css" href="javascript/jquery/themes/base/jquery.ui.all.css" rel="stylesheet" />
	<script type="text/javascript" src="javascript/jquery/jquery-1.4.2.js"></script>
	<script type="text/javascript" src="javascript/jquery/external/jquery.bgiframe-2.1.1.js"></script>
	<script type="text/javascript" src="javascript/jquery/ui/jquery.ui.core.js"></script>
	<script type="text/javascript" src="javascript/jquery/ui/jquery.ui.widget.js"></script>
	<script type="text/javascript" src="javascript/jquery/ui/jquery.ui.mouse.js"></script>
	<script type="text/javascript" src="javascript/jquery/ui/jquery.ui.button.js"></script>
	<script type="text/javascript" src="javascript/jquery/ui/jquery.ui.draggable.js"></script>
	<script type="text/javascript" src="javascript/jquery/ui/jquery.ui.position.js"></script>
	<script type="text/javascript" src="javascript/jquery/ui/jquery.ui.resizable.js"></script>
	<script type="text/javascript" src="javascript/jquery/ui/jquery.ui.dialog.js"></script>
	<script type="text/javascript" src="javascript/jquery/ui/jquery.effects.core.js"></script>
	<link type="text/css" href="javascript/jquery/demos/demos.css" rel="stylesheet" />

<div class="demo" id="demo">
    <div class="dialog-form" id="dialog-form" title="Add New Cheif Complaint">
	<p class="validateTips">Write the complaint name</p>

	<form>
	<fieldset>
		<label for="name">Complaint Name</label>
		<input type="text" name="name" id="name" class="text ui-widget-content ui-corner-all" />
	</fieldset>
	</form>
</div>
<span class="add_new" id="add_new">Add new chief complaint</span>
</div><!-- End demo -->
<!-- End demo-description -->

    <style>

                
		#dialog-form .label, .input { display:block; }
		#dialog-form input.text { margin-bottom:12px; width:95%; padding: .4em; }
		#dialog-form .fieldset { padding:0; border:0; margin-top:15px; }

		div#users-contain { width: 350px; margin: 20px 0; }
		div#users-contain table { margin: 1em 0; border-collapse: collapse; width: 100%; }
		div#users-contain table td, div#users-contain table th { border: 1px solid #eee; padding: .6em 10px; text-align: left; }
		.ui-dialog .ui-state-error { padding: .3em; }
		.validateTips { border: .5px solid transparent; padding: 0.1em; }
#add_new{
    font-size: 15px;
    float:left;
    color: #0000FF;
    text-decoration: underline;
    cursor: pointer;

}
	</style>

    <script type="text/javascript">
	$(function() {
		// a workaround for a flaw in the demo system (http://dev.jqueryui.com/ticket/4375), ignore!
		$( "#dialog:ui-dialog" ).dialog( "destroy" );

		var name = $( "#name" ),
			allFields = $([]).add(name),
			tips = $( ".validateTips" );

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

		$( "#dialog-form" ).dialog({
			autoOpen: false,
			height: 300,
			width: 400,
			modal: true,
			buttons: {
				"Add the Complain": function() {
					var bValid = true;
					allFields.removeClass('ui-state-error');

					bValid = bValid && checkLength( name, "username", 2, 30 );
                                        var ccname=name.val();
					if ( bValid ) {
                                            $.post("http://localhost:8084/MedicalCentre/AddNewcc",
                                                    { cc_name: ccname },
                                                        function(){
                                                            $('#ccName').append(Option(ccname,ccname));
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

		$( "#add_new" )
			.click(function() {
				$( "#dialog-form" ).dialog( "open" );
			});
	});

    </script>

