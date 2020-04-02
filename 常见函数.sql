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

SELECT TRIM('a' FROM 'aaaaaaaaaaaa加aaaaaaaa藤aaaaaaa惠aaaaaa') output
SELECT TRIM('aa' FROM 'aaaaaaa加aaaaaaaa藤aaaaaaa惠aaaaaa') output # 每次去除两个aa，如果数量不够就留在那

#7. Lpad 用指定字符实现左填充指定长度
SELECT LPAD('加藤惠', 10, "*") output;
SELECT LPAD('加藤惠', 2, "*") output; # 最总长度只有2

#8. Rpad 用指定字符实现右填充指定长度
SELECT RPAD('加藤惠', 10, "*") output;
SELECT RPAD('加藤惠', 2, "*") output; # 最总长度只有2

#9. replace 替换
SELECT REPLACE('加藤惠和安艺伦也', '加藤惠', ' ') output;



















