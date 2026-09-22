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