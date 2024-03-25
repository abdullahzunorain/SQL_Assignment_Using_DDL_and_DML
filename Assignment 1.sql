/*
Create a table called  employees with the following columns and datatypes:

ID - INT autoincrement
last_name - VARCHAR of size 50 should not be null
first_name - VARCHAR of size 50 should not be null
age - INT
job_title - VARCHAR of size 100
date_of_birth - DATE
phone_number - INT
insurance_id - VARCHAR of size 15

SET ID AS PRIMARY KEY DURING TABLE CREATION
*/

CREATE TABLE employees ( 
ID INT AUTO_INCREMENT PRIMARY KEY,
LAST_NAME VARCHAR(50) NOT NULL,
FIRST_NAME VARCHAR(50) NOT NULL,
AGE int,
JOB_TITLE VARCHAR(100),
DATE_OF_BIRTH DATE,
PHONE_NUMBER BIGINT,    -- i did research on it, and concluded that `bigint` will be a better option here.
INSURANCE_ID VARCHAR(15)
);

/*
Add the following data to this table in a SINGLE query:

Smith    | John    | 32 | Manager   		   | 1989-05-12 | 5551234567   | INS736 |
Johnson  | Sarah   | 28 | Analyst    		   | 1993-09-20 | 5559876543   | INS832 |
Davis    | David   | 45 | HR       			   | 1976-02-03 | 5550555995   | INS007 |
Brown    | Emily   | 37 | Lawyer               | 1984-11-15 | 5551112022   | INS035 |
Wilson   | Michael | 41 | Accountant           | 1980-07-28 | 5554403003   | INS943 |
Anderson | Lisa    | 22 | Intern               | 1999-03-10 | 5556667777   | INS332 |
Thompson | Alex    | 29 | Sales Representative | 5552120111 | 555-888-9999 | INS433 |

*/

INSERT INTO employees (last_name, first_name, age, job_title, date_of_birth, phone_number, insurance_id)
VALUES
('Smith', 'John', 32, 'Manager', '1989-05-12', 5551234567, 'INS736'),
('Johnson', 'Sarah', 28, 'Analyst', '1993-09-20', 5559876543, 'INS832'),
('Davis', 'David', 45, 'HR', '1976-02-03', 5550555995, 'INS007'),
('Brown', 'Emily', 37, 'Lawyer', '1984-11-15', 5551112022, 'INS035'),
('Wilson', 'Michael', 41, 'Accountant', '1980-07-28', 5554403003, 'INS943'),
('Anderson', 'Lisa', 22, 'Intern', '1999-03-10', 5556667777, 'INS332'),
('Thompson', 'Alex', 29, 'Sales Representative', null, 5552120111, 'INS433');

SELECT * FROM employees;


-- While inserting the above data, you might get error because of Phone number column.
-- As phone_number is INT right now. Change the datatype of phone_number to make them strings of FIXED LENGTH of 10 characters.
-- // alter table employees 
-- // modify column PHONE_NUMBER char(10);  -- we can do this method too, to solve the problem...

-- Do some research on which datatype you need to use for this.
-- // alter table employees modify column PHONE_NUMBER bigint;



-- Explore unique job titles
SELECT distinct JOB_TITLE FROM employees;

-- Name the top three youngest employees
SELECT concat(FIRST_NAME,' ',LAST_NAME) AS top_3_youngest_employees FROM employees ORDER BY AGE LIMIT 3;
SELECT * FROM employees;


Set sql_safe_updates = 0;

-- Update date of birth for Alex Thompson as it is 1992-06-24
update employees
set DATE_OF_BIRTH = "1992-06-24"
where last_name = "Thompson";

SELECT * FROM employees;


-- Delete the data of employees with age greater than 30
delete from employees where age>30;
SELECT * FROM employees;

-- Concatenating First name and Last name:
select concat(FIRST_NAME, ' ',LAST_NAME) AS FULL_NAME from employees;


/*-- Create a table called employee_insurance with the following columns and datatypes:

insurance_id VARCHAR of size 15
insurance_info VARCHAR of size 100

Make insurance_id the primary key of this table
*/
create table employee_insurance (
insurance_id VARCHAR(15) primary key,
insurance_info VARCHAR(100)
);

select * from employee_insurance;

/*
Insert the following values into employee_insurance:

"INS736", "unavailable"
"INS832", "unavailable"
"INS007", "unavailable"
"INS035", "unavailable"
"INS943", "unavailable"
"INS332", "unavailable"
"INS433", "unavailable"

*/

insert into employee_insurance
values 
("INS736", "unavailable"),
("INS832", "unavailable"),
("INS007", "unavailable"),
("INS035", "unavailable"),
("INS943", "unavailable"),
("INS332", "unavailable"),
("INS433", "unavailable");

select * from employee_insurance;


-- Add a column called email to the employees table. Remember to set an appropriate datatype
ALTER TABLE employees
ADD COLUMN email VARCHAR(20);

select * from employees;

-- Add the value "unavailable" for all records in email in a SINGLE query
update employees set email = "unavailable";

select * from employees;
