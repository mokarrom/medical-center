# Medical Center Management System
A web based Online Medical Center Management System (for SUST Medical Center).

Problem Statement
-----------------
Currently, SUST Medical Centre uses manual (primitive) Management System for maintaining the patient demography and distributing medicine to the patient. In the existing system, doctors and other employees have to spend a lot of time to provide services to the patient because a lot of papers are used to record information. Here, all the tasks (e.g., prescribing patient, delivering medicine, maintaining medicine stock, retrieving records etc.) are tremendously manual and paper dependent. Therefore, an automated online management system needs to be developed.

Project Overview
----------------
This system will provide a graphical user interface to maintain the whole system, including prescribing patient, delivering medicine, maintaining medicine stock etc. Moreover, the new system will be accessible from terminals within the Medical Center and also through the internet from computers outside the Medical Center. Besides, the patients (both student and staff) can view their prescription through internet from anywhere. 

Users
-----
1) **General User (Patient):** Student, Staff.

2)	**Administrative User:** Doctor, Pharmacist, Store Officer, Medicine Distributor.

Major Functions
---------------
The main facilities will be available in this project are:- 
- Total existing management system will be computerized.
- Maintaining patients diagnosis details, advised tests to be done. 
- Maintaining patient’s prescription, medicine, medication instructions, precautions and diet advice details.
- Providing and maintaining all records of stock medicine through two subcategory central-store and sub-store. 
-	The system will keep all tracks of newly purchased medicine and also monitoring their flow.
-	Billing report for the patient who are employee and Report generation.
-	The system will able to provide a proposed list of medicine that should be purchased in upcoming month.
-	If user forgets his/her password then it can be retrieved by hint question.

System Interfaces
-----------------
- **Client on Internet:** Web Browser, Operating System (any).
- **Client on Intranet:** Client Software, Web Browser, Operating System (any).
- **Web Server:** Apache Tomcat, Operating System (any).
- **DataBase:** MySQL.

User Interface
--------------
User interfaces for all users are graphical user interfaces (GUI). These GUI could be both web based and desktop based which is connect to the medical central terminal. The user interfaces are pretty simple and straight-forward.

Communication Interface
-----------------------
- Client on Internet will be using HTTP/HTTPS Protocol.
- Client on intranet will be using TCP/IP protocol.

Requirements & Installation
---------------------------
**Requirements:**

1. jdk-6u1-windows-i586-p
2. netbeans-6.9.1-ml-windows
3. MySql Database
  1. mysql-5.1.39-win32_2
  2. mysql-connector-odbc-5.1.6-win32
  3. mysql-gui-tools-5.0-r17-win32
4. mysql-connector-java-5.1.6-bin.jar
5. Apache Tomcat 6.0.26 (integrated with netbaens)
6. Firefox  (3.6.3 or higher)

**Installation:**

1. Install JDK.
2. Install NetBeans IDE (Version 6.9.1).
3. We used MySQL database in this project. We have to install  three components of MySQL. In our case `root` and `admin` are the username and password respectively for MySQL. (If you want to change the username & password then open `database.java` file from *project\MedicalCentre\src\java\medicalcenter* location and change username or  password according to your MySQL database username and password).
4. Install Firefox web browser.
5. Open NetBeans IDE and import the `MedicalCentre` project as web project.
6. Add *mysql-connector-java-5.1.6-bin.jar* in Libraries if not added before.

**Known Issue:**

Although you have installed and configured everyting properrly, you might have faced problem regarding database. In that case you may take help from `DBQuery.sql` file for database query (i.e., trigger, procedure, event etc.).

A few dummy users are (available in the system):

User Name  | Password | Uset Type
------------- | ------------- | -----------
doctor  | d | Doctor
doctor2	| d | Doctor
pharmacist |	p | Pharmacist
md |	md1 | Medicine Distributor
a-cse	| p | Patient (Employee)	
b-cse	| p | Patient (Employee)
2007331039 |	mokarrom | Patient (Student)
2007331023 |	p | Patient (Student)	

Reference
---------
A detail technical report which explains different phases (e.g. requirement analysis, system design, architecture, coding, debugging and testing etc.) of software engineering, is avaialable in the `docs` directory. 
