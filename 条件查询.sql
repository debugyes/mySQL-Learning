# 进阶查询
/*
语法
	select
		查询列表
	from
		表名
	where
		筛选条件
筛选条件结果是true/false
执行顺序：from表名-》where筛选条件-》select查询

分类：
1. 按条件表达式筛选
	条件运算符：>=, <=, =(sql里是等于), != <> (这两种都是不等), >, <
2. 按逻辑表达式筛选
	作用：链接条件表达式
	逻辑运算符：&&  ||  !
		    and or not（推荐）
	
	&&和and：两个条件都为true，结果味true，反之为false
	||或or：只要有一个条件为true，结果为true，反之为false
	！或 not：如果连接的条件本身为false，结果为true，反之为false
3. 模糊查询
	like
	between and
	in
	is null
	
*/

USE myemployees;

# 一、按条件表达式筛选
# 案例1:查询员工工资>12000的工资

SELECT 
	*
FROM 
	employees
WHERE 
	salary > 12000;
	
# 案例2：查询部门编号不等于90号的员工名和部门编号
SELECT department_id, CONCAT(first_name, ' ', last_name)
FROM employees
WHERE department_id <> 90;


# 二、按逻辑表达式筛选
#案例1：查询工资在10000在20000之间的员工名、工资以及奖金
SELECT 
	CONCAT(first_name, ' ',last_name), salary, commission_pct
FROM 
	employees
WHERE 
	salary >= 10000 AND salary <= 20000;
	
#案例2：查询部门编号不是在90到110之间，或者工资高于15000的员工信息
SELECT *
FROM employees
WHERE (department_id<90 OR department_id > 110) OR salary > 15000;


# 三、模糊查询
/*
like
	特点：
		1.一般和通配符搭配使用
			 %任意多个字符，包含0个字符
			 _任意单个字符
between and
in
is null|is not null
*/
# 1.like
#案例1：查询员工名中包含字符a的员工信息
SELECT 
	* 
FROM 
	employees
WHERE
	last_name LIKE '%a%';-- %代表前面和后面都有字符

#案例2：查询员工名中第三个字符为e，第五个字符为a的员工名和工资
SELECT 
	last_name,
	salary
FROM
	employees
WHERE
	last_name LIKE '__n_l%';

#案例3：查询员工名中第二个字符为_的员工名
SELECT
	last_name
FROM
	employees
WHERE
	last_name LIKE '_\_%';
	#last_name like '_$_%' escape '$';//使用escape转义
	

#2. between and
/*
1. 使用between and可以提高语句的简洁度
2. 包含临界值
3. 两个临界值不要调换顺序
4. between 左边值 and 右边值；等价于（>=左边值 && <=右边值）
*/

#案例1：查询员工编号在100到120之间的员工信息
SELECT
*
FROM
employees
WHERE
employees >= 100 AND employees <= 120;
#-------------------------------------
SELECT
*
FROM
	employees
WHERE
	employee_id BETWEEN 100 AND 120;


# 3. in
/*
含义：判断某字段的值是否属于in列表中的某一项
特点：
	1.使用in提高语句简洁度
	2.in列表的值类型必须统一，或者兼容
	3.不支持通配符
*/
#案例：查询员工的工种标号IT_PROG、AD_VP、AD_PRES中的一个员工名和工种编号
SELECT
	CONCAT(first_name, last_name) AS 'name',
	job_id
FROM
	employees
WHERE
	(job_id = 'IT_PROT' OR job_id = 'AD_VP' OR job_id = 'AD_PRES');
	
#-------------------------------------------------------------------------
SELECT
	#CONCAT(first_name, ' ',last_name) AS 'name',
	last_name,
	job_id
FROM
	employees
WHERE
	job_id IN ('IT_PROG', 'AD_VP', 'AD_PRES');

# 4. is null
/*
=或<>不能用于判断null值
is null或者is not null可以判断null值
*/

#案例1：查询没有奖金的员工名和奖金率

SELECT 
	CONCAT(first_name, ' ' , last_name) NAME,
	`commission_pct`
FROM 
	employees
WHERE
	commission_pct IS NULL;

# 查询有奖金的

SELECT 
	last_name,
	commission_pct
FROM
	employees
WHERE
	commission_pct IS NOT NULL;

#安全等于 <=> 

#案例1：查询没有奖金的员工名和奖金率

SELECT 
	CONCAT(first_name, ' ' , last_name) NAME,
	`commission_pct`
FROM 
	employees
WHERE
	commission_pct <=> NULL;

#案例2：查询工资为12000的员工信息
SELECT 
	last_name,
	salary
FROM
	employees
WHERE
	salary <=> 12000;

/*
is null 和 <=> 的区别
is null:仅仅可以判断null
<=>: 即可以判断null，又可以判断普通的数值
*/

 