drop database if exists loja_estoque;
create database loja_estoque;
use loja_estoque;
create table produto(
    id int primary key auto_increment,
    nome varchar(100) not null,
    descricao varchar(300),
    preco decimal(10,2) not null,
    marca varchar(100) not null,
    id_categoria int not null,
    id_fornecedor int not null
);
create table categoria(
    id int primary key auto_increment,
    nome varchar(100) not null,
    descricao varchar(300)
);
create table fornecedor(
    id int primary key auto_increment,
    razao_social varchar(100) not null,
    nome_fantasia varchar(100),
    cnpj varchar(20) not null,
    telefone varchar(15),
    email varchar(50) not null,
    endereco varchar(150) not null
);
create table estoque(
    id_estoque int primary key auto_increment,
    id_produto int not null,
    quantidade int not null,
    quantidade_minima int not null,
    localizacao varchar(100) not null
);
create table movimentacao_do_estoque(
    id_movimentacao int primary key auto_increment,
    id_produto int not null,
    tipo enum("Entrada","Saída") not null,
    quantidade int not null,
    data datetime not null
);

alter table produto add constraint fk_categoria foreign key (id_categoria) references categoria(id);
alter table produto add constraint fk_fornecedor foreign key (id_fornecedor) references fornecedor(id);
alter table estoque add constraint fk_produto foreign key (id_produto) references produto(id);
alter table movimentacao_do_estoque add constraint fk_produto2 foreign key (id_produto) references produto(id);

show tables;
describe produto;
describe categoria;
describe fornecedor;
describe estoque;
describe movimentacao_do_estoque;