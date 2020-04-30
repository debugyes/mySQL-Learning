#进阶4：常见函数
/*
概念：类似于java中的方法，将一组逻辑语句封装在方法体中，对外暴露方法名
好处：  1.隐藏了实现细节
	2.提高代码的复用性
调用：select 函数名(实参列表) 【from 表】; 
使用表的字段时，要添加from 表
特点：
	1.叫什么（函数名）
	2.干什么（函数功能）
分类:
1. 单行函数
如concat、length、ifnull等
2. 分组函数
*/

USE myemployees;

#一、字符函数
#1. length 获取参数值的字节个数，一个汉字占3个字节，一个数字占1个字节。
SELECT LENGTH('张三22');

SHOW VARIABLES LIKE "%char%"
#2. concat 拼接字符串
SELECT CONCAT(last_name, '_', first_name) 姓名 FROM employees;

#3. upper、lower
SELECT UPPER('John');
SELECT LOWER('JOHN');

#实例：将姓大写，名小节，然后拼接
SELECT CONCAT(UPPER(last_name), ' ', LOWER(first_name)) 姓名 FROM employees;

#4. substr/substring 
#注意：索引从1开始
SELECT SUBSTR('加藤惠', 3) output;#截取从指定索引处后面所有字符
SELECT SUBSTR('加藤惠', 1, 3) output;#截取从指定索引处指定字符长度的字符

#案例：姓名中首字符大写，其他字符小写然后用_拼接，显示出来
SELECT CONCAT(UPPER(SUBSTR(last_name, 1, 1)), '_', LOWER(SUBSTR(last_name, 2))) output 
FROM employees;

#5. instr 返回字串第一次出现的索引，如果找不到返回0

SELECT INSTR('加藤惠和安艺伦也', '加藤惠') AS out_put;

#6. trim 去除前后空格
SELECT TRIM('         加藤惠          ') AS out_put;

SELECT TRIM('a' FROM 'aaaaaaaaaaaa加aaaaaaaa藤aaaaaaa惠aaaaaa') output;
SELECT TRIM('aa' FROM 'aaaaaaa加aaaaaaaa藤aaaaaaa惠aaaaaa') output; # 每次去除两个aa，如果数量不够就留在那

#7. Lpad 用指定字符实现左填充指定长度
SELECT LPAD('加藤惠', 10, "*") output;
SELECT LPAD('加藤惠', 2, "*") output; # 最总长度只有2

#8. Rpad 用指定字符实现右填充指定长度
SELECT RPAD('加藤惠', 10, "*") output;
SELECT RPAD('加藤惠', 2, "*") output; # 最总长度只有2

#9. replace 替换
SELECT REPLACE('加藤惠和安艺伦也', '加藤惠', ' ') output;

#二、数学函数

#round 四舍五入
SELECT ROUND(-1.55); #先四舍五入绝对值再加上+/-
SELECT ROUND(1.567,2); #小数点后保留两位

#ceil 向上取整 返回>=该参数的最小整数
SELECT CEIL(1.52);
SELECT CEIL(1.0);

SELECT CEIL(-1.02);

#floor 向下取整 返回<=该参数的最大整数
SELECT FLOOR(9.99);
SELECT FLOOR(-9.99);

#truncate 截断
SELECT TRUNCATE(1.65, 1); #小数点后保留1位

#mod 取余
/*
MOD(a, b) ：a-a/b*b

MOD(-10, -3): -10-(-10)/(-3) * (-3)
*/
SELECT MOD(-10, -3);
SELECT 10 % 3;

#三、日期函数

#now返回当前系统日期+时间
SELECT NOW();

#curdate 返回当前系统日期，不包含时间
SELECT CURDATE();

#curtime 返回当前时间，不包含时间
SELECT CURTIME();

#可以获取指定的部分，年、月、日、小时、分钟、秒
SELECT YEAR(NOW()) 年;
SELECT YEAR('1998-1-1') 年;
SELECT YEAR(hiredate) 年 FROM employees;

SELECT MONTH(NOW()) 月;
SELECT MONTHNAME(NOW()) 月

SELECT DAY(NOW()) 日;

SELECT HOUR(NOW()) 小时;

SELECT MIN(NOW()) 分;

#str_to_date 将字符通过指定的格式转换成日期
SELECT STR_TO_DATE('1998-3-2', '%Y-%c-%d') AS output;

#查询入职时间为1992-4-3的员工信息
SELECT * FROM employees WHERE hiredate = STR_TO_DATE('4-3 1992', '%c-%d %Y');

#date_format 将日期转换成字符
SELECT DATE_FORMAT(NOW(), '%y年%m月%d日') AS output;

#查询有奖金的员工名和入职日期(xx月xx日xx年)
SELECT last_name, DATE_FORMAT(hiredate, '%m月/%d日 %y年') 入职日期
FROM employees
WHERE commission_pct IS NOT NULL;

