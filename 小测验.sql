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

