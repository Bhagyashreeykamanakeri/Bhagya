/* EMPLOYEE DATABASE */
/Q1/
CREATE DATABASE Employee_db;
/*drop database Employee_db;*/
USE Employee_db;


CREATE TABLE Employee_dtl(
id INT NOT NULL PRIMARY KEY,
ename VARCHAR(60),
company VARCHAR(60),
EXP INT,
salary INT);

DESCRIBE Employee_dtl;
/Q3/

ALTER TABLE Employee_dtl
ADD COLUMN address VARCHAR(100) AFTER company,
ADD COLUMN city VARCHAR(60) AFTER address,
ADD COLUMN state VARCHAR(60) AFTER city,
ADD COLUMN country VARCHAR(60) AFTER state;

DESCRIBE Employee_dtl;
/Q4/

ALTER TABLE Employee_dtl
CHANGE COLUMN id emp_id INT ,
CHANGE COLUMN ename emp_name VARCHAR(60),
CHANGE COLUMN company emp_company VARCHAR(60),
CHANGE COLUMN address emp_address VARCHAR(100),
CHANGE COLUMN city emp_city VARCHAR(60),
CHANGE COLUMN state emp_state VARCHAR(60),
CHANGE COLUMN country emp_country VARCHAR(60),
CHANGE COLUMN EXP emp_Exp INT ,
CHANGE COLUMN salary emp_salary INT ;

DESCRIBE Employee_dtl;
/Q5/
ALTER TABLE employee_dtl
MODIFY COLUMN emp_exp INT AFTER emp_company,
MODIFY COLUMN emp_salary INT AFTER emp_exp;

DESCRIBE employee_dtl;



/Q6/
ALTER TABLE Employee_dtl
MODIFY COLUMN emp_name VARCHAR(150) NOT NULL,
MODIFY COLUMN emp_company VARCHAR(150) NOT NULL,
MODIFY COLUMN emp_address VARCHAR(150) NOT NULL,
MODIFY COLUMN emp_city VARCHAR(150) NOT NULL,
MODIFY COLUMN emp_state VARCHAR(150) NOT NULL,
MODIFY COLUMN emp_country VARCHAR(150) NOT NULL,
MODIFY COLUMN emp_id INT NOT NULL,
MODIFY COLUMN emp_exp INT NOT NULL,
MODIFY COLUMN emp_salary INT NOT NULL;

DESCRIBE Employee_dtl;
/Q7/

INSERT INTO Employee_dtl VALUES(1,'Daniel','Wipro',3,80000,'1st Cross','Bengaluru','Karnataka','India');
INSERT INTO Employee_dtl VALUES(2,'Gun','TCS',5,95000,'2nd Cross','Chennai','Tamil Nadu','India');
INSERT INTO Employee_dtl VALUES(3,'Goo','TECH-M',4,90000,'3rd Cross','Mumbai','Maharashtra','India');
INSERT INTO Employee_dtl VALUES(4,'Johan','Infosys',2,70000,'4th Cross','Hyderabad','Telangana','India');

DESCRIBE Employee_dtl;

INSERT INTO Employee_dtl (emp_id,emp_name,emp_company,emp_exp,emp_salary,emp_address,emp_city,emp_state,emp_country)								
 VALUES(5,'Jinyoung','Wipro',10,120000,'5th Cross','Mumbai','Maharashtra','India');
INSERT INTO Employee_dtl (emp_id,emp_name,emp_company,emp_exp,emp_salary,emp_address,emp_city,emp_state,emp_country)
VALUES(6,'Zack','TCS',3,75000,'6th Cross','Pune','Maharashtra','India');
INSERT INTO Employee_dtl (emp_id,emp_name,emp_company,emp_exp,emp_salary,emp_address,emp_city,emp_state,emp_country)
VALUES(7,'James','TECH-M',6,100000,'7th Cross','Bengaluru','Karnataka','India');
INSERT INTO Employee_dtl (emp_id,emp_name,emp_company,emp_exp,emp_salary,emp_address,emp_city,emp_state,emp_country)
VALUES(8,'Sameul','Infosys',2,65000,'8th Cross','Gokte','Karnataka','India');
DESCRIBE Employee_dtl;

/Q10/

/*FROM Employee_dtl TABLE
SELECT* FROM Employee_dtl;
SELECT* FROM Employee_dtl WHERE emp_company==Wipro OR emp_company==Infosys;
SELECT* FROM Employee_dtl WHERE emp_salary>50000 AND emp_salary<80000;
SELECT* FROM Employee_dtl WHERE emp_city!=Bengaluru AND emp_company==TCS;*/

/Q8/

-- q to fetch details of employee

SELECT * FROM Employee_dtl;

/Q9/

-- q to display name ep etc

SELECT emp_name,emp_exp,emp_city FROM Employee_dtl WHERE emp_company='Infosys' OR emp_company='Wipro';
/Q10/

-- q to display employee b/w 50000 to 80000

SELECT * FROM Employee_dtl WHERE emp_salary<80000 AND emp_salary>50000 

/Q11/

-- q to display the employee not from bangalore but tcs

SELECT * FROM Employee_dtl WHERE emp_city!='Bengaluru' AND emp_company='TCS' ;

/Q12/

-- q to find total amount of salary 

SELECT SUM(emp_salary) FROM Employee_dtl ;

/Q13/

-- q to find heighest salary 

SELECT MAX(emp_exp) FROM Employee_dtl ;

/Q14/

-- q to find first s and end e

SELECT * FROM Employee_dtl WHERE emp_name LIKE 's%' AND emp_city LIKE '%e'  ;

/Q15/

-- q to find avg salary of infosys

SELECT AVG(emp_salary) FROM Employee_dtl WHERE emp_company='Infosys' ;
/Q16/

-- q to find salary of tech m and tcs

SELECT AVG(emp_salary) FROM Employee_dtl WHERE emp_company='TECH-M' OR emp_company='TCS'  ;

-- q to find details specified

/Q17/

SELECT * FROM Employee_dtl WHERE emp_city='Bengaluru' OR emp_city='Mumbai' AND emp_salary>70000 AND emp_exp=3 ;

/Q18/

-- q to display comanyname and empolyee
SELECT emp_company ,COUNT(*)FROM Employee_dtl
GROUP BY emp_company;

SELECT emp_company ,COUNT(emp_id)FROM Employee_dtl
GROUP BY emp_company;

/Q19/

-- SUB QUERIES

-- q to find details of Employee who has highest salary
 
SELECT * FROM Employee_dtl WHERE emp_salary=(SELECT MAX(emp_salary) FROM Employee_dtl);

-- q to find second highest salary of an employee from employee table

/Q20/

SELECT * FROM Employee_dtl WHERE emp_salary=(SELECT MAX(emp_salary) FROM Employee_dtl 
WHERE emp_salary<(SELECT MAX(emp_salary) FROM Employee_dtl));

SELECT * FROM Employee_dtl WHERE emp_salary<(SELECT MAX(emp_salary) FROM Employee_dtl)
ORDER BY emp_salary DESC
LIMIT 1;

/Q21/

-- q to print details of employee who has 4th lowest salary

SELECT MIN(emp_salary) FROM Employee_dtl
WHERE emp_salary > (SELECT MIN(emp_salary) FROM Employee_dtl
WHERE emp_salary > (SELECT MIN(emp_salary) FROM Employee_dtl
WHERE emp_salary > (SELECT MIN(emp_salary) FROM Employee_dtl)));   

/Q22/

-- q to print details of the employee who has max exp or min exp

SELECT * FROM Employee_dtl 
WHERE emp_exp=(SELECT MAX(emp_exp) FROM Employee_dtl) OR emp_exp=(SELECT MIN(emp_exp) FROM Employee_dtl) 

/Q23/

-- q to print average salaries given by each company and display the details in descending order of the company names

SELECT emp_company, AVG(emp_salary) AS average_salary 
FROM Employee_dtl
GROUP BY emp_company
ORDER BY emp_company DESC

/Q24/

-- q to print total no. of Emps from each state and display the details in which the state which contains max no. of Emps is in first position

SELECT emp_state,COUNT(emp_id) AS emp_count
FROM Employee_dtl
GROUP BY emp_state
ORDER BY emp_count DESC	

/Q25/

-- q to display the details of all the emps who works for tcs or infosys but is not residing in B'lore or Mumbai

SELECT * FROM Employee_dtl
WHERE emp_company IN ('TCS' , 'Infosys' )
AND emp_city NOT IN ('Mumbai' , 'Bengaluru');

-- q to display total count of emps who have salary more than 50,000





/Q27/

--  q to update the salary of all the emps by Rs 3000

SELECT * FROM Employee_dtl;
UPDATE Employee_dtl SET emp_salary=emp_salary+3000;

/Q28/

-- q to update the exp of all the emps by 1 yr for those who are working with Tcs

SELECT * FROM Employee_dtl;
UPDATE Employee_dtl SET emp_exp=emp_exp+1 WHERE emp_company='Tcs';

/Q29/

-- q to update the salary of an Emp by 30% and the emp to be considered is the emp who has the max exp

SELECT * FROM Employee_dtl;
UPDATE Employee_dtl SET emp_salary=emp_salary+(emp_salary*0.3)
WHERE emp_exp=(SELECT MAX(emp_exp) FROM Employee_dtl);

/Q30/

-- q to display states in which the emps are present uniquely

SELECT DISTINCT emp_state FROM Employee_dtl;

/Q31/

-- WA Procedure to fetch th structural copy of current table along with its data

