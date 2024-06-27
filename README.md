# README

DESCRIBE DATASETS
I am using a dataset that a friend provided. It contains an inventory of cards. I will be using the product, sku, title, image, type, price, sale price, inventory, and category. The csv dataset will be used for both the product and category tables. The Product and Category databases will be connected as a one-to-many relationship; one category can have many products.


DATABASE ERD
+------------+         +-------------+
|  Category  |         |   Product   |
+------------+         +-------------+
| id         |  <----- | id          |
| name       |  1    * | product_id  |
| created_at |         | title       |
| updated_at |         | image       |
+------------+         | category_id |
                       | type        |
                       | price       |
                       | sale_price  |
                       | inventory   |
                       | created_at  |
                       | updated_at  |
                       +-------------+


This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version 3.3.0

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
