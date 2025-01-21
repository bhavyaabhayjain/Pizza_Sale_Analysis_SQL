# Pizza Sales Analysis

This project involves a comprehensive analysis of pizza sales data using **SQL** for data manipulation and **MySQL** as the database software. The dataset includes the following files: **pizzas.csv**, **pizza_types.csv**, **orders.csv**, and **order_details.csv**, containing information about pizzas, orders, and sales. The analysis covers various aspects, including identifying the best and worst-selling pizzas, determining total revenue generated, calculating average revenue, and examining sales trends on various time scales.

The data is sourced from the Kaggle page: [Pizza Sales Data](https://www.kaggle.com/datasets/kamrulislamanik1998/pizza-sales-data).

---


## Dataset Overview

The dataset includes the following files:

- **pizzas.csv**: Contains details about individual pizzas.
- **pizza_types.csv**: Contains information about different pizza types (e.g., vegetarian, non-vegetarian).
- **orders.csv**: Contains information about customer orders.
- **order_details.csv**: Contains details about the pizza quantity and order-specific data.

The **pizzas.csv** file includes the following columns:

- `Pizza_id`: Unique identifier for the pizza.
- `Pizza_type_id`: ID associated with the pizza type.
- `Size`: Size of the pizza (e.g., small, medium, large).
- `Price`: Price of the pizza.

The **pizza_types.csv** file includes the following columns:

- `Pizza_type_id`: Unique identifier for the pizza type.
- `Name`: Name of the pizza.
-`Category`: Category of the pizza 
-`Ingredients`: All the ingredients used to make a pizza


The **orders.csv** file includes the following columns:

- `Order_id`: Unique identifier for the order.
- `Order_date`: Date when the order was placed.
- `Order_time`: Time of the order.

The **order_details.csv** file includes the following columns:

- `Order_details_id`: Unique identifier for the order details.
- `Order_id`: Unique identifier for the order.
- `Pizza_id`: ID associated with the ordered pizza.
- `Quantity`: Quantity of the pizza ordered.

---
## Technologies Used

- **Language**: SQL
- **Working Enviorment**: MySQL.

## Analysis Questions

### Basic:

1. Retrieve the total number of orders placed.
2. Calculate the total revenue generated from pizza sales.
3. Identify the highest-priced pizza.
4. Identify the most common pizza size ordered.
5. List the top 5 most ordered pizza types along with their quantities.

### Intermediate:

1. Join the necessary tables to find the total quantity of each pizza category ordered.
2. Determine the distribution of orders by hour of the day.
3. Join relevant tables to find the category-wise distribution of pizzas.
4. Group the orders by date and calculate the average number of pizzas ordered per day.
5. Determine the top 3 most ordered pizza types based on revenue.

### Advanced:

1. Calculate the percentage contribution of each pizza type to total revenue.
2. Analyze the cumulative revenue generated over time.
3. Determine the top 3 most ordered pizza types based on revenue for each pizza category.

---

## How to Run the Project

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/pizza-sales-analysis.git
## Schema Diagram
![Pizza2](https://github.com/user-attachments/assets/2b3a0f9d-15f8-49d8-af3f-41723c939d05)

