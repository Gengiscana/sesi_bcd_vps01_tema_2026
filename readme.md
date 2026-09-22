# Estoque de uma Loja
## Tema
Este é um banco de dados de um estoque de uma loja de roupas, gerindo vestidos masculinos, femininos e acessórios, controlando entrada e saída, preços, etc.
## MER & DER
![alt text](<MER & DER.drawio.png>)
## Dicionário de dados MarkDown
| Entidade | Atributo | Tipo | Tamanho | Descrição |
| :--- | :--- | :--- | :--- | :--- |
| Produto | id | int | 11 | Chave primária |
| Produto | nome | varchar | 100 | Nome do produto |
| Produto | descricao | varchar | 300 | Descrição do produto |
| Produto | preco | decimal | 10,2 | Preço do produto |
| Produto | marca | varchar | 100 | Marca do produto |
| Produto | id_categoria | int | 11 | Chave estrangeira, referência: Categoria(id) |
| Produto | id_fornecedor | int | 11 | Chave estrangeira, referência: Fornecedor(id) |
| Categoria | id | int | 11 | Chave primária |
| Categoria | nome | varchar | 100 | Nome da categoria |
| Categoria | descricao | varchar | 300 | Descrição da categoria |
| Fornecedor | id | int | 11 | Chave primária |
| Fornecedor | razao_social | varchar | 100 | Razão Social do fornecedor |
| Fornecedor | nome_fantasia | varchar | 100 | Nome Fantasia do fornecedor |
| Fornecedor | cnpj | varchar | 20 | CNPJ do fornecedor |
| Fornecedor | telefone | varchar | 15 | Telefone do fornecedor |
| Fornecedor | email | varchar | 50 | Email do fornecedor |
| Fornecedor | endereco | varchar | 150 | Endereço do fornecedor |
| Estoque | id_estoque | int | 11 | Chave primária |
| Estoque | id_produto | int | 11 | Chave estrangeira, referência: Produto(id) |
| Estoque | quantidade | int | 11 | Quantidade de estoque |
| Estoque | quantidade_minima | int | 11 | Quantidade mínima de estoque |
| Estoque | localizacao | varchar | 100 | Localização do estoque |
| Movimentação do estoque | id_movimentacao | int | 11 | Chave primária |
| Movimentação do estoque | id_produto | int | 11 | Chave estrangeira, referência: Produto(id) |
| Movimentação do estoque | tipo | enum | 1 byte | Tipo de movimentação do estoque |
| Movimentação do estoque | quantidade | int | 11 | Quantidade de movimentação do estoque |
| Movimentação do estoque | data | datetime | 5 bytes | Data de movimentação do estoque |
## Dados de Teste CSV
[Produtos](produto.CSV)
[Fornecedor](fornecedor.CSV)
[Categoria](categoria.CSV)
[Estoque](estoque.CSV)
[Movimentação](mov.CSV)
## Linhas de código DDL e DML
### DDL
```sql
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
```
### DML
```sql
use loja_estoque;

insert into categoria (nome, descricao) values
('Moda Feminina', 'Vestidos, saias, blusas, calças e moda íntima feminina'),
('Moda Masculina', 'Camisetas, camisas, bermudas, calças e casacos masculinos'),
('Acessórios', 'Bolsas, cintos, bonés, lenços, carteiras, etc.');

insert into fornecedor (razao_social, nome_fantasia, cnpj, telefone, email, endereco) values
('Moda Aura e Ego', 'Aurego', '12.640.595/0001-29', '(24) 92567-7742', 'contato@roupassigmas.com', 'Rua Skibidi, 500 - São Paulo/SP'),
('Roupas Radicais da Silva', 'RoupasWow', '33.890.494/0001-86', '(95) 96510-7263', 'comprem@minhasroupas.com', 'Av. das Manobras, 120 - Afeganistão/RJ'),
('Artefatos Misticos', 'Bruxaria', '90.912.830/0001-88', '(81) 99437-7060', 'cuidado@magianegra.com', 'Rua Sombria Maligna, 333 - Pizzas/MG');

insert into produto (nome, descricao, preco, marca, id_categoria, id_fornecedor) values
('Camiseta Tung Tung Sahur', 'Camiseta masculina 100% madeira, gola careca, cor marrom', 49,90, 'Brain', 2, 1),
('Calça Billie Jeans', 'Calça jeans masculina azul escuro com elastano', 139,90, 'Michael', 2, 1),
('Vestido do Batman', 'Vestido sombrio para trazer justiça nas ruas', 159,90, 'Vengeance', 1, 2),
('Anel de salomão', 'Um anel com extremo poder e extremo perigo, não venda', 30,00, 'Sal', 3, 3);

insert into estoque (id_produto, quantidade, quantidade_minima, localizacao) values
(1, 100, 20, 'Arara 01 - Seção Masculina'),
(2, 45, 10, 'Prateleira B2 - Jeans'),
(3, 1, 1, 'Patreleira da Justiça - Aura'),
(4, 30, 5, 'Cofre - Seção Feitiçaria');

insert into movimentacao_do_estoque (id_produto, tipo, quantidade, data) values
(1, 'Entrada', 100, '2026-03-01 08:30:00'),
(2, 'Entrada', 45, '2026-03-01 09:00:00'),
(3, 'Saída', 1, '2026-03-02 14:15:00'),
(4, 'Saída', 1, '2026-03-03 03:33:33');
```
