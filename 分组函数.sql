# 二、分组函数
/*
功能：用作统计使用，又称为聚合函数或统计函数或组函数

分类：
sum求和
avg平均值
max最大值
min最小值
count计算个数

特点：
1. sum、avg一般用用户处理数值类型
   max、min、count可以处理任何类型
   
2. 是否忽略null值
*/
USE myemployees;

#1、简单使用
SELECT SUM(salary) FROM employees;
SELECT AVG(salary) FROM employees;
SELECT MAX(salary) FROM employees;
SELECT MIN(salary) FROM employees;
SELECT COUNT(salary) FROM employees;

SELECT 
	SUM(salary) 和, 
	AVG(salary) 平均, 
	MAX(salary) 最高, 
	MIN(salary) 最低,
	COUNT(salary) 个数
FROM employees;

SELECT 
	SUM(salary) 和, 
	ROUND(AVG(salary), 2) 平均, 
	MAX(salary) 最高, 
	MIN(salary) 最低,
	COUNT(salary) 个数
FROM employees;

#2、参数类型支持哪些类型
SELECT SUM(last_name), AVG(last_name) FROM employees;#error

SELECT 
	MAX(last_name), 
	MIN(last_name), 
	COUNT(last_name)
FROM employees;

SELECT MAX(hiredate), MIN(hiredate) FROM employees;

SELECT COUNT(last_name) FROM employees;

SELECT COUNT(commission_pct) FROM employees;#只计算不为null的个数

#3. 忽略null
SELECT SUM(commission_pct), AVG(commission_pct), SUM(commission_pct)/35, SUM(commission_pct)/107 FROM employees;
