USE myemployees;
#1. 查询公司员工工资的最大值，最小值，平均值，总合
SELECT 
	MAX(salary) max_salary, 
	MIN(salary) min_salary, 
	ROUND(AVG(salary), 2) min_salary, 
	SUM(salary) sum_salary
FROM employees;

#2. 查询员工表中的最大入职时间和最小入职时间的相差天数(DIFFERENCE)
SELECT DATEDIFF(MAX(hiredate), MIN(hiredate)) DIFFERENCE FROM employees;

#3. 查询部门编号为90的员工个数
SELECT COUNT(*) 个数
FROM employees
WHERE department_id = 90;