select @@autocommit;

-- setar autocommit para 0

set @@autocommit = 0;
show databases;
use ecommerce;
show tables;

desc orders;
select * from orders;

start transaction;

	update orders 
    set orderStatus = 'Cancelado' 
    where paymentCash = 0;

	savepoint cancelando;
    
	select * 
    from orders;
    
    rollback to savepoint cancelando;
    
    commit;


    