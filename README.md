[![Build Status](https://travis-ci.org/Xin00163/bank_tech_test.svg?branch=master)](https://travis-ci.org/Xin00163/bank_tech_test)


# Bank tech test

### Requirements

* You should be able to interact with your code via a REPL like IRB or the JavaScript console.  (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2012
**And** a deposit of 2000 on 13-01-2012
**And** a withdrawal of 500 on 14-01-2012
**When** she prints her bank statement
**Then** she would see

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```

## My solution

#### User Stories ####
```
As a User
So that I can have money in my bank
I want to be able to deposit money

As a User
So I can take money from my bank
I want to be able to withdrawal money

As a User
So I can see how much money I have in the bank
I want to be able to see the balance

As a User
So I can see which date I did the transactions
I want to be able to see the dates for each transaction

As a User
So I can see the details of each transaction
I want to be able to know the credit for each transaction

As a User
So I can see the details of each transaction
I want to be able to know the debit for each transaction

As a User
So I can see my transactions on paper
I want to be able to print the date, credit/debit amount and balance

As a User
So I can see previous transactions
I want to be able to save the previous transactions in memory
```
## Tech
- Ruby
- [Rspec](http://rspec.info/documentation/)
- [travis-ci](https://travis-ci.org/)

# Set up
#### Clone the repo
```
$ git@github.com:Xin00163/bank_tech_test.git
```
#### Install dependencies
```
$ gem install bundler
$ bundle
```
#### Run the tests
```
$ rspec
```
#### Run the app
```
$ irb
$ require "./lib/bank_account.rb"
$ bank_account = BankAccount.new
$ bank_account.deposit(100.00)
$ bank_account.withdrawal(50.00)
$ bank_account.print_statement
```
#### Irb Demo ####
![Imgur](https://i.imgur.com/msMbQRu.png)

#### My approach

| BankAccount | |
| -- | -- |
| Responsibility | Collaborator |
| transactions | credit & debit |
| deposit | credit  |
| withdrawal| debit |
| print_statement| printer |

| Credit | |
| -- | -- |
| Responsibility | Collaborator |
| amount |  |
| current_balance|  |
| created_date |  |

| Debit | |
| -- | -- |
| Responsibility | Collaborator |
| amount |  |
| current_balance|  |
| created_date |  |

| Printer | |
| -- | -- |
| Responsibility | Collaborator |
| format |  |

- Use CRC card to model the problem so that objects do just one thing and do that thing well

- Transactions are stored in an array of transactions in the BankAccount class.

- The deposit/withdrawal method increases/decreases the bank account balance and then instantiates a Credit/Debit object which gets stored in the transactions array.

- Printer class makes the array of transactions into formatted tables.

- BankAccount class has a print_statement method to print the stored transactions.
