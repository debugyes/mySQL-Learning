# 二、分组函数
/*
功能：用作统计使用，又称为聚合函数或统计函数或组函数

分类：
sum求和
avg平均值
max最大值
min最小值
count计算非空值个数

特点：
1. sum、avg一般用用户处理数值类型
   max、min、count可以处理任何类型
   
2. 是否忽略null值
   sum、avg、max、min、count忽略null值
   
3. 可以和distinct搭配使用实现去重的运算

4. count函数的单独介绍
   一般使用count(*)用作统计行数
   
5. 和分组函数一同查询的字段要求是group by后的字段
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
SELECT 
	SUM(commission_pct), 
	AVG(commission_pct), 
	SUM(commission_pct)/35, 
	SUM(commission_pct)/107 
FROM employees;

SELECT MAX(commission_pct), MIN(commission_pct) FROM employees;

SELECT COUNT(commission_pct) FROM employees;

#4. 和distinct搭配
SELECT SUM(DISTINCT salary), SUM(salary) FROM employees;

SELECT COUNT(DISTINCT salary) FROM employees;

#5. count函数的详细介绍
SELECT COUNT(salary) FROM employees;

SELECT COUNT(*) FROM employees; #用于查询行数
SELECT COUNT(1) FROM employees; #count中加任意常量值皆可，相当于在表里加了一列全是常量，然后计常量列的个数

MYISAM 搜索引擎下，count(*)的效率高
INNODB 搜索引擎下，count(*)和count(1)的效果差不多，比count(字段)要高一些(因为有个判断的过程)

#6、和分组函数一同查询的字段有限制
SELECT AVG(salary), employee_id FROM employees; #不规则的表格，两个字段长短不一
