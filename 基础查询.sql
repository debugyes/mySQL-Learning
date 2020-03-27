#进阶1：基础查询
/*
语法：
select 查询列表 from 表名;

类似于：System.out.println(打印东西)

特点：
1.查询列表可以是：表中的字段、常量、表达式、函数
2.查询的结果是一个虚拟的表格
*/

USE myemployees;#要先使用这个库

#1.查询表中单个字段
SELECT last_name FROM employees;

#2.查询表中的多个字段
SELECT last_name, salary, email FROM employees;
#不一定要按照表中的字段顺序

#3.查询表中的所有字段
/*select 
	`first_name`,
	`last_name`,
	`email`,
	`phone_number`,
	`job_id`,
	`salary`,
	`commission_pct`,
	`manager_id`,
	`department_id`,
	`hiredate`
from employees;
*/
#`是着重号，用于区分是字段还是关键字

SELECT * FROM employees;

#4.查询常量值
#常量不用加from表名
SELECT 100;
SELECT 'john';#不区分字符和字符串，都用单引号

#5.表达式
SELECT 100%98;

#6.查询函数
SELECT VERSION();

#7.为字段起别名
/*
1. 便于理解
2. 如果要查询的字段有重名的情况，使用别名可以区分开来
*/
#方式一：使用as
SELECT 100%98 AS 结果;
SELECT last_name AS 姓, first_name AS 名 FROM employees;

#方式二：使用空格
SELECT last_name 姓, first_name 名 FROM employees;

#案例：查询salary，显示结果为out
SELECT salary AS "output" FROM employees;
#这里out是一个关键字，可以把out put用""括起来，sql中""和''都代表字符串，推荐""

#8.去重
#案例：查询员工表中涉及到的所有的部门编号
SELECT DISTINCT department_id FROM employees;

#9.+号
/*
java中的加号
1. 运算符，两个操作数都是数值
2. 连接符，只要有一个操作数为字符串

mysql中的加号：
仅仅只有一个功能：运算符

select 100+90; 两个操作数都为数值型，则做加法运算
select '123'+90; 其中一方为字符型，试图将字符型数值转换成数值型，
			如果转换成功，则继续做加法运算。
select 'john'+90;	如果转换失败，则将字符型的数值转换成0.

select null+10;		参与拼接的只要其中一方为null，则结果肯定为null
*/
#案例：查询员工名和姓连接成一个字段，并显示为 姓名

SELECT CONCAT('a', 'b', 'c') AS 结果;
SELECT 
	CONCAT(last_name, first_name) AS 姓名 
FROM
	employees;




