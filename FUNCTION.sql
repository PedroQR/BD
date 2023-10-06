use sakila;

DELIMITER // 
create function aprender_func() returns int 
begin
	declare quantidade int default 0;
    
    select count(*) into quantidade from film;
    
    return quantidade;
    
END//

DELIMITER ;

SELECT APRENDER_FUNC();

USE CLASSICMODELS;
DELIMITER //
Create function ATRIBUIR_COMISSAO_VENDEDOR() returns FLOAT
BEGIN 
	DECLARE COMISSAO FLOAT DEFAULT 0.0;
    
    IF (VALOR > 100000) THEN 
		SET COMISSAO = VALOR * 1.05;
	ELSEIF (VALOR <= 100000) AND (VALOR > 5000) THEN 
		SET COMISAO = VALOR *1.02;
	ELSE 
		RETURN VALOR;
	end if;
    
    RETURN COMISSAO;
    
END//
DELIMITER ;

select ARTRIBUIR_COMISSAO_VENDEDOR(4000);

/* 1º - Criar uma tabela venda_comissao com os campos vendedor (varchar(200) e comissao float)
2º - Criar uma View que retorne as vendas por vendedor, mês e ano.
3º - Criar um função para determinar a comissão considerando:
       a. Vendas acima de 20.000 aplicar 10%;
       b. Vendas entre 20.000 e 10.000 aplicar 5;
       c. Vendas abaixo de 10.000 aplicar 2%.
4º - Criar um procedure com Cursor para usar o View do Item 2 para inserir os dados na tabela.
*/

