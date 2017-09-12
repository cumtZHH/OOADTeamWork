--����--
create database pols default charset utf8 collate utf8_general_ci;
--�û���--
create table userInfo(
	userId int not null primary key auto_increment,
	loginName varchar(20) not null,
	userName varchar(20) not null,
	password varchar(32) not null,
	gender int,
	passQuestion varchar(30),
	passAnswer varchar(30),
	email varchar(20),
	tel varchar(20),
	IDCard varchar(20),
	money double not null,
	consume double not null,
	registerTime datetime not null,
	levelId int not null,
	userState int not null
);
-- ���û��������� --
alter table userInfo add constraint fk_userInfo_levelId foreign key(levelId) references level(levelId);
--�û��ȼ���--
create table level(
	levelId int not null primary key auto_increment,
	levelName varchar(20) not null,
	levelDesc varchar(20),
	discount double not null
);
--�ֻ����ͱ�--
create table phoneType(
	phoneTypeId int not null primary key auto_increment,
	phoneTypeName varchar(20) not null,
	size varchar(20) not null,
	weight varchar(20) not null,
	callTime varchar(20) not null,
	liveTime varchar(20) not null,
	phoneTypeState int not null
);
--�ֻ���--
create table phone(
	phoneId int not null primary key auto_increment,
	phoneTypeId int not null,
	phonePrice double not null,
	color varchar(20) not null,
	capacity varchar(20) not null,
	picture varchar(20) not null,
	phoneDesc varchar(500) not null,
	phoneState int not null
);
-- ���ֻ��������� --
alter table phone add constraint fk_phone_phoneTypeId foreign key(phoneTypeId) references phoneType(phoneTypeId);
--���ﳵ��--
create table shoppingCar(
	shoppingCarId int not null primary key auto_increment,
	userId int not null,
	phoneId int not null,
	shoppingCarTime datetime not null
);
--�����ﳵ��������--
alter table shoppingCar add constraint fk_shoppingCar_userId foreign key(userId) references userInfo(userId);
alter table shoppingCar add constraint fk_shoppingCar_phoneId foreign key(phoneId) references phone(phoneId);
--�ջ��ַ��--
create table address(
	addressId int not null primary key auto_increment,
	userId int not null,
	addressInfo varchar(50) not null,
	postcode varchar(10)
);
--���ջ��ַ��������--
alter table address add constraint fk_address_userId foreign key(userId) references userInfo(userId);
--������ϸ��--
create table orderForm(
	orderFormId varchar(20) not null primary key,
	userId int not null,
	addressId int not null,
	remark varchar(50)
);
--��������ϸ��������--
alter table orderForm add constraint fk_orderForm_userId foreign key(userId) references userInfo(userId);
alter table orderForm add constraint fk_orderForm_addressId foreign key(addressId) references address(addressId);
--������ϸ��--
create table orderDeatil(
	orderDeatilId int not null primary key auto_increment,
	orderFormId varchar(20) not null,
	phoneId int not null
);
--��������ϸ��������--
alter table orderDeatil add constraint fl_orderDetail_orderFormId foreign key(orderFormId) references orderForm(orderFormId);
alter table orderDeatil add constraint fl_Phone_phoneId foreign key(phoneId) references phone(phoneId);
--����״̬��--
create table orderState(
	orderStateId int not null primary key auto_increment,
	orderFormId varchar(20) not null,
	orderStateDesc varchar(20) not null,
	orderStateTime datetime
);
--������״̬��������--
alter table orderState add constraint fk_orderState_orderFormId foreign key(orderFormId) references orderForm(orderFormId);
--���۱�--
create table comment(
	commentId int not null primary key auto_increment,
	userId int not null,
	phoneId int not null,
	commentContent varchar(500) not null,
	commentTime datetime not null
);
--�����۱�������--
alter table comment add constraint fk_comment_userId foreign key(userId) references userInfo(userId);
alter table comment add constraint fk_comment_phoneId foreign key(phoneId) references phone(phoneId);
--�������ű�--
create table news(
	newsId int not null primary key auto_increment,
	title varchar(50) not null,
	newsContent varchar(500) not null,
	newsTime datetime not null,
	newsState int not null
);
--����Ա��--
create table manager(
	managerId int not null primary key auto_increment,
	loginName varchar(20) not null,
	loginPass varchar(32) not null
);
--����Ա��¼��־��--
create table log(
	logId int not null primary key auto_increment,
	managerId int not null,
	ipAddress varchar(20) not null,
	message varchar(20) not null,
	logTime datetime not null
);
--����־��������--
alter table log add constraint fk_log_managerId foreign key(managerId) references manager(managerId);
--����ȯ��--
create table voucher(
	voucherId int not null primary key auto_increment,
	userId int not null,
	voucherPrice double not null,
	voucherTime datetime not null,
	voucherDesc varchar(50),
	voucherState int not null
);
--������ȯ��������--
alter table voucher add constraint fk_voucher_userId foreign key(userId) references userInfo(userId);