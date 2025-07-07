-- create database pizzadata;


-- que 1 How many no of prder placed?

select count(order_id) as total_count_order from orders;

-- que2 calculate total revenue generated

SELECT 
    round(SUM(o.quantity * p.price),2) AS total_revenue
FROM order_details o
        JOIN
    pizzas p ON o.pizza_id = p.pizza_id
    
     -- que3identify the highest prize pizza 

SELECT  o.name, p.price
FROM
    pizzas p
        JOIN
    pizza_types o ON p.pizza_type_id = o.pizza_type_id
ORDER BY price DESC
LIMIT 1

-- que4 identify the most common pizza size
SELECT 
    p.size, COUNT(o.order_details_id) AS count
FROM
    order_details o
        JOIN
    pizzas p ON o.pizza_id = p.pizza_id
GROUP BY p.size
ORDER BY count DESC
LIMIT 1
  
-- que5 top 5 most ordered type with their quantity

-- SELECT * FROM pizzadata.pizza_types;
SELECT 
    pt.name, pi.size, SUM(od.quantity) AS q
FROM
    pizza_types pt
        JOIN
    pizzas pi ON pt.pizza_type_id = pi.pizza_type_id
        JOIN
    order_details AS od ON pi.pizza_id = od.pizza_id
GROUP BY pt.name , pi.size
ORDER BY q DESC
LIMIT 5;
