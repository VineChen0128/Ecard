--ѧ����Ϣ��(ѧ�ţ�������רҵ���༶)
create table XSXXB
(
SID char(100) primary key,
Sname nchar(100) not null,
Smajor nchar(100) not null,
Sclass char(100) not null
)
 
insert into XSXXB values('S1','������','�Ź�','1801')

select *
from XSXXB

--��ְ����Ϣ��(���ţ�����������Ժϵ)
create table ZZGXXB
(
TID char(100) primary key,
Tname nchar(10) not null,
Tdepartment nchar(10) not null,
)

insert into ZZGXXB values('T1','����','��ϢѧԺ')

select *
from ZZGXXB

--��ʱ��Ա��(��ţ�������ʧЧʱ��)
create table LSRYB
(
PID char(100) primary key,
Pname nchar(10) not null,
Ptime datetime not null,
)

insert LSRYB values('P1','����','2020-9-21 09:20:40')
insert LSRYB values('P2','����','2020/10/21 9:27:44')

select *
from LSRYB

--����Ϣ�����ţ�ѧ��/����/��ţ�״̬����ʧЧʱ�䣩
create table KXXB
(
CID char(100) primary key,
SIDorTIDorPID char(100) not null,
Cstatus nchar(10) check(Cstatus in ('����','ͣ��','ע��')),
Money decimal(6,2) check( Money >=0 and Money <=1000),
Ptime datetime 
)

select *
from KXXB


insert into KXXB values('C1','S1','����',50,null)
insert into KXXB values('C2','T1','����',100,null)
insert into KXXB values('C3','P1','ͣ��',20,'2020-9-21 09:20:40')
insert into KXXB values('C4','P2','����',70,'2020/10/21 9:27:44')
insert into KXXB values('1','1','����',70,'2020/10/21 9:27:44')

--��ˮ��Ϣ����ˮ�ţ����ţ� �̼ұ�ţ����׽�����ʱ�䣩
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

--���ؼ�¼����ˮ�ţ����ţ��̼ұ�ţ�����������ʱ�䣩
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

--��ֵ��¼�������ţ����ţ���ֵ����ֵ���ͣ�֧���˺ţ�֧��ʱ�䣩
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

--֧�������˺ţ�����,��
create table ZFBB
(
PayID char(100) primary key,
Paypw char(100),
PayMoney decimal(6,2) check(PayMoney >=0)
)
insert into ZFBB values('p1','p1',500)

select *
from ZFBB

--�ڹ�������¼����¼�ţ����ţ�������
create table QGBZJLB
(
QID char(100) primary key,
CID char(100) not null,
Qmoney decimal(6,2) check(Qmoney >0)
)
insert into QGBZJLB values('Q1','C1',20)

select *
from czjlb

--����Ա���˺ţ����룬Ȩ�ޣ�
create table GLYB
(
ID char(100) primary key,
Password char(20) not null,
Glname char(20) not null,
QX int check(QX in (1,2,3)), 
)
insert into GLYB values('Sa','Sa','adminstrator',3)
insert into GLYB values('A1','A1','CHEN',2)
insert into GLYB values('1','1','����ͷ����һ��',1)
select *
from GLYB

--�̼ұ��̼ұ�ţ��̼�����
create table SJB
(
MID char(100) primary key,
Mname nchar(10) not null
)
insert into SJB values('M1','����')

insert into SJB values('M2','һ���')