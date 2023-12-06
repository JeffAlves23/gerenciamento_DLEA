CREATE DATABASE gerenciamento_dlea;
USE gerenciamento_dlea;
 
CREATE TABLE Produto (
    idProduto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10, 2),
    quantidade_estoque INT
);
 
CREATE TABLE Fornecedor (
    idFornecedor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    cnpj VARCHAR(18),
    telefone VARCHAR(11)
);
 
CREATE TABLE Cliente (
    idCliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    cnpj VARCHAR(18),
    telefone VARCHAR(11)
);
 
CREATE TABLE Venda (
    idVenda INT AUTO_INCREMENT PRIMARY KEY,
    idCliente INT,
    data_venda DATE,
    valor_total DECIMAL(10, 2),
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
);
 
CREATE TABLE DetalhesVenda (
    idDetalhesVenda INT AUTO_INCREMENT PRIMARY KEY,
    idVenda INT,
    idProduto INT,
    quantidade INT,
    preco_unitario DECIMAL(10, 2),
    FOREIGN KEY (idVenda) REFERENCES Venda(idVenda),
    FOREIGN KEY (idProduto) REFERENCES Produto(idProduto)
);
 
CREATE TABLE Compra (
    idCompra INT AUTO_INCREMENT PRIMARY KEY,
    idFornecedor INT,
    data_compra DATE,
    valor_total DECIMAL(10, 2),
    FOREIGN KEY (idFornecedor) REFERENCES Fornecedor(idFornecedor)
);
 
CREATE TABLE DetalhesCompra (
    idDetalhesCompra INT AUTO_INCREMENT PRIMARY KEY,
    idCompra INT,
    idProduto INT,
    quantidade INT,
    preco_unitario DECIMAL(10, 2),
    FOREIGN KEY (idCompra) REFERENCES Compra(idCompra),
    FOREIGN KEY (idProduto) REFERENCES Produto(idProduto)
);
 
CREATE TABLE Estoque (
    idEstoque INT AUTO_INCREMENT PRIMARY KEY,
    idProduto INT,
    quantidade_em_estoque INT,
    FOREIGN KEY (idProduto) REFERENCES Produto(idProduto)
);

INSERT INTO Produto (nome, descricao, preco, quantidade_estoque)
VALUES ('Produto1', 'Descrição do Produto 1', 29.99, 100);

INSERT INTO Fornecedor (nome, cnpj, telefone)
VALUES ('Fornecedor1', '12345678901234', '1234567890');

INSERT INTO Cliente (nome, cnpj, telefone)
VALUES ('Cliente1', '98765432109876', '9876543210');

INSERT INTO Venda (idCliente, data_venda, valor_total)
VALUES (1, '2023-12-01', 150.00);

INSERT INTO DetalhesVenda (idVenda, idProduto, quantidade, preco_unitario)
VALUES (1, 1, 3, 29.99);

INSERT INTO Compra (idFornecedor, data_compra, valor_total)
VALUES (1, '2023-11-25', 200.00);

INSERT INTO DetalhesCompra (idCompra, idProduto, quantidade, preco_unitario)
VALUES (1, 1, 5, 25.00);

INSERT INTO Estoque (idProduto, quantidade_em_estoque)
VALUES (1, 90);


SELECT *
FROM Fornecedor;


SELECT *
FROM Cliente;


SELECT *
FROM Produto;


SELECT V.*, DV.idProduto, DV.quantidade, DV.preco_unitario
FROM Venda V
INNER JOIN DetalhesVenda DV ON V.idVenda = DV.idVenda;


SELECT C.*, DC.idProduto, DC.quantidade, DC.preco_unitario
FROM Compra C
INNER JOIN DetalhesCompra DC ON C.idCompra = DC.idCompra;


SELECT *
FROM Estoque;