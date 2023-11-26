
CREATE DATABASE IF NOT EXISTS PastelariaDB;
USE PastelariaDB;


CREATE TABLE IF NOT EXISTS Clientes (
    cliente_id INT PRIMARY KEY AUTO_INCREMENT,
    nome_completo VARCHAR(100),
    nome_preferido VARCHAR(50),
    cpf VARCHAR(14),
    data_nascimento DATE,
    telefone VARCHAR(20),
    email VARCHAR(100),
    bairro VARCHAR(50),
    cidade VARCHAR(50),
    estado VARCHAR(2)
);


CREATE TABLE IF NOT EXISTS Contatos_Cliente (
    contato_id INT PRIMARY KEY AUTO_INCREMENT,
    cliente_id INT,
    tipo_contato VARCHAR(20),
    valor_contato VARCHAR(100),
    FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id)
);


CREATE TABLE IF NOT EXISTS Recheios (
    recheio_id INT PRIMARY KEY AUTO_INCREMENT,
    nome_recheio VARCHAR(50)
);


CREATE TABLE IF NOT EXISTS Tamanhos (
    tamanho_id INT PRIMARY KEY AUTO_INCREMENT,
    nome_tamanho VARCHAR(50),
    tipo VARCHAR(10) -- P, M, G para pasteis; 300ml, 500ml, 1L para bebidas
);


CREATE TABLE IF NOT EXISTS Categorias (
    categoria_id INT PRIMARY KEY AUTO_INCREMENT,
    nome_categoria VARCHAR(50)
);


CREATE TABLE IF NOT EXISTS Pasteis (
    pastel_id INT PRIMARY KEY AUTO_INCREMENT,
    nome_pastel VARCHAR(100),
    preco DECIMAL(10, 2),
    tamanho_id INT,
    categoria_id INT,
    FOREIGN KEY (tamanho_id) REFERENCES Tamanhos(tamanho_id),
    FOREIGN KEY (categoria_id) REFERENCES Categorias(categoria_id)
);


CREATE TABLE IF NOT EXISTS Pasteis_Recheios (
    pastel_id INT,
    recheio_id INT,
    PRIMARY KEY (pastel_id, recheio_id),
    FOREIGN KEY (pastel_id) REFERENCES Pasteis(pastel_id),
    FOREIGN KEY (recheio_id) REFERENCES Recheios(recheio_id)
);

CREATE TABLE IF NOT EXISTS Bebidas (
    bebida_id INT PRIMARY KEY AUTO_INCREMENT,
    nome_bebida VARCHAR(100),
    preco DECIMAL(10, 2),
    tamanho_id INT,
    FOREIGN KEY (tamanho_id) REFERENCES Tamanhos(tamanho_id)
);

CREATE TABLE IF NOT EXISTS Pedidos (
    pedido_id INT PRIMARY KEY AUTO_INCREMENT,
    cliente_id INT,
    data_pedido DATE,
    forma_pagamento VARCHAR(50),
    categoria_id INT,
    FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id),
    FOREIGN KEY (categoria_id) REFERENCES Categorias(categoria_id)
);

CREATE TABLE IF NOT EXISTS Detalhes_Pedido (
    detalhe_id INT PRIMARY KEY AUTO_INCREMENT,
    pedido_id INT,
    pastel_id INT,
    quantidade INT,
    FOREIGN KEY (pedido_id) REFERENCES Pedidos(pedido_id),
    FOREIGN KEY (pastel_id) REFERENCES Pasteis(pastel_id)
);

CREATE TABLE IF NOT EXISTS Detalhes_Pedido_Bebida (
    detalhe_bebida_id INT PRIMARY KEY AUTO_INCREMENT,
    pedido_id INT,
    bebida_id INT,
    quantidade INT,
    FOREIGN KEY (pedido_id) REFERENCES Pedidos(pedido_id),
    FOREIGN KEY (bebida_id) REFERENCES Bebidas(bebida_id)
);

-- inserts 
-- Inserts para a tabela Categorias
INSERT INTO Categorias (nome_categoria) VALUES
    ('Tradicional'),
    ('Vegano'),
    ('Vegetariano'),
    ('Sem lactose');


INSERT INTO Tamanhos (nome_tamanho, tipo) VALUES
    ('P', 'P'),
    ('M', 'M'),
    ('G', 'G');

INSERT INTO Tamanhos (nome_tamanho, tipo) VALUES
    ('300ml', '300ml'),
    ('500ml', '500ml'),
    ('1L', '1L');

INSERT INTO Pasteis (nome_pastel, preco, tamanho_id, categoria_id)
VALUES
    ('Pastel de Carne', NULL, NULL, 1),
    ('Pastel de Queijo', NULL, NULL, 1),
    ('Pastel de Frango', NULL, NULL, 1),
    ('Pastel de Calabresa', NULL, NULL, 1),
    ('Pastel de Presunto', NULL, NULL, 1),
    ('Pastel de Bacon', NULL, NULL, 1),
    ('Pastel de Tofu com Legumes', NULL, NULL, 2),
    ('Pastel de Soja com Espinafre', NULL, NULL, 2),
    ('Pastel de Brócolis e Queijo', NULL, NULL,3),
    ('Pastel Vegano de Abobrinha', NULL, NULL, 4),
    ('Pastel de Palmito', NULL, NULL, 3),
    ('Pastel Vegano de Cogumelos', NULL, NULL,2);
    

INSERT INTO Bebidas (nome_bebida, preco, tamanho_id)
VALUES
    ('Refrigerante 300ml', 3.00, 4),
    ('Refrigerante 500ml', 5.00, 5),
    ('Refrigerante 1L', 7.00, 6),
    ('Suco de Laranja 300ml', 3.00, 4),
    ('Suco de Laranja 500ml', 5.00, 5),
    ('Suco de Laranja 1L', 7.00, 6),
    ('Água 300ml', 3.00, 4),
    ('Água 500ml', 5.00, 5),
    ('Água 1L', 7.00, 6);
    


