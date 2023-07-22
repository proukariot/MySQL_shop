# Electronic Store Database 
## Description
This database has been designed for a electronic store to facilitate the management of producers, products, orders, and customers. Each table has unique attributes to store essential information related to the electronic store.

## Tables
## Table "Producers"
Description: This table stores information about electronics producers who supply products to the store.
### Fields:
id_producer: Unique identifier for the producer (primary key).
producer_name: Name of the producer.
producer_address: Address of the producer.
producer_nip: Tax Identification Number (NIP) of the producer.
contract_signing_date: Date of signing the contract with the producer.

## Table "Products"
Description: This table stores information about the available products in the store.
### Fields:
id_product: Unique identifier for the product (primary key).
id_producer: Foreign key that connects the product to the respective producer (linked to the "Producers" table).
product_name: Name of the product.
product_description: Brief description of the product.
net_purchase_price: Net purchase price per unit of the product.
gross_purchase_price: Gross purchase price per unit of the product.
net_retail_price: Net retail price per unit of the product.
gross_retail_price: Gross retail price per unit of the product.
VAT_percent: Percentage value of Value Added Tax (VAT) on the product.

## Table "Orders"
Description: This table stores information about placed orders.
### Fields:
id_order: Unique identifier for the order (primary key).
id_customer: Foreign key that connects the order to the respective customer (linked to the "Customers" table).
id_product: Foreign key that connects the order to the respective product (linked to the "Products" table).
order_date: Date of placing the order.

## Table "Customers"
Description: This table stores information about the store's customers.
### Fields:
id_customer: Unique identifier for the customer (primary key).
id_order: Foreign key that connects the customer to the respective order (linked to the "Orders" table).
first_name: First name of the customer.
last_name: Last name of the customer.
address: Customer's residential address.

## Table Relationships
The "Products" table has a foreign key "id_producer" that is connected to the "Producers" table, allowing products to be associated with their respective producers.
The "Orders" table has foreign keys "id_customer" and "id_product" that are linked to the "Customers" and "Products" tables, respectively, enabling orders to be associated with the corresponding customers and products.
