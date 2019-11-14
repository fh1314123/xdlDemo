drop  database   examdb34;
create  database  examdb34;
use   examdb34;
create  table  et_admin(
    id   int  auto_increment,
    name   varchar(30),
    password  varchar(30),
    constraint  et_admin_id_pk primary key(id)
);
insert into et_admin values(1,'abc','123');

create  table   et_user(
	id	INT  auto_increment,
	username	VARCHAR(20),
	truename	VARCHAR(10),
	password	CHAR(40)  not null,
	email	VARCHAR(40),
	phone	VARCHAR(20),
	add_date	TIMESTAMP ,
	expire_date	TIMESTAMP ,
	add_by	INT,
	enabled	INT default 0,
	field_id	INT,
	last_login_time	TIMESTAMP,
	login_time	TIMESTAMP,
	province	VARCHAR(20),
	company	VARCHAR(40),
	department	VARCHAR(20),
	classID	INT,
	constraint  et_user_id_pk  primary key(id),
	constraint  et_user_username_uk  unique(username)
);
insert  into  et_user(username,password,expire_date) values('abcdef','123456',now());  


CREATE TABLE  et_knowledge_point(
point_id	INT   AUTO_INCREMENT,	
point_name	VARCHAR(100),	
memo	VARCHAR(100),	
state	DECIMAL	DEFAULT 1,
CONSTRAINT  et_knowledge_point_point_id_pk
  PRIMARY KEY(point_id),
CONSTRAINT  et_knowledge_point_point_name_uk 
  UNIQUE(point_name) 
);
INSERT  INTO  et_knowledge_point(point_name,memo)  VALUES('关系型数据库','和关系型数据库有关');
INSERT  INTO  et_knowledge_point(point_name,memo)  VALUES('SQL语句的分类','和SQL语句分类有关');
INSERT  INTO  et_knowledge_point(point_name,memo)  VALUES('SQL语句的基本查询','和SQL语句单表操作有关');
INSERT  INTO  et_knowledge_point(point_name,memo)  VALUES('SQL语句的分页查询','和SQL语句分类页有关');
INSERT  INTO  et_knowledge_point(point_name,memo)  VALUES('SQL语句的表连接','和SQL语句多表有关');
INSERT  INTO  et_knowledge_point(point_name,memo)  VALUES('SQL语句DDL','和建表删除改表有关'); 
INSERT  INTO  et_knowledge_point(point_name,memo)  VALUES('SQL事务','和数据库的事务有关');
INSERT  INTO  et_knowledge_point(point_name,memo)  VALUES('SQL视图','和SQL语句视图有关');
INSERT  INTO  et_knowledge_point(point_name,memo)  VALUES('数据库存储过程','和SQL存储过程有关');
INSERT  INTO  et_knowledge_point(point_name,memo)  VALUES('JDBC访问数据库','和java访问数据库有关'); 
INSERT  INTO  et_knowledge_point(point_name,memo)  VALUES('Spring框架构成','和框架模块有关');
INSERT  INTO  et_knowledge_point(point_name,memo)  VALUES('Spring中的IOC','IOC有关');
INSERT  INTO  et_knowledge_point(point_name,memo)  VALUES('Spring中的DI','DI操作有关');
INSERT  INTO  et_knowledge_point(point_name,memo)  VALUES('Spring中的DAO','Spring访问数据库');
INSERT  INTO  et_knowledge_point(point_name,memo)  VALUES('Spring中的MVC核心组件','和MVC的相关的组件');
INSERT  INTO  et_knowledge_point(point_name,memo)  VALUES('Spring中控制器接受参数和传递数据','控制器接受参数和传递数据'); 
INSERT  INTO  et_knowledge_point(point_name,memo)  VALUES('Spring中的事务管理','Spring和数据库的事务有关');
INSERT  INTO  et_knowledge_point(point_name,memo)  VALUES('Spring中的AOP','面向切面编程有关');
INSERT  INTO  et_knowledge_point(point_name,memo)  VALUES('AOP中的通知','五种通知类型有关');
INSERT  INTO  et_knowledge_point(point_name,memo)  VALUES('Spring中的标注','Spring标注相关'); 

SELECT * FROM et_knowledge_point;

/* 建立问题类型表  并插入数据 */
create  table  et_question_type(
    id	INT auto_increment,
    name	VARCHAR(20) not null,
    subjective	INT  default  0  not null,
    constraint   et_question_type_id_pk primary key(id)
);
insert into   et_question_type  values(1,'选择题',0);
insert into   et_question_type  values(4,'主观题',1);
/** 问题表 */
CREATE TABLE  et_question(
	id	INT  AUTO_INCREMENT,
	description	VARCHAR(1000)	NOT NULL,
	question_type_id	INT,
	points	INT,		
	group_id	INT,		
	is_visible	INT	NOT NULL,
	create_time	TIMESTAMP,		
	creator	VARCHAR(20)  DEFAULT 'admin'	NOT NULL,
	last_modify	TIMESTAMP ,	
	answer	TEXT	NOT NULL,
	expose_times	INT	DEFAULT 1	NOT NULL,
	right_times	INT	DEFAULT 1	NOT NULL,
	wrong_times	INT	DEFAULT 1	NOT NULL,
	difficulty	DOUBLE	DEFAULT 1	NOT NULL,
	analysis	TEXT,		
	reference	VARCHAR(1000),		
	examing_point	VARCHAR(5000),		
	keyword	VARCHAR(5000),
	CONSTRAINT et_question_id_pk PRIMARY KEY(id),
	CONSTRAINT et_question_question_type_id_fk 
	   FOREIGN KEY(question_type_id) REFERENCES et_question_type(id)		
);

/** 问题和 知识点的关联表 */

create table  et_question_2_point(
    question_2_point_id	INT  auto_increment,
    question_id	INT,
    point_id	INT,
    constraint   et_question_2_point_question_2_point_id_pk 
       primary key(question_2_point_id),
    constraint   et_question_2_point_question_id_fk 
       FOREIGN KEY(question_id) REFERENCES et_question(id),
    constraint   et_question_2_point_point_id_fk 
       FOREIGN KEY(point_id) REFERENCES et_knowledge_point(point_id)        
);

CREATE TABLE  et_question_2_option(
    question_2_option_id	INT  AUTO_INCREMENT,
    question_id	INT,
    option_name	CHAR(2),
    option_content VARCHAR(300),
    CONSTRAINT   et_question_2_option_question_2_option_id_pk 
       PRIMARY KEY(question_2_option_id),
    CONSTRAINT   et_question_2_option_question_id_fk 
       FOREIGN KEY(question_id) REFERENCES et_question(id)
);
/** 创建一张试卷表 */
create  table  et_paper(
	id	INT  auto_increment,
	name	VARCHAR(40),
	duration	INT,
	total_point	INT,
	pass_point	INT,
	is_visible	TINYINT,
	status	TINYINT,
	create_time	TIMESTAMP,
	summary	VARCHAR(1000),
	is_subjective	TINYINT,
	answer_sheet	TEXT,
	creator	VARCHAR(40),
	difficulty	double,
	sum_score   double,
	constraint  et_paper_id_pk  primary key(id)
);

CREATE TABLE  et_user_2_paper(
    et_user_2_paper_id	INT  AUTO_INCREMENT,
    user_id	INT,
    paper_id int,
    CONSTRAINT   et_user_2_paper_et_user_2_paper_id_pk 
       PRIMARY KEY(et_user_2_paper_id),
    CONSTRAINT   et_user_2_paper_user_id_fk 
       FOREIGN KEY(user_id) REFERENCES et_user(id),   
    CONSTRAINT   et_user_2_paper_paper_id_fk 
       FOREIGN KEY(paper_id) REFERENCES et_paper(id)
);

/** 用户考试历史表 */
create  table  et_user_exam_history(
    id	INT  auto_increment,
	user_id	INT,
	exam_paper_id	INT,
	create_time	TIMESTAMP,
	duration	INT,
	point_get	FLOAT,
	submit_time	TIMESTAMP,
	constraint  et_user_exam_history_id_pk primary key(id),
	constraint  et_user_exam_history_user_id_fk 
	  foreign key(user_id) references et_user(id),
	constraint  et_user_exam_history_exam_paper_id_fk 
	  foreign key(exam_paper_id) references et_paper(id)
);

/** 考试记录详情 */
create  table  et_user_exam_history_detail(
	id	int   auto_increment,
	user_exam_history_id	INT,
	question_id	int,
	user_answer	text,
    std_answer	text,
    correct_rate	float,
    constraint  et_user_exam_history_detail_id_pk primary key(id),
    constraint  et_user_exam_history_detail_user_exam_history_id_fk
      foreign key(user_exam_history_id)  
      references  et_user_exam_history(id)
);

insert  into `et_question`(`id`,`description`,`question_type_id`,`points`,`group_id`,`is_visible`,`create_time`,`creator`,`last_modify`,`answer`,`expose_times`,`right_times`,`wrong_times`,`difficulty`,`analysis`,`reference`,`examing_point`,`keyword`) values (12,'下面选项不属于DML的是?',1,0,0,0,'2019-07-22 10:16:08','abc','2019-07-22 10:16:08','D',0,0,0,0.2,'DML 叫数据操作语言   语句有  insert  delete  update  所以select 不是DML',NULL,NULL,'sql  dml'),(13,'下列那些属于事物',1,0,0,0,'2019-07-22 10:17:17','abc','2019-07-22 10:17:17','A',0,0,0,0.4,'事物控制',NULL,NULL,'事物'),(14,'事务的特性有哪几种',4,0,0,0,'2019-07-22 10:18:37','abc','2019-07-22 10:18:37','原子性 一致性 隔离性  持久性',0,0,0,0.4,'事物控制',NULL,NULL,'事物'),(15,'spring MVC的五大核心组件 并简单解释？',4,0,0,0,'2019-07-22 10:18:56','abc','2019-07-22 10:18:56','DispatcherServlet    控制器   请求的入口 \n  HandlerMapping       控制器   请求的派发  让请求和控制器建立一一对应的关联关系 \n  Controller           控制器   真正请求的处理者\n  ModelAndView         模型和视图   封装数据信息和视图信息的\n  ViewResolver         视图处理器   找到对应的页面 ',0,0,0,0.5,'DispatcherServlet    控制器   请求的入口 \n  HandlerMapping       控制器   请求的派发  让请求和控制器建立一一对应的关联关系 \n  Controller           控制器   真正请求的处理者\n  ModelAndView         模型和视图   封装数据信息和视图信息的\n  ViewResolver         视图处理器   找到对应的页面 ',NULL,NULL,'mvc  spring'),(16,'sql语句有几种?',1,0,0,0,'2019-07-22 10:20:24','abc','2019-07-22 10:20:24','C',0,0,0,0.5,'DQL DML DDL TCL',NULL,NULL,'sql'),(17,'下列那些不是DI的实现方式',1,0,0,0,'2019-07-22 10:21:58','abc','2019-07-22 10:21:58','D',0,0,0,0.6,'DI的实现方式',NULL,NULL,'DI的实现方式'),(18,'查找表结构用以下哪一项?',1,0,0,0,'2019-07-22 10:22:01','abc','2019-07-22 10:22:01','D',0,0,0,0.4,'DESC查询表结构,SELECT查询表数据',NULL,NULL,'sql'),(19,'DI的使用方式',1,0,0,0,'2019-07-22 10:22:19','abc','2019-07-22 10:22:19','D',0,0,0,0.6,'setting注入 set方法注入\nconstructor-age 注入  构造方法注入\n自动注入  byName   byType constructor',NULL,NULL,'SpingDI'),(20,'spring通知有几种?',1,0,0,0,'2019-07-22 10:22:45','abc','2019-07-22 10:22:45','C',0,0,0,0.5,'前置通知,后置通知,异常通知,最终通知,环绕通知',NULL,NULL,'spring aop'),(21,'DI的使用方式',4,0,0,0,'2019-07-22 10:23:08','abc','2019-07-22 10:23:08','setting注入 \nconstructor-age 注入  \n自动注入 ',0,0,0,0.6,'setting注入 set方法注入\nconstructor-age 注入  构造方法注入\n自动注入  byName   byType constructor',NULL,NULL,'SpingDI'),(22,'SpringMVC的执行流程是什么？',4,0,0,0,'2019-07-22 10:23:13','abc','2019-07-22 10:23:13','一个请求匹配前端控制器 DispatcherServlet 的请求映射路径(在 web.xml中指定), WEB 容器将该请求转交给 DispatcherServlet 处理\nDispatcherServlet 接收到请求后, 将根据 请求信息 交给 处理器映射器 （HandlerMapping）\nHandlerMapping 根据用户的url请求 查找匹配该url的 Handler，并返回一个执行链\nDispatcherServlet 再请求 处理器适配器(HandlerAdapter) 调用相应的 Handler 进行处理并返回 ModelAndView 给 DispatcherServlet\nDispatcherServlet 将 ModelAndView 请求 ViewReslover（视图解析器）解析，返回具体 View\nDispatcherServlet 对 View 进行渲染视图（即将模型数据填充至视图中）\nDispatcherServlet 将页面响应给用户',0,0,0,0.6,'一个请求匹配前端控制器 DispatcherServlet 的请求映射路径(在 web.xml中指定), WEB 容器将该请求转交给 DispatcherServlet 处理\nDispatcherServlet 接收到请求后, 将根据 请求信息 交给 处理器映射器 （HandlerMapping）\nHandlerMapping 根据用户的url请求 查找匹配该url的 Handler，并返回一个执行链\nDispatcherServlet 再请求 处理器适配器(HandlerAdapter) 调用相应的 Handler 进行处理并返回 ModelAndView 给 DispatcherServlet\nDispatcherServlet 将 ModelAndView 请求 ViewReslover（视图解析器）解析，返回具体 View\nDispatcherServlet 对 View 进行渲染视图（即将模型数据填充至视图中）\nDispatcherServlet 将页面响应给用户',NULL,NULL,'SpringMVC'),(23,'常见的五大异常??????',4,0,0,0,'2019-07-22 10:23:34','abc','2019-07-22 10:23:34','我也不知道',0,0,0,0.1,'你猜',NULL,NULL,'空 类 数 算 '),(24,'DI的三种实现方式 写出并简单解释?',4,0,0,0,'2019-07-22 10:23:46','abc','2019-07-22 10:23:46','1.setter 注入 \n  <property name=\"属性名\"  value=\"值\"></property>\n2.构造器注入 \n  参考的是构造方法的参数的名字 或者  位置  \n  配置形式 把上面的  property   换成  constructor-arg  \n3.自动化注入 \n 一般是用来解决复杂值的注入问题  \n 在bean 标记中 写一个属性  autowire    这个属性的取值有 \n byName   通过名字去注入对应的属性值   参考set方法去容器中找对应的组件id \n byType   通过属性对应的类型 去自动加载   如果多于一个匹配 则程序崩溃 \n constructor   参考的构造器的参数 进行自动装配   如果第一个参数不匹配 则终止后续赋值 程序不报错',0,0,0,0.7,'1.setter 注入 \n  <property name=\"属性名\"  value=\"值\"></property>\n2.构造器注入 \n  参考的是构造方法的参数的名字 或者  位置  \n  配置形式 把上面的  property   换成  constructor-arg  \n3.自动化注入 \n 一般是用来解决复杂值的注入问题  \n 在bean 标记中 写一个属性  autowire    这个属性的取值有 \n byName   通过名字去注入对应的属性值   参考set方法去容器中找对应的组件id \n byType   通过属性对应的类型 去自动加载   如果多于一个匹配 则程序崩溃 \n constructor   参考的构造器的参数 进行自动装配   如果第一个参数不匹配 则终止后续赋值 程序不报错',NULL,NULL,'Spring DI'),(25,'关于自动化注入autowire的取值,下列取值错误的是?',1,0,0,0,'2019-07-22 10:24:11','abc','2019-07-22 10:24:11','D',0,0,0,0.1,'自动化注入 \n 一般是用来解决复杂值的注入问题  \n 在bean 标记中 写一个属性  autowire    这个属性的取值有 \n byName   通过名字去注入对应的属性值   参考set方法去容器中找对应的组件id \n byType   通过属性对应的类型 去自动加载   如果多于一个匹配 则程序崩溃 \n constructor   参考的构造器的参数 进行自动装配   如果第一个参数不匹配 则终止后续赋值 程序不报错',NULL,NULL,'autowire'),(26,'请写出事务的隔离级别?',4,0,0,0,'2019-07-22 10:24:26','abc','2019-07-22 10:24:26','1.读未提交\n2.读已提交\n3.可重复读\n4.序列化',0,0,0,0.5,'1.读未提交\n2.读已提交\n3.可重复读\n4.序列化',NULL,NULL,'隔离'),(27,'下面哪个不是DI的实现方式？',1,0,0,0,'2019-07-22 10:24:32','abc','2019-07-22 10:24:32','D',0,0,0,0.5,'DI的三种实现方式是 setter注入，构造器注入，自动化注入。',NULL,NULL,'DI'),(28,'什么是关系型数据库管理系统？',1,0,0,0,'2019-07-22 10:24:36','abc','2019-07-22 10:24:36','A',0,0,0,0.5,'由关系、数据、数据之间的约束三者所组成的数据模型则称为RDBMS,即关系型数据库管理系统。',NULL,NULL,'sql'),(29,'通用层标注是什么',1,0,0,0,'2019-07-22 10:25:24','abc','2019-07-22 10:25:24','D',0,0,0,0.1,'@Component是通用层',NULL,NULL,'sping'),(30,'where 条件 与 having条件的区别?',4,0,0,0,'2019-07-22 10:25:41','abc','2019-07-22 10:25:41','where条件 对查询的所有数据 进行过滤.\nhaving条件是对分组查询的结果, 进行过滤 !   例如: 我们部门编号分组查询员工表, 结果为12组数据, having就是从这12行数据中再进行筛选 !\nwhere条件 执行在 having之前 !\n',0,0,0,0.3,'where条件 对查询的所有数据 进行过滤.\nhaving条件是对分组查询的结果, 进行过滤 !   例如: 我们部门编号分组查询员工表, 结果为12组数据, having就是从这12行数据中再进行筛选 !\nwhere条件 执行在 having之前 !',NULL,NULL,'WHERE'),(31,'用来设置事务隔离级别的方式有那种？ ',4,0,0,0,'2019-07-22 10:25:47','abc','2019-07-22 10:25:47','读未提交  读提交 可重复读  序列化',0,0,0,0.6,'spring事务控制',NULL,NULL,'spring事务控制'),(32,'1.查询每个年级的各多少人(表名为:studet)?',4,0,0,0,'2019-07-22 10:26:18','abc','2019-07-22 10:26:18','select gradeid,count(*) from studet group by gradeid',0,0,0,0.5,'select gradeid,count(*) from studet group by gradeid',NULL,NULL,'sql'),(33,'属于查询语句关键字的是？',1,0,0,0,'2019-07-22 10:26:33','abc','2019-07-22 10:26:33','D',0,0,0,0.2,'select  是查询的关键字',NULL,NULL,'select'),(34,'事务管理的特性',4,0,0,0,'2019-07-22 10:26:48','abc','2019-07-22 10:26:48','原子性：事务的整个操作是一个整体，不可以分割，要么全部成功，要么全部失败。\n一致性：事务操作的前后，数据表中的数据没有变化。\n隔离性：事务操作是相互隔离不受影响的。\n持久性：数据一旦提交，不可改变，永久的改变数据表数据。',0,0,0,0.8,'四大特性',NULL,NULL,'事务管理'),(35,'简述date和timestamp的区别？',1,0,0,0,'2019-07-22 10:26:52','abc','2019-07-22 10:26:52','A',0,0,0,0.5,'a)	date的最小单位是毫秒，timestamp包含小数位的秒，如果需要秒一下的单位，需要用timestamp。',NULL,NULL,'sql'),(36,'SQL语言是( )语言?',1,0,0,0,'2019-07-22 10:27:00','abc','2019-07-22 10:27:00','C',0,0,0,0.2,'sql语言是关系型数据库语言',NULL,NULL,'sql'),(37,'集合参数的单独定义的含义？',4,0,0,0,'2019-07-22 10:27:01','abc','2019-07-22 10:27:01','一个结合的参数可以被单独定义出来然后让其他对象的属性进行引用',0,0,0,0.1,'集合参数的单独定义',NULL,NULL,'DI'),(38,'下面是IOC自动装载方法的是',1,0,0,0,'2019-07-22 10:27:23','abc','2019-07-22 10:27:23','A',0,0,0,0.001,'IOC',NULL,NULL,'IOC'),(39,'下列选项中不属于组件扫描的标注是？',1,0,0,0,'2019-07-22 10:27:35','abc','2019-07-22 10:27:35','C',0,0,0,0.5,' 组件扫描的四大标注有：\n   @Service   服务层标注\n   @Controller  控制层标注\n   @Repository  持久层标注 \n   @Component   通用层标注',NULL,NULL,'Spring MVC'),(40,'索引的优点',1,0,0,0,'2019-07-22 10:27:40','abc','2019-07-22 10:27:40','A',0,0,0,0.5,'通过创建唯一性索引，可以保证数据库表中每一行数据的唯一性；',NULL,NULL,'sql'),(41,'mysql分页关键字的是？',1,0,0,0,'2019-07-22 10:27:42','abc','2019-07-22 10:27:42','B',0,0,0,0.4,'mysql 分页关键字 limit   oracle 是rownum',NULL,NULL,'select'),(42,'数据库中的事务是什么?',4,0,0,0,'2019-07-22 10:28:01','abc','2019-07-22 10:28:01','事务（transaction）是作为一个单元的一组有序的数据库操作。如果组中的所有操作都成功，则认为事务成功，即使只有一个操作失败，事务也不成功。如果所有操作完成，事务则提交，其修改将作用于所有其他数据库进程。如果一个操作失败，则事务将回滚，该事务所有操作的影响都将取消。',0,0,0,0.4,'事务（transaction）是作为一个单元的一组有序的数据库操作。如果组中的所有操作都成功，则认为事务成功，即使只有一个操作失败，事务也不成功。如果所有操作完成，事务则提交，其修改将作用于所有其他数据库进程。如果一个操作失败，则事务将回滚，该事务所有操作的影响都将取消。ACID 四大特性,原子性、隔离性、一致性、持久性。',NULL,NULL,'sql'),(43,'在数据库技术中,独立于计算机系统的模型是?',1,0,0,0,'2019-07-22 10:28:18','abc','2019-07-22 10:28:18','C',0,0,0,0.4,'在数据库技术中,独立于计算机系统的模型是E-R模型',NULL,NULL,'模型'),(44,'什么是事务管理：',4,0,0,0,'2019-07-22 10:28:32','abc','2019-07-22 10:28:32','保证数据操作的完整性。可以把一系列要执行的操作称为事务，而事务管理就是管理这些操作要么完全执行，要么完全不执行。mysql中并不是所有的数据引擎都支持事务管理的，只有innodb支持事务管理。',0,0,0,0.8,'理解',NULL,NULL,'事务管理'),(45,'where和having的区别是什么？',4,0,0,0,'2019-07-22 10:28:35','abc','2019-07-22 10:28:35','本质的区别就是where筛选的是数据库表里面本来就有的字段，而having筛选的字段是从前筛选的字段筛选的',0,0,0,0.6,'本质的区别就是where筛选的是数据库表里面本来就有的字段，而having筛选的字段是从前筛选的字段筛选的',NULL,NULL,'sql'),(46,'子查询语句不可以在select中出现的位置？',1,0,0,0,'2019-07-22 10:28:36','abc','2019-07-22 10:28:36','A',0,0,0,0.3,'子查询语句 可以在select中的三个位置出现:\n    1.  出现在from之后\n    2.  出现在where条件后\n    3.  出现在having条件后\n',NULL,NULL,'WHERE'),(47,'不属于Spring中和DI相关的标注的是：',1,0,0,0,'2019-07-22 10:28:43','abc','2019-07-22 10:28:43','D',0,0,0,0.5,'Spring中和DI相关的标注：@Value、@Autowired、@Resource',NULL,NULL,'标注'),(48,'select * form UsEr有错吗?',1,0,0,0,'2019-07-22 10:29:02','abc','2019-07-22 10:29:02','A',0,0,0,1,'form 拼写错误 \n应改为from',NULL,NULL,'from'),(49,'什么是aop',4,0,0,0,'2019-07-22 10:29:23','abc','2019-07-22 10:29:23','Aspect Orientied Programming 面向切面编程、\n他可以不修改原来代码的情况，增强原来组件的功能\n将共同业务逻辑 提取到切面中，有利于切面和组件解耦，提供组件和切面的复用程度，提高程序灵活性',0,0,0,0.9,'Aspect Orientied Programming 面向切面编程、\n他可以不修改原来代码的情况，增强原来组件的功能\n将共同业务逻辑 提取到切面中，有利于切面和组件解耦，提供组件和切面的复用程度，提高程序灵活性',NULL,NULL,'aop'),(50,'Spring中的异常处理方式有哪些?',4,0,0,0,'2019-07-22 10:29:38','abc','2019-07-22 10:29:38','Spring 中的异常处理 \n1 使用系统提供的异常处理器 \n  SimpleMappingExceptionResolver    \n     核心思想就是 出现一个异常时 让程序跳转到对应的页面 \n2 使用自己定义的异常处理器 ---- 实现 HandlerExceptionResolver\n     核心思想也是 出现一个异常时 让程序跳转到对应的页面    \n3 局部异常处理   ---  只针对一个具体的控制器抛出的异常   注意Exception 参数必须存在\n \n  ',0,0,0,0.2,'Spring 中的异常处理 \n1 使用系统提供的异常处理器 \n  SimpleMappingExceptionResolver    \n     核心思想就是 出现一个异常时 让程序跳转到对应的页面 \n2 使用自己定义的异常处理器 ---- 实现 HandlerExceptionResolver\n     核心思想也是 出现一个异常时 让程序跳转到对应的页面    \n3 局部异常处理   ---  只针对一个具体的控制器抛出的异常   注意Exception 参数必须存在\n    @ExceptionHandler',NULL,NULL,'spring'),(51,'下面哪个是通知是代表一定会执行的?',1,0,0,0,'2019-07-22 10:29:45','abc','2019-07-22 10:29:45','B',0,0,0,0.3,'SpringAOP标注形式的五大通知:\n@before:前置通知\n@after:最终通知\n@after-returning:后置通知\n@after-throwing:异常通知\n@around:环绕通知',NULL,NULL,'AOP   通知'),(52,'获取当前时间?格式如下:2019年8月15日',4,0,0,0,'2019-07-22 10:30:01','abc','2019-07-22 10:30:01','to_char(systada,\'xxxx年mm月dd日\')',0,0,0,0.1,'to_char(systada,\'xxxx年mm月dd日\')',NULL,NULL,'to_char'),(53,'请简述spring的优点。',4,0,0,0,'2019-07-22 10:30:11','abc','2019-07-22 10:30:11','优点：轻量级,Spring在大小和透明性方面绝对属于轻量级的，基础版本的Spring框架大约只有2MB。\n控制反转(IOC),Spring使用控制反转技术实现了松耦合。依赖被注入到对象，而不是创建或寻找依赖对象。\n面向切面编程(AOP),Spring支持面向切面编程，同时把应用的###业务逻辑与系统的服务###分离开来。\n容器,Spring包含并管理应用程序对象的配置及生命周期。\nMVC框架,Spring的web框架是一个设计优良的web MVC框架，很好的取代了一些web框架。\n事务管理,Spring对下至本地业务上至全局业务(JAT)提供了统一的事务管理接口。\n异常处理,Spring提供一个方便的API将特定技术的异常(由JDBC, Hibernate, 或JDO抛出)转化为一致的、Unchecked异常。',0,0,0,0.8,'优点：轻量级,Spring在大小和透明性方面绝对属于轻量级的，基础版本的Spring框架大约只有2MB。\n控制反转(IOC),Spring使用控制反转技术实现了松耦合。依赖被注入到对象，而不是创建或寻找依赖对象。\n面向切面编程(AOP),Spring支持面向切面编程，同时把应用的###业务逻辑与系统的服务###分离开来。\n容器,Spring包含并管理应用程序对象的配置及生命周期。\nMVC框架,Spring的web框架是一个设计优良的web MVC框架，很好的取代了一些web框架。\n事务管理,Spring对下至本地业务上至全局业务(JAT)提供了统一的事务管理接口。\n异常处理,Spring提供一个方便的API将特定技术的异常(由JDBC, Hibernate, 或JDO抛出)转化为一致的、Unchecked异常。',NULL,NULL,'轻量级，控制反转，面向切面编程，mvc框架'),(54,'SQL语句的分类?',4,0,0,0,'2019-07-22 10:30:47','abc','2019-07-22 10:30:47','(1)DQL:数据库查询语言\n(2)DML:数据库操作语言\n(3)DDL:数据库定义语言\n(4)TCL:数据库事务控制',0,0,0,0.4,'(1)DQL:数据库查询语言\n(2)DML:数据库操作语言\n(3)DDL:数据库定义语言\n(4)TCL:数据库事务控制',NULL,NULL,'sql'),(55,'主键 超键 候选键 外键',4,0,0,0,'2019-07-22 10:30:49','abc','2019-07-22 10:30:49','主 键：\n数据库表中对储存数据对象予以唯一和完整标识的数据列或属性的组合。一个数据列只能有一个主键，且主键的取值不能缺失，即不能为空值（Null）。\n超 键：\n在关系中能唯一标识元组的属性集称为关系模式的超键。一个属性可以为作为一个超键，多个属性组合在一起也可以作为一个超键。超键包含候选键和主键。\n候选键：\n是最小超键，即没有冗余元素的超键。\n外 键：\n在一个表中存在的另一个表的主键称此表的外键。',0,0,0,0.9,'理解',NULL,NULL,'事务'),(56,'删除除了(自增主键)id外,别的数据都重复的数据',4,0,0,0,'2019-07-22 10:31:06','abc','2019-07-22 10:31:06','delete tablename where id not in(\nselect min(id) from tablename group by v1,v2,v3,v4,...)',0,0,0,1,'略',NULL,NULL,'sql'),(57,'Spring 声明式事务实现的步骤?',4,0,0,0,'2019-07-22 10:31:07','abc','2019-07-22 10:31:07','1.开启声明式事务  <tx:annotation-driven   transaction-manager=\"transactionManager\" \n     proxy-target-class=\"false\"/>\n2.配置事务管理器  依赖于dataSource\n3.在类或者方法上加@Transactional 标注',0,0,0,0.8,'1.开启声明式事务  <tx:annotation-driven   transaction-manager=\"transactionManager\" \n     proxy-target-class=\"false\"/>\n2.配置事务管理器  依赖于dataSource\n3.在类或者方法上加@Transactional 标注',NULL,NULL,'sql  spring  jdbc'),(58,'数据操纵语言（DML）提供用户对数据库进行数据的查询和处理操作，在SQL?Server中，通常不包括什么语句？',1,0,0,0,'2019-07-22 10:31:23','abc','2019-07-22 10:31:23','D',0,0,0,0.1,'DML操作只包含insert，delete，update，所以create不是',NULL,NULL,'sql'),(59,'下面关于事务管理说法错误的是?',1,0,0,0,'2019-07-22 10:31:39','abc','2019-07-22 10:31:39','D',0,0,0,0.000001,'666',NULL,NULL,'事务管理'),(60,'在SQL中创建视图有什么作用？',4,0,0,0,'2019-07-22 10:32:04','abc','2019-07-22 10:32:04','1、视图隐藏了底层的表结构，简化了数据访问操作，客户端不需要知道底层表结构及其之间的关系。\n2、视图提供了一个统一访问数据的接口，即可以不授予用户直接访问底层表的权限，加强安全性\n',0,0,0,0.5,'常规视图本身并不存储实际数据，而仅仅是由SELECT语句组成的查询定义的虚拟表。\n从数据库内部来看，视图是一张或多张表中数据组成的，从数据库外部来看，视图就像一张表，对表能够进行的一般操作都可以应用于视图。',NULL,NULL,'视图/表结构/安全/简化'),(61,'在下列类型的数据库系统中,应用最广泛的是?',1,0,0,0,'2019-07-22 10:32:11','abc','2019-07-22 10:32:11','C',0,0,0,0.4,'应用最广泛的是关系型数据库系统',NULL,NULL,'数据库系统'),(62,'Spring中声明式事务管理的步骤：',4,0,0,0,'2019-07-22 10:32:32','abc','2019-07-22 10:32:32','1、开启组建扫描和开启声明式事务管理；\n2、创建事务管理器；\n3、在相应类或方法上添加事务管理标注',0,0,0,0.5,'Spring中事务管理的步骤：\n1、开启组建扫描和开启声明式事务管理；\n2、创建事务管理器；\n3、在相应类或方法上添加事务管理标注',NULL,NULL,'事务管理'),(63,'以下不是核心组件的是',1,0,0,0,'2019-07-22 10:32:50','abc','2019-07-22 10:32:50','A',0,0,0,1,'DispetcherServlet    拼写错误\\\n应改为 DispatcherServlet    ',NULL,NULL,'springMvc核心组件'),(64,'简单描述AOP涉及到概念有哪些并解释？',4,0,0,0,'2019-07-22 10:32:52','abc','2019-07-22 10:32:52',' Aspect   切面  封装共通业务逻辑的  封装共通业务逻辑的类叫切面类  用切面类创建的对象叫切面对象。\n  JoinPoint  连接点   用来说明共通业务逻辑 所嵌入的位置  一般封装了方法的信息\n  PointCut    切点    多个连接点 组成的一个集合 (后面会讲用表达式来表达切点)\n  Target     目标     要加强的对象   \n  Proxy      代理        增强之后的对象  \n  Advice    通知        时机： 目标方法调用之前   目标方法调用之后    目标方法调用前后                                                 目标方法最终    目标方法出现异常',0,0,0,0.9,' Aspect   切面  封装共通业务逻辑的  封装共通业务逻辑的类叫切面类  用切面类创建的对象叫切面对象。\n  JoinPoint  连接点   用来说明共通业务逻辑 所嵌入的位置  一般封装了方法的信息\n  PointCut    切点    多个连接点 组成的一个集合 (后面会讲用表达式来表达切点)\n  Target     目标     要加强的对象   \n  Proxy      代理        增强之后的对象  \n  Advice    通知        时机： 目标方法调用之前   目标方法调用之后    目标方法调用前后                                                 目标方法最终    目标方法出现异常',NULL,NULL,'Spring Aop'),(65,'下面对Spring中Bean的注入说法正确的是?',1,0,0,0,'2019-07-22 10:33:14','abc','2019-07-22 10:33:14','B',0,0,0,0.4,'Spring依赖注入的两种方式是构造注入和设值注入。对于构造注入，Spring在创建Bean实例时，需要同时实例化其依赖的全部实例。对于复杂的依赖关系，若使用构造注入，会导致构造器过于臃肿。在bean元素中使用constructor-arg元素来设值属性值的构造函数注入，可以通过该元素的type属性指定参数类型，index属性指定该参数在构造函数参数列表中的索引位置。',NULL,NULL,'sql'),(66,'下面那个标注不属于标注形式DI的标注?',1,0,0,0,'2019-07-22 10:33:35','abc','2019-07-22 10:33:35','C',0,0,0,0.2,'DI的标注有三组 分别是@Value   @Autowired  @Resource',NULL,NULL,'DI'),(67,'oracle属于下列哪种数据库?',1,0,0,0,'2019-07-22 10:33:40','abc','2019-07-22 10:33:40','B',0,0,0,0.1,'常见的关系型数据库有:oracle,DB2,IBM,SQLServer,MySQL等.',NULL,NULL,'数据库'),(68,'开启声明式事务?',4,0,0,0,'2019-07-22 10:33:52','abc','2019-07-22 10:33:52','<!--  开启声明式事务  -->\n<tx:annotation-driven   transaction-manager=\"transactionManager\" \n     proxy-target-class=\"false\"/>\n<bean  id=\"transactionManager\" class=\"org.springframework.jdbc.datasource.DataSourceTransactionManager\">\n    <property name=\"dataSource\"  ref=\"dataSource\"></property>\n</bean> ',0,0,0,0.6,'<!--  开启声明式事务  -->\n<tx:annotation-driven   transaction-manager=\"transactionManager\" \n     proxy-target-class=\"false\"/>\n<!--  c  --> \n<bean  id=\"transactionManager\" class=\"org.springframework.jdbc.datasource.DataSourceTransactionManager\">\n    <property name=\"dataSource\"  ref=\"dataSource\"></property>\n</bean> ',NULL,NULL,'bean'),(69,'Spring事务管理中的隔离级别并简述期其解决的是事务中的哪几个问题,简述!',4,0,0,0,'2019-07-22 10:34:33','abc','2019-07-22 10:34:33','四种隔离级别:读未提交 	读提交	可重复读	序列化\n解决三个问题: \n1>脏读:一个事务读取了另一个事务未提交的数据(读提交解决该问题)\n2>不可重复读:一个事务读取了某个数据,另一个事务对该事务进行了删改,当这个事务再次读取该 \n      数据时,发现该数据发生了变化(可重复读解决该问题)\n3>幻读:一个事务统计了整张表的数据,另一个事务向该表增加了数据,当这个事务再次统计整张表 \n      的数据时,发现数据发生了变化  (序列化解决该问题)',0,0,0,0.8,'四种隔离级别:读未提交 	读提交	可重复读	序列化\n解决三个问题: \n1>脏读:一个事务读取了另一个事务未提交的数据(读提交解决该问题)\n2>不可重复读:一个事务读取了某个数据,另一个事务对该事务进行了删改,当这个事务再次读取该 \n      数据时,发现该数据发生了变化(可重复读解决该问题)\n3>幻读:一个事务统计了整张表的数据,另一个事务向该表增加了数据,当这个事务再次统计整张表 \n      的数据时,发现数据发生了变化  (序列化解决该问题)',NULL,NULL,'事务'),(70,'以下标注是通用层的是',1,0,0,0,'2019-07-22 10:35:11','abc','2019-07-22 10:35:11','D',0,0,0,0,'d',NULL,NULL,'spring'),(71,'下面对Spring框架的持久化支持说法错误的是?',1,0,0,0,'2019-07-22 10:35:12','abc','2019-07-22 10:35:12','C',0,0,0,1.01,'Spring对多个持久化技术提供了集成的支持，借助于Spring框架提供的DAO抽象，开发者能够以统一的方式同数据访问技术（比如JDBC、Hibernate、JDO、TopLink）进行交互。JdbcTemplate是Spring为借助JDBC操作RDBMS而提供的实用模版类，简化了JDBC操作。Spring提供了DataAccessException，这个异常类对现有多种数据库访问技术的异常进行封装，为我们提供了一个与底层数据库无关的异常体系，因此可以方便地处理各种数据访问异常，该异常类是RuntimeException。\n',NULL,NULL,'1'),(72,'Spring的组成一个有（）块组成',1,0,0,0,'2019-07-22 10:35:22','abc','2019-07-22 10:35:22','D',0,0,0,0.6,'spring\n',NULL,NULL,'spring'),(73,'使用Spring框架的好处是什么？',4,0,0,0,'2019-07-22 10:35:32','abc','2019-07-22 10:35:32','轻量：Spring 是轻量的，基本的版本大约2MB。\n控制反转：Spring通过控制反转实现了松散耦合，对象们给出它们的依赖，而不是创建或查找依赖的对象们。\n面向切面的编程(AOP)：Spring支持面向切面的编程，并且把应用业务逻辑和系统服务分开。\n容器：Spring 包含并管理应用中对象的生命周期和配置。\nMVC框架：Spring的WEB框架是个精心设计的框架，是Web框架的一个很好的替代品。\n事务管理：Spring 提供一个持续的事务管理接口，可以扩展到上至本地事务下至全局事务（JTA）。\n异常处理：Spring 提供方便的API把具体技术相关的异常（比如由JDBC，Hibernate or JDO抛出的）转化为一致的unchecked 异常。',0,0,0,0.8,'轻量：Spring 是轻量的，基本的版本大约2MB。\n控制反转：Spring通过控制反转实现了松散耦合，对象们给出它们的依赖，而不是创建或查找依赖的对象们。\n面向切面的编程(AOP)：Spring支持面向切面的编程，并且把应用业务逻辑和系统服务分开。\n容器：Spring 包含并管理应用中对象的生命周期和配置。\nMVC框架：Spring的WEB框架是个精心设计的框架，是Web框架的一个很好的替代品。\n事务管理：Spring 提供一个持续的事务管理接口，可以扩展到上至本地事务下至全局事务（JTA）。\n异常处理：Spring 提供方便的API把具体技术相关的异常（比如由JDBC，Hibernate or JDO抛出的）转化为一致的unchecked 异常。',NULL,NULL,'spring');
insert  into `et_question_2_option`(`question_2_option_id`,`question_id`,`option_name`,`option_content`) values (17,12,'A','insert'),(18,12,'B','delete'),(19,12,'C','update'),(20,12,'D','select'),(21,13,'A','commit'),(22,13,'B','create'),(23,13,'C','drop'),(24,13,'D','insert'),(25,16,'A','2'),(26,16,'B','3'),(27,16,'C','4'),(28,16,'D','5'),(29,17,'A','setter注入'),(30,17,'B','构造器注入'),(31,17,'C','自动化注入'),(32,17,'D','复杂值注入'),(33,18,'A','FIND'),(34,18,'B','SELECT'),(35,18,'C','ALTER'),(36,18,'D','DESC'),(37,19,'A','Setting注入'),(38,19,'B','constructor-arg'),(39,19,'C','自动注入'),(40,19,'D','以上三种答案'),(41,20,'A','3'),(42,20,'B','4'),(43,20,'C','5'),(44,20,'D','2'),(45,25,'A','byName'),(46,25,'B','byType'),(47,25,'C','constructor'),(48,25,'D','byParam'),(49,27,'A','setter注入'),(50,27,'B','构造器注入'),(51,27,'C','自动化注入'),(52,27,'D','参数注入'),(53,28,'A','由关系、数据、数据之间的约束三者所组成的数据模型则称为RDBMS,即关系型数据库管理系统'),(54,28,'B','由关系、数据、数据之间的约束三者所组成的数据模型则称为RDBMS,'),(55,28,'C','sql'),(56,28,'D','orcal'),(57,29,'A','@Service'),(58,29,'B','@Controller'),(59,29,'C','@Respository'),(60,29,'D','@Component'),(61,33,'A','commit'),(62,33,'B','save'),(63,33,'C','get'),(64,33,'D','select'),(65,35,'A','a)	date的最小单位是毫秒，timestamp包含小数位的秒，如果需要秒一下的单位，需要用timestamp。'),(66,35,'B','M'),(67,35,'C','sql'),(68,35,'D','Oracle'),(69,36,'A','层次数据库'),(70,36,'B','网络数据库'),(71,36,'C','关系型数据库'),(72,36,'D','非数据库redis'),(73,38,'A','byName'),(74,38,'B','byTpe'),(75,38,'C','byMethod'),(76,38,'D','construcor'),(77,39,'A','@Service'),(78,39,'B','@Controller'),(79,39,'C','@Autowired'),(80,39,'D','@Component'),(81,40,'A','通过创建唯一性索引，可以保证数据库表中每一行数据的唯一性；'),(82,40,'B','创建索引和维护索引要耗费时间，这种时间随着数据量的增加而增加'),(83,40,'C','索引需要占物理空间，除了数据表占数据空间之外，每一个索引还要占一定的物理空间，如果要建立聚簇索引，那么需要的空间就会更大'),(84,40,'D','当对表中的数据进行增加、删除、修改的时候，索引也要动态的维护，这样就降低了数据的维护速度；'),(85,41,'A','rownum'),(86,41,'B','limit'),(87,41,'C','row'),(88,41,'D','select'),(89,43,'A','面向对象的模型'),(90,43,'B','关系模型'),(91,43,'C','E-R模型'),(92,43,'D','层次模型'),(93,46,'A','出现在 order by 之后'),(94,46,'B','出现在from之后 '),(95,46,'C','出现在where条件后 '),(96,46,'D','出现在having条件后'),(97,47,'A','@Value'),(98,47,'B','@Autowired'),(99,47,'C','@Resource'),(100,47,'D','@Scope'),(101,48,'A','有'),(102,48,'B','没有'),(103,51,'A','@before'),(104,51,'B','@after'),(105,51,'C','@around'),(106,51,'D','@after-returning'),(107,58,'A','insert'),(108,58,'B','delete'),(109,58,'C','update'),(110,58,'D','create'),(111,59,'A','Spring事务管理方式包括编程方式、声明式'),(112,59,'B','编程式采用的方式来控制事物的边界'),(113,59,'C','声明式采用配置xml方式，将事务管理与实际业务代码解耦'),(114,59,'D','实现编程事物，可以实现PlatformTransaction接口或是使用事务模板TransactionTemplate'),(115,61,'A','分布型数据库系统'),(116,61,'B','逻辑型数据库系统'),(117,61,'C','关系型数据库系统'),(118,61,'D','层次型数据库系统'),(119,63,'A','DispetcherServlet    '),(120,63,'B','HandlerMapping       '),(121,63,'C','Controller           '),(122,63,'D','ModelAndView         '),(123,63,'E','ViewResolver         '),(124,65,'A','Bean根据注入方式不同可以分为构造方法注入和自动装载。'),(125,65,'B','使用构造方法注入构造对象的同时，完成依赖关系的建立'),(126,65,'C','在关系的对象很多时，使用构造方法注入更适合'),(127,65,'D','构造方法通过constructor-index属性来指定，在该标签下要指定索引的位置'),(128,66,'A','@Value'),(129,66,'B','@Atuowired'),(130,66,'C','@Servcie'),(131,66,'D','@Resource'),(132,67,'A','网状数据库'),(133,67,'B','关系型数据库'),(134,67,'C','面向对象数据库'),(135,67,'D','分布式数据库'),(136,70,'A','@Service   '),(137,70,'B','@Controller  '),(138,70,'C','@Repository  '),(139,70,'D','@Component   '),(140,71,'A','Spring没有自己的持久化方案，它集合了现有的流行持久化框架'),(141,71,'B','Spring采用JDBC模板封装了JDBC的数据库操作'),(142,71,'C','Spring对各种持久化技术提供了统一的编程方式'),(143,71,'D','Spring将数据库访问的checked异常转换为运行时异常'),(144,72,'A','1'),(145,72,'B','3'),(146,72,'C','5'),(147,72,'D','7');
insert  into `et_question_2_point`(`question_2_point_id`,`question_id`,`point_id`) values (21,12,1),(22,12,2),(23,13,2),(24,13,7),(25,14,2),(26,14,7),(27,15,15),(28,16,2),(29,16,1),(30,17,13),(31,18,1),(32,18,3),(33,19,13),(34,20,19),(35,21,13),(36,22,15),(37,24,13),(38,25,13),(39,26,7),(40,27,13),(41,28,1),(42,28,2),(43,29,20),(44,29,3),(45,30,1),(46,30,2),(47,31,17),(48,33,3),(49,33,2),(50,34,7),(51,34,17),(52,35,1),(53,35,2),(54,36,1),(55,37,13),(56,38,12),(57,39,2),(58,39,15),(59,40,1),(60,40,2),(61,41,3),(62,41,2),(63,41,4),(64,42,1),(65,42,7),(66,43,1),(67,44,7),(68,44,17),(69,45,3),(70,46,1),(71,46,2),(72,47,20),(73,48,3),(74,49,18),(75,49,17),(76,50,18),(77,51,19),(78,52,2),(79,53,11),(80,54,2),(81,55,7),(82,55,17),(83,56,3),(84,57,7),(85,57,10),(86,57,14),(87,57,18),(88,58,2),(89,59,17),(90,60,8),(91,60,1),(92,60,3),(93,61,1),(94,62,17),(95,63,15),(96,64,18),(97,64,19),(98,65,13),(99,66,13),(100,66,18),(101,67,1),(102,68,17),(103,69,17),(104,70,13),(105,71,11),(106,72,11),(107,73,12),(108,73,13),(109,73,15),(110,73,18),(111,73,17),(112,73,20);

CREATE TABLE  et_paper_2_question (
   paper_2_question_id	INT  AUTO_INCREMENT,
   paper_id   INT,
   question_id INT ,
   order_num  INT ,
   question_score  DOUBLE,
   CONSTRAINT et_paper_2_question_paper_2_question_id_pk
    PRIMARY KEY(paper_2_question_id) 
);

