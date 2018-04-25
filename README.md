# Bank tech test
## Overview

This is the first tech test at Makers Academy of week 10.

## Specification (provided)

* You should be able to interact with your code via a REPL like IRB or the JavaScript console.  (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### My User Stories

```
As a customer,
I'd like to open a bank account, so that I can keep track of my money.
```
```
As a customer,
I'd like to use my bank account regularly , so that I can put deposit in when I need to.
```
```
As a customer,
I'd like to use my bank account regularly , so that I can withdraw money when I need to.
```
```
As a customer,
I'd like to print my bank statement, so that I can see how much money I transferred and when.
```
## Approach
* Followed TDD, OOP process
* I started with two main classes BankAccount and Transaction, BankAccount handles the deposit and withdrawal methods, Transaction is responsible for adding and storing all the transactions.
* Statement class is converting the transactions to a statement which presents as a 2D arrays and the Printer will print it out as a nice format.
* All the classes are completely independent so that I can test everything easily without any mocks.

## Domain Model
![bank_tech_test_dia](https://user-images.githubusercontent.com/33848023/39277752-52684f4a-48e7-11e8-8441-7493571dd754.png)

## Installation
* Clone the repo with https://github.com/cindyjialiu/bank_tech_test.git
* Run bundle install
* Run rspec for the tests

## How to run the app
```ruby
Jias-MacBook-Pro:bank_tech_test Cindy$ pry
[1] pry(main)> require './lib/bank.rb'
=> true
[2] pry(main)> account = BankAccount.new
=> #<BankAccount:0x00007f8dcc865068 @balance=0>
[3] pry(main)> statement = Statement.new
=> #<Statement:0x00007f8dcc827768>
[4] pry(main)> transactions = Transaction.new
=> #<Transaction:0x00007f8dcc198af0 @history=[]>
[5] pry(main)> printer = Printer.new
=> #<Printer:0x00007f8dcc07d440>
[6] pry(main)> t1 = account.deposit(1500, DateTime.now)
=> {:date=>
  #<DateTime: 2018-04-25T11:51:01+01:00 ((2458234j,39061s,812812000n),+3600s,2299161j)>,
 :amount=>1500,
 :balance=>1500}
[7] pry(main)> transactions.add_transaction(t1)
=> [{:date=>
   #<DateTime: 2018-04-25T11:51:01+01:00 ((2458234j,39061s,812812000n),+3600s,2299161j)>,
  :amount=>1500,
  :balance=>1500}]
[8] pry(main)> t2 = account.withdrawal(1000, DateTime.now)
=> {:date=>
  #<DateTime: 2018-04-25T11:51:34+01:00 ((2458234j,39094s,10066000n),+3600s,2299161j)>,
 :amount=>-1000,
 :balance=>500}
[9] pry(main)> transactions.add_transaction(t2)
=> [{:date=>
   #<DateTime: 2018-04-25T11:51:01+01:00 ((2458234j,39061s,812812000n),+3600s,2299161j)>,
  :amount=>1500,
  :balance=>1500},
 {:date=>
   #<DateTime: 2018-04-25T11:51:34+01:00 ((2458234j,39094s,10066000n),+3600s,2299161j)>,
  :amount=>-1000,
  :balance=>500}]
[10] pry(main)> transaction_history = transactions.history
=> [{:date=>
   #<DateTime: 2018-04-25T11:51:01+01:00 ((2458234j,39061s,812812000n),+3600s,2299161j)>,
  :amount=>1500,
  :balance=>1500},
 {:date=>
   #<DateTime: 2018-04-25T11:51:34+01:00 ((2458234j,39094s,10066000n),+3600s,2299161j)>,
  :amount=>-1000,
  :balance=>500}]
[[11] pry(main)> statement_body = statement.get_statement(transaction_history)
=> [["25/04/2018", "", "500.00", "1000.00"], ["25/04/2018", "1500.00", "", "1500.00"]]
[12] pry(main)> fields = statement.formatted_statement(statement_body)
=> [["date      ", "credit    ", "debit     ", "balance   "],
 ["25/04/2018", "          ", "500.00    ", "1000.00   "],
 ["25/04/2018", "1500.00   ", "          ", "1500.00   "]]
[13] pry(main)> printer.print(fields)
date       || credit     || debit      || balance
25/04/2018 ||            || 500.00     || 1000.00
25/04/2018 || 1500.00    ||            || 1500.00
=> nil

```
## Technologies Used
* ruby ~2.5.0

## Testing Used and dependencies
* RSpec
* gem 'simplecov' - check the coverage of tests
* gem 'rubocop' - check the code syntax

## Contributing Members
* Cindy Liu
