use sakila;
/*
Relacione a quantidade de filmes existente por cada categoria; 
Informe o total de valores pagos foram executados entre os meses março e setembro de 2005 por clientes inativos;
Informe o total de filmes por categoria que existem no estoque (inventory) por loja (store);
Informe o total de clientes existentes em cada país, ordenando do maior para o menor.
Relacione a cidades que têm as maiores quantidades de clientes inativos; 
Informe o total de valores pagos foram executados entre os meses março e setembro de 2004;
Informe o total de filmes por categoria que existem no estoque (inventory);
Informe o total de filmes que existem em cada uma das lojas.
*/

# QUESTÃO 1
Select 
   Count(Film.Film_id), 
   Category.Name
From 
   Film_Category 
     inner join Category on (Film_Category.Category_id = Category.Category_id);

# QUESTÃO 2
Select 
   Sum(Payment.Aumount)
from 
   Payment
     inner join Customer on (Payment.Customer_id = Customer.Customer_id)
where 
    Customer.Active = 0
and Month(Payment_date) between 3 and 9 
and Year(Payment_date) = 2005;

#QUESTÃO 3
Select
  Store.Store_id Loja,
  Category.Name Categoria,
  Count(Inventory.Film_id) Qtde_filme
From 
  Store
    inner join Inventory on (Store.Store_id = Inventory.Store_id)
    inner join Film_Category on (Inventory.Film_id = Film_Category.Film_id)
    inner join Category on (Film_Category.Category_id = Category.Category_id)
Group by
  Loja,
  Categoria
Order by
  Loja;

#QUESTÃO 4
Select 
  Country.Country Pais, 
  Count(Customer.Customer_id) Cliente
from 
  Country
    inner join City on (Country.Country_id = City.City_id)
    inner join Address on (City.City_id = Address.Address_id)
    inner join Customer on (Address.Address_id = Customer.Address_id)
Group by
  Pais
Order by
  Cliente desc;

#QUESTÃO 5
Select 
  City.City Cidade, 
  Count(Customer.Customer_id) Qtde_Cliente
from 
  City
	inner join Address on (City.City_id = Address.Address_id)
    inner join Customer on (Address.Address_id = Customer.Address_id)
where 
  Customer.Active = 0
group by 
  Cidade;

#QUESTÃO 6
Select 
  Sum(Payment.Amount) Total
From 
  Payment
where 
    Month(Payment_date) between 3 and 9 
and Year(Payment_date) = 2004;

#QUESTÃO 7
Select
  Category.Name Categoria,
  Count(Inventory.Film_id) Qtde_filme
From 
    Inventory 
    inner join Film_Category on (Inventory.Film_id = Film_Category.Film_id)
    inner join Category on (Film_Category.Category_id = Category.Category_id)
Group by
  Categoria;
  
#QUESTÃO 8
Select
  Store.Store_id Loja,
  Count(Inventory.Film_id) Qtde_filme
From 
  Store
    inner join Inventory on (Store.Store_id = Inventory.Store_id)
Group by
  Loja;
