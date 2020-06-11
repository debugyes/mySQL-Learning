#进阶5 分组查询
/*
  语法：
	select 分组函数,列(要求出现在group by后面)
	from 表
	【where 筛选条件】
	group by 分组的列表
	【order by 子句】
  注意：
	查询列表必须特殊，要求是分组函数和group by后出现的字段
	
*/
USE myemployees;

#引入：查询每个部门的平均工资
SELECT AVG(salary) FROM employees;

#案例1：查询每个工种的最高工资
SELECT MAX(salary), job_id
FROM employees
GROUP BY job_id;

#案例2：查询每个位置上的部门个数
SELECT COUNT(*), location_id
FROM departments
GROUP BY location_id;