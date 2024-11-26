create database project1;
use project1;

select * from data_science_team;
select * from emp_record_table;
select * from proj_table;

#3.	Write a query to fetch EMP_ID, FIRST_NAME, LAST_NAME, GENDER, and DEPARTMENT 
#from the employee record table, and make a list of employees and details of their department.


select EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPT from emp_record_table;


#4.	Write a query to fetch EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPARTMENT, and EMP_RATING if the EMP_RATING is: 
#•	less than two
#•	greater than four 
#•	between two and four

 
 select EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPT, EMP_RATING from emp_record_table where EMP_RATING < 2;
 select EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPT, EMP_RATING from emp_record_table where EMP_RATING > 4;
 select EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPT, EMP_RATING from emp_record_table where EMP_RATING between 2 and 4;
 
 
# 5.Write a query to concatenate the FIRST_NAME and the LAST_NAME of 
#employees in the Finance department from the employee table and then give the resultant column alias as NAME.


select concat(FIRST_NAME, " ", LAST_NAME) AS Name from emp_record_table where DEPT = "Finance";


#7.	Write a query to list down all the employees from the healthcare and finance departments using union. 
#Take data from the employee record table.


select * from emp_record_table where DEPT = "Healthcare" union select * from emp_record_table where DEPT = "Finance";


#8.	Write a query to list down employee details such as EMP_ID, FIRST_NAME, LAST_NAME, ROLE, DEPARTMENT, 
#and EMP_RATING grouped by dept. Also include the respective employee rating along with the max emp rating for the department.


select FIRST_NAME, LAST_NAME, ROLE, DEPT, EMP_RATING from emp_record_table group by FIRST_NAME, LAST_NAME, ROLE, DEPT, EMP_RATING order by DEPT, EMP_RATING ASC;


#9.	Write a query to calculate the minimum and the maximum salary of the employees in each role.
#Take data from the employee record table.


select ROLE, min(salary) as mini_salary, max(salary) as max_salary from emp_record_table group by ROLE;


#10.Write a query to assign ranks to each employee based on their experience. 
#Take data from the employee record table.


select RANK() OVER (ORDER BY EXP DESC) AS RANKING, emp_record_table.* from emp_record_table;


#11.Write a query to create a view that displays employees in various countries whose salary 
#is more than six thousand. Take data from the employee record table.


select EMP_ID, FIRST_NAME, LAST_NAME, COUNTRY, SALARY from emp_record_table where SALARY > 6000 order by COUNTRY;


#12.	Write a nested query to find employees with experience of more than ten years.
# Take data from the employee record table.


select EMP_ID, FIRST_NAME, LAST_NAME, EXP from emp_record_table where EXP > 10;


/*14.	Write a query using stored functions in the project table to check whether the job profile assigned to each employee in the data science team matches the organization’s set standard.
 
The standard being:
For an employee with experience less than or equal to 2 years assign 'JUNIOR DATA SCIENTIST',
For an employee with the experience of 2 to 5 years assign 'ASSOCIATE DATA SCIENTIST',
For an employee with the experience of 5 to 10 years assign 'SENIOR DATA SCIENTIST',
For an employee with the experience of 10 to 12 years assign 'LEAD DATA SCIENTIST',
For an employee with the experience of 12 to 16 years assign 'MANAGER'. */


select * from emp_record_table where ROLE = "Junior Data Scientist" and EXP <= 2;
select * from emp_record_table where ROLE = "ASSOCIATE DATA SCIENTIST" and EXP between 2 and 5;
select * from emp_record_table where ROLE = "SENIOR DATA SCIENTIST" and EXP between 5 and 10;
select * from emp_record_table where ROLE = "LEAD DATA SCIENTIST" and EXP between 10 and 12;
select * from emp_record_table where ROLE = "MANAGER" and EXP between 12 and 16;



#15.	Create an index to improve the cost and performance of the query to 
#find the employee whose FIRST_NAME is ‘Eric’ in the employee table after checking the execution plan.



create index NAME_1 on emp_record_table where FIRST_NAME = "Eric";


#16.	Write a query to calculate the bonus for all the employees, based on their 
#ratings and salaries (Use the formula: 5% of salary * employee rating).



select * , (0.05*SALARY*EMP_RATING) AS BONUS, (0.05*SALARY*EMP_RATING + SALARY) AS TOTAL_SALARY from emp_record_table;


#17.	Write a query to calculate the average salary distribution based on the continent and country. 
#Take data from the employee record table.


select CONTINENT, COUNTRY, avg(SALARY) AS avg_salary from emp_record_table group by CONTINENT, COUNTRY ORDER BY CONTINENT, COUNTRY;


