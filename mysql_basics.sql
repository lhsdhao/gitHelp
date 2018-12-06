-- 所有数据库
SHOW DATABASES;
-- 创建数据库
CREATE DATABASE DATABASENAME;
-- 删除数据库
DROP DATABASE DATABASENAME;
-- 切换数据库
USE DATABASENAME;

-- 显示所有表
-- SHOW TABLES;

-- 显示表结构
SHOW COLUMNS FROM TABLE_NAME;    或使用 DESC TABLE_NAME

-- 显示表索引
SHOW INDEX FROM TABLE_NAME;

TINYINT 极小数值
SMALLINT   小数值
MEDIUMINT 中等数值
INT 大数值
BIGINT 超大数值
FLOAT 单精度
DOUBLE 双精度

-- 时间和日期~~~~~
DATE    	    YYYY-MM-DD
TIME         HH:MM:SS
DATETIME    	YYYY

-- 字符串类型

CHAR 定长字符串 0-255
VARCHAR 变长字符串 	0-65535 字节
TINYBLOB 不超过 255 个字符的二进制字符串
TINYTEXT 不超过 255 个字符的字符串
TEXT    大字符串
BLOB    大二进制数据

-- 注:
-- UTF－8：一个汉字＝3个字节
-- GBK：一个汉字＝2个字节

-- 创建数据表

mysql> CREATE TABLE students(
    -> id INT NOT NULL AUTO_INCREMENT,
    -> name VARCHAR(12) NOT NULL,

    --datatime 设置为当前时间 -> 
    -birthday datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
    -> city VARCHAR(40) NOT NULL,
    主键-> PRIMARY KEY(id))engine=InnoDB DEFAULT CHARSET=utf8;
    Query OK, 0 rows affected (0.04 sec)

-- 删除数据表
DROP TABLE TABLE_NAME;

-- 插入数据
INSERT INTO TABLE_NAME(field1,field2,)VALUES(val1,val2);

-- 查询数据
SELECT * FROM TABLE_NAME  --*表示字段

--模糊查询 LIKE替代等号
SELECT * FROM TABLE_NAME WHERE name LIKE '李%松';

--UNION 对多张表查询的结果,打包成一个集合,可用 WHERE
SELECT name FROM table1 UNION SELECT name FROM table2;

--排序查询 默认升序,降序在age后面加上desc;
SELECT * FROM TABLE_NAME ORDER BY age;

--分组查询 例如统计每个年龄有多少人,count,avg,cum
SELECT age,conut(age) from TABLE_NAME GROUP BY age;

--多表组合查询, 例如查询表1和表2中name相同的值,打印出来
SELECT TB1.name,TB2.city from TB1 INNER JOIN TB2 ON TB1.name = TB2.name WHERE TB1.ID>1;

--正则匹配 REGEXP 代替运算符
SELECT * FROM TB1 WHERE name REGEXP '^xx$';

-- 条件查询where,运算符,NAD OR , >< >= <= !=
SELECT * FROM TABLE_NAME WHERE id > 5;
SELECT * FROM TABLE_NAME WHERE name = '张三';

-- 注意:WHERE 后面查找的字符串默认是不区分大小写的,
如果要区分大小写,应该在 WHERE 后米加上 BINARY name = 'Alex';

-- 修改数据表的那种,配合 WHERE 使用,口味更佳
UPDATE TABLE_NAME SET field1 = 'value',field2 = 'value2' WHERE id < 2;. field字段的意思

--删除数据
DELETE FROM TABLE_NAME WHERE id>2;

-- MYSQL事务(后悔药)  原子性,一致性,隔离性,持久性
-- 原子性：一个事务（transaction）中的所有操作，要么全部完成，要么全部不完成，不会结束在中间某个环节。事务在执行过程中发生错误，会被回滚（Rollback）到事务开始前的状态，就像这个事务从来没有执行过一样。
-- 一致性：在事务开始之前和事务结束以后，数据库的完整性没有被破坏。这表示写入的资料必须完全符合所有的预设规则，这包含资料的精确度、串联性以及后续数据库可以自发性地完成预定的工作。
-- 隔离性：数据库允许多个并发事务同时对其数据进行读写和修改的能力，隔离性可以防止多个事务并发执行时由于交叉执行而导致数据的不一致。事务隔离分为不同级别，包括读未提交（Read uncommitted）、读提交（read committed）、可重复读（repeatable read）和串行化（Serializable）。
-- 持久性：事务处理结束后，对数据的修改就是永久的，即便系统故障也不会丢失。
-- 开启事务 BIGIN;一顿操作
-- 发现错误 ROLLBACKL;继续更改;
--更改完成确定提交 COMMIT;
-- //--------------------------

-- 修改数据表结构-字段 ALERT
-- 删除数据表中的字段当前字段为空时
ALTER TABLE TABLE_NAME DROP 字段名;

--添加字段
ALTER TABLE TABLE_NAME ADD 字段名 类型;

--**修改字段类型
ALTER TABLE TABLE_NAME MODIFY 字段名 新类型;

--**修改字段名及类型
ALTER TABLE TABLE_NAME CHANGE 原字段 新字段 新类型;

-- 修改当前字段的默认值,用到连个ALTER
ALTER TABLE TABLE_NAME ALERT field SET DEFAULT 20;

-- MYSQL 索引
-- 创建索引
CREATE INDEX indexNmae on TABLE_NAME(field);

--删除索引
DROP INDEX indexName on TABLE_NAME;

-- 索引详情参考 https://www.cnblogs.com/bypp/p/7755307.html

-- MYSQL创建临时表,退出即销毁
CREATE temporary table TABLE_NAME(...);

-- 复制MYSQL表单
CREATE TABLE 目标表单 LIKE 源表单;
INSERT INTO 目标表单 SELECT * FROM 源表单;

-- MYSQL导出表的内容
SELECT * FROM TABLE_NAME INTO OUTFILE '/TMP/XX.txt';

--MYSQL导出表的格式文件(包含这个表中所有需要的命令)
mysqldump -u root -p DATABASENAME TABLE_NAME > dump.txt

--导出数据库
 mysql -u root -p database_name < dump.txt

 --导入数据库
 mysqlimport -u root -p --local database_name dump.txt

 






