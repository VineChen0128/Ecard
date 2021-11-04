--学生信息表(学号，姓名，专业，班级)
create table XSXXB
(
SID char(100) primary key,
Sname nchar(100) not null,
Smajor nchar(100) not null,
Sclass char(100) not null
)
 
insert into XSXXB values('S1','黄世辽','信管','1801')

select *
from XSXXB

--教职工信息表(工号，姓名，所属院系)
create table ZZGXXB
(
TID char(100) primary key,
Tname nchar(10) not null,
Tdepartment nchar(10) not null,
)

insert into ZZGXXB values('T1','张三','信息学院')

select *
from ZZGXXB

--临时人员表(编号，姓名，失效时间)
create table LSRYB
(
PID char(100) primary key,
Pname nchar(10) not null,
Ptime datetime not null,
)

insert LSRYB values('P1','李四','2020-9-21 09:20:40')
insert LSRYB values('P2','王五','2020/10/21 9:27:44')

select *
from LSRYB

--卡信息表（卡号，学号/工号/编号，状态，余额，失效时间）
create table KXXB
(
CID char(100) primary key,
SIDorTIDorPID char(100) not null,
Cstatus nchar(10) check(Cstatus in ('在用','停用','注销')),
Money decimal(6,2) check( Money >=0 and Money <=1000),
Ptime datetime 
)

select *
from KXXB


insert into KXXB values('C1','S1','在用',50,null)
insert into KXXB values('C2','T1','在用',100,null)
insert into KXXB values('C3','P1','停用',20,'2020-9-21 09:20:40')
insert into KXXB values('C4','P2','在用',70,'2020/10/21 9:27:44')
insert into KXXB values('1','1','在用',70,'2020/10/21 9:27:44')

--流水信息表（流水号，卡号， 商家编号，交易金额，交易时间）
create table LSXXB
(
LID char(100) primary key,
CID char(10) not null,
MID char(10) not null,
ExchangeMoney decimal(6,2) check( ExchangeMoney >0),
ExchangeTime datetime not null
)

select *
from LSXXB

insert into LSXXB values('L1','C1','M2',6,'2020/9/20 9:55:16')
insert into LSXXB values('L2','C2','M1',20,'2020/9/21 9:56:48')

--撤回记录表（流水号，卡号，商家编号，撤销金额，撤回时间）
create table CHJLB
(
LID char(100) primary key,
CID char(10) not null,
MID char(10) not null,
ReturnMoney decimal(6,2) check( ReturnMoney >0),
ReturnTime datetime not null,
)
insert into CHJLB values('L1','C1','M2',6,'2020/9/20 11:55:16')

select *
from CHJLB

--充值记录表（订单号，卡号，充值金额，充值类型，支付账号，支付时间）
create table CZJLB
(
DID char(100) primary key,
CID char(100) not null,
ChargeMoney decimal(6,2) ,
ChargeWay int check(ChargeWay in (0,1)), 
PayID char(10),
PayTime datetime not null,
)

insert into CZJLB values('D1','C1',100,0,null,'2020/9/20 10:14:24')
insert into CZJLB values('D2','C2',100,1,'P1','2020/9/20 11:14:24')


select *
from CZJLB

--支付宝表（账号，密码,余额）
create table ZFBB
(
PayID char(100) primary key,
Paypw char(100),
PayMoney decimal(6,2) check(PayMoney >=0)
)
insert into ZFBB values('p1','p1',500)

select *
from ZFBB

--勤工补助记录表（记录号，卡号，补助金额）
create table QGBZJLB
(
QID char(100) primary key,
CID char(100) not null,
Qmoney decimal(6,2) check(Qmoney >0)
)
insert into QGBZJLB values('Q1','C1',20)

select *
from czjlb

--管理员表（账号，密码，权限）
create table GLYB
(
ID char(100) primary key,
Password char(20) not null,
Glname char(20) not null,
QX int check(QX in (1,2,3)), 
)
insert into GLYB values('Sa','Sa','adminstrator',3)
insert into GLYB values('A1','A1','CHEN',2)
insert into GLYB values('1','1','给您头上来一刀',1)
select *
from GLYB

--商家表（商家编号，商家名）
create table SJB
(
MID char(100) primary key,
Mname nchar(10) not null
)
insert into SJB values('M1','古茗')

insert into SJB values('M2','一点点')