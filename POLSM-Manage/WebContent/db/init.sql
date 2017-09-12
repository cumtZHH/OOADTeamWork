--用户等级表初始化数据--
insert into level(levelName,levelDesc,discount) values
('英勇黄铜','英勇黄铜',0.95),
('不屈白银','不屈白银',0.90),
('荣耀黄金','荣耀黄金',0.88),
('华贵铂金','华贵铂金',0.86),
('璀璨钻石','璀璨钻石',0.84),
('超凡大师','超凡大师',0.82),
('最强王者','最强王者',0.80);
--给订单状态表初始化数据--
('等待买家付款')
('取消订单')
('等待卖家发货')
('等待买家收获')
('申请退货')
('退款成功')
('交易成功')
('交易关闭')
--给用户初始化数据--
insert into userInfo(loginName,userName,passWord,gender,passQuestion,passAnswer,email,tel,IDCard,money,comsum,registerTime,levelId,userState)
values('你猜','王五','123456','1','随便吧','那就随便吧','1571902315@qq.co,',18895627238,340121199411085253,0,0,'2017-1-1',3,0);