use sakila;

/*
A) Crie uma consulta juntando as tabelas City e Address;
B) Crie uma consulta juntando as tabelas Address e Customer;
C) Crie uma consulta juntando as tabelas Customer e Payment;
D) Crie uma consulta juntando as tabelas Payment e Customer;
E) Crie uma consulta juntando as tabelas Film e Language;
*/

select * from City INNER JOIN Address on (City.City_id = Address.City_id);
select * from Address INNER JOIN Customer on (Address.Address_id = Customer.Address_id);
select * from Customer INNER JOIN Payment on (Customer.Customer_id = Payment.Customer_id);
select * from Payment INNER JOIN Customer on (Payment.Customer_id = Customer.Customer_id);
select * from Film INNER JOIN Language on (Film.Language_id = Language.Language_id);

/*
F) Crie uma consulta para contar o número Filme (Film) por Idioma (Language);
G) Crie uma consulta que retorne o total de pagamentos realizados (Payment) por Loja (Store)
H) Crie uma consulta que retorne a quantidade de clientes (Customer) existente por Loja (Store)
I) Crie uma consulta que retorne a média (AVG), o total (SUM), a quantidade de pagamento (COUNT), o valor máximo (MAX) pago, e valor mínimo (MIN) recebido por Loja;
J) Crie uma consulta que retorne o total de pagamentos realizados por cliente;
*/

Select 
    count(film_id) Qtde, 
	Language.Name Idioma
from  
  Film 
	inner join Language on (Film.Language_id = Language.Language_id)
group by Language.Name;

Select 
    Sum(Payment.Amount) Total, 
	Store.Store_id Loja
from 
  Payment 
    inner join Staff on (Staff.Staff_id = Payment.Staff_id)
    inner join Store on (Store.Store_id = Staff.Staff_id)
group by Store.Store_id;

Select 
   Store.Stored_id Loja, 
   Count(Customer_id) Cliente
from 
  Store
	inner join Customer on (Store.Store_id = Customer.Store_id)
group by
  Store.Stored_id;

Select 
    Format(Avg(Payment.Amount),2) media,    
    Sum(Payment.Amount) total, 
    Count(Payment.Payment_id) quantidade,
    Max(Payment.Amount) Maximo,
    Min(Payment.Amount) Minimo,
	Store.Store_id Loja
from 
  Payment 
    inner join Staff on (Staff.Staff_id = Payment.Staff_id)
    inner join Store on (Store.Store_id = Staff.Staff_id)
group by Store.Store_id;

Select 
   Concat(Customer.First_Name, ' ',Customer.Last_Name) Cliente,
   Sum(Payment.Amount) Total
from 
  Customer
    inner join Payment on (Customer.Customer_id = Payment.Customer_id)
group by
  Cliente;
  
/*
K) Faça uma consulta que retorne a quantidade de Filmes (Film) por Idioma (Language), cujo tamanho (length) do filme esteja entre 100 e 150;
L) Faça uma consulta que retorne o total de pagamentos realizados (Payment) por Loja (Store) entre os meses de agosto e setembro;
M) Fala uma consulta que retorne a quantidade de clientes (Customer) existente por Loja (Store), filtrando os clientes que tenham o sobrenome (Last_name) iniciado de R.
*/

Select 
  Count(Film_id) Qtde, 
  Language.Name Idioma
From 
  Film
    inner join Language on (Film.language_id = Language.Language_id)
Where 
   Film.Length between 100 and 150
Group by
  Language.Name;

Select 
   Sum(Payment.Amount) Total,
   Store.Store_id Loja
from 
  Payment 
    inner join Staff on (Staff.Staff_id = Payment.Staff_id)
    inner join Store on (Store.Store_id = Staff.Staff_id)
where 
   Month(Payment.Payment_date) in (8,9) # ou between 8 and 9
group by Store.Store_id;
   
Select 
   Store.Store_id Loja, 
   Count(Customer_id) Qtde
from 
  Store
	inner join Customer on (Store.Store_id = Customer.Store_id)
where 
  Customer.Last_name like 'R%' 
group by
  Store.Store_id;
  
/*
N) Crie uma consulta juntando as tabelas City, Address e Customer;
O) Crie uma consulta juntando as tabelas Customer, Payment e Rental;
P) Crie uma consulta juntando as tabelas Film, Film_Category e Category;
Q) Crie uma consulta juntando as tabelas Actor, Film_Actor, Film;
*/

Select 
  * 
from 
    City
    inner join Address on (City.City_id = Address.City_id)
    inner join Customer on (Address.Address_id = Customer.Address_id);
    
Select 
   * 
From 
   Customer
     inner join Payment on (Customer.Customer_id = Payment.Customer_id)
     inner join Rental on (Payment.Rental_id = Rental.Rental_id);
     
Select 
  * 
from 
  Category 
     inner join Film_Category on (Category.Category_id = Film_Category.Category_id)
     inner join Film on (Film_Category.Film_id = Film.Film_id);

Select 
  * 
from 
   Film 
     inner join Film_Actor on (Film.Film_id = Film_Actor.Film_id)
     inner join Actor on (Film_Actor.Actor_id = Actor.Actor_id);
  
/*
R) Crie uma consulta que retorne a quantidade de clientes criados (create_date) em fevereiro por cidade;
S) Crie uma consulta que retorne a quantidade de filme por ator cujo filme tenha duração (rental_duration) de 3 ou 7, o tamanho (length) esteja entre 60 e 150 e a multa (replacement_cost) seja acima 12;
T) Crie uma consulta que retorne o total de multa (Film.replacement_cost) por categoria, considerando os mesmos filtros da letra S.
*/

Select 
  Count(Customer_id) Qtde_Cliente,
  City.City Cidade
from 
  City
    inner join Address on (City.City_id = Address.City_id)
    inner join Customer on (Address.Address_id = Customer.Address_id)
where 
  Month(Customer.Create_date) = 2
group by
  City.City;


Select 
  Count(Film_Actor.Film_id) Qtde_Filme,
  Concat(Actor.First_name, ' ', Actor.Last_Name) Ator
from 
   Film 
     inner join Film_Actor on (Film.Film_id = Film_Actor.Film_id)
     inner join Actor on (Film_Actor.Actor_id = Actor.Actor_id)
where 
    Film.Rental_Duration in (3,7)
and Film.Length between 60 and 150
and Film.Replacement_cost > 12
group by
  Ator;

Select 
  Sum(Film.Replacement_cost) Total_multa,
  Category.Name Catogoria
from 
  Category 
     inner join Film_Category on (Category.Category_id = Film_Category.Category_id)
     inner join Film on (Film_Category.Film_id = Film.Film_id)
where 
      Film.Rental_Duration in (3,7)
and Film.Length between 60 and 150
and Film.Replacement_cost > 12
group by
  Category.Name;
  
/*
U) Crie uma consulta juntando as tabelas City, Address, Customer e Payment;
V) Crie uma consulta juntando as tabelas Store, Payment, Rental, Inventory, Film;
W) Crie uma consulta juntando as tabelas Actor, Film_Actor, FILM, Inventory, Rental, Payment, Customer, Address, City, Country;
*/

Select 
  *
from 
    City
    inner join Address on (City.City_id = Address.City_id)
    inner join Customer on (Address.Address_id = Customer.Address_id)
    inner join Payment on (Customer.Customer_id = Payment.Customer_id);
    
Select 
  *
from 
   Film
     inner join Inventory on (Film.Film_id = Inventory.Film_id)
     inner join Rental on (Inventory.Inventory_id = Rental.Inventory_id)
     inner join Store on (Inventory.Store_id = Store.Store_id)
     inner join Payment on (Payment.Rental_id = Rental.Rental_id);

Select
   *
From 
   Actor
     inner join Film_Actor on (Actor.Actor_id = Film_Actor.Actor_id)
     inner join Film on (Film_Actor.Film_id = Film.Film_id)
     inner join Inventory on (Film.Film_id = Inventory.Film_id)
     inner join Rental on (Inventory.Inventory_id = Rental.Inventory_id)
     inner join Payment on (Rental.Rental_id = Payment.Rental_id)
     inner join Customer on (Payment.Customer_id = Customer.Customer_id)
     inner join Address on (Customer.Address_id = Address.Address_id)
     inner join City on (Address.City_id = City.City_id)
     inner join Country on (City.Country_id = Country.Country_id);
     
/*
Liste as tabelas envolvidas para determinar o total de pagamentos por Categoria;
*/

# Catogory, Film_Cateogry, Inventory, Rental, Payment; 

Select 
  Category.Name Categoria, 
  format (Sum(Payment.Amount)2) Total
From 
  Category
    inner join Film_Category on (Category.Category_id = Film_Category.Category_id)
    inner join Inventory on (Film_Category.Film_id = Inventory.Film_id)
    inner join Rental on (Inventory.Inventory_id = Rental.Inventory_id)
    inner join Payment on (Rental.Rental_id = Payment.Rental_id)
Group by
  Categoria;

/*
Liste as tabelas envolvidas para determinar a quantidade de pagamentos por país;
*/

# 1 - Opção Payment, Customer, Address, City, Country
# ou
# 2 - Opção Payment, Staff, Store, Address, City, Country


# 1 - Opção 
Select 
   Country.Country Pais, 
   Sum(Payment.amount) Total
from 
   Payment
	 inner join Customer on (Payment.Customer_id = Customer.Customer_id)
     inner join Address on (Customer.Address_id = Address.Address_id)
     inner join City on (Address.City_id = City.City_id)
     inner join Country on (City.Country_id = Country.Country_id)
Group by 
  Pais;
  
# 2 - Opção
Select 
  Country.Country Pais, 
  Sum(Payment.amount) Total
from 
  Payment
    inner join Staff on (Payment.Staff_id = Staff.Staff_id)
    inner join Store on (Staff.Store_id = Store.Store_id)
    inner join Address on (Store.Address_id = Address.Address_id)
    inner join City on (Address.City_id = City.City_id)
    inner join Country on (City.Country_id = Country.Country_id)
Group by
  Pais;

