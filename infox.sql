-- criar um novo banco de dados
create database dbinfox;
-- escolher o banco de dados
use dbinfox;
-- criar a tabela de usuários
create table tbusuarios(
iduser int primary key,
usuario varchar(50) not null,
fone varchar(15),
login varchar(15) not null unique,
senha varchar(15) not null
);

-- descrever a tabela
describe tbusuarios;
-- a linha abaixo insere dados na tabela (CRUD)
-- create --> insert
insert into tbusuarios(iduser,usuario,fone,login,senha)
values(1,'Maycon Moraes','9999-9999','maycon','123456');

-- a linha abaixo abaixo exibe os dados da tabela (CRUD)
-- read --> select
select * from tbusuarios;

-- cadastrar mais 2 usuários
insert into tbusuarios(iduser,usuario,fone,login,senha)
values(2,'Administrador','9999-9999','admin','admin');
insert into tbusuarios(iduser,usuario,fone,login,senha)
values(3,'Renato Sene','9999-9999','renato','123456');

-- a linha abaixa atualiza os dados na tabela (CRUD)
-- update --> update
update tbusuarios set fone='8888-8888' where iduser=2;

-- a linha abaixa apaga os dados na tabela (CRUD)
-- delete --> delete
delete from tbusuarios where iduser=3;

select * from tbusuarios;

create table tbclientes(
idcli int primary key auto_increment,
nomecli varchar(50) not null,
endcli varchar(100),
fonecli varchar(50) not null,
emailcli varchar(50)
);

describe tbclientes;

insert into tbclientes(nomecli,endcli,fonecli,emailcli)
values('Linus Torvalds', 'Rua Tux 2019', '9999-9999','linus@linux.com');

select * from tbclientes;

create table tbos(
os int primary key auto_increment,
data_os timestamp default current_timestamp,
equipamento varchar(150) not null,
defeito varchar(150) not null,
servico varchar(150),
tecnico varchar(30),
valor decimal(10,2),
idcli int not null,
foreign key(idcli) references tbclientes(idcli)
);

describe tbos;

insert into tbos(equipamento,defeito,servico,tecnico,valor,idcli)
values('notebook','Não liga','Troca da Fonte','Zé',87.50,1);

select * from tbos;


-- o codigo abaixo trás informações de duas tabelas

select 
O.os,equipamento,defeito,servico,valor,
C.nomecli,fonecli
from tbos as O 
inner join tbclientes as C
on (O.idcli = C.idcli);

use dbinfox;
describe tbusuario;
select * from tbusuario;
-- a linha abaixo adiciona um campo à tabela usuário
alter table tbusuario add column perfil varchar(20) not null;
-- a linha abaixo remove um campo de uma tabela
alter table tbusuario drop column perfil;

-- acrescentar usuários ao perfil
update tbusuario set perfil ='admin' where iduser=1;

insert into tbusuario(iduser,usuario,fone,login,senha,perfil)
values(3,'Gabriel','9999-9999','gabriel','123456','admin');

-- tornar gabriel user apenas
update tbusuario set perfil ='user' where iduser=3;
update tbusuario set perfil ='admin' where iduser=1;
update tbusuario set perfil ='admin' where iduser=2;

-- usuarios não podem acessar relatórios nem cadastrar usuários
-- admininistradores podem fazer tudo

-- selecionar clientes a partir do nome 
select idcli,nomecli,fonecli from tbclientes where nomecli like 'jo%';
-- a linha abaixo cria um apelido aos campos da tabela
select idcli as Id,nomecli as Nome,fonecli as Fone from tbclientes where nomecli like 'jo%';

