create database sql_project;
use sql_project;

/*Write a query to fetch EMP_ID, FIRST_NAME, LAST_NAME, GENDER, and DEPARTMENT 
from the employee record table, and make a list of employees and details of their department. */


select EMP_ID, first_name, last_name, gender, dept
from emp_record_table;


/*Write a query to fetch EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPARTMENT, and EMP_RATING if the EMP_RATING is: 
less than two
greater than four 
between two and four
*/

select emp_id, first_name, last_name, gender, dept, emp_rating
from emp_record_table
where emp_rating < 2 or emp_rating > 4 or (emp_rating between 2 and 4);


/*Write a query to concatenate the FIRST_NAME and the LAST_NAME of employees in the Finance department
 from the employee table and then give the resultant column alias as NAME. */
 
 
 select concat(first_name," ",last_name) as name
 from emp_record_table
 where dept = 'Finance';
 
 
 /*Write a query to list only those employees who have someone reporting to them. 
 Also, show the number of reporters (including the President). */
 
 
select manager_id, count(*) as num_of_reporters
from emp_record_table
group by manager_id
having count(*) > 0;



 