/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function addRow(tableID) {

			var table = document.getElementById(tableID);
                    /*    var rowCount = table.rows.length;
                        var row = table.insertRow(rowCount);

                        var cell0=row.insertCell(0);
                        cell0.innerHTML = table.rows[1].cells[0].innerHTML;

                        var cell1=row.insertCell(1);
                        cell1.innerHTML = rowCount;

                        var cell2=row.insertCell(2);
                        //cell2.innerHTML = table.rows[1].cells[2].innerHTML;
                        var sel = document.createElement('select');
                        sel.name = 'medicine_type';
                        sel.id = 'medicine_type' + rowCount;

                        sel.options[0] = new Option(rs.getString("med_type"), '');
                        sel.options[1] = new Option('text one', 'value1');
                        cell2.appendChild(sel);
                       // cell2.appendChild(table.rows[1].cells[2]) ;
                       */
			var rowCount = table.rows.length;
			var row = table.insertRow(rowCount);

			var colCount = table.rows[1].cells.length;

			for(var i=0; i<colCount; i++) {

				var newcell = row.insertCell(i);
                                if( i == 1 )
                                    newcell.innerHTML = rowCount;
                                else
                                    newcell.innerHTML = table.rows[1].cells[i].innerHTML;
				//alert(newcell.childNodes);

			}
		}
                function addInstructionrow(tableID) {
                    var table = document.getElementById(tableID);

			var rowCount = table.rows.load();
			var row = table.insertRow(rowCount);
                        row.innerHTML='<td align=\"center\" colspan=\"9\">Row 3 Cell 1</td>';
                        //var newdiv = document.createElement('div');
                        //newdiv.innerHTML = 'Here<br> is the Medication Instruction ';
			//var colCount = table.rows[1].cells.length;
			//table.rows[1].appendChild(newdiv);
                }

		function deleteRow(tableID) {
			try {
			var table = document.getElementById(tableID);
			var rowCount = table.rows.length;

			for(var i=0; i<rowCount; i++) {
				var row = table.rows[i];
				var chkbox = row.cells[0].childNodes[1];
				if( chkbox != null && chkbox.checked == true) {
					if(rowCount <= 2) {
						alert("Cannot delete all the rows.");
						break;
					}
					table.deleteRow(i);
					rowCount--;
					i--;
				}

			}
			}catch(e) {
				alert("Error"+e);
			}
		}
function test(){
   // alert('dflds');
    var complain=document.getElementById('cct');
    var complaintext = complain.options[complain.selectedIndex].text;
    var duration=document.getElementById('ccd');
    var durationtext = duration.options[duration.selectedIndex].text;
    document.innerHTML=complaintext+durationtext;
    //var Value = complain.options[complain.selectedIndex].value;
    document.write(Text);
}
function removeElement(divNum) {
    //alert('f');
  var d = document.getElementById('ccDiv');
  var olddiv = document.getElementById(divNum);
  d.removeChild(olddiv);
}


function rowCount(tableID){
    var table = document.getElementById(tableID);
    var rowNo = table.rows.length;
    return rowNo;
}
                function validateTable(tableID)
                    {
			var table = document.getElementById(tableID);
			var rowCount = table.rows.length;

			for(var i=1; i<rowCount; i++) {
                            if(validateRow(i))
                                continue;
                            else return false;
			}
			return true;
                    }
function validateRow(i){
     var medTypep="medicine_type" + i ;
     var comNamep="medicine_com_name" + i ;
     var medWeightp="medicine_weight" + i ;
     var medQtyp="medicine_qty" + i ;
     var medpp_pp="pp_price" + i ;


     var medType=document.getElementById(medTypep);
     var medComName=document.getElementById(comNamep);
     var medWeight=document.getElementById(medWeightp);
     var medQty=document.getElementById(medQtyp);
     var medpp_p=document.getElementById(medpp_pp);

     if( notEmpty(medType,"Please select the Medicine Type") ){
        if( notEmpty(medComName,"Please select the Medicine Commercial Name") ){
            if( notEmpty(medWeight,"Please select the Medicine Weight") ){
                if( notEmpty(medQty,"Please select the Medicine Quantity") && isNumeric(medQty,'Please Enter a valid Quantity') ){
                    if( notEmpty(medpp_p,"Please select the Per Peace Price") && isNumeric(medpp_p,'Please Enter a valid Price') )
                        return true;
                }
            }

        }
    }
    return false;
    }
function formvalidate()
    {
        var dt=document.getElementById('date');
        var comp=document.getElementById('company_id');
        var commission=document.getElementById('commission');
        //if(document.formName.Item.selectedIndex==0)
        //if(document.stock_ledger_entry_form.company_id.value == ""){
   /*     if(comp.value == ""){
            alert('Please select the Company Name');
            comp.focus();
            valid=false;
            return valid;
        }
       else  if(dt.value == ""){
            alert('Please select the Purchase Date');
            dt.focus();
            valid=false;
            return valid;
        }
*/
    if(notEmpty(comp,'Please select the Company Name')){
        if(notEmpty(dt,'Please select the Purchase Date')){
            if(notEmpty(commission,'Please Enter the Commission') && isNumeric(commission,'Please Enter a valid Commission')){
                //if(validateTable('dataTable'))
                    return true;
            }
        }
    }
   return false;
    }

    function notEmpty(item,msg){
        if (item.value == "")
            {
            alert(msg)
            item.focus();
            return false;
            }
       return true;
    }
   function isNumeric(item, msg){
	var numericExpression = /^[0-9]+$/;
	if(item.value.match(numericExpression)){
		return true;
	}else{
		alert(msg);
		item.focus();
		return false;
	}
    }
    function checkReg(){

        var reg_no=document.getElementById('reg_id');
        var error=$('#reg_error');
        error.html('');
        var numericExpression = /^[0-9]+$/;
        if(reg_no.value.length == 10 && reg_no.value.match(numericExpression)){
            //alert("yes");
            return true;
        }
        else{
            error.html('Enter a valid Registration Number <br> e.g. 200XXXXXXX');
            return false;
        }
    }
