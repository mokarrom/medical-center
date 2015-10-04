/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author cse
 */
package medicalcenter;
import java.util.Date;
import java.util.Formatter;
public class ClientDate {
    public static Date dt;
    public static Formatter getDate(){
        dt=new Date();
        Formatter fmt=new Formatter();
        fmt.format("%td/%tm/%ty", dt,dt,dt);
        return fmt;
    }
//    public static void main(String[] args){
//        System.out.println(getDate());
//    }
}
