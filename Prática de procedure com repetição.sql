USE classicmodels;

select 
	concat(firstname,' ', lastname) as empregado,
	sum(amount) valor_vendido,
    count(costumernumber) qtde_clientes
from 
	customers 
    inner join payments using (customernumber)
    inner join employees uon (salesrepemploueenumber = employeenumber)
where 
	year(paymentdate) = 2003
	and month(patmentdate) = 4 
group by empregado
limit 1 offset 1;