create database nutritionist;
use nutritionist;

create table user(
idUser bigint not null auto_increment,
userName varchar(40) not null,
userAge bigint not null,
userDob date not null,
userHeight double not null,
userWeight bigint not null,
primary key(idUser)
);

drop table user;

create table day(
idDay date not null,
idUser bigint not null,
primary key(idDay),
foreign key(idUser) references user(idUser)
);

create table meals(
mealNum bigint not null auto_increment,
calories bigint not null,
fat bigint not null,
carbohydrates bigint not null,
fibra bigint not null,
protein bigint not null,
day_idDay date not null,
primary key(mealNum),
foreign key(day_idDay) references day(idDay)
);

describe user;
insert into user(userName, userAge, userDob, userHeight, userWeight) values("hernesto", 18, "2023-07-20", 1.81, 75);
insert into meals (calories, fat, carbohydrates, fibra, protein, day_idDay) values(100, 150, 500, 250, 325, "2023-07-20");