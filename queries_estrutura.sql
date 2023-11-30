
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
    
-- pedidos

INSERT INTO Clientes (nome_completo, nome_preferido, cpf, data_nascimento, telefone, email, bairro, cidade, estado)
VALUES
    ('João Silva', 'João', '123.456.789-01', '1990-05-15', '(11) 98765-4321', 'joao@gmail.com', 'Centro', 'São Paulo', 'SP'),
    ('Maria Oliveira', 'Maria', '987.654.321-02', '1985-08-20', '(11) 87654-3210', 'maria@gmail.com', 'Bela Vista', 'São Paulo', 'SP'),
    ('Carlos Souza', 'Carlos', '234.567.890-03', '1995-02-10', '(11) 76543-2109', 'carlos@gmail.com', 'Pinheiros', 'São Paulo', 'SP');

INSERT INTO Pasteis (nome_pastel, preco, tamanho_id, categoria_id)
VALUES
    ('Pastel de Carne', 5.00, 1, 1),
    ('Pastel de Queijo', 4.50, 2, 1),
    ('Pastel de Frango', 5.50, 2, 1),
    ('Pastel Vegano de Abobrinha', 6.00, 1, 4);

INSERT INTO Bebidas (nome_bebida, preco, tamanho_id)
VALUES
    ('Refrigerante 300ml', 3.00, 1),
    ('Suco de Laranja 500ml', 5.00, 2),
    ('Água 1L', 4.00, 3);

CALL FazerPedido(1, '2023-11-30', 'Cartão de Crédito', 1, 1, 1);
CALL FazerPedido(1, '2023-11-29', 'Dinheiro', 1, 2, 2);

CALL FazerPedido(2, '2023-11-28', 'Cartão de Débito', 1, 2, 1);

CALL FazerPedido(3, '2023-11-27', 'Dinheiro', 4, 4, 1);

CALL ObterDetalhesPedido(1);
CALL ObterDetalhesPedido(2);
CALL ObterDetalhesPedido(3);



DELIMITER //

CREATE PROCEDURE AdicionarCliente(
    IN p_nome_completo VARCHAR(100),
    IN p_nome_preferido VARCHAR(50),
    IN p_cpf VARCHAR(14),
    IN p_data_nascimento DATE,
    IN p_telefone VARCHAR(20),
    IN p_email VARCHAR(100),
    IN p_bairro VARCHAR(50),
    IN p_cidade VARCHAR(50),
    IN p_estado VARCHAR(2)
)
BEGIN
    INSERT INTO Clientes (
        nome_completo, nome_preferido, cpf, data_nascimento, 
        telefone, email, bairro, cidade, estado
    ) VALUES (
        p_nome_completo, p_nome_preferido, p_cpf, p_data_nascimento, 
        p_telefone, p_email, p_bairro, p_cidade, p_estado
    );
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE FazerPedido(
    IN p_cliente_id INT,
    IN p_data_pedido DATE,
    IN p_forma_pagamento VARCHAR(50),
    IN p_categoria_id INT,
    IN p_pastel_id INT,
    IN p_quantidade INT
)
BEGIN
    DECLARE v_pedido_id INT;


    INSERT INTO Pedidos (cliente_id, data_pedido, forma_pagamento, categoria_id)
    VALUES (p_cliente_id, p_data_pedido, p_forma_pagamento, p_categoria_id);

    SET v_pedido_id = LAST_INSERT_ID();

    INSERT INTO Detalhes_Pedido (pedido_id, pastel_id, quantidade)
    VALUES (v_pedido_id, p_pastel_id, p_quantidade);
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE ObterDetalhesPedido(
    IN p_pedido_id INT
)
BEGIN
    SELECT
        D.detalhe_id,
        D.pedido_id,
        D.pastel_id,
        D.quantidade,
        P.nome_pastel,
        P.preco,
        C.nome_categoria
    FROM
        Detalhes_Pedido D
    JOIN
        Pasteis P ON D.pastel_id = P.pastel_id
    JOIN
        Categorias C ON P.categoria_id = C.categoria_id
    WHERE
        D.pedido_id = p_pedido_id;
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER AtualizarPrecoTotalPedido
AFTER INSERT ON Detalhes_Pedido
FOR EACH ROW
BEGIN
    DECLARE total DECIMAL(10, 2);

    SELECT COALESCE(SUM(P.preco * DP.quantidade), 0.00)
    INTO total
    FROM Detalhes_Pedido DP
    JOIN Pasteis P ON DP.pastel_id = P.pastel_id
    WHERE DP.pedido_id = NEW.pedido_id;

    UPDATE Pedidos
    SET preco_total = total
    WHERE pedido_id = NEW.pedido_id;
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER AtualizarQuantidadePedidosCliente
AFTER INSERT ON Pedidos
FOR EACH ROW
BEGIN
    UPDATE Clientes
    SET quantidade_pedidos = quantidade_pedidos + 1
    WHERE cliente_id = NEW.cliente_id;
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER AtualizarQuantidadePasteisVendidos
AFTER INSERT ON Detalhes_Pedido
FOR EACH ROW
BEGIN
    UPDATE Categorias
    SET quantidade_pasteis_vendidos = quantidade_pasteis_vendidos + NEW.quantidade
    WHERE categoria_id = (SELECT categoria_id FROM Pasteis WHERE pastel_id = NEW.pastel_id);
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER LimparDetalhesPedidosExpirados
AFTER DELETE ON Pedidos
FOR EACH ROW
BEGIN
    DELETE FROM Detalhes_Pedido
    WHERE pedido_id = OLD.pedido_id;
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER AtualizarTotalPasteisEstoque
AFTER INSERT ON Detalhes_Pedido
FOR EACH ROW
BEGIN
    UPDATE Pasteis
    SET quantidade_estoque = quantidade_estoque - NEW.quantidade
    WHERE pastel_id = NEW.pastel_id;
END //

DELIMITER ;

DELIMITER //

CREATE FUNCTION ObterNomeCliente(cliente_id INT) RETURNS VARCHAR(100) DETERMINISTIC
BEGIN
    DECLARE nome_cliente VARCHAR(100);
    
    SELECT nome_completo INTO nome_cliente
    FROM Clientes
    WHERE cliente_id = cliente_id;
    
    RETURN nome_cliente;
END //

DELIMITER ;

DELIMITER //

CREATE FUNCTION CalcularIdadeCliente(cliente_id INT) RETURNS INT DETERMINISTIC
BEGIN
    DECLARE idade_cliente INT;
    
    SELECT YEAR(CURDATE()) - YEAR(data_nascimento) - 
           (RIGHT(CURDATE(), 5) < RIGHT(data_nascimento, 5)) INTO idade_cliente
    FROM Clientes
    WHERE cliente_id = cliente_id;
    
    RETURN idade_cliente;
END //

DELIMITER ;

-- Função para calcular o preço total de compras de um cliente
DELIMITER //

CREATE FUNCTION CalcularPrecoTotalCliente(cliente_id INT) RETURNS DECIMAL(10, 2) DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10, 2);

    SELECT COALESCE(SUM(P.preco * DP.quantidade), 0.00)
    INTO total
    FROM Detalhes_Pedido DP
    JOIN Pasteis P ON DP.pastel_id = P.pastel_id
    JOIN Pedidos PE ON DP.pedido_id = PE.pedido_id
    WHERE PE.cliente_id = cliente_id;

    RETURN total;
END //

DELIMITER ; 




