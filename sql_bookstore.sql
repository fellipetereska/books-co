/* Criando o banco de dados */
CREATE DATABASE db_bookstore;

/* Usando o banco de dados */
USE db_bookstore;

/* Criando tabelas */
/* Livros */
CREATE TABLE livros (
    idLivro INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    titulo VARCHAR(250) NOT NULL,
    autor VARCHAR(250) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    qtd DECIMAL(10,2) NOT NULL,
    fkIdFornecedor INT
);

/* Clientes */
CREATE TABLE clientes (
    idCliente INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome VARCHAR(250) NOT NULL,
    email VARCHAR(250) NOT NULL,
    telefone VARCHAR(250) NOT NULL
);

/* Fornecedores */
CREATE TABLE fornecedores (
    idFornecedor INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome VARCHAR(250) NOT NULL,
    cnpj VARCHAR(250) NOT NULL,
    contato VARCHAR(250) NOT NULL
);

/* Vendas */
CREATE TABLE vendas (
    idVenda INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    dataVenda DATE,
    fkIdCliente INT,
    fkIdLivro INT,
    total DECIMAL(10,2) NOT NULL
);

/* Intercessão de Livro e Venda */
CREATE TABLE livrosVendas (
    idLivroVenda INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    fkLivroId INT,
    fkVendaId INT
);

/* Relacionamentos */
ALTER TABLE livros ADD FOREIGN KEY(fkIdFornecedor) REFERENCES fornecedores(idFornecedor);
ALTER TABLE vendas ADD FOREIGN KEY(fkIdCliente) REFERENCES clientes(idCliente);
ALTER TABLE livrosVendas ADD FOREIGN KEY(fkLivroId) REFERENCES livros(idLivro);
ALTER TABLE livrosVendas ADD FOREIGN KEY(fkVendaId) REFERENCES vendas(idVenda);

/* Inserindo dados na tabela Livros */
INSERT INTO livros (titulo, autor, preco, qtd) VALUES 
('O Senhor dos Anéis', 'J.R.R. Tolkien', 59.90, 100),
('Harry Potter e a Pedra Filosofal', 'J.K. Rowling', 39.90, 150),
('O Código Da Vinci', 'Dan Brown', 49.90, 120),
('O Pequeno Príncipe', 'Antoine de Saint-Exupéry', 19.90, 200);

/* Inserindo dados na tabela Clientes */
INSERT INTO clientes (nome, email, telefone) VALUES 
('Ana Silva', 'ana.silva@example.com', '11999999999'),
('Carlos Pereira', 'carlos.pereira@example.com', '11988888888'),
('Mariana Souza', 'mariana.souza@example.com', '11977777777');

/* Inserindo dados na tabela Fornecedores */
INSERT INTO fornecedores (nome, cnpj, contato) VALUES 
('Distribuidora A', '12.345.678/0001-90', 'contato@distribuidorA.com.br'),
('Editora B', '23.456.789/0001-80', 'contato@editorab.com.br'),
('Distribuidora C', '34.567.890/0001-70', 'contato@distribuidorac.com.br');

/* Inserindo dados na tabela Vendas */
INSERT INTO vendas (dataVenda, fkIdCliente, fkIdLivro, total) VALUES 
('2024-08-01', 1, 1, 59.90),
('2024-08-02', 2, 2, 79.80),
('2024-08-03', 3, 3, 49.90);

/* Inserindo dados na tabela livrosVendas */
INSERT INTO livrosVendas (fkLivroId, fkVendaId) VALUES 
(1, 1),
(2, 2),
(3, 3);