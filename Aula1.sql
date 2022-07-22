USE [letscode_food]
GO

--CLIENTE (cod_cli, nome_cli, endereco, cidade, cep, uf)
CREATE TABLE cliente (
    cod_cli INTEGER NOT NULL IDENTITY(1,1),
    nome_cli VARCHAR(100) NULL,
    endereco VARCHAR(100) NULL,
    cidade VARCHAR(40) NULL,
    cep VARCHAR(10) NULL,
    uf CHAR(2) NULL,
    CONSTRAINT PK_cod_cli PRIMARY KEY (cod_cli)
);
GO


CREATE TABLE cliente (
    cod_cli INTEGER NOT NULL IDENTITY(1,1),
    nome_cli VARCHAR(100) NULL,
    endereco VARCHAR(100) NULL,
    cidade VARCHAR(40) NULL,
    cep VARCHAR(10) NULL,
    uf CHAR(2) NULL,
    PRIMARY KEY (cod_vend)
);
GO

INSERT INTO cliente (
	nome_cli,
	endereco,
	cidade,
	cep,
	uf
)
VALUES
  ('Michael Tadeu','Rua Teste','Varginha','37014-200','Minas Gerais');

INSERT INTO cliente VALUES
  ('Marcos Leonardo','Rua Teste2','Varginha','37014-200','Minas Gerais');

--VENDEDOR (cod_vend, nome_vend, sal_fixo, faixa_comiss)
CREATE TABLE vendedor (
    cod_vend INTEGER NOT NULL IDENTITY(1,1),
    nome_vend VARCHAR(100) NULL,
    sal_fixo NUMERIC(8,2) NULL,
    faixa_comiss INT NULL,
	CONSTRAINT PK_cod_vend PRIMARY KEY (cod_vend)
);
GO

INSERT INTO vendedor
           (nome_vend
           ,sal_fixo
           ,faixa_comiss)
     VALUES
           ('Teste'
           ,3500.00
           ,10);

INSERT INTO vendedor VALUES 
	('Teste',3500.00,10)
	
--PRODUTO (cod_prod, unid_prod, desc_prod, val_unit)
CREATE TABLE produto (
    cod_prod INTEGER NOT NULL IDENTITY(1,1),
    unid_prod INTEGER NOT NULL,
    desc_prod VARCHAR(100) NULL,
    val_unit NUMERIC(8,2) NULL,
    PRIMARY KEY (cod_prod)
);
GO

--PEDIDO (cod_ped, prazo_entr, cod_cli, cod_vend)
CREATE TABLE pedido (
    cod_ped INTEGER NOT NULL IDENTITY(1,1),
    prazo_entr INTEGER NOT NULL,
    cod_cli INTEGER NOT NULL,
    cod_vend INTEGER NOT NULL,
    PRIMARY KEY (cod_ped),
	CONSTRAINT FK_cod_cli FOREIGN KEY (cod_cli)
    REFERENCES cliente(cod_cli),
	CONSTRAINT FK_cod_vend FOREIGN KEY (cod_vend)
    REFERENCES vendedor(cod_vend)
);
GO

CREATE TABLE pedido (
    cod_ped INTEGER NOT NULL IDENTITY(1,1),
    prazo_entr INTEGER NOT NULL,
    cod_cli INTEGER FOREIGN KEY REFERENCES cliente(cod_cli),
	cod_vend INTEGER FOREIGN KEY REFERENCES vendedor(cod_vend),
	PRIMARY KEY (cod_ped)
);
GO

INSERT INTO pedido
           (prazo_entr
           ,cod_cli
           ,cod_vend)
     VALUES
           (15
           ,1
           ,1)
GO

--ITEM_PEDIDO (cod_item_ped, qtd_ped, cod_ped, cod_prod)
CREATE TABLE item_pedido (
    cod_item_ped INTEGER NOT NULL IDENTITY(1,1),
    qtd_ped INTEGER NOT NULL,
    cod_ped INTEGER NOT NULL,
    cod_prod INTEGER NOT NULL,
    PRIMARY KEY (cod_item_ped),
	CONSTRAINT FK_cod_ped FOREIGN KEY (cod_ped)
    REFERENCES pedido(cod_ped),
	CONSTRAINT FK_cod_prod FOREIGN KEY (cod_prod)
    REFERENCES produto(cod_prod)
);
GO

CREATE TABLE item_pedido (
    cod_item_ped INTEGER NOT NULL IDENTITY(1,1),
    qtd_ped INTEGER NOT NULL,
    cod_ped INTEGER FOREIGN KEY REFERENCES pedido(cod_ped),
	cod_prod INTEGER FOREIGN KEY REFERENCES produto(cod_prod),
	PRIMARY KEY (cod_item_ped)
);
GO