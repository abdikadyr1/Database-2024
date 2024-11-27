--1
create function increase_value(input_value int)
returns int as
$$
begin
    return input_value + 10;
end;
$$
language plpgsql;

--2
create or replace function compare_numbers(num1 int, num2 int)
returns varchar(10) as
$$
begin
    if num1 > num2 then
        return 'Greater';
    elseif num1 = num2 then
        return 'Equal';
    else
        return 'Lesser';
    end if;
end;
$$
language plpgsql;

--3
create or replace function number_series(n int)
returns text as
$$
declare
    i int := 1;
    series text := '';
begin
    while i <= n loop
        series := series || i || ' ';
        i := i + 1;
    end loop;
    return series;
end;
$$
language plpgsql;

--4
create or replace function find_employee(emp_name varchar)
returns table(id int, name varchar, position varchar, salary numeric) as
$$
begin
    return query
    select id, name, position, salary from employees where name = emp_name;
end;
$$
language plpgsql;


--5
create or replace function list_products(category_name varchar)
returns table(product_id int, name varchar, price numeric) as
$$
begin
    return query
    select product_id, name, price from products where category = category_name;
end;
$$
language plpgsql;


--6
create or replace function calculate_bonus(employee_id int)
returns numeric as
$$
declare
    base_salary numeric;
    bonus_amount numeric;
begin
    select base_salary into base_salary from employees where id = employee_id;
    bonus_amount := base_salary * 0.1;
    return bonus_amount;
end;
$$
language plpgsql;

create or replace function update_salary(employee_id int)
returns void as
$$
declare
    bonus numeric;
begin
    bonus := calculate_bonus(employee_id);

    update employees
    set total_salary = base_salary + bonus
    where id = employee_id;
end;
$$
language plpgsql;

--7
create or replace function complex_calculation(input_number int, input_text varchar)
returns text as
$$
declare
    numeric_result int;
    string_result varchar;
    final_result text;
begin

    numeric_computation:
    begin
        numeric_result := input_number * input_number;
    end numeric_computation;

    string_manipulation:
    begin
        string_result := reverse(input_text);
    end string_manipulation;

    final_result := 'Numeric Result: ' || numeric_result || ', String Result: ' || string_result;

    return final_result;
end;
$$
language plpgsql;
