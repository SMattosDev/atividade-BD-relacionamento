CREATE DATABASE loja_pascotto;

USE loja_pascotto;

CREATE TABLE Cargo (
    id_cargo INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);

CREATE TABLE Funcionario(
	id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    senha VARCHAR(100) NOT NULL,
    data_nascimento DATE NOT NULL,
    cpf VARCHAR(11) UNIQUE NOT NULL,
     telefone VARCHAR(20) NOT NULL,
    id_cargo INT,
	FOREIGN KEY (id_cargo) REFERENCES Cargo(id_cargo)
);

CREATE TABLE Cliente (
	id_cliente INT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	email VARCHAR(255) UNIQUE NOT NULL,
    senha VARCHAR(100) NOT NULL,
    data_nascimento DATE NOT NULL,
    endereco VARCHAR(255) NOT NULL,
	cpf VARCHAR(11) UNIQUE NOT NULL,
	telefone VARCHAR(20) NOT NULL
);

CREATE TABLE Produto (
	id_produto INT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(600) NOT NULL,
    preco DOUBLE NOT NULL,
    estoque INT NOT NULL
);

CREATE TABLE Pedido (
	id_pedido INT AUTO_INCREMENT PRIMARY KEY,
	id_cliente INT,
	data_pedido DATE NOT NULL,
	forma_pagamento	VARCHAR(50) NOT NULL,
	endereco_entrega VARCHAR(255) NOT NULL,
	FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);

CREATE TABLE ItemPedido (
    id_item INT PRIMARY KEY AUTO_INCREMENT,
    id_pedido INT,
    id_produto INT,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido),
    FOREIGN KEY (id_produto) REFERENCES Produto(id_produto)
);

INSERT INTO Cargo (nome) VALUES 
('Supervisor'),
('Vendedor'),
('Suporte T.I.'),
('Gerente'),
('Estagiário'),
('Financeiro'),
('Logística');

INSERT INTO Funcionario (nome, email, senha, data_nascimento, cpf, telefone, id_cargo) VALUES
('Igor da Mota', 'mota@hotmail.com', 'senha123', '1992-02-08', '86431907213', '21 6154-4005', 1),
('Ana Laura Lopes', 'analopes@gmail.com', 'senha123', '1977-08-14', '57021849397', '0300 030 5722', 2),
('Thales Alves', 'alvess@gmail.com', 'senha123', '1983-11-05', '85463917000', '0300 774 4286', 3),
('Rafael Cavalcanti', 'rafa90@yahoo.com.br', 'senha123', '1999-04-29', '28573104988', '(051) 5423-7927', 4),
('Igor Ribeiro', 'ribeiro92@hotmail.com', 'senha123', '1998-10-08', '41867395282', '31 6849 9426', 5),
('Fernanda Ferreira', 'fernandaferreira@mendes.br', 'senha123', '1983-04-03', '81347629564', '+55 (031) 2189-4875', 6),
('Josefino', 'josefinocastro@uol.com.br', 'senha123', '1984-03-16', '53840216915', '0500 453 6431', 7);

INSERT INTO Cliente (nome, email, senha, data_nascimento, endereco, cpf, telefone) VALUES
('Abobrinha do Carmo', 'abobrinha@email.com', 'senha123', '1990-01-15', 'Rua das Couves, 123', '12345678901', '11988887777'),
('Creuza Pança Fina', 'creuza@email.com', 'senha123', '1985-03-22', 'Av. Bizarra, 456', '23456789012', '11999996666'),
('Zé do Gás Desligado', 'zedogas@email.com', 'senha123', '1978-07-10', 'Travessa dos Fogões, 789', '34567890123', '11977775555'),
('Antônio da Luz', 'luzdoantonio01@ferreira.com', 'senha123', '1973-10-15', 'Área Bernardo da Rocha, 20, Vila Havaí, 38342232 Fogaça / SE', '29850147350', '61 4043 1886'),
('Carolina da Quebrada', 'carolquebrada@email.com', 'senha123', '1998-11-11', 'Beco Sem Saída, 55', '56789012345', '11955553333'),
('Gustavo Dentadura', 'gustavodente@email.com', 'senha123', '1992-08-18', 'Av. dos Sorrisos, 202', '67890123456', '11944442222'),
('Jacinto Leite Aquino', 'jacinto@email.com', 'senha123', '1980-05-05', 'Rua da Piada, 007', '78901234567', '11933331111');

INSERT INTO Produto (nome, descricao, preco, estoque) VALUES
('Mouse Gamer RGB', 'Mouse ergonômico com iluminação RGB, 7 botões programáveis e sensor de alta precisão.', 149.90, 50),
('Teclado Mecânico ABNT2', 'Teclado com switches mecânicos, layout ABNT2, ideal para digitação e jogos.', 279.99, 35),
('Monitor 24" Full HD', 'Monitor LED de 24 polegadas com resolução Full HD, tempo de resposta de 1ms.', 899.00, 20),
('Headset com Microfone', 'Fone de ouvido com microfone embutido, som estéreo e almofadas confortáveis.', 199.50, 60),
('Notebook i5 8GB RAM', 'Notebook com processador Intel i5, 8GB de memória RAM e SSD de 256GB.', 2999.00, 15),
('Cadeira Gamer Reclinável', 'Cadeira ergonômica com encosto reclinável, apoio lombar e estrutura reforçada.', 899.99, 10),
('Mousepad XXL Antiderrapante', 'Mousepad tamanho extra grande, base emborrachada e superfície de alta precisão.', 69.90, 100);

INSERT INTO Pedido (id_cliente, data_pedido, forma_pagamento, endereco_entrega) VALUES
(3, '2025-04-28', 'Boleto', 'Aeroporto de Almeida, 6, Vila Jardim Leblon, 80292-304 Barbosa de Ramos / PB'),
(5, '2025-04-27', 'Cartão de Crédito', 'Rua Santa Cruz, 999, Centro, 01234-567 São Paulo / SP'),
(1, '2025-04-26', 'Pix', 'Travessa das Palmeiras, 88, Bairro Verde, 12345-678 Porto Alegre / RS');

INSERT INTO ItemPedido (id_pedido, id_produto, quantidade, preco_unitario) VALUES
(1, 2, 3, 279.99),
(1, 5, 1, 2999.00),
(2, 1, 2, 149.90),
(2, 3, 1, 899.00),
(3, 4, 4, 199.50);