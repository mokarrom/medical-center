/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Administrator
 */
package medicalcenter;

import java.sql.ResultSet;

public class StockLedgerEntry {
    ResultSet rs;
    String query;

    public StockLedgerEntry() {
        rs=null;
        query=null;

    }


        public ResultSet getInfo(String fld,String tbl){
            query="select distinct("+fld+") from "+tbl;
            try{
            database db=new database();
            rs=db.executeQuery(query);
            }catch(Exception e){
                
                }

            return rs;
        }
        public ResultSet getInfo(String fld1,String fld2,String tbl){
            query="select " +fld1+ "," +fld2+ " from "+tbl+" order by " +fld2;
            try{
            database db=new database();
            rs=db.executeQuery(query);
            }catch(Exception e){

                }

            return rs;
        }

        public ResultSet getCentralStocInfo(String viewName){
            query="select * from "+viewName;
            try{
            database db=new database();
            rs=db.executeQuery(query);
            }catch(Exception e){

                }
            return rs;
        }
        public ResultSet getUserProfile(String userPk){
            query="SELECT full_name,employee_code,designation_name,dept_name,sex"+
" FROM employee,employee_personal_info,employee_status,designation,department"+
" where employee_pk=employee_personal_pk_fk"+
" and employee_pk= employee_status_pk_fk"+
" and designation_pk=designation_fk"+
" and department_fk=dept_pk"+
" and employee_pk="+userPk;
            try{
            database db=new database();
            rs=db.executeQuery(query);
            }catch(Exception e){

                }
            return rs;
        }

        public ResultSet getPrescriptionDate(String stdPk){
            query="SELECT std_prescription_pk,prescription_dt FROM std_prescription_info"
+" where student_pk_fk="+stdPk
+" order by prescription_dt desc";
            try{
            database db=new database();
            rs=db.executeQuery(query);
            }catch(Exception e){

                }
            return rs;
        }
        public ResultSet getDiagnosisDetails(String presPk){
            query="SELECT prescription_dt,diagnosis_detail,reconsult_dt,general_advice,full_name"+
" FROM std_prescription_info,employee_personal_info"+
" where std_prescription_pk="+presPk+
" and emplaoyee_pk_fk=employee_personal_pk_fk;";
            try{
            database db=new database();
            rs=db.executeQuery(query);
            }catch(Exception e){

                }
            return rs;
        }
        public ResultSet getPatientMedicine(String presPk){
            query="SELECT med_type,med_com_name,med_weight,no_of_doses,day_duration,med_qty,medication_inst_text"+
" FROM patient_med_info,medicine_gen_info,medicine_com_info,medication_inst_detail"+
" where std_prescription_fk="+presPk+
" and med_com_name_fk=med_com_name_pk"+
" and med_gen_name_fk=med_gen_name_pk"+
" and medication_inst_fk=medication_inst_pk"+
" order by med_type asc";
            try{
            database db=new database();
            rs=db.executeQuery(query);
            }catch(Exception e){

                }
            return rs;
        }
}
