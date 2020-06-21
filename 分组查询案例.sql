use myemployees;
/*
1.查询各job_id的员工工资的最大值，最小值，平均值，总和，并按job_id升序
2.查询员工最高工资和最低工资的差距(DIFFERENCE)
3.查询各个管理者手下员工的最低工资，其中最低工资不能低于6000，没有管理者的员工不计算在内
4.查询所有部门的编号，员工数量和工资平均值,并按平均工资降序
5.选择具有各个job_ id的员工人数
*/

#1.
select MAX(salary), MIN(salary), AVG(salary), SUM(salary), job_id
from employees
group by job_id
order by job_id asc;

#2.
select MAX(salary)-MIN(salary) DIFFERENCE
from employees;

#3.
select manager_id, MIN(salary)
from employees
where manager_id is not null
group by manager_id
having MIN(salary) >= 6000;

#4.
select department_id, COUNT(*), AVG(salary)
from employees
group by department_id
order by AVG(salary) desc;

#5.
select job_id, COUNT(*)
from employees
group by job_id;
