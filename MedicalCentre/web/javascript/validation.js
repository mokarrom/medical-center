/***************************/
//@Author: Adrian "yEnS" Mato Gondelle & Ivan Guardado Castro
//@website: www.yensdesign.com
//@email: yensamg@gmail.com
//@license: Feel free to use it, but keep this credits please!					
/***************************/

$(document).ready(function(){
	//global vars
	var form = $("#customForm");
	var reg= $("#reg");
	var regInfo= $("#regInfo");
	var name = $("#name");
	var nameInfo = $("#nameInfo");
	var email = $("#email");
	var emailInfo = $("#emailInfo");
	var pass1 = $("#pass1");
	var pass1Info = $("#pass1Info");
	var pass2 = $("#pass2");
	var pass2Info = $("#pass2Info");
	var sex = $("#sex");
	var sexInfo = $("#sexInfo");
	var bday = $("#bday");
	var bdayInfo = $("#bdayInfo");
	var cursem = $("#cursem");
	var cursemInfo = $("#cursemInfo");
	var batch = $("#batch");
	var batchInfo = $("#batchInfo");
	var session = $("#session");
	var sessionInfo = $("#sessionInfo");	
		
	
	
	//On blur
	reg.blur(validateReg);
	pass1.blur(validatePass1);
	pass2.blur(validatePass2);
	name.blur(validateName);
	email.blur(validateEmail);	
	//bday.onblur(validateBday);	
	//On key press
	reg.keyup(validateReg);
	pass1.keyup(validatePass1);
	pass2.keyup(validatePass2);
	name.keyup(validateName);
	email.keyup(validateEmail);
	//bday.keyup(validateBday);
	//On Submitting
	form.submit(function(){ 
		if(validateReg() & validatePass1() & validatePass2() & validateName() & validateEmail())
			return true
		else
			return false;
	});
	
	//validation functions
	
	//reg validation
	function validateReg(){
		if(reg.val().length != 10){
			reg.addClass("error");
			regInfo.text("Invalid registration number.");
			regInfo.addClass("error");
			return false;
		}
		//if it's valid
		else{
			reg.removeClass("error");
			regInfo.text("Valid registration number.");
			regInfo.removeClass("error");
			return true;
		}
	}
	
	//email validation
	function validateEmail(){
		//testing regular expression
		var a = $("#email").val();
		var filter = /^[a-zA-Z0-9]+[a-zA-Z0-9_.-]+[a-zA-Z0-9_-]+@[a-zA-Z0-9]+[a-zA-Z0-9.-]+[a-zA-Z0-9]+.[a-z]{2,4}$/;
		//if it's valid email
		if(filter.test(a)){
			email.removeClass("error");
			emailInfo.text("Valid email address.");
			emailInfo.removeClass("error");
			return true;
		}
		//if it's NOT valid
		else{
			email.addClass("error");
			emailInfo.text("Invalid email address.");
			emailInfo.addClass("error");
			return false;
		}
	}
	
	//name validation
	function validateName(){
		//if it's NOT valid
		if(name.val().length < 6){
			name.addClass("error");
			nameInfo.text("Name must be more than 5 letters!");
			nameInfo.addClass("error");
			return false;
		}
		//if it's valid
		else{
			name.removeClass("error");
			nameInfo.text("Valid name.");
			nameInfo.removeClass("error");
			return true;
		}
	}
	
	//pass1 validation
	function validatePass1(){
		var a = $("#password1");
		var b = $("#password2");

		//it's NOT valid
		if(pass1.val().length <5){
			pass1.addClass("error");
			pass1Info.text("Password must be minimum 5 character.");
			pass1Info.addClass("error");
			return false;
		}
		//it's valid
		else{			
			pass1.removeClass("error");
			pass1Info.text("Valid password.");
			pass1Info.removeClass("error");
			validatePass2();
			return true;
		}
	}
	
	//pass2 validation
	function validatePass2(){
		var a = $("#password1");
		var b = $("#password2");
		//are NOT valid
		if( pass1.val() != pass2.val() ){
			pass2.addClass("error");
			pass2Info.text("Passwords mismatches!");
			pass2Info.addClass("error");
			return false;
		}
		//are valid
		else{
			pass2.removeClass("error");
			pass2Info.text("Password confirmed.");
			pass2Info.removeClass("error");
			return true;
		}
	}		
	
});