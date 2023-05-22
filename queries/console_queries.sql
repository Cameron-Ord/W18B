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
('2023-11-22', 2),
('2019-01-02', 5),
('2019-03-22', 5),
('2012-11-12', 5),
('2021-01-02', 2);

insert into order_item (order_id, item_id)
values
(3, 7),
(2, 5),
(5, 4),
(1, 3),
(3, 1),
(4, 8),
(3, 9),
(2, 10),
(2, 7),
(1, 4),
(4, 6),
(5, 6),
(1, 2),
(3, 1),
(2, 10);

select username, `order`.created_at 
from customer inner join `order` 
on customer.id = `order`.customer_id
where `order`.created_at >= '2021-01-01' and username = 'user_1';

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