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

### File Details

#### pizzas.csv
- `Pizza_id`: Unique identifier for the pizza.
- `Pizza_type_id`: ID associated with the pizza type.
- `Size`: Size of the pizza (e.g., small, medium, large).
- `Price`: Price of the pizza.

#### pizza_types.csv
- `Pizza_type_id`: Unique identifier for the pizza type.
- `Name`: Name of the pizza.
- `Category`: Category of the pizza.
- `Ingredients`: All the ingredients used to make a pizza.

#### orders.csv
- `Order_id`: Unique identifier for the order.
- `Order_date`: Date when the order was placed.
- `Order_time`: Time of the order.

#### order_details.csv
- `Order_details_id`: Unique identifier for the order details.
- `Order_id`: Unique identifier for the order.
- `Pizza_id`: ID associated with the ordered pizza.
- `Quantity`: Quantity of the pizza ordered.

---

## Technologies Used

- **Language**: SQL
- **Working Environment**: MySQL

---

## Analysis Questions

### Basic

1. Retrieve the total number of orders placed.
2. Calculate the total revenue generated from pizza sales.
3. Identify the highest-priced pizza.
4. Identify the most common pizza size ordered.
5. List the top 5 most ordered pizza types along with their quantities.

### Intermediate

1. Join the necessary tables to find the total quantity of each pizza category ordered.
2. Determine the distribution of orders by hour of the day.
3. Group the orders by date and calculate the average number of pizzas ordered per day.
4. Identify the peak sales days of the week.
5. Determine the top 3 most ordered pizza types based on revenue.

### Advanced

1. Calculate the percentage contribution of each pizza type to total revenue.
2. Analyze the cumulative revenue generated over time.
3. Determine the top 3 most ordered pizza types based on revenue for each pizza category.
4. Perform a time-series analysis of daily sales to observe patterns and seasonality.

---

## How to Run the Project

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/pizza-sales-analysis.git
   ```

2. Import the dataset into your MySQL environment.

3. Run the provided SQL queries to perform the analysis.

4. Optionally, visualize the results using any BI tool like Tableau, Power BI, or Python libraries like Matplotlib and Seaborn.

---

## Schema Diagram

![Pizza2](https://github.com/user-attachments/assets/2e9492c2-246c-4284-929f-9d1612d20e8c)



---

## Contribution

Contributions are welcome! If you'd like to improve this project, feel free to fork the repository and create a pull request with your changes.

---

## License

This project is licensed under the [MIT License](LICENSE).

---

## Acknowledgments

Special thanks to Kaggle for providing the dataset used in this analysis.

