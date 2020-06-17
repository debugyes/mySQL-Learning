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

  原始表就能筛选的用where
  非原始表，需要进行二次筛选的要用having
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

#添加分组前的筛选条件
#案例1：查询邮箱中包含a字符的，每个部门的平均工资
select AVG(salary), department_id
from employees
where email like '%a%'
group by department_id;

#案例2：查询有奖金的每个手下员工的最高工资
select MAX(salary), manager_id
from employees
where commission_pct is not null
group by manager_id;

#添加分组后进一步的筛选条件
#案例1：查询哪个部门的员工个数大于2
#1.查询每个部门的员工个数
select COUNT(*), department_id
from employees
group by department_id;
#2.根据第一步的结果进行筛选，查询哪个部门的员工个数大于2
select COUNT(*), department_id
from employees
group by department_id
having count(*) > 2;

#案例2：查询每个工种有奖金的员工的最高工资>12000的工种编号和最高工资
#1.每个工种有奖金的员工的最高工资
select MAX(salary), job_id
from employees
where commission_pct is not null
group by job_id;
#2.根据1的结果继续筛选最高工资>12000
select MAX(salary), job_id
from employees
where commission_pct is not null
group by job_id
having MAX(salary)>12000;
#3.查询领导编号>102的每个领导手下的最低工资>5000的领导编号是哪个，以及其最低工资
select MIN(salary), manager_id
from employees
where manager_id > 102
group by manager_id
having MIN(salary) > 5000;


