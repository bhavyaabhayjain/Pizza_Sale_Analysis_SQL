-- Create Database and Tables
CREATE DATABASE pizzahut;
USE pizzahut;

CREATE TABLE pizzas (
    pizza_id INT NOT NULL,
    pizza_type_id INT NOT NULL,
    size TEXT NOT NULL,
    price INT NOT NULL,
    PRIMARY KEY (pizza_id)
);

CREATE TABLE pizza_types (
    pizza_type_id INT NOT NULL,
    name TEXT NOT NULL,
    category TEXT NOT NULL,
    ingredients TEXT NOT NULL,
    PRIMARY KEY (pizza_type_id)
);

CREATE TABLE orders (
    order_id INT NOT NULL,
    order_date DATE NOT NULL,
    order_time TIME NOT NULL,
    PRIMARY KEY (order_id)
);

CREATE TABLE order_details (
    order_details_id INT NOT NULL,
    order_id INT NOT NULL,
    pizza_id TEXT NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (order_details_id)
);

-- Basic Queries
-- Q1. Total number of orders placed
SELECT COUNT(order_id) AS All_Orders FROM orders;

-- Q2. Total revenue from pizza sales
SELECT ROUND(SUM(order_details.quantity * pizzas.price), 2) AS Total_Revenue 
FROM order_details
JOIN pizzas ON pizzas.pizza_id = order_details.pizza_id;

-- Q3. Highest-priced pizza
SELECT pizza_types.name, pizzas.price
FROM pizza_types
JOIN pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
ORDER BY pizzas.price DESC
LIMIT 1;

-- Q4. Most common pizza size ordered
SELECT pizzas.size, COUNT(order_details.order_details_id) AS order_count
FROM pizzas
JOIN order_details ON pizzas.pizza_id = order_details.pizza_id
GROUP BY pizzas.size
ORDER BY order_count DESC
LIMIT 1;

-- Q5. Top 5 most ordered pizza types
SELECT pizza_types.name, SUM(order_details.quantity) AS quantity
FROM pizza_types
JOIN pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
JOIN order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.name
ORDER BY quantity DESC
LIMIT 5;

-- Advanced Queries
-- Q6. Total quantity of each pizza category ordered
SELECT pizza_types.category, SUM(order_details.quantity) AS quantity
FROM pizza_types
JOIN pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
JOIN order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY category
ORDER BY quantity DESC;

-- Q7. Distribution of orders by hour
SELECT HOUR(order_time) AS hour, COUNT(order_id) AS order_count
FROM orders
GROUP BY HOUR(order_time);

-- Q8. Category-wise distribution of pizzas
SELECT category, COUNT(name) FROM pizza_types GROUP BY category;

-- Q9. Average number of pizzas ordered per day
SELECT ROUND(AVG(quantity), 0) AS Average_orders
FROM (
    SELECT orders.order_date, SUM(order_details.quantity) AS quantity
    FROM orders
    JOIN order_details ON orders.order_id = order_details.order_id
    GROUP BY orders.order_date
) AS order_quantity;

-- Q10. Top 3 most ordered pizza types based on revenue
SELECT pizza_types.name, ROUND(SUM(order_details.quantity * pizzas.price), 0) AS revenue
FROM pizza_types
JOIN pizzas ON pizzas.pizza_type_id = pizza_types.pizza_type_id
JOIN order_details ON order_details.pizza_id = pizzas.pizza_id 
GROUP BY pizza_types.name
ORDER BY revenue DESC
LIMIT 3;

-- Q11. Percentage contribution of each pizza type to total revenue
SELECT pizza_types.category, 
    ROUND(SUM(order_details.quantity * pizzas.price) / 
          (SELECT ROUND(SUM(order_details.quantity * pizzas.price), 2) FROM order_details
           JOIN pizzas ON pizzas.pizza_id = order_details.pizza_id) * 100, 2) AS revenue
FROM pizza_types
JOIN pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
JOIN order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.category
ORDER BY revenue DESC;

-- Q12. Cumulative revenue over time
SELECT order_date, ROUND(SUM(revenue) OVER (ORDER BY order_date), 0) AS Cum_revenue 
FROM (
    SELECT orders.order_date, SUM(order_details.quantity * pizzas.price) AS revenue
    FROM order_details
    JOIN pizzas ON order_details.pizza_id = pizzas.pizza_id
    JOIN orders ON orders.order_id = order_details.order_id
    GROUP BY orders.order_date
) AS sales;

-- Q13. Top 3 most ordered pizza types based on revenue for each category
WITH CTE_PizzaRevenue AS (
    SELECT pizza_types.category, pizza_types.name AS pizza_name,
           SUM(order_details.quantity * pizzas.price) AS revenue,
           RANK() OVER (PARTITION BY pizza_types.category ORDER BY SUM(order_details.quantity * pizzas.price) DESC) AS revenue_rank
    FROM pizza_types
    JOIN pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
    JOIN order_details ON order_details.pizza_id = pizzas.pizza_id
    GROUP BY pizza_types.category, pizza_types.name
)
SELECT pizza_name AS name, revenue
FROM CTE_PizzaRevenue
WHERE revenue_rank <= 3
ORDER BY category, revenue_rank;
