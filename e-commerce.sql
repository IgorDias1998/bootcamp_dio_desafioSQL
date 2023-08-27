-- Tabela de Categorias de Produtos
CREATE TABLE Categorias (
    categoria_id INT PRIMARY KEY,
    nome VARCHAR(50),
    descricao TEXT
);

-- Tabela de Produtos
CREATE TABLE Produtos (
    produto_id INT PRIMARY KEY,
    nome VARCHAR(100),
    descricao TEXT,
    preco DECIMAL(10, 2),
    categoria_id INT,
    FOREIGN KEY (categoria_id) REFERENCES Categorias(categoria_id)
);

-- Tabela de Clientes
CREATE TABLE Clientes (
    cliente_id INT PRIMARY KEY,
    nome VARCHAR(50),
    endereco VARCHAR(100),
    email VARCHAR(50),
    senha VARCHAR(100)
);

-- Tabela de Endereços de Envio
CREATE TABLE Enderecos (
    endereco_id INT PRIMARY KEY,
    cliente_id INT,
    endereco VARCHAR(100),
    cidade VARCHAR(50),
    estado VARCHAR(50),
    cep VARCHAR(10),
    FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id)
);

-- Tabela de Pedidos
CREATE TABLE Pedidos (
    pedido_id INT PRIMARY KEY,
    cliente_id INT,
    endereco_id INT,
    data_pedido TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status ENUM('pendente', 'processando', 'enviado', 'entregue'),
    FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id),
    FOREIGN KEY (endereco_id) REFERENCES Enderecos(endereco_id)
);

-- Tabela de Itens de Pedido
CREATE TABLE ItensPedido (
    item_id INT PRIMARY KEY,
    pedido_id INT,
    produto_id INT,
    quantidade INT,
    preco_unitario DECIMAL(10, 2),
    subtotal DECIMAL(10, 2),
    FOREIGN KEY (pedido_id) REFERENCES Pedidos(pedido_id),
    FOREIGN KEY (produto_id) REFERENCES Produtos(produto_id)
);

-- Tabela de Avaliações de Produtos
CREATE TABLE Avaliacoes (
    avaliacao_id INT PRIMARY KEY,
    produto_id INT,
    cliente_id INT,
    pontuacao INT,
    comentario TEXT,
    data_avaliacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (produto_id) REFERENCES Produtos(produto_id),
    FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id)
);

