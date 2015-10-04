<%-- 
    Document   : std_menu
    Created on : Apr 15, 2011, 11:15:30 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.ResultSet"%>
<jsp:useBean id="medicalcenter" class="medicalcenter.StockLedgerEntry" scope="session"/>
<script type='text/javascript' src="javascript/jquery-1.2.3.min.js"></script>
<script type='text/javascript' src="javascript/menu.js"></script>

<link rel="stylesheet" href="CSS/style.css" type="text/css" media="screen" />
<%
    ResultSet rs;
    String std_pk=session.getAttribute("user_pk").toString();
    rs=medicalcenter.getPrescriptionDate(std_pk);
%>
<div id="menu">
			 <ul id="nav">
                             <li><a href="student_profile.jsp">Profile</a></li>
                             <li><a href="#">Link1</a></li>
                              <li><a href="#">Previous Prescription </a>
                                  <ul>
                                      <% while(rs.next()){ %>
                                      <li>
                                          <a href="view_std_prescription.jsp?pres_pk=<%=rs.getInt("std_prescription_pk") %>"><%=rs.getDate("prescription_dt") %></a>
                                      </li>
                                      <% } %>
                                      <li>
                                         <a href="#">See All</a>
                                      </li>
                                  </ul>
                               </li>
                      <li><a href="include/logout.jsp">Log out</a></li>

                    </ul>

 </div>

