#进阶6: 连接查询
/*
 含义：又称多表查询，当查询的字段来自多个表时，就回用到连接查询

笛卡尔乘积现象：表1 有m行，表2有n行，结果m*n行

发生原因：没有有效的连接条件
如何避免：添加上有效的连接条件

分类：
    按年代分类：
        sql92标准：仅支持内连接
        sql99标准：【推荐】支持内连接+外连接（左外和右外）+交叉连接

    按功能进行分类
        内连接：
            等值连接
            非等值连接
            自连接
        外连接：
            左外连接
            右外连接
            全外连接
        交叉连接
 */
USE girls;

# 一、示例
 SELECT * FROM beauty;
 SELECT * FROM boys;

 SELECT NAME, boyName 
 FROM boys, beauty
 WHERE beauty.boyfriend_id = boys.id;

# 二、sql92标准
#1、等值连接

#案例1：查询女生名和对应的男生名
 SELECT NAME, boyName 
 FROM boys, beauty
 WHERE beauty.boyfriend_id = boys.id;

#案例2：查询员工名和对应的部门名
SELECT last_name, department_name
FROM employees, departments
WHERE employees.depatment_id = depatments.department_id;

#2、为表起别名
/*
1. 提高语句的简洁度
2. 区分多个重名的字段

注意：
如果为表起了别名，则查询的字段就不能使用原来的表名去限定
*/
# 查询员工名、工种号、工种名
SELECT last_name, e.job_id, job_title
FROM employees AS e, jobs j
WHERE e.job_id = j.job_id;