var loginToggle = function()
{
	var obj = $('#login');
	if(!obj.hasClass('open')){
		obj.animate({
			height:'120px'
		},
		800
		);
		obj.addClass('open');
		return;
	}
	obj.animate({
			height:'0px'
	},
	800
	);
	obj.removeClass('open');
}




$(document).ready(function(){
	$('#username').focus( function(){
		$(this).val('');
	});
	;
	
	$('#password').focus( function(){
		$(this).val('');
	});
	
		
	$('#toggleLogin, #closeLogin').click(function(){
		loginToggle();						
		
	});
	// initialise plugins
		jQuery(function(){
			jQuery('ul.sf-menu').superfish();
		});

       $('.datepicker').datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'yy-mm-dd'
        });

      $('.datepicker').keyup(function(){
          return false;
      });
       $('.datepicker').keydown(function(){
          return false;
      });
   


});