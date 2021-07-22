select *
from customers;
-- where customerName = 'land of toys inc.';

explain select *
from customers
where customerName = 'land of toys inc.';

alter table customers 
add index idx_customer(customername);

explain select *
from customers
where customerName = 'land of toys inc.';

alter table customers 
add index idx_full_name (contactlastname, contactfirstname);

explain select *
from customers 
where contactFirstName = 'jean' and contactlastname = 'king';