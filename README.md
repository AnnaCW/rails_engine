# Rails Engine

#### Table of Contents  
[Authors](#authors)  
[Overview](#overview)  
[Setup](#setup)  
[Test Suite](#testsuite)  
[API Endpoints](#apiendpoints)  
--[Record Endpoints](#recordendpoints)  
--[Relationship Endpoints](#relationshipendpoints)  
--[Business Intelligence](#businessintelligenceendpoints)  

### Authors
[Ryan Batty](https://github.com/Riizu), [Anna Weisbrodt](https://github.com/AnnaCW)

This project was created as a part of the curriculum for the [Turing School of Software & Design](http://turing.io). The full project specification can be found [here](https://github.com/turingschool/lesson_plans/blob/master/ruby_03-professional_rails_applications/rails_engine.md).

### Overview

Rails Engine is a project designed to teach Turing students to implement a basic JSON & XML API on top of a PostgreSQL-powered Rails application. Endpoints are implemented that stretch across multiple model relationships and query non-standard REST routes to exemplify real-world examples. The data itself is loaded using a CSV file backup that is then uploaded into the PostgreSQL install. The data provided is intended to model a standard storefront with multiple businesses, customers, items, transactions, and invoices.

### Setup

To set up a local copy of this project, perform the following:

  1. Clone the repository: `git clone https://github.com/AnnaCW/rails_engine`
  2. `cd` into the project's directory
  3. Run `bundle install`
  4. Run `rake db:create db:seed_csv`
  5. Run `Rails s`


### Test Suite

The included test suite checks the API against integration and unit level tests. To run all of the tests, run `rspec` from the terminal in the main directory of the project. Note, the database must be installed locally and properly seeded for the tests to run successfully.

### API Endpoints

The available endpoints can be categorized into three areas. All listed API's have a prefix of `http://hostname/api/v1`

#### Record Endpoints
Merchants
* `/merchants`: Returns a collection of all records
* `/merchants/:id`: Returns a record with the matching id attribute

Transactions
* `/transactions`: Returns a collection of all records
* `/transactions/:id`: Returns a record with the matching id attribute

Customers
* `/customers`: Returns a collection of all records
* `/customers/:id`: Returns a record with the matching id attribute

Invoices
* `/invoices`: Returns a collection of all records
* `/invoices/:id`: Returns a record with the matching id attribute

Items
* `/items`: Returns a collection of all records
* `/items/:id`: Returns a record with the matching id attribute

Invoice Items
* `/invoice_items`: Returns a collection of all records
* `/invoice_items/:id`: Returns a record with the matching id attribute

All record endpoints also include the following additional endpoints. Included params can be any or all of the attributes for an associated record.

* Find - `/find?params`: Returns the first entry that matches the included params

* Find All - `/find_all?params`: Returns a collection of all entries that match the included params

#### Relationship Endpoints

Merchants
* GET `/api/v1/merchants/:id/items`: returns a collection of items associated with that merchant
* GET `/api/v1/merchants/:id/invoices`: returns a collection of invoices associated with that merchant from their known orders

Invoices
* GET `/api/v1/invoices/:id/transactions`: returns a collection of associated transactions
* GET `/api/v1/invoices/:id/invoice_items`: returns a collection of associated invoice items
* GET `/api/v1/invoices/:id/items`: returns a collection of associated items
* GET `/api/v1/invoices/:id/customer`: returns the associated customer
* GET `/api/v1/invoices/:id/merchant`: returns the associated merchant

Invoice Items
* GET `/api/v1/invoice_items/:id/invoice`: returns the associated invoice
* GET `/api/v1/invoice_items/:id/item`: returns the associated item

Items
* GET `/api/v1/items/:id/invoice_items`: returns a collection of associated invoice items
* GET `/api/v1/items/:id/merchant`: returns the associated merchant

Transactions
* GET `/api/v1/transactions/:id/invoice`: returns the associated invoice

Customers
* GET `/api/v1/customers/:id/invoices`: returns a collection of associated invoices
* GET `/api/v1/customers/:id/transactions`: returns a collection of associated transactions

#### Business Intelligence Endpoints
All Merchants
* GET `/api/v1/merchants/most_revenue?quantity=x`: returns the top x merchants ranked by total revenue
* GET `/api/v1/merchants/most_items?quantity=x`: returns the top x merchants ranked by total number of items sold
* GET `/api/v1/merchants/revenue?date=x returns`: the total revenue for date x across all merchants

*NOTE: Assume the dates provided match the format of a standard ActiveRecord timestamp.*

Single Merchant
* GET `/api/v1/merchants/:id/revenue`: returns the total revenue for that merchant across all transactions
* GET `/api/v1/merchants/:id/revenue?date=x`: returns the total revenue for that merchant for a specific invoice date x
* GET `/api/v1/merchants/:id/favorite_customer`: returns the customer who has conducted the most total number of successful transactions.
* GET `/api/v1/merchants/:id/customers_with_pending_invoices`: returns a collection of customers which have pending (unpaid) invoices

*NOTE: Failed charges should never be counted in revenue totals or statistics.*

*NOTE: All revenues should be reported as a float with two decimal places.*

Items
* GET `/api/v1/items/most_revenue?quantity=x`: returns the top x items ranked by total revenue generated
* GET `/api/v1/items/most_items?quantity=x`: returns the top x item instances ranked by total number sold
* GET `/api/v1/items/:id/best_day`: returns the date with the most sales for the given item using the invoice date. If there are multiple days with equal number of sales, return the most recent day.

Customers
* GET `/api/v1/customers/:id/favorite_merchant`: returns a merchant where the customer has conducted the most successful transactions
