-- Tabela de Clientes
CREATE TABLE Clientes (
    cliente_id INT PRIMARY KEY,
    nome VARCHAR(100),
    telefone VARCHAR(20),
    endereco VARCHAR(200)
);

-- Tabela de Veículos
CREATE TABLE Veiculos (
    veiculo_id INT PRIMARY KEY,
    cliente_id INT,
    modelo VARCHAR(50),
    ano INT,
    placa VARCHAR(10),
    FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id)
);

-- Tabela de Ordens de Serviço
CREATE TABLE OrdensServico (
    ordem_id INT PRIMARY KEY,
    veiculo_id INT,
    data_inicio DATE,
    data_fim DATE,
    status ENUM('aberta', 'em_andamento', 'concluida'),
    FOREIGN KEY (veiculo_id) REFERENCES Veiculos(veiculo_id)
);

-- Tabela de Peças
CREATE TABLE Pecas (
    peca_id INT PRIMARY KEY,
    descricao VARCHAR(100),
    preco DECIMAL(10, 2)
);

-- Tabela de Peças em Ordens de Serviço
CREATE TABLE PecasOrdemServico (
    peca_ordem_id INT PRIMARY KEY,
    ordem_id INT,
    peca_id INT,
    quantidade INT,
    FOREIGN KEY (ordem_id) REFERENCES OrdensServico(ordem_id),
    FOREIGN KEY (peca_id) REFERENCES Pecas(peca_id)
);
