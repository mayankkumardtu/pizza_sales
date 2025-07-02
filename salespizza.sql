-- que2 calculate total revenue generated

SELECT 
    round(SUM(o.quantity * p.price),2) AS total_revenue
FROM order_details o
        JOIN
    pizzas p ON o.pizza_id = p.pizza_id