/*1.显示系统时间(注:日期+时间)
2.查询员工号，姓名，工资，以及工资提高百分之208后的结果(NEW salary)
3.将员工的姓名按首字母排序，并写出姓名的长度(LENGTH)
4.做一个查询，产生下面的结果
<last_ name> earns <salary> monthly but wants <salary*3>
Dream salary
King earns 24000 monthly but wants 72000
5.使用CASE-WHEN，按照下面的条件:
job		grade
AD PRES		A
ST_ MAN		B
IT_ PROG	C

产生下面结果
Last_name    Job_id	Grade
king         AD_PRES      A
*/

USE myemployees

#1.
SELECT NOW();

#2.
SELECT employee_id, last_name, salary,
salary * 2.08 AS "new salary"
FROM employees;

#3.
SELECT LENGTH(last_name),SUBSTR(last_name, 1, 1) 首字符, last_name
FROM employees
ORDER BY 首字符 ASC;

#4.
SELECT CONCAT(last_name, ' earns ', salary, ' monthly but wants ',salary * 3) AS "Dream Salary"
FROM employees;

#5.
SELECT 
	last_name AS Last_name,
	job_id AS Job_id,
	CASE
	WHEN job_id = 'AD_PRES' THEN 'A'
	WHEN job_id = 'ST_MAN' THEN 'B'
	WHEN job_id = 'IT_PROG' THEN 'C'
	WHEN job_id = 'SA_REP' THEN 'D'
	WHEN job_id = 'ST_CLERK' THEN 'E'
	END AS Grade
FROM employees
WHERE job_id = 'AD_PRES';
