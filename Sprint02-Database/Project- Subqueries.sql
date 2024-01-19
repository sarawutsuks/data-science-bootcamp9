-- customers table
create table customers (
  customer_id int unique,
  name text,
  age int,
  gender text
);

insert into customers values
 (1, 'James', 25, 'M'),
 (2, 'Mary', 58, 'F'),
 (3, 'Jing', 25, 'F'),
 (4, 'Thitavee', 26, 'F'),
 (5, 'John', 40, 'M'),
 (6, 'Josh', 62, 'M'),
 (7, 'Yan', 50, 'M'),
 (8, 'Brown', 29, 'M'),
 (9, 'Print', 27, 'F'),
 (10, 'Joy', 72, 'F');

-- manus table
create table menus (
  menu_id int unique,
  menu_name text,
  price real
);

insert into menus values
 (1, 'Pizza', 50.9),
 (2, 'Hamburger', 35.2),
 (3, 'French Fries', 25.7),
 (4, 'Coke', 12.5),
 (5, 'Water', 6),
 (6, 'Fried Chicken', 40.9),
 (7, 'Salad', 30);

-- location table
create table location (
  location_id int unique,
  location_name text
);

insert into location values
 (1, 'Bangkok'),
 (2, 'Chiang mai'),
 (3, 'Phuket'),
 (4, 'Pattaya'),
 (5, 'Krabi');

-- orders table (fact table)
create table orders (
  order_id int unique,
  customer_id int,
  menu_id int,
  quantity int,
  location_id int,
  order_date date
);

insert into orders values
 (1, 9, 2, 2, 4, '2022-01-01'),
 (2, 4, 1, 5, 4, '2022-01-01'),
 (3, 2, 2, 3, 3, '2022-01-02'),
 (4, 7, 4, 1, 5, '2022-01-02'),
 (5, 5, 3, 5, 4, '2022-01-03'),
 (6, 10, 5, 6, 2, '2022-01-03'),
 (7, 6, 3, 3, 1, '2022-01-03'),
 (8, 3, 5, 3, 1, '2022-01-04'),
 (9, 8, 6, 3, 3, '2022-01-04'),
 (10, 1, 3, 4, 2, '2022-01-04'),
 (11, 6, 2, 1, 5, '2022-01-04'),
 (12, 2, 6, 1, 5, '2022-01-05'),
 (13, 8, 2, 1, 4, '2022-01-05'),
 (14, 9, 6, 1, 1, '2022-01-05'),
 (15, 6, 7, 1, 4, '2022-01-05'),
 (16, 5, 3, 6, 4, '2022-01-06'),
 (17, 5, 7, 4, 1, '2022-01-06'),
 (18, 3, 2, 3, 4, '2022-01-06'),
 (19, 2, 5, 2, 4, '2022-01-07'),
 (20, 2, 4, 3, 1, '2022-01-07');

.mode box

-- question 1
-- อยากทราบว่าเมนูอะไรขายดีที่สุดของแต่ละสาขา

with sub as (
  select * from orders
  join menus on orders.menu_id = menus.menu_id
  join location on orders.location_id = location.location_id
)

select
  sub.menu_name,
  sum(sub.price * sub.quantity) as total_sales$,
  sub.location_name
from sub
group by sub.location_name
order by 2 desc;


-- question 2
-- อยากทราบว่าตั้งแต่วันที่ 2022-01-05 ยอดขายทั้งหมดเท่าไหร่แบ่งตาม gender

with sub1 as (
  select * from orders
  join menus on orders.menu_id = menus.menu_id
  join customers on orders.customer_id = customers.customer_id
)

select
  sub1.gender,
  sum(sub1.price * sub1.quantity) as total_sales$
from sub1
where strftime('%Y-%m-%d', order_date) >= '2022-01-05'
group by 1;


-- question 3
-- มีสาขาไหนบ้างที่ลูกค้ากลับมาซ้ำมากกว่า 2 ครั้ง

-- วิธีที่ 1
select
  orders.customer_id,
  customers.name,
  location.location_name,
  count(*) as repeat_times
from orders, menus, customers, location
where  
  orders.menu_id = menus.menu_id
  and orders.customer_id = customers.customer_id
  and orders.location_id = location.location_id
group by 1
having count(*) > 2;



-- วิธีที่ 2
with sub2 as (
  select 
    orders.customer_id,
    customers.name,
    location.location_name,
    count(*) as repeat_times
  from orders, menus, customers, location 
  where orders.menu_id = menus.menu_id
    and orders.customer_id = customers.customer_id
    and orders.location_id = location.location_id 
  group by 1
)

select
  customer_id,
  name,
  location_name,
  repeat_times
from (select * from sub2)
where repeat_times > 2;


-- question 4
-- อยากทราบค่าเฉลี่ยยอดขายของลูกกค้าที่อายุ <30, 30-60, >60

-- วิธีที่ 1
select
  case 
    when customers.age < 30 then "age <30"
    when customers.age between 30 and 60 then "age 30-60"
    when customers.age > 60 then "age >60"
  end as customer_segment,
  avg(menus.price * orders.quantity) as avg_sales$
from orders
join customers on orders.customer_id = customers.customer_id
join menus on orders.menu_id = menus.menu_id
group by 1
order by 2 desc;


-- วิธีที่ 2
with sub3 as (
  select * from orders
  join customers on orders.customer_id = customers.customer_id
  join menus on orders.menu_id = menus.menu_id
), sub4 as (
  select
    case 
      when sub3.age < 30 then "age <30"
      when sub3.age between 30 and 60 then "age 30-60"
      when sub3.age > 60 then "age >60"
    end as customer_segment,
    sub3.price,
    sub3.quantity
  from sub3
)

select
  customer_segment,
  avg(sub4.price * sub4.quantity) as avg_sales$
from sub4
group by 1
order by 2 desc;
