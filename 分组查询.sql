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

  特点：
    1.分组查询中的筛选条件分为两类
                    数据源                                                位置                   关键字
        分组前筛选    原始表（原始表就能筛选的用where）                         group by子句的前面     where
        分组后筛选    分组后的结果集（非原始表，需要进行二次筛选的要用having）      group by子句的后面     having

        (1)分组函数做条件肯定是放在having子句中
        (2)能用分组前筛选的就优先使用分组前筛选
        (3)group by和having后都可以用别名，where不行
    2.group by子句支持单个字段分组、多个字段分组（多个字段之间没有顺序要求），表达式或函数(用的较少)
    3.也可以添加排序（排序放在整个分组查询的最后）
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

#按表达式/函数分组
#案例：按员工姓名长度分组，查询每一组的员工个数，筛选员工个数>5的有哪些
#1.查询每个长度的员工个数
select COUNT(*), LENGTH(last_name)
from employees
group by LENGTH(last_name);
#2.添加筛选条件
select COUNT(*) c, LENGTH(last_name) len_name
from employees
group by len_name
having c > 5;

#按多个字段进行分组
#案例：查询每个部门，每个工种的员工的平均工资
select AVG(salary), department_id, job_id
from employees
group by department_id, job_id; #当department_id和job_id都相同的时候才是同一个分组

#添加排序
#案例：查询每个部门，每个工种的员工的平均工资,并且按工资高低显示
select AVG(salary), department_id, job_id
from employees
where department_id is not null
group by department_id, job_id
having AVG(salary) > 10000
order by AVG(salary) desc;

