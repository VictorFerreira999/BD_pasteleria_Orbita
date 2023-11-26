-- Criando o banco de dados
CREATE DATABASE IF NOT EXISTS PastelariaDB;
USE PastelariaDB;

-- Tabela Clientes
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

-- Tabela Contatos_Cliente
CREATE TABLE IF NOT EXISTS Contatos_Cliente (
    contato_id INT PRIMARY KEY AUTO_INCREMENT,
    cliente_id INT,
    tipo_contato VARCHAR(20),
    valor_contato VARCHAR(100),
    FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id)
);

-- Tabela Recheios
CREATE TABLE IF NOT EXISTS Recheios (
    recheio_id INT PRIMARY KEY AUTO_INCREMENT,
    nome_recheio VARCHAR(50)
);

-- Tabela Tamanhos
CREATE TABLE IF NOT EXISTS Tamanhos (
    tamanho_id INT PRIMARY KEY AUTO_INCREMENT,
    nome_tamanho VARCHAR(50),
    tipo VARCHAR(10) -- P, M, G para pasteis; 300ml, 500ml, 1L para bebidas
);

-- Tabela Categorias
CREATE TABLE IF NOT EXISTS Categorias (
    categoria_id INT PRIMARY KEY AUTO_INCREMENT,
    nome_categoria VARCHAR(50)
);

-- Tabela Pasteis
CREATE TABLE IF NOT EXISTS Pasteis (
    pastel_id INT PRIMARY KEY AUTO_INCREMENT,
    nome_pastel VARCHAR(100),
    preco DECIMAL(10, 2),
    tamanho_id INT,
    categoria_id INT,
    FOREIGN KEY (tamanho_id) REFERENCES Tamanhos(tamanho_id),
    FOREIGN KEY (categoria_id) REFERENCES Categorias(categoria_id)
);

-- Tabela Pasteis_Recheios (Relação many-to-many)
CREATE TABLE IF NOT EXISTS Pasteis_Recheios (
    pastel_id INT,
    recheio_id INT,
    PRIMARY KEY (pastel_id, recheio_id),
    FOREIGN KEY (pastel_id) REFERENCES Pasteis(pastel_id),
    FOREIGN KEY (recheio_id) REFERENCES Recheios(recheio_id)
);

-- Tabela Bebidas
CREATE TABLE IF NOT EXISTS Bebidas (
    bebida_id INT PRIMARY KEY AUTO_INCREMENT,
    nome_bebida VARCHAR(100),
    preco DECIMAL(10, 2),
    tamanho_id INT,
    FOREIGN KEY (tamanho_id) REFERENCES Tamanhos(tamanho_id)
);

-- Tabela Pedidos
CREATE TABLE IF NOT EXISTS Pedidos (
    pedido_id INT PRIMARY KEY AUTO_INCREMENT,
    cliente_id INT,
    data_pedido DATE,
    forma_pagamento VARCHAR(50),
    categoria_id INT,
    FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id),
    FOREIGN KEY (categoria_id) REFERENCES Categorias(categoria_id)
);

-- Tabela Detalhes_Pedido
CREATE TABLE IF NOT EXISTS Detalhes_Pedido (
    detalhe_id INT PRIMARY KEY AUTO_INCREMENT,
    pedido_id INT,
    pastel_id INT,
    quantidade INT,
    FOREIGN KEY (pedido_id) REFERENCES Pedidos(pedido_id),
    FOREIGN KEY (pastel_id) REFERENCES Pasteis(pastel_id)
);

-- Tabela Detalhes_Pedido_Bebida (Relação many-to-many)
CREATE TABLE IF NOT EXISTS Detalhes_Pedido_Bebida (
    detalhe_bebida_id INT PRIMARY KEY AUTO_INCREMENT,
    pedido_id INT,
    bebida_id INT,
    quantidade INT,
    FOREIGN KEY (pedido_id) REFERENCES Pedidos(pedido_id),
    FOREIGN KEY (bebida_id) REFERENCES Bebidas(bebida_id)
);
