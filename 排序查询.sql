#进阶3：排序查询
/*
语法：
	select 查询列表
	from 表
	【where 筛选条件】
	order by 排序列表 【asc|desc】
	
	
特点：
	1. desc降序asc升序，如果不写默认升序
	2. order by子句中可以支持单个字段、多个字段、表达式、函数、别名
	3. order by子句一般放在查询语句的最后面，limit子句除外
	
*/
USE myemployees;

#案例1：查询员工信息，要求工资从高到低排序【按字段排序】
SELECT * FROM employees ORDER BY salary DESC;
SELECT * FROM employees ORDER BY salary ASC;

#案例2：查询部门编号大于等于90的员工信息，按入职时间先后排序【按字段排序】
SELECT 
	* 
FROM 
	employees
WHERE
	department_id >= 90
order by
	hiredate;

#案例3: 按年薪的高低显示员工的信息和年薪【按表达式排序】
select *, salary*12*(1+IFNULL(commission_pct, 0)) as "年薪"
from employees
order by salary*12*(1+ifnull(commission_pct, 0)) desc;

#案例4：按年薪的高低显示员工的信息和年薪【按表达式排序的别名】
SELECT *, salary*12*(1+IFNULL(commission_pct, 0)) AS "年薪"
FROM employees
ORDER BY "年薪" DESC;

#案例5：按姓名的长度显示员工的姓名和工资【按函数排序】
select length(last_name) 字节长度, last_name, salary
from employees
order by 字节长度 desc;

#案例6：查询员工信息，要求先按工资升序，再按员工编号降序【查询多个】
select *
from employees
order by salary asc, employee_id desc;