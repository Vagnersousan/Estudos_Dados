-- criação do banco de dados para o cenário de e-commerce
create database ecommerce;
use ecommerce;


-- criar tabela cliente
create table cliente(
		idCliente int auto_increment primary key,
        Pnome varchar(10),
        Minicial char(3),
        Snome varchar(20),
		CPF char(11) not null,
        Endereço varchar(30),
        constraint unique_cpf_cliente unique (CPF)
);
-- criar tabela produto
create table Produto(
		idProduto int auto_increment primary key,
        Pnome varchar(10),
        classificacao_kids bool default false,
        categoria enum('Eletronico','Vestimenta','Brinquedos','Alimentos','moveis') not null,
        avaliacao float default 0,
        dimensao varchar (10)
);

-- criar tabela pagamento
create table pagamento(
	idcliente int primary key,
    idPagamento int,
    tipopagamento enum('Boleto','Cartão', 'Dois Cartões'),
    limiteDisponivel float,
    primary key(idcliente, id_pagamento)
);
-- criar tabela pedido
create table Pedido(
		idPedido int auto_increment primary key,
        idPedidoCliente int,
        PedidoStatus enum('Cancelado','Confirmado','Em Processamento') default 'Em Processamento ',
        PedidoDescricao varchar(255),
		Frete float default 10,
        pagamentoboleto boolean default false,
        constraint fk_pedido_cliente foreign key(idPedidoCliente) references cliente(idCliente)
);
-- criar tabela estoque
create table EstoquedeProduto(
		idEstoqueProd int auto_increment primary key,
        LocalEstoqueProd varchar(255),
        Quantidade int default 0
);

-- criar tabela fornecedor
create table Fornecedor(
		idFornecedor int auto_increment primary key,
        RazaoSocial varchar(255) not null,
        CNPJ char(15) not null,
        Contato char(11) not null,
        constraint unique_fornecedor unique (CNPJ)
);
-- criar tabela vendedor
create table Vendedor(
		idvendedor int auto_increment primary key,
        RazaoSocial varchar(255) not null,
        CNPJ char(15),
        CPF char(9),
        Localidade varchar(255),
        Contato char(11) not null,
        constraint unique_cnpj_vendedor unique (CNPJ),
        constraint unique_cpf_vendedor unique (CPF)
);
-- criar tabela Produto_vendedor
create table Produto_vendedor (
	idPvendedor int,
    idProduto int,
    QuantidadeProduto int default 1,
    primary key (idPvendedor, idProduto),
    constraint fk_vendedor_produto foreign key (idPvendedor) references vendedor(idvendedor),
    constraint fk_produto_produto foreign key (idProduto) references produto(idProduto)    
);
-- criar tabela Produtopedido
create table Produtopedido (
	idPpproduto int,
    idProdutopedido int,
    QuantidadeProdutopedido int default 1,
    StatusProdutopedido enum('Disponivel','Sem Estoque') default 'Disponivel',
    primary key (idPpproduto, idProdutopedido),
    constraint fk_vendedor_produtopedido foreign key (idPpproduto) references produto(idProduto),
    constraint fk_produtopedido_produto foreign key (idProdutopedido) references Pedido(idPedido)    
);

-- criar tabela storageLocation
create table storagelocation (
	idlproduct int,
    idlstorage int,
    location varchar(255) not null,
    primary key (idlproduct, idlstorage),
    constraint fk_estoque_localizacao_produto foreign key (idlproduct) references produto(idProduto),
    constraint fk_estoque_localizacao_estoque foreign key (idlstorage) references EstoquedeProduto(idEstoqueProd)    
);
-- criar tabela productSupplier
create table productSupplier (
	idpsSupplier int,
    idPsProduct int,
    Quantity int not null,
    primary key (idpsSupplier, idPsProduct),
    constraint fk_product_supplier_supplier foreign key (idPsSupplier) references Fornecedor(idFornecedor),
    constraint fk_product_supplier_product foreign key (idPsProduct) references Produto(idProduto)
    );

alter table cliente auto_increment = 1;