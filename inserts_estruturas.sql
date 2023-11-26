-- Inserindo tamanhos dos pasteis
INSERT INTO Tamanhos (nome_tamanho, tipo) VALUES
    ('P', 'P'),
    ('M', 'M'),
    ('G', 'G');

-- Inserindo preços dos pasteis
UPDATE Tamanhos SET preco = 5.00 WHERE nome_tamanho = 'P';
UPDATE Tamanhos SET preco = 10.00 WHERE nome_tamanho = 'M';
UPDATE Tamanhos SET preco = 15.00 WHERE nome_tamanho = 'G';

-- Inserindo tamanhos das bebidas
INSERT INTO Tamanhos (nome_tamanho, tipo) VALUES
    ('300ml', '300ml'),
    ('500ml', '500ml'),
    ('1L', '1L');

-- Inserindo preços das bebidas
UPDATE Tamanhos SET preco = 3.00 WHERE nome_tamanho = '300ml';
UPDATE Tamanhos SET preco = 5.00 WHERE nome_tamanho = '500ml';
UPDATE Tamanhos SET preco = 7.00 WHERE nome_tamanho = '1L';

-- saborres e valores
INSERT INTO Pasteis (nome_pastel, preco, categoria_id)
VALUES
    ('Carne', 5.00, 1),
    ('Queijo', 5.00, 2),
    ('Frango', 5.00, 3),
    ('Calabresa', 5.00, 4),
    ('Presunto', 5.00, 5),
    ('Bacon', 5.00, 6),
    ('Vegetariano', 6.00, 7),
    ('Vegano', 6.00, 8),
    ('Tofu com Legumes', 6.50, 7),
    ('Soja com Espinafre', 6.50, 8),
    ('Brócolis e Queijo', 6.50, 7),
    ('Vegano de Abobrinha', 6.50, 8),
    ('Palmito', 6.00, 7),
    ('Vegano de Cogumelos', 6.50, 8);
    
-- bebidas
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
    
