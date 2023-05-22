insert into customer (username, password, created_at)
values 
('user_1', 'password', '2021-01-01'),
('user_2', 'password', '2019-01-01'),
('user_3', 'password', '2011-01-01'),
('user_4', 'password', '2017-01-01'),
('user_5', 'password', '2002-01-01');

insert into item (name, price, description)
values
('item_1', 90, 'description text'),
('item_2', 10, 'description text'),
('item_3', 1000, 'description text'),
('item_4', 75, 'description text'),
('item_5', 25, 'description text'),
('item_6', 300, 'description text'),
('item_7', 750, 'description text'),
('item_8', 50, 'description text'),
('item_9', 150, 'description text'),
('item_10', 125, 'description text');

insert into `order` (created_at, customer_id)
values 
('2021-11-22', 4),
('2017-01-02', 4),
('2023-03-22', 5),
('2023-11-12', 3),
('2021-01-02', 3);

insert into order_item (order_id, item_id)
values
(1, 1),
(1, 1),
(1, 3),
(3, 1),
(3, 5),
(3, 4),
(4, 6),
(4, 10),
(2, 8),
(2, 3),
(5, 7),
(5, 9),
(5, 1),
(2, 2),
(2, 6);

select username, `order`.created_at 
from customer inner join `order` 
on customer.id = `order`.customer_id
where `order`.created_at >= '2021-01-01'
order by created_at  DESC 
limit 1;

select username, count(`order`.id) 
from customer inner join `order`
on customer.id = `order`.customer_id
group by username;

SELECT AVG(price)
from item
inner join order_item 
on item.id = order_item.item_id;

select username, SUM(price)
from item
inner join order_item 
on item.id = order_item.item_id 
inner join `order`
on order_item.order_id = `order`.id
inner join customer
on `order`.customer_id = customer.id
group by order_item.id
order by SUM(price) desc
limit 1;

select customer.username, SUM(price)
from item
inner join order_item 
on item.id = order_item.item_id 
inner join `order`
on order_item.order_id = `order`.id
inner join customer
on `order`.customer_id = customer.id
group by customer.id
order by SUM(price) desc;

SELECT username, AVG(price)
from item
inner join order_item 
on item.id = order_item.item_id
inner join `order`
on order_item.order_id = `order`.id 
inner join customer
on `order`.id = customer.id 
group by username
order by AVG(price) desc;

