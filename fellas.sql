create database fellas;
use fellas;

#aTipoFundo
create table aTF(
codTipoFundo int not null auto_increment,
descTipoFundo varchar(30) not null,
primary key (codTipoFundo)
);
drop table aTF;

#aFundoInvestimento
create table aFI(
numFundo int not null auto_increment,
nomeComFundo varchar(60) not null,
codTipoFundo int not null,
dataInicio datetime not null default now(),
ativo_S_N char(1) not null default "N",
primary key(numFundo),
foreign key(codTipoFundo) references aTF(codTipoFundo)
);
drop table aFI;

create table aAplicacao(
numAplicativo int not null auto_increment,
codCli int not null,
numFundo int not null,
numConsultor int not null,
dataAplicacao datetime not null,
valorAplicacao numeric(10.2),
primary key (numAplicativo),
foreign key (codCli) references aCliente(codCli),
foreign key (numFundo) references aFI(numFundo),
foreign key (numConsultor) references aConsultorinvestimento(numConsultor)
);
drop table aAplicacao;

create table aCliente(
codCli int not null auto_increment,
nomeCli varchar(50) not null,
dataNascimento datetime not null,
CPF varchar(14) not null,
primary key(codCli)
);
drop table aCliente;

create table aConsultorinvestimento(
numConsultor int not null auto_increment,
nomeConsultor varchar(30) not null,
percentual_comissao numeric(10.2),
primary key(numConsultor)
);
drop table aConsultorinvestimento;

alter table aFI modify dataInicio datetime not null default now();

insert into aCliente(nomeCli, dataNascimento, CPF) values
("ronaldinho", "1980-02-21", "708-870-071-13"),
("pelé", "1940-10-23", "546-645-456-56");

insert into aConsultorinvestimento(nomeConsultor, percentual_comissao) values
("cristiano ronaldo", 500),
("carlos", 450);

insert into aAplicacao(codCli, numFundo, numConsultor, dataAplicacao, valorAplicacao) values
(5019034022, 543021, 930, "2004-07-20", 80),
(0123456789, 789654, 789, "2007-12-31", 75);

insert into aFI(nomeComFundo, codTipoFundo, dataInicio, ativo_S_N) values
("santander", 504, "1987-11-16"),
("nubank", 607, "1978-10-19");

insert into aTF(descTipoFundo) values
("Ações"),
("CDB"),
("tesouro direto");

select * from aCliente;

select * from aConsultorinvestimento; 

select * from aAplicacao a
join aCliente c on c.codCli = a.codCliFK
join aConsultorinvestimento ci on ci.numConsultor = a.numConsultorFK
join aFI f on f.numFundo = a.numFundoFK
join aTF t on t.codTipoFundo = a.codTipoFundoFK;

select * from aFI;

select * from aTF;

describe aCliente;
describe aConsultorinvestimento;
describe aAplicacao;
describe aFI;
describe aTF;

/*prijeto atualizado 21:41*/