create database lab10;

create table books (
    book_id int primary key,
    title varchar(50),
    author varchar(50),
    price decimal(10, 2),
    quantity int
);

insert into books (book_id, title, author, price, quantity)
values
(1, 'Database 101', 'A. Smith', 40.00, 10),
(2, 'Learn SQL', 'B. Johnson', 35.00, 15),
(3, 'Advanced DB', 'C. Lee', 50.00, 5);

create table customers (
    customer_id int primary key,
    name varchar(100),
    email varchar(100)
);

insert into customers (customer_id, name, email)
values
(1, 'John Doe', 'john.doe@example.com'),
(2, 'Jane Doe', 'jane.doe@example.com');

create table orders (
    order_id int primary key,
    book_id int,
    customer_id int,
    order_date date,
    quantity int
);

-- 1
begin;

insert into orders (order_id, book_id, customer_id, order_date, quantity)
values (1, 1, 101, current_date, 2);

update books
set quantity = quantity - 2
where book_id = 1;

commit;

select * from orders;

select * from books;

-- 2
begin;

do $$
begin
    if (select quantity from books where book_id = 3) < 10 then
        raise exception 'Not enough stock for book_id 3. Transaction aborted.';
    end if;
end;
$$;

insert into orders (order_id, book_id, customer_id, order_date, quantity)
values (2, 3, 102, current_date, 10);

update books
set quantity = quantity - 10
where book_id = 3;

commit;

select * from orders;
select * from books;

-- 3
set transaction isolation level read committed;

do $$
begin
    raise notice 'Session 1: BEGIN transaction';
    begin;

    update books
    set price = 45.00
    where book_id = 1;
    raise notice 'Session 1: Updated price to 45.00';

    perform pg_sleep(5);

    commit;
    raise notice 'Session 1: COMMITTED transaction';
    end;
end;
$$;

do $$
begin

    raise notice 'Session 2: BEGIN transaction';
    begin;

    raise notice 'Session 2: Reading price BEFORE commit';
    perform (select price from books where book_id = 1);

    perform pg_sleep(6);

    raise notice 'Session 2: Reading price AFTER commit';
    perform (select price from books where book_id = 1);

    commit;
    raise notice 'Session 2: COMMITTED transaction';
    end;
end;
$$;

-- 4
begin;

update customers
set email = 'updated_email@example.com'
where customer_id = 1;

commit;

select * from customers where customer_id = 1;

select * from customers where customer_id = 1;
