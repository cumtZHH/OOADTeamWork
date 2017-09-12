--建库--
create database pols default charset utf8 collate utf8_general_ci;
--用户表--
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
-- 给用户表添加外键 --
alter table userInfo add constraint fk_userInfo_levelId foreign key(levelId) references level(levelId);
--用户等级表--
create table level(
	levelId int not null primary key auto_increment,
	levelName varchar(20) not null,
	levelDesc varchar(20),
	discount double not null
);
--手机类型表--
create table phoneType(
	phoneTypeId int not null primary key auto_increment,
	phoneTypeName varchar(20) not null,
	size varchar(20) not null,
	weight varchar(20) not null,
	callTime varchar(20) not null,
	liveTime varchar(20) not null,
	phoneTypeState int not null
);
--手机表--
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
-- 给手机表添加外键 --
alter table phone add constraint fk_phone_phoneTypeId foreign key(phoneTypeId) references phoneType(phoneTypeId);
--购物车表--
create table shoppingCar(
	shoppingCarId int not null primary key auto_increment,
	userId int not null,
	phoneId int not null,
	shoppingCarTime datetime not null
);
--给购物车表添加外键--
alter table shoppingCar add constraint fk_shoppingCar_userId foreign key(userId) references userInfo(userId);
alter table shoppingCar add constraint fk_shoppingCar_phoneId foreign key(phoneId) references phone(phoneId);
--收获地址表--
create table address(
	addressId int not null primary key auto_increment,
	userId int not null,
	addressInfo varchar(50) not null,
	postcode varchar(10)
);
--给收获地址表添加外键--
alter table address add constraint fk_address_userId foreign key(userId) references userInfo(userId);
--订单详细表--
create table orderForm(
	orderFormId varchar(20) not null primary key,
	userId int not null,
	addressId int not null,
	remark varchar(50)
);
--给订单详细表添加外键--
alter table orderForm add constraint fk_orderForm_userId foreign key(userId) references userInfo(userId);
alter table orderForm add constraint fk_orderForm_addressId foreign key(addressId) references address(addressId);
--订单明细表--
create table orderDeatil(
	orderDeatilId int not null primary key auto_increment,
	orderFormId varchar(20) not null,
	phoneId int not null
);
--给订单明细表添加外键--
alter table orderDeatil add constraint fl_orderDetail_orderFormId foreign key(orderFormId) references orderForm(orderFormId);
alter table orderDeatil add constraint fl_Phone_phoneId foreign key(phoneId) references phone(phoneId);
--订单状态表--
create table orderState(
	orderStateId int not null primary key auto_increment,
	orderFormId varchar(20) not null,
	orderStateDesc varchar(20) not null,
	orderStateTime datetime
);
--给订单状态表添加外键--
alter table orderState add constraint fk_orderState_orderFormId foreign key(orderFormId) references orderForm(orderFormId);
--评价表--
create table comment(
	commentId int not null primary key auto_increment,
	userId int not null,
	phoneId int not null,
	commentContent varchar(500) not null,
	commentTime datetime not null
);
--给评价表添加外键--
alter table comment add constraint fk_comment_userId foreign key(userId) references userInfo(userId);
alter table comment add constraint fk_comment_phoneId foreign key(phoneId) references phone(phoneId);
--公告新闻表--
create table news(
	newsId int not null primary key auto_increment,
	title varchar(50) not null,
	newsContent varchar(500) not null,
	newsTime datetime not null,
	newsState int not null
);
--管理员表--
create table manager(
	managerId int not null primary key auto_increment,
	loginName varchar(20) not null,
	loginPass varchar(32) not null
);
--管理员登录日志表--
create table log(
	logId int not null primary key auto_increment,
	managerId int not null,
	ipAddress varchar(20) not null,
	message varchar(20) not null,
	logTime datetime not null
);
--给日志表添加外键--
alter table log add constraint fk_log_managerId foreign key(managerId) references manager(managerId);
--购物券表--
create table voucher(
	voucherId int not null primary key auto_increment,
	userId int not null,
	voucherPrice double not null,
	voucherTime datetime not null,
	voucherDesc varchar(50),
	voucherState int not null
);
--给购物券表添加外键--
alter table voucher add constraint fk_voucher_userId foreign key(userId) references userInfo(userId);